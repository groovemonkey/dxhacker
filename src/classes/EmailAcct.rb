class EmailAcct
	attr_reader :address

	def initialize(address)
		@address = address
		@messages = []
	end

	def send_message(toaccount, fromip, fromname, message)
		$people.each do |name, p|
			p.emailaccts.each do |acct|
				if acct.address == toaccount
					acct.receive_message(fromip, fromname, message)
				end
			end
		end
	end

	def receive_message(ip, fromname, message)
		@messages << [ip, fromname, message]
		puts "an e-mail was just received. Messages is now #{@messages}." if $debug
	end

	def messages()
		messagelist = ""
		@messages.each do |m|
			messagelist << "\n############### 
			From: #{m[1]} (at #{m[0]}):
			\n###############\n\n
			#{m[2]}\n"
		end

		return messagelist
	end

end