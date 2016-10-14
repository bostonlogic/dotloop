module Dotloop
  module Models
    class Task
      extend ModelAttribute
      
      attribute :completion_status,     :string
      attribute :created_by,            :integer
      attribute :created_date,          :time
      attribute :due_date,              :time
      attribute :due_date_type,         :time
      attribute :list_id,               :integer
      attribute :list_name,             :string
      attribute :locked_status,         :string
      attribute :name,                  :string
    
      def initialize(attributes = {})
        set_attributes(attributes)
      end
    end
  end
end
