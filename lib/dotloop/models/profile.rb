module Dotloop
  module Models
    class Profile
      extend ModelAttribute
      
      attr_accessor :client

      attribute :active,           :boolean
      attribute :address1,         :string
      attribute :address2,         :string
      attribute :city,             :string
      attribute :company_name,     :string
      attribute :deleted,          :boolean
      attribute :fax_number,       :string
      attribute :name,             :string
      attribute :phone_number,     :string
      attribute :profile_id,       :integer
      attribute :profile_type,     :string
      attribute :state,            :string
      attribute :suite,            :string
      attribute :zipcode,          :string

      def initialize(attributes = {})
        set_attributes(attributes)
      end

      def loops
        client.Loop.all(profile_id profile_id)
      end
    end
  end
end
