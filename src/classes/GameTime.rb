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

end
