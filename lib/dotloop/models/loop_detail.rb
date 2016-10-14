module Dotloop
  module Models
    class LoopDetail
      extend ModelAttribute

      attribute :loop_id, :integer
      attr_reader :sections

      def initialize(attributes = {})
        set_attributes(attributes)
        @sections = Dotloop::Models::Section.new(attributes.sections) if attributes.sections
      end
    end

  end
end
