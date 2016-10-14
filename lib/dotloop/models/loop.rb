module Dotloop
  module Models
    class Loop
      extend ModelAttribute

      attr_reader :loop_tags

      attribute :created_by,        :integer
      attribute :last_updated,      :time
      attribute :loop_id,           :integer
      attribute :loop_name,         :string
      attribute :loop_status,       :string
      attribute :loop_view_id,      :integer
      attribute :transaction_type,  :string

      def initialize(attributes = {})
        @loop_tags = attributes[:loop_tags]
        set_attributes(attributes)
      end

    end
  end
end
