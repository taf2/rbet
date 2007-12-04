require 'test/unit'
$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'et'
require 'webrick'
require 'thread'
require 'rubygems'
gem 'hpricot'
require 'hpricot'

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

# list for subscriber requests and respond like ET would
class SubscriberETService < ::WEBrick::HTTPServlet::AbstractServlet
  include ET::Renderable

  def do_POST(req, res)
    set_template_path( File.join(File.dirname(__FILE__), "templates") )

    xml_body = String.new(req.body)
    xml_body.gsub!(/qf=xml&xml=/,'')
    doc = Hpricot.XML(xml_body)
    system_name = doc.at(:system).at(:system_name).inner_html.strip.downcase
    action = doc.at(:system).at(:action).inner_html.strip.downcase

    response = render_template("#{system_name}_#{action}_success")

    res.body = %Q(<?xml version="1.0" ?>
<exacttarget>
#{response}
</exacttarget>)

    res['Content-Type'] = "text/xml"
  end
end

module ET
  module TestCase

    def setup
      # create the server
      @server = WEBrick::HTTPServer.new( :Port => 99999 )

      # setup test server (simulates exact target)
      @server.mount("/test/", SubscriberETService)
 
      # start up the server in a background thread
      @thread = Thread.new(@server) do|server|
        server.start
      end
    end

    def teardown
      @server.shutdown
      #@thread.join
    end

  end
end
