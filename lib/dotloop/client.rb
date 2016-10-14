module Dotloop
  class Client
    include Curl

    attr_accessor :api_key, :application, :base_uri

    def initialize(api_key, application = 'dotloop')
      @api_key = api_key[:api_key]
      @application = application
      @base_uri = 'https://www.dotloop.com/my/api/v1_0/'
      raise 'Please enter an API key' unless @api_key
    end

    def get(page, params = {})
      response = raw(page, params)
      self.class.snakify(response)
    end

    def raw(page, params = {})
      uri = Addressable::URI.parse(@base_uri + page)
      uri.query_values = params
      uri.query
      response = Curl.get(uri.to_s) do |http|
        http.headers['Authorization'] = "Bearer #{@api_key}"
        http.headers['User-Agent'] = @application
        http.headers['Accept'] = '*/*'
      end
      raise "Error communicating: Response code #{response.response_code}" unless response.response_code == 200
      Oj.load response.body_str
    end

    def Profile
      @profile ||= Dotloop::Profile.new(:client => self)
    end

    def Loop
      @loop ||= Dotloop::Loop.new(:client => self)
    end

    def Document
      @document ||= Dotloop::Document.new(:client => self)
    end

    def Participant
      @participant ||= Dotloop::Participant.new(:client => self)
    end

    def LoopActivity
      @loop_activity ||= Dotloop::LoopActivity.new(:client => self)
    end

    def Task
      @task ||= Dotloop::Task.new(:client => self)
    end

    def Folder
      @folder ||= Dotloop::Folder.new(:client => self)
    end

    def Employee
      @employee ||= Dotloop::Employee.new(:client => self)
    end

    def DocumentActivity
      @document_activity ||= Dotloop::DocumentActivity.new(:client => self)
    end

    def Person
      @person ||= Dotloop::Person.new(:client => self)
    end

    def Admin
      @admin ||= Dotloop::Admin.new(:client => self)
    end

    def self.snakify(hash)
      if hash.is_a? Array
        hash.map(&:to_snake_keys)
      else
        hash.to_snake_keys
      end
    end
  end
end
