
class Person
	attr_accessor :emailaccts, :timeline, :computers, :phone

	def initialize(name, emailaccts, computers, phone, timeline)
		@name = name
		@emailaccts = emailaccts
		@computers = computers
		@phone = phone
		@timeline = timeline
	end

	def send_email(toaccount, computer, fromname, message)
		@emailaccts[0].send_message(toaccount, @computers[computer].ip, fromname, message)
		puts "#{@name} just sent an e-mail to #{toaccount}!\n" if $debug
	end

	def browse(url)
		@computers[0].http_request(url)
	end


end