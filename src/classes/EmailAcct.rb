
class EmailAcct

	def initialize(address)
		@address = address
		@messages = []
	end

	def send_message(toaccount, fromip, fromname, message)
		recipient.emailacct.receive_message(fromip, fromname, message)
	end

	def receive_message(ip, fromname, message)
		@messages << [ip, fromname, message]
	end

	def display_messages()
		return @messages
	end

end