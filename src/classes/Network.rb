class Network
	attr_reader :arp_table, :rarp_table

	def initialize()
		@nodes = {}
		@arp_table = {}
		@rarp_table = {}
	end

	def join(device)
		ip = device.ip
		hostname = device.hostname
		@arp_table[hostname] = ip
		@rarp_table[ip] = hostname

		@nodes[ip] = device
	end

	def getNode(ip)
		return @nodes[ip]
	end

	def getHostname(host)
		host = host.to_s
		!host.include?(":") ? host : @rarp_table[host]
	end

	def getIP(host)
		host = host.to_s
		host.include?(":") ? host : @arp_table[host]
	end

	def viewAllNodes()
		nodelist = ""
		@nodes.each do |k, v|
			nodelist << "#{v.hostname} -- #{k}\n"
		end

		return nodelist
	end

end


$Internet = Network.new()