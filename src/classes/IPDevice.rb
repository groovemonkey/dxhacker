require_relative "ConnectionLog.rb"
require_relative "Network.rb"

class IPDevice
	attr_reader :hostname, :ip, :log

	def initialize(hostname, ip=generate_ip())
		@hostname = hostname
		@ip = ip
		@log = ConnectionLog.new()
		$Internet.join(self)
	end

	def connect_to(outip)
		@log.record(:out, outip)
		$Internet.getNode(outip).receive_connection(@ip)
	end


	def receive_connection(inip)
		@log.record(:in, inip)
	end



private
	def generate_ip()
		# thanks to Lars Haugseth -- http://stackoverflow.com/questions/13913600/how-to-use-java-arrays-translating-from-ruby-to-java
		Array.new(8) { "%04x" % rand(2**16) }.join(':').to_sym
	end

end