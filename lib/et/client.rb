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
