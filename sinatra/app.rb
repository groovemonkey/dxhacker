require 'sinatra'
require 'pstore'

require_relative '../src/Game.rb'

enable :sessions


get '/' do
	File.read(File.join('public', 'index.html'))
end


get '/play' do
	# if you don't .inspect session[:game], it just evaluates to true 
	# => (because sessions are enabled)
	if session[:game].inspect != "inprogress"
		$gamestate ||= PStore.new("_tmp/game_state.pstore")

		#pstore -- store a new game object
		$gamestate.transaction do
			$gamestate[:gameobj] ||= Game.new()
		end

		session[:game] = "inprogress"
	end

	erb :console
end


get '/play/' do
	redirect "/play"
end


get '/play/command/:command' do |command|

	# grab state from pstore
	$gamestate.transaction(true) do
		@game = $gamestate[:gameobj]
	end

	@game.takeTurn(command)
	
	#set new $gamestate
	$gamestate.transaction do
			$gamestate[:gameobj] = @game
	end

	redirect "/play"
end


# empty command (player just hits ENTER)
get '/play/command/' do

	# grab state from pstore
	$gamestate.transaction(true) do
		@game = $gamestate[:gameobj]
	end

	@game.takeTurn()

	#set new $gamestate
	$gamestate.transaction do
			$gamestate[:gameobj] = @game
	end

	redirect "/play"
end



