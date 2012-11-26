require_relative "../ConnectionLog.rb"

testlog = ConnectionLog.new()
testlog.record(14, :in, "fe00::0122:booa:1987")
testlog.record(15, :out, "blah::schna:booa:1987")

text = testlog.view_log()
puts(text)
