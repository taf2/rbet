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

require 'rubygems'
require 'hpricot'

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
  class Subscriber < Client
    attr_accessor :attrs
    attr_reader :email, :status
 
    def initialize(service_url,username,password,options={})
      super
      @attrs = {}
    end

    def load!(email)
      response = send do|io|
        io << render_template('subscriber_retrieve')
      end
      if response.class != Net::HTTPOK
        # error?
      else
        doc = Hpricot.XML(response.body)
        subscriber = doc.at(:subscriber)
        # load elements into the attrs hash
        @attrs = {}
        subscriber.each_child do|attr_element|
          if attr_element.elem?
            name = attr_element.name.gsub(/__/,' ')
            value = attr_element.inner_html
            @attrs[name] = value
            if name == 'Email Address'
              @email = value
            elsif name == 'Status'
              @status = value
            end
          end
        end
      end
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
