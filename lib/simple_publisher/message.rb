require 'digest/sha1'

module SimplePublisher
  class Message
    attr_reader :body, :uid
    
    def initialize(message_body)
      @body = message_body
      generate_uid!
    end
    
    private
    
      def generate_uid!
        # This is taken from the workling gem
        @uid = ::Digest::SHA1.hexdigest("#{self}:#{@body}:#{ rand(1 << 64) }:#{ Time.now }")
      end
    
  end
end