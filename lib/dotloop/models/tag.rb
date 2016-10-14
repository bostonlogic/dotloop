module Dotloop
  module Models
    class Tag
      extend ModelAttribute

      attribute :profile_id,     :integer
      attribute :tag_id,         :integer
      attribute :tag_name,       :string
    
      def initialize(attributes = {})
        set_attributes(attributes)
      end
    end
  end
end
