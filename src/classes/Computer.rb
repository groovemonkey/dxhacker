require_relative "Network.rb"
require_relative "IPDevice.rb"

class Computer < IPDevice
	attr_reader :web_history

def initialize(hostname, files, website={})
	super(hostname)
	@files = files
	@website = website
	@web_history = ""
end


def http_request(url)
	# www.host.com/page/or/multiple/pages
	# separates the HOSTNAME from the PAGE
	split = url.split("/")
	host = split[0] # everything before the first slash
	page =  "/" + split[1..-1].join() # "/page/path"

	puts "New network connection:\nHost #{self.hostname} (#{self.ip}) connected to host is #{host}, requesting #{page}" if $debug

	dest_ip = $Internet.getIP(host)
	#host.include?(":") ? ip = host : ip = $Internet.arp(host)

	self.connect_to(dest_ip) # Logging
	@web_history << "#{url}\n"
	return $Internet.getNode(dest_ip).http_serve(page, self.ip) 	# return the requested page
end


def http_serve(page, ip)
	@log.serve_page(page, ip)
	# returns the requested page in the form of a string.
	return @website[page]
end

def getHacked
	puts "You've compromised #{@hostname}. Hardcore! This is where a menu should happen, allowing you to do stuff on the hacked machine."
end


end # end class