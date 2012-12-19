require_relative "../src/classes/Computer.rb"
require_relative "../src/classes/Phone.rb"


$devices = {
	:pcraven_comp => Computer.new(hostname="pcraven.ny.us14.naGEO", files=["files"]),
	:sdowd_comp => Computer.new(hostname="dowd.research.vandenberg.usmil", files=["files"]),
	:eagle_news => Computer.new(hostname="www.eaglenews.com",
								files=[],
								website={"/" => "This is a webpage. Welcome to the website.",
										 "/secret" => "This is a secret page!",
									}),
	:pcraven_phone => Phone.new("phone.pcraven.nyc"), # address book is optional
	:sdowd_phone => Phone.new("phone.sdowd.usmil"),



} # end devices

