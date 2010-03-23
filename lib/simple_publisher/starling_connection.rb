require 'starling'

module SimplePublisher
  class StarlingConnection
    
    attr_reader :starling_url
    
    def initialize(attributes = {})
      @starling_url = "#{attributes[:host]}:#{attributes[:port]}"
    end
    
    def write(options)
      starling.set(options[:to].name, options[:message].body)
    end
    
    private
    
      def starling
        @starling ||= Starling.new(starling_url)
      end
    
  end
end