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

	puts($strings[:mainmenu])
	choice = gets().downcase.chomp!
	if choice == "quit"
		running = false
		break
	elsif choice == "net dump"
		puts "\nDEBUG: Dumping all Registered Internet Nodes!\n"
		puts "\n" + $Internet.viewAllNodes() + "\n\n\n"
	end

	puts "DEBUG! Gametime is #{$gt.getTime}"
	$gt.tick
end