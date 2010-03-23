require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplePublisher
  describe "Topic" do

    it "should have a name" do
      topic = Topic.new(:name => "my_topic")
      topic.name.should == "my_topic"
    end

    it "should fail if wrong attributes are a assigned through constructor" do
      lambda { Topic.new(:bad_attribute => true) }.should raise_error(NoMethodError)
    end

  end
end