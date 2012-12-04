require_relative "../src/classes/Computer.rb"


$computers = {
	:pcraven_comp => Computer.new(type=:desktop, hostname="pcraven.ny.us14.naGEO", files=["files"], website={}),
	:sdowd_comp => Computer.new(type=:desktop, hostname="dowd.research.vandenberg.usmil", files=["files"], website={}),
	:eagle_news => Computer.new(type=:server,
								hostname="www.eaglenews.com",
								files=[],
								website={"/" => "This is a webpage. Welcome to the website.",
										 "/secret" => "This is a secret page!",
									}),



} # end computers map

