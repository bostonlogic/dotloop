module Dotloop
  class Task
    include Dotloop::QueryParamHelpers
    attr_accessor :client

    def initialize(args)
      @client = args[:client]
    end

    def all(options = {})
      url = "/profile/#{profile_id(options)}/loop/#{loop_view_id(options)}/task"
      @client.get(url).map { |task_attrs| Dotloop::Models::Task.new(task_attrs) }
    end
  end
end
