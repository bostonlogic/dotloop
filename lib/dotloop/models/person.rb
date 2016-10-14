module Dotloop
  module Models
    class Person
      extend ModelAttribute
      
      attribute :city,                  :string
      attribute :email,                 :string
      attribute :fax,                   :string
      attribute :first_name,            :string
      attribute :homephone,             :string
      attribute :last_name,             :string
      attribute :officephone,           :string
      attribute :person_id,             :integer
      attribute :state_or_prov,         :string
      attribute :street_address01,      :string
      attribute :zip_or_postal_code,    :string
      
      
      def initialize(attributes = {})
        set_attributes(attributes)
      end
    
    end
  end
end
