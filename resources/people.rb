require_relative "../src/classes/Person.rb"
require_relative "../src/classes/EmailAcct.rb"
require_relative "timelines.rb"
require_relative "computers.rb"

$people = {
	"Peter Craven" => Person.new(
		name="Peter Craven",
		emailaccts=[EmailAcct.new("pcraven@schnarg.com")],
		computers=[$computers[:pcraven_comp]],
		timeline=$timelines[:pcraven_tl]
	),

	"Stanton Dowd" => Person.new(
		name="Stanton Dowd",
		emailaccts=[EmailAcct.new("sdowd@rd.vandenberg.mil")],
		computers=[$computers[:sdowd_comp]],
		timeline=$timelines[:sdowd_tl]
	),


}