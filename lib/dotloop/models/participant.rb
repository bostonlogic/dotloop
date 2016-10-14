module Dotloop
  module Models
    class Participant
      extend ModelAttribute
      
      attribute :email,               :string
      attribute :member_of_my_team,   :string
      attribute :name,                :string
      attribute :participant_id,      :integer
      attribute :role,                :string
      
      def initialize(attributes = {})
        set_attributes(attributes)
      end
    
    end
  end
end
