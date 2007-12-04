$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'et'

user = ENV['ET_USER']
pass = ENV['ET_PASS']
EXACTTARGET_URI="https://www.exacttarget.com/api/integrate.asp?qf=xml"

if !user or !pass
  STDERR.puts "You must set the environment variables ET_USER and ET_PASS. e.g. export ET_USER='tester'; export ET_PASS='ssshh'"
  exit(1)
end

subscriber = ET::Subscriber.new(EXACTTARGET_URI, user, pass,:debug_output => $stderr)

subscriber.load!('user@example.com')

puts subscriber.inspect

# check if the user is subscribed to a specific list
#subscriber.subscribed?( list )

# check if the user is subscribed to any list
#subscriber.subscribed?

# subscribe a new user to an existing list
#subscriber = Subscriber.create('user@example.com',list)

# add the user to a specific list
#subscriber.add(list)

# remove the user from a specific list
#subscriber.remove(list)
