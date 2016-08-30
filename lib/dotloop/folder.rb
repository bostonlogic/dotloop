module Dotloop
  class Folder
    attr_accessor :client

    def initialize(args)
      @client = args[:client]
    end

    def all(profile_id, loop_view_id)
      url = "/profile/#{profile_id.to_i}/loop/#{loop_view_id.to_i}/folder"
      @client.get(url).map { |folder_attrs| Dotloop::Models::Folder.new(folder_attrs) }
    end
  end
end
