require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplePublisher
  
  describe "Publisher" do
    
    before :each do
      @topic = Topic.new(:name => "some_topic")
      @connection = mock("ConnectionMock")
    end
    
    it "should initialize with topic and a connection" do
      publisher = Publisher.new(:topic => @topic, :connection => @connection)
      publisher.topic.should == @topic
      publisher.connection.should == @connection
    end
    
    it "should require a topic and a connection on creation" do
      lambda { Publisher.new(:topic => @topic) }.should raise_error(ArgumentError)
      lambda { Publisher.new(:connection => @connection) }.should raise_error(ArgumentError)
    end
    
    it "should not allow to change the connection later on" do
      publisher = Publisher.new(:topic => @topic, :connection => @connection)
      lambda { publisher.connection = mock("AnotherConnection") }.should raise_error(NoMethodError)
    end
    
    it "should not allow to change the topic later on" do
      publisher = Publisher.new(:topic => @topic, :connection => @connection)
      lambda { publisher.topic = mock("another_topic") }.should raise_error(NoMethodError)
    end
    
  end
  
end