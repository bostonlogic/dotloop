module Dotloop
  module Models
    class Document
      extend ModelAttribute
      
      attr_accessor :client
      
      attribute :created_by,                  :integer
      attribute :created_date,                :time
      attribute :document_id,                 :integer
      attribute :document_name,               :string
      attribute :folder_name,                 :string
      attribute :last_modified_date,          :time
      attribute :loop_id,                     :integer
      attribute :signature_verfication_link,  :string
      
      attr_reader :shared_with
      
      def initialize(attributes = {})
        set_attributes(attributes)
      end
      
      def shared_with=(attrs)
        @shared_with = attrs.map(&:to_i)
      end
      
    end
  end
end
