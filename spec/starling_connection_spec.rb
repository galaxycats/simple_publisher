require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplePublisher
  describe "StarlingAdapter" do

    it "should take a message and topic information and write them to a starling queue" do
      starling_connection = StarlingConnection.new(:host => "127.0.0.1", :port => "22122")

      message = Message.new("some message content")
      topic = Topic.new(:name => "my_topic")

      Starling.should_receive(:new).with("127.0.0.1:22122").and_return(starling_instance = mock("Starling"))
      starling_instance.should_receive(:set).with("my_topic", "some message content")

      starling_connection.write(:message => message, :to => topic)
    end

  end
end