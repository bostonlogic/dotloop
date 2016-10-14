module Dotloop
  module Models
    
    class PropertyAddress
      extend ModelAttribute

      attribute :city,                       :string
      attribute :country,                    :string
      attribute :mls_number,                 :string
      attribute :postal_code,                :string
      attribute :property_address_country,   :string
      attribute :state_or_province,          :string
      attribute :street_name,                :string
      attribute :street_number,              :string

      def initialize(attributes = {})
        set_attributes(attributes)
      end
    end
  
  end
end
