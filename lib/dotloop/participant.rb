module Dotloop
  class Participant
    attr_accessor :client

    def initialize(args)
      @client = args[:client]
    end

    def all(profile_id, loop_view_id)
      @client.get("/profile/#{profile_id.to_i}/loop/#{loop_view_id.to_i}/participant").map do |participant_attrs|
        Dotloop::Models::Participant.new(participant_attrs)
      end
    end
  end
end
