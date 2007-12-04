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
  # Subscriber list
  # usage:
  #
  #   # create a new subscriber list
  #   super_list = List.create 'Super list', :type => :public
  #   => ET::List
  #
  #   # rename the list
  #   super_list.edit :name => 'Basic list'
  #   => ET::List
  #
  #   # make it private
  #   super_list.edit :type => :private
  #   => ET::List
  #
  #   # retrieve the list by name
  #   basic_list = List.retrieve :name => 'Basic list'
  #   => ET::List
  #
  #   # retrieve by id
  #   basic_list = List.retrieve :id => 12322
  #   => ET::List
  #
  #   # see if this user is subscribed to the list
  #   basic_list.has_subscriber?( subscriber )
  #   => true|false
  #
  #   # get all the subscribers to the list
  #   basic_list.subscribers
  #   => [ET::Subscribers,ET::Subscribers]
  #
  #   # delete the list
  #   basic_list.delete!
  #   => nil
  #
  class List < Client

    def self.create( name, options = {} )
    end

    def self.retrieve( options = {} )
    end

    def edit( options = {} )
    end

  end
end
