module SimplePublisher
  class Topic
    attr_accessor :name
    
    def initialize(attributes = {})
      attributes.each do |attr, value|
        send("#{attr}=", value)
      end
    end
  end
end