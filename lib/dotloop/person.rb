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

    def find(arg_one, arg_two)
      profile_id = arg_one[:profile_id] 
      person_id = arg_two[:person_id]
      person = @client.get("/profile/#{profile_id.to_i}/person/#{person_id.to_i}").first
      Dotloop::Models::Person.new(person)
    end
  end
end
