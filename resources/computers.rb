require_relative "../src/classes/Computer.rb"


$computers = {
	:pcraven_comp => Computer.new(:desktop, "pcraven.ny.us14.naGEO", ["documents"], ["files"]),
	:sdowd_comp => Computer.new(:desktop, "dowd.research.vandenberg.usmil", ["documents"], ["files"]),
}