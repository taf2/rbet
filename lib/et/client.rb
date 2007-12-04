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
require 'net/https'
require 'uri'
require 'erb'

module ET
  class Client
    attr_reader :username, :password, :headers

    def initialize(service_url,username,password)
      @username = username
      @password = password
      @uri = URI.parse(service_url)
      @url = Net::HTTP.new(@uri.host, @uri.port)
      @url.set_debug_output $stderr
      @headers = {
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
    end

    # usage:
    #   send do|io|
    #     io << 'more xml'
    #   end
    def send
      @system = ""
      yield @system
			erb = ERB.new(File.open(File.join(File.dirname(__FILE__),"auth.rxml"),"r").read, 0, "<>")
      result = 'qf=xml&xml=' + erb.result( binding )

      @url.post( @uri.path, result, @headers.merge('Content-length' => result.length.to_s) )
    end

  end
end
