module SimplePublisher
  class Publisher
    attr_reader :topic, :connection

    def initialize(attributes = {})
      unless attributes.keys.include?(:topic) and attributes.keys.include?(:connection)
        raise ArgumentError, "You must specify a connection and a topic"
      end
      
      attributes.each do |attr, value|
        send("#{attr}=", value)
      end
    end
    
    def publish(raw_message)
      message = Message.new(raw_message)
      connection.write(:message => message, :to => topic)
    end
    
    private

      attr_writer :topic, :connection
    
  end
end