require 'sinatra'
require 'json'
require_relative '../src/Game.rb'

enable :sessions

# FIXME: this resets the game----WHAT IS THE INITIAL VALUE OF A session[:val]??????
get '/' do
	session[:game] = "empty"
	File.read(File.join('public', 'index.html'))
end


get '/play' do
	if session[:game] == "empty"
		session[:game] = Game.new().to_json
	end
	puts "session[:game] (the game object) is now JSON:\n\n #{session[:game]}\n\n"
	#puts "session[:test] (the gt object) is now JSON:\n\n #{session[:test]}\n\n"

	erb :console
end

get '/play/' do
	redirect "/play"
end

get '/play/command/:command' do |command|
	game = JSON.parse(session[:game])
	game.takeTurn(command)
	session[:game] = game.to_json
	redirect "/play"
end

# empty command (player just hits ENTER)
get '/play/command/' do
	game = JSON.parse(session[:game])
	game.takeTurn()
	session[:game] = game.to_json
	redirect "/play"
end



