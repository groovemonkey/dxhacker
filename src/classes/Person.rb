
class Person
	attr_accessor :emailaccts, :timeline

	def initialize(name, emailaccts, computers, timeline)
		@name = name
		@emailaccts = emailaccts
		@computers = computers
		@timeline = timeline
	end

	def send_email(toaccount, computer, fromname, message)
		@emailaccts[0].send_message(toaccount, @computers[computer].ip, fromname, message)
		puts "#{@name} just sent an e-mail to #{toaccount}!\n" if $debug
	end

	def access(hostname, fromcomputer)
		ip = $Internet.arp_table[hostname]
		@computers[fromcomputer].connect_to(ip)
	end


end