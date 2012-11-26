require_relative "GameTime.rb"
class ConnectionLog

	def initialize()
		@log = []
	end

	def record(inorout, ip)
		time = $gt.getTime()
		@log << [time, inorout, ip]
	end

	def view_log()
		output = ""
		@log.each do |entry|
			t = entry[0]
			ip = entry[2]

			if entry[1] == :out
				desc = "connected to "
			elsif entry[1] == :in
				desc = "received connection from "
			end

			output << "\n#{t} -- #{desc} #{ip}."
		end

		return output
	end

end