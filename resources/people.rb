require_relative "../src/classes/Person.rb"
require_relative "../src/classes/Phone.rb"
require_relative "../src/classes/EmailAcct.rb"
require_relative "timelines.rb"
require_relative "devices.rb"

$people = {
	"Peter Craven" => Person.new(
		name="Peter Craven",
		emailaccts=[EmailAcct.new("pcraven@schnarg.com")],
		computers=[$devices[:pcraven_comp]],
		phone=$devices[:pcraven_phone],
		timeline=$timelines[:pcraven_tl]
	),

	"Stanton Dowd" => Person.new(
		name="Stanton Dowd",
		emailaccts=[EmailAcct.new("sdowd@rd.vandenberg.mil")],
		computers=[$devices[:sdowd_comp]],
		phone=$devices[:sdowd_phone],
		timeline=$timelines[:sdowd_tl]
	),


}