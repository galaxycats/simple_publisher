require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplePublisher
  describe "Message" do
    
    it "should encapsulate any raw message in the class and generate a UID for itself" do
      raw_message_content = "some raw message content"
      message = Message.new(raw_message_content)
      message.uid.should_not be(nil)
      message.body.should == raw_message_content
    end

  end
end