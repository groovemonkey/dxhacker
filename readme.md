# TODO:


websites: NPCs just request connections? Or do they actually use the http_request method? How to display the returned web page string?

Create a file for every user called "web history" that records a list of all pages visited?



-phones:
-- People have phones
-- global phone list and phone/internet registration
-- merge computer list and phone list into one global DEVICE LIST?
-- script calls between people
-- NPCs have address books that are passed to phones when they're created? Maybe a "know each other" list? Ugh...implement later...


Person.make_call(<to>, self.phone.ip)

def Person.receive_call(ip)
	if self.phone.address_book[ip]
		self.phone.log_call(ip, self.phone.address_book[ip]) #<-- pass IP addr and caller name
		# make Phone.log_call take ONE or TWO arguments (either just an IP, or an IP and a name).
		# write to the call log accordingly.
end









- search -- put in domains, ip addresses, etc. Get back public info about them.
- Logins/passwords for all computers

- Servers have public websites (documents?). Maybe a "port80" attribute that stores text?
- "browser" or URL bar that allows you to access public sites. (if hostname.port80 puts hostname.port80[$gt.getTime()])...or something like that.
- how do websites change over time? (news sites, etc.). Like above?

-emails should be arrays of "subject", "message", etc.
-maildump/netdump/logdump -- print statements execute in a weird order.



######################################

Sample Gameplay:


-player checks a news website (liberal, conservative, and underground)
-player sees a news story about a government contract awarded to a contractor for something cool-sounding, but potentially scary.
---------2 ways in---------
-player goes to company website, hacks in
OR
-player looks up the head of PR mentioned in the story, and hacks into his private computer
---------------------------

Either way, player finds suspicious information. And the story has begun...



######################################

The game is called Timeline. It's a snapshot of a futuristic world, with multiple stories happening independently of your watching. Wherever you start to unravel the thread, you'll be able to follow clues into the narrative you've discovered. The only catch: which narrative will you follow? What will you do? What effects will your actions have?

v1: timelines and a basic "story" that you can follow through hacking.
v2: your actions can affect timelines.



######################################

FINISHED FEATURES:

-maildump -- see all email
-netdump -- see all internet nodes
-logdump -- see all logs

computers can connect to each other
people can send email to each other.
