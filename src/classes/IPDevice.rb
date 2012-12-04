class IPDevice
	def initialize()
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