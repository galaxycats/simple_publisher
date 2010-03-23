module SimplePublisher
  class Topic
    attr_accessor :name
    
    def initialize(attributes = {})
      attributes.each do |attr, value|
        send("#{attr}=", value)
      end
    end
    
    def ==(other)
      case other
      when Topic
        other.name == self.name
      else
        false
      end
    end
  end
end