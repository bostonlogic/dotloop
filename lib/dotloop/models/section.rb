module Dotloop
  module Models
    
    class Section
      extend ModelAttribute
      
      attr_reader :property_address, :buying_brokerage, :listing_brokerage, :financials 

      def initialize(attributes = {})
        @property_address = Dotloop::Models::PropertyAddress.new(attributes.property_address) if attributes.property_address
        @buying_brokerage = Dotloop::Models::BuyingBrokerage.new(attributes.buying_brokerage) if attributes.buying_brokerage
        @listing_brokerage = Dotloop::Models::ListingBrokerage.new(attributes.listing_brokerage) if attributes.listing_brokerage
        @financials = Dotloop::Models::Financials.new(attributes.financials) if attributes.financials
      end
    end
  
  end
end
