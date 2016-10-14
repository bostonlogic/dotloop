module Dotloop
  class Employee
    include Dotloop::QueryParamHelpers
    attr_accessor :client

    def initialize(args)
      @client = args[:client]
    end

    def all(options = {})
      url = "/profile/#{profile_id(options)}/employee"
      @client.get(url).map { |employee_attrs| Dotloop::Models::Employee.new(employee_attrs) }
    end
  end
end
