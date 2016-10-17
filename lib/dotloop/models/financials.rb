module Dotloop
  module Models
    class Financials
      extend ModelAttribute
      
      attribute :comission_rate,             :string
      attribute :current_price,              :string
      attribute :earnest_money_held_by,      :string
      attribute :original_listing_price,     :string
      attribute :purchase_price,             :string
      
      def initialize(attributes = {})
        attributes ||= {}
        set_attributes(attributes)
      end
    
    end
  end
end
