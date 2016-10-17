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
      
      def property_address
        sections.property_address
      end
      
      def buying_brokerage
        sections.buying_brokerage
      end
      
      def listing_brokerage
        sections.listing_brokerage
      end
      
      def financials
        sections.financials
      end

    end

  end
end
