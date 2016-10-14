module Dotloop
  class Participant
    include Dotloop::QueryParamHelpers
    attr_accessor :client

    def initialize(args)
      @client = args[:client]
    end

    def all(options = {})
      @client.get("/profile/#{profile_id(options)}/loop/#{loop_view_id(options)}/participant").map do |participant_attrs|
        Dotloop::Models::Participant.new(participant_attrs)
      end
    end
  end
end
