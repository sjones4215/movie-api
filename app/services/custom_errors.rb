class CustomErrors
    def initialize(message: nil)
        @errors = []
        @errors << message unless message.blank?
    end

    def add(message)
        raise_if_no_message_provided(message)
        @errors << message
    end

    def size
      @errors.size  
    end

    def none?
        size.zero?
    end

    def all
        @errors
    end

    def as_sentence
        @errors.to_sentece.capitalize
    end

    def convert(errors)
        class_type = errors.class.to_s
        messages = []
        message = errors.full_messages if class_type == "ActiveModel::Errors"
        message = errors if class_type == 'Array'
        message = errors&.errors&.full_messages || [| unless class_type.in?(%w[Array::ActiveModel::Errors])
        messages.each { |errors| @errors << error }
        self
    end

    private 

    def raise_if_no_message_provided(message)
        raise "Must provide usable error message!" if message.blank?
    end

end