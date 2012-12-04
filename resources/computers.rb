require_relative "../src/classes/Computer.rb"


$computers = {
	:pcraven_comp => Computer.new(:desktop, "pcraven.ny.us14.naGEO", ["documents"], ["files"], website={}),
	:sdowd_comp => Computer.new(:desktop, "dowd.research.vandenberg.usmil", ["documents"], ["files"], website={}),
	:eagle_news => Computer.new(type=:server,
								hostname="www.eaglenews.com",
								documents=[],
								files=[],
								website={"/" => "This is a webpage. Welcome to the website.",
										 "/secret" => "This is a secret page!",
									}),



} # end computers map

