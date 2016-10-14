module Dotloop
  class Folder
    include Dotloop::QueryParamHelpers
    attr_accessor :client

    def initialize(args)
      @client = args[:client]
    end

    def all(options = {})
      url = "/profile/#{profile_id(options)}/loop/#{loop_view_id(options)}/folder"
      @client.get(url).map { |folder_attrs| Dotloop::Models::Folder.new(folder_attrs) }
    end
  end
end
