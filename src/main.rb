$debug = true

require_relative "../resources/strings.rb"
require_relative "classes/GameTime.rb"
# initialize the timekeeper
$gt = GameTime.new()
require_relative "../resources/people.rb"
require_relative "classes/Player.rb"
player = Player.new(name="HackerDude",
				emailaccts=[EmailAcct.new("player@game.com")],
				computers=nil,
				phone=nil,
				timeline=nil)


# MAIN LOOP
running = true
while running
	now = $gt.getTime

	$people.each do |name, p|
		p.timeline[now].call(p) if p.timeline[now] #if there's something to do, do it.
	end


	puts($strings[:mainmenu])
	choice = gets().downcase.chomp!

	if choice == "quit"
		running = false
		break

	elsif choice == "netdump"
		puts "\nDEBUG: Dumping all Registered Internet Nodes!\n"
		puts "\n" + $Internet.viewAllNodes() + "\n\n"
		puts "\nARP table:\n"
		$Internet.arp_table.each do |kv|
			puts "#{kv}"
		end
		puts "\n RARP Table\n"
		$Internet.arp_table.each do |kv|
			puts "#{kv}"
		end

	elsif choice == "maildump"
		print "\nDEBUG: Dumping all Mail!\n"
		$people.each do |name, p|
			print "\n\n#{name}'s e-mail:\n #{p.emailaccts.each {|a| print a.messages }}\n\n"
		end

	elsif choice == "logdump"
		print "\nDEBUG: Dumping all logs!\n"
		$devices.each do |name, d|
			print "\n\n#{name}'s logs:\n #{d.log.view_log()}"
		end

	elsif choice == "gametime"
		puts "Gametime is #{$gt.getTime}"

	elsif choice == "dumphistory"
		$devices.each do |name, d|
			if d.class == Computer
				puts "Web History for host #{d.hostname}:\n\n#{d.web_history}\n"
			end
		end

	elsif choice == "hack"
		print "Enter the IP or Hostname of the target: "
		targetname = gets().chomp
		target = $Internet.getNode($Internet.getIP(targetname))
		target.getHacked()

	elsif choice == "search"
		print("\n\nPlease enter your search query: ")
		query = gets().downcase.chomp!
		# the entered string could be:
		# hostname, IP address, first name, last name, full name, phone number
		# check all cases against the string. If nothing is found, return "not found."
	end

	
	$gt.tick
end