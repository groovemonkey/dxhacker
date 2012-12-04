require_relative "ConnectionLog.rb"
require_relative "Network.rb"

class Computer
	attr_reader :ip, :hostname, :type, :log

def initialize(type, hostname, documents, files, website)
	@type = type
	@hostname = hostname
	@ip = generate_ip()
	@log = ConnectionLog.new()
	@documents = documents
	@files = files
	@website = website
end


def connect_to(ip)
	@log.record(:out, ip)
	$Internet.getNode(ip).receive_connection(self.ip)
end


def receive_connection(ip)
	@log.record(:in, ip)

end

def generate_ip()
	list = ["a", "b", "c", "d", "e", "f", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
	address = ""
	8.times do
		4.times do
			address << list.shuffle[5]
		end
		address << ":"
	end
	return address[0..-2].to_sym
end

def http_request(hostAndPage)
			# separates the HOSTNAME from the PAGE
			split = hostAndPage.split("/")
			host = split[0] # everything before the first slash
			page =  "/" + split[1..-1].join() # "/page/path"

			puts "host is #{host} and page is #{page}" if $debug

			# IP address -- needs to work if player enters ip OR hostname
			if host.include?(":")
				ip = host
			else
				ip = $Internet.arp(host)
			end

			self.connect_to(ip) # Logging
			# return the requested page
			return $Internet.getNode(ip).http_serve(page)

end


def http_serve(page)
	# returns the requested page in the form of a string.
	return @website[page]
end


end # end class