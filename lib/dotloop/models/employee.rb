module Dotloop
  module Models
    class Employee
      extend ModelAttribute

      attribute :first_name,        :string
      attribute :last_name,         :string
      attribute :email_address,     :string
      attribute :status,            :string
      attribute :is_admin,          :boolean
      attribute :loops_created,     :integer
      attribute :member_id,         :integer
      attribute :total_loops,       :integer

      def initialize(attributes = {})
        set_attributes(attributes)
      end

    end
  end
end
