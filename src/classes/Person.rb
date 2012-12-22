
class Person
	attr_accessor :emailaccts, :timeline, :computers, :phone

	def initialize(name, emailaccts, computers, phone, timeline)
		@name = name
		@emailaccts = emailaccts
		@computers = computers
		@phone = phone
		@timeline = timeline
	end

	def send_email(toaccount, fromname, message, compnumber=0)
		@emailaccts[0].send_message(toaccount, @computers[compnumber].ip, fromname, message)
		puts "#{@name} just sent an e-mail to #{toaccount}!\n" if $debug
	end

	def browse(url)
		@computers[0].http_request(url)
	end

	def hack(device)
		# in: symbol
		## TODO: roll to see if the hack succeeds
		$devices[device].get_Hacked()
	end

	def write(content, compnumber=0)
		@computers[compnumber].createDocument(content)
		puts "DEBUG: #{@name} just created a file" if $debug
	end


	def to_json(*a)
	    {
	      'json_class'   => self.class.name,
	      'data'         => [ "name" => @name,
	      					"emailaccts" => @emailaccts.to_json,
	      					"computers" => @computers.to_json,
	      					"phone" => @phone.to_json,
	      					"timeline" => @timeline,  ]
	    }.to_json(*a)
	end

	def self.json_create(o)
    	new(o['data'][0]['name'],
    		JSON.parse(o['data'][0]['emailaccts']),
    		JSON.parse(o['data'][0]['computers']),
    		JSON.parse(o['data'][0]['phone']),
    		o['data'][0]['timeline'] )
  	end

end
