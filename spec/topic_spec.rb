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
    
    it "should check object equality based on the topic name" do
      topic_a = Topic.new(:name => "my_topic")
      topic_b = Topic.new(:name => "my_topic")
      topic_a.should == topic_b
      
      topic_a = Topic.new(:name => "my_topic")
      topic_b = Topic.new(:name => "your_topic")
      topic_a.should_not == topic_b
    end

  end
end