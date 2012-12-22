class GameTime
	def initialize(currenttime = 0)
		@currenttime = currenttime
	end

	def tick()
		@currenttime += 1
	end

	def getTime()
		return @currenttime
	end

	def to_json(*a)
	    {
	      'json_class'   => self.class.name,
	      'data'         => [ "currenttime" => @currenttime]
	    }.to_json(*a)
	end

	def self.json_create(o)
    	new(o['data'][0]['currenttime'])
  	end

end
