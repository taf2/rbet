#
# Copyright (c) 2007 Todd A. Fisher
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
module ET

  #
  # usage:
  #
  #   # get an existing subscriber
  #   subscriber = Subscriber.retrieve('user@example.com')
  #   => ET::Subscriber
  #
  #   # check if the user is subscribed to a specific list
  #   subscriber.subscribed?( list )
  #   => true|false
  #
  #   # check if the user is subscribed to any list
  #   subscriber.subscribed?
  #   => true|false
  #
  #   # subscribe a new user to an existing list
  #   subscriber = Subscriber.create('user@example.com',list)
  #   => ET::Subscriber
  #
  #   # add the user to a specific list
  #   subscriber.add(list)
  #   => ET::Subscriber
  #
  #   # remove the user from a specific list
  #   subscriber.remove(list)
  #   => ET::Subscriber
  #
  class Subscriber

    # desc:
    #   creates a new Subscriber object
    # params:
    #   email_addr: the address of the user to create
    def initialize(email_addr)
    end

    # desc:
    #   get an existing subscriber
    # params:
    #   email: the address of the user to retrieve
    # returns:
    #   an existing subscriber from the ET system
    def self.retrieve(email_addr)
    end

    # desc:
    #   add this user as a new subscriber to the email, with a set of attributes
    # params:
    #   emailid: id of the e-mail list to subscribe this user to 
    def add(emailid,attributes ={})
    end

    def save
    end
    
    def delete
    end

  end
end
