require_relative "Network.rb"
require_relative "IPDevice.rb"

class Computer < IPDevice
	attr_reader :type

def initialize(hostname, files, website={})
	super(hostname)
	@files = files
	@website = website
end


def http_request(hostAndPage)
	# www.host.com/page/or/multiple/pages
	# separates the HOSTNAME from the PAGE
	split = hostAndPage.split("/")
	host = split[0] # everything before the first slash
	page =  "/" + split[1..-1].join() # "/page/path"

	puts "New network connection:\nHost #{self.hostname} (#{self.ip}) connected to host is #{host}, requesting #{page}" if $debug

	# IP address -- needs to work if player enters ip OR hostname
	host.include?(":") ? ip = host : ip = $Internet.arp(host)

	self.connect_to(ip) # Logging
	return $Internet.getNode(ip).http_serve(page, self.ip) 	# return the requested page
end


def http_serve(page, ip)
	@log.serve_page(page, ip)
	# returns the requested page in the form of a string.
	return @website[page]
end


end # end class