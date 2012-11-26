class Network

	def initialize()
		@nodes = {}
		@arp_table = {}
		@rarp_table = {}
	end

	def join(computer)
		hostname = computer.hostname
		ip = computer.ip

		@nodes[ip] = computer
		@arp_table[hostname] = ip
		@rarp_table[ip] = hostname
	end

	def arp(hostname)
		@arp_table[hostname]
	end

	def rarp(ip)
		@rarp_table[ip]
	end

	def getNode(ip)
		return @nodes[ip]
	end

	def viewAllNodes()
		nodelist = ""
		@nodes.each do |k, v|
			nodelist << "#{k} -- #{v.hostname}"
		end

		return nodelist
	end

end


$Internet = Network.new()