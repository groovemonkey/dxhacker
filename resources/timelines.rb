

$timelines = {
	:pcraven_tl => {3 => Proc.new {|p| p.send_email("sdowd@rd.vandenberg.mil", 0, "Peter Craven", "This is Peter Craven. What's going on?")}},
	:sdowd_tl => {1 => Proc.new {|p| p.access("dowd.research.vandenberg.usmil", 0)},
				  5 => Proc.new {|p| p.send_email("pcraven@schnarg.com", 0, "wintermute", "Beware. They are after you. Ditch them and meet us at the old place.")},
				  }
}

