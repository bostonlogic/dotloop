module Dotloop
  class Profile
    attr_accessor :client

    def initialize(args)
      @client = args[:client]
    end

    def all
      @client.get('/profile').map do |profile_attrs|
        profile = Dotloop::Models::Profile.new(profile_attrs)
        profile.client = client
        profile
      end
    end
  end
end
