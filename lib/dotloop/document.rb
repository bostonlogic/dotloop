module Dotloop
  class Document
    include Dotloop::QueryParamHelpers
    attr_accessor :client

    def initialize(args)
      @client = args[:client]
    end

    def all(options = {})
      @client.get("/profile/#{profile_id(options)}/loop/#{loop_view_id(options)}/document").map do |document_attrs|
        doc = Dotloop::Models::Document.new(document_attrs)
        doc.client = client
        doc
      end
    end

    def get(options = {})
      document_name = CGI.escape(document_name(options).delete('/'))
      StringIO.new(
        @client.raw(
          "/profile/#{profile_id(options)}/loop/#{loop_view_id(options)}/document/#{document_id(options)}/#{document_name}.pdf"
        )
      )
    end
  end
end
