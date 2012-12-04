require_relative "IPDevice.rb"
require_relative "GameTime.rb"

class Phone < IPDevice.rb

	def initialize()
		@ip = generate_ip()
		@address_book = {}
		@call_log {}
	end


	def add_to_address_book(ip, name)
		# ips should be strings, not ints
		@address_book[ip] = name
	end

	def log_call(ip)
		time = $gt.getTime()
		# allow for logging several calls during the same time slot
		if @call_log[time]
			@call_log[time] << ip
		else
			@call_log[time] = [ip]
		end
	end

	def view_log()
		coll = ""
		@call_log.each do |time, ip|
			coll << "\nTime: #{time} -- Call Received from #{ip}"
			coll << " (#{@address_book[ip]})" if @address_book.include?(ip) # (Steve Applebaum)
		end

		puts coll
	end


end

