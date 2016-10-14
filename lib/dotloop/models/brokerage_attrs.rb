module Dotloop
  module Models
    module BrokerageAttrs
      
      def self.included(klass)
        klass.extend ModelAttribute
        klass.attribute :city,                  :string
        klass.attribute :name,                  :string
        klass.attribute :postal_code,           :string
        klass.attribute :state_or_province,     :string
        klass.attribute :street_name,           :string
        klass.attribute :street_number,         :string
        klass.attribute :suite,                 :string
        klass.attribute :office_phone,          :string
        
        klass.class_eval do
          include InstanceMethods
        end 
      
      end
      
      module InstanceMethods
        def initialize(attributes = {})
          set_attributes(attributes)
        end
      end

    end
  end
end
