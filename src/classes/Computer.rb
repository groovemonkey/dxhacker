require_relative "ConnectionLog.rb"
require_relative "Network.rb"
require_relative "IPDevice.rb"

class Computer < IPDevice
	attr_reader :ip, :hostname, :type, :log

def initialize(type, hostname, files, website)
	@type = type
	@hostname = hostname
	@ip = generate_ip()
	@log = ConnectionLog.new()
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