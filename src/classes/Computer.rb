require_relative "ConnectionLog.rb"
require_relative "Network.rb"

class Computer
	attr_reader :ip, :hostname, :type, :log

def initialize(type, hostname, documents, files)
	@type = type
	@hostname = hostname
	@ip = generate_ip()
	@log = ConnectionLog.new()
	@documents = documents
	@files = files

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



end