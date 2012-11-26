$debug = true

require_relative "../resources/strings.rb"
require_relative "classes/GameTime.rb"
# initialize the timekeeper
$gt = GameTime.new()

require_relative "../resources/people.rb"

# populate the Internet
$computers.each do |name, computer|
	$Internet.join(computer)
end



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
		puts "\n" + $Internet.viewAllNodes() + "\n\n\n"
	elsif choice == "maildump"
		print "\nDEBUG: Dumping all Mail!\n"
		$people.each do |name, p|
			print "\n\n#{name}'s e-mail:\n #{p.emailaccts.each {|a| print a.messages }}\n\n"
		end
	end

	puts "DEBUG! Gametime is #{$gt.getTime}"
	$gt.tick
end