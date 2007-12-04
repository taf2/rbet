require 'test/unit'
$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'et/client'
require 'webrick'
require 'thread'

# shut up, webrick :-)
class ::WEBrick::HTTPServer
  def access_log(config, req, res)
    # nop
  end
end
class ::WEBrick::BasicLog
  def log(level, data)
    # nop
  end
end

class PingETService < ::WEBrick::HTTPServlet::AbstractServlet
  def do_POST(req, res)
    res.body = %q(<?xml version="1.0" ?>
<exacttarget>
  <system>
    <diagnostics>
      <Ping>Running</Ping>
    </diagnostics>
  </system>
</exacttarget>)

    res['Content-Type'] = "text/xml"
  end
end

module ET
  module TestCase

    def setup

      # create the server
      @server = WEBrick::HTTPServer.new( :Port => 99999 )

      # use the test url
      @server.mount("/test/", PingETService)
      
      # start up the server in a background thread
      @thread = Thread.new(@server) do|server|
        server.start
      end
    end

    def teardown
      @server.stop
    end

  end
end
