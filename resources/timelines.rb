

$timelines = {
	:pcraven_tl => {3 => Proc.new {|p| p.send_email("sdowd@rd.vandenberg.mil", 0, "Peter Craven", "This is Peter Craven. What's going on?")}},
	:sdowd_tl => {5 => Proc.new {|p| p.send_email("pcraven@schnarg.com", 0, "wintermute", "Beware. They are after you. Ditch them and meet us at the old place.")},
				  6 => Proc.new {|p| p.browse("www.eaglenews.com/secret")},
				  2 => Proc.new {|p| p.phone.call(:pcraven_phone)},
				  }
}

