require File.join(File.dirname(__FILE__),"help.rb")

class SubscriberClient  < Test::Unit::TestCase
  include ET::TestCase

  def test_subscriber_load
    client = ET::Subscriber.new('http://127.0.0.1:99999/test/','tester','tester11', :use_ssl => false)
    client.load!('foo@bar.com')
  end

end
