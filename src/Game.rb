$debug = false

require_relative "../resources/strings.rb"
require_relative "classes/GameTime.rb"
require_relative "../resources/people.rb"
require_relative "classes/Player.rb"

$gt = GameTime.new()

class Game
	attr_reader :console

	def initialize( player=Player.new(name="HackerDude",
								emailaccts=[EmailAcct.new("player@game.com")],
								computers=["none"],
								phone="none",
								timeline="none"),
					console="You just started a new game!\n\n#{$strings[:mainmenu]}")

		@player = player
		@console = console
	end

	def outputs(str)
		#our replacement for outputs
		@console << str + "\n"
	end

	def output(str)
		@console << str
	end


	# THE "MAIN LOOP"
	def takeTurn(usercommand="")
		now = $gt.getTime

		$people.each do |name, p|
			p.timeline[now].call(p) if p.timeline[now] #if there's something to do, do it.
		end


		if usercommand == "netdump"
			outputs "\nDEBUG: Dumping all Registered Internet Nodes!\n"
			outputs "\n" + $Internet.viewAllNodes() + "\n\n"
			outputs "\nARP table:\n"
			$Internet.arp_table.each do |kv|
				outputs "#{kv}"
			end
			outputs "\n RARP Table\n"
			$Internet.arp_table.each do |kv|
				outputs "#{kv}"
			end

		elsif usercommand == "maildump"
			output "\nDEBUG: Dumping all Mail!\n"
			$people.each do |name, p|
				output "\n\n#{name}'s e-mail:\n #{p.emailaccts.each {|a| output a.messages }}\n\n"
			end

		elsif usercommand == "logdump"
			output "\nDEBUG: Dumping all logs!\n"
			$devices.each do |name, d|
				output "\n\n#{name}'s logs:\n #{d.log.view_log()}"
			end

		elsif usercommand == "gametime"
			outputs "Gametime is #{$gt.getTime}"

		elsif usercommand == "dumphistory"
			$devices.each do |name, d|
				if d.class == Computer
					outputs "Web History for host #{d.hostname}:\n\n#{d.web_history}\n"
				end
			end

		elsif usercommand == "filedump"
			$devices.each do |name, d|
				d.view_files() if d.class == Computer
			end

		elsif usercommand == "hack"
			output "Enter the IP or Hostname of the target: "
			targetname = gets().chomp
			target = $Internet.getNode($Internet.getIP(targetname))
			target.getHacked()

		elsif usercommand == "search"
			output("\n\nPlease enter your search query: ")
			query = gets().downcase.chomp!
			# the entered string could be:
			# hostname, IP address, first name, last name, full name, phone number
			# check all cases against the string. If nothing is found, return "not found."
		

		else
			if usercommand != ""
				outputs "What? You can't #{usercommand} here, and certainly not *now*!"
			end
		end


		$gt.tick
	end


end