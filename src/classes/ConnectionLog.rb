require_relative "GameTime.rb"

class ConnectionLog

	def initialize()
		@log = []
	end

	def record(inorout, ip, page=nil)
		time = $gt.getTime()
		# if this is a webpage, log a single string, otherwise an array
		page ? @log << "#{time} -- Served the page #{page} to #{ip}" : @log << [time, inorout, ip]
	end

	def serve_page(page, ip)
		record(:out, ip, page)
	end

	def view_log()
		output = ""

		@log.each do |entry|
			if entry.class == String
				output << "\n#{entry}"
			else
				t = entry[0]
				ip = entry[2]
				hostname = $Internet.getHostname(ip)

				if entry[1] == :out
					desc = "connected to "
				elsif entry[1] == :in
					desc = "received connection from "
				end

				output << "\n#{t} -- #{desc} #{ip} (#{hostname})."
			end
		end

		return output
	end

end