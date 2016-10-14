module Dotloop
  class Person
    include Dotloop::QueryParamHelpers
    attr_accessor :client

    def initialize(args)
      @client = args[:client]
    end

    def all(options = {})
      persons = []
      url = "/profile/#{profile_id(options)}/person"
      (1..MAX_LOOPS).each do |i|
        options[:batch_number] = i
        current_person = @client.get(url, query_params(options)).map do |person_attrs|
          Dotloop::Models::Person.new(person_attrs)
        end
        persons += current_person
        break if current_person.size < BATCH_SIZE
      end
      persons
    end

    def find(options = {})
      person = @client.get("/profile/#{profile_id(options)}/person/#{person_id(options)}").first
      Dotloop::Models::Person.new(person)
    end
  end
end
