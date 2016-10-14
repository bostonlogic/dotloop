module Dotloop
  module Models
    class Folder
      extend ModelAttribute

      attribute :archived,               :boolean
      attribute :folder_email_name,      :string
      attribute :folder_id,              :integer
      attribute :last_updated_date_iso,  :time
      attribute :minimized,              :boolean
      attribute :name,                   :string
      attribute :view_id,                :integer

      def initialize(attributes = {})
        set_attributes(attributes)
      end

    end
  end
end
