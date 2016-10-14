module Dotloop
  module Models
    class DocumentActivity
      extend ModelAttribute
      
      attribute :activity_date,    :time
      attribute :message,          :string
      
      def initialize(attributes = {})
        set_attributes(attributes)
      end
    
    end
  end
end
