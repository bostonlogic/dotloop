module Dotloop
  module Models
    class Admin
      extend ModelAttribute
      
      attribute :email_address,  :string
      attribute :first_name,     :string
      attribute :last_name,      :string
      attribute :is_admin,       :boolean
      attribute :member_id,      :integer
      attribute :status,         :string

      def initialize(attributes = {})
        set_attributes(attributes)
      end

    end
  end
end
