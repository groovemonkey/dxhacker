
class Person
	attr_accessor :emailacct

def initialize(name, emailacct, computers, timeline)
	@name = name
	@emailacct = emailacct
	@computers = computers
	@timeline = timeline
end

def send_email(toaccount, computer, fromname, message)
	@emailacct.send_message(toaccount, computer.ip, fromname, message)
end



end