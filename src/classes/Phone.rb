require_relative "IPDevice.rb"
require_relative "GameTime.rb"
require_relative "Network.rb"

class Phone < IPDevice
	attr_reader :address_book

	def initialize(hostname, address_book={})
		super(hostname)
		@address_book = address_book
	end

	def call(phone_ID)
		# takes the phone's ID (the symbol it's stored under in $devices)
		phone = $devices[phone_ID]

		destination_ip = $Internet.arp(phone.hostname)
		self.connect_to(destination_ip)

		puts "\nDEBUG: a call was just made to #{phone.hostname}, at IP #{destination_ip}" if $debug
	end

	def add_to_address_book(ip, name)
		@address_book[ip] = name
	end

end

