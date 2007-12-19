require File.join(File.dirname(__FILE__),'help.rb')

subscriber = ET::Subscriber.new($et_uri, $et_user, $et_pass, :debug_output => $stderr)


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
