# WHAT I WAS JUST WORKING ON:

got browser console working
	-needs to scroll/auto-scroll
	-story output not printing to console
	-maildump doesn't print data to console
	-pstore file is permanent -- delete on session exit
	-hitting ENTER doesn't activate the enter button :-(


# TODO:

SESSIONS -- does $gt get in the way? How to have multiple players?
-randomly name pstore files?

##########
FEATURES:
##########

-- menu for doing stuff with hacked computers:
	-bouncing connections through them (proxies)
	-installing or using software (rootkit, log_wiper)
	-if rootkit is installed, computer is added to your Person's "hacked" list and you can re-access anytime


add PROGRAMS like log_wiper, keylogger (notifies you of events on that machine), etc.

AI that "tracks" you down if you've hacked important computers?
	-are you noticed at all? Use the computer's security level to decide
	-during tracking -- log wiper ruins the trail
					 -- at each tracking step, roll to see if trail is lost



####################
FIXES/IMPROVEMENTS:
####################

for Phone.call and Computer.connect -- make those methods take ANY arg (device sym, IP, or hostname?) -- using getHostname and getIP?

improve getHostname() and getIP() to be able to take $device SYMBOLS as well (more error-proof)

rootkits might be discovered? Roll on every turn?

abstract servers out as a separate class

-phones:
phone address book is not being used (view_log does a hostname (phone ->'name') lookup)
-- NPCs have (optional?) address books that are passed to phones when they're created? 

Maybe a "know each other" list? -- each person has the other's name/number stored in their phone's address book, and each other's name/e-mail address stored in the e-mail address book.

- search -- put in domains, ip addresses, etc. Get back public info about them.
- Logins/passwords for all computers

- Servers have public websites (documents?). Maybe a "port80" attribute that stores text?
- "browser" or URL bar that allows you to access public sites. (if hostname.port80 puts hostname.port80[$gt.getTime()])...or something like that.
- how do websites change over time? (news sites, etc.). Like above?

-emails should be arrays of "subject", "message", etc.
-maildump/netdump/logdump -- print statements execute in a weird order.



######################################

How to make a new character:

1. create a new Person object in "~/resources/people.rb"
2. create device objects for that person in "~/resources/computers.rb"
3. Write the "story" for that person -- their timeline! ("~/resources/timelines.rb")

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
-netdump -- see all internet nodes, ARP and RARP tables
-logdump -- see all logs
-hack -- lets you hack into computers
-filedump -- see all files on all Computers
-dumphistory -- see all webhistories

computers can connect to each other
people can send email to each other
IPDevices automatically join the Internet when they are created.
people can call each other
scripting API is better now (timelines.rb) -- web browsing/history, phone calls, etc.
implement getIP() and getHostname() in Network.rb, which take any device identifier and spit out the appropriate form (decoupling!)
decide how "NSC" (non-story characters) will be modeled: documents and browsing history? Anything else?
for story scripting: add document creation commands on Computer (for journals, hints, etc.)
remove Network#arp and Network#rarp functions -- switch everything to using getHostname() and getIP().
Create a file for every user called "web history" that records a list of all pages visited?
