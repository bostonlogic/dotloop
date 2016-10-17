module ClientHelper
    
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
    case response.content_type
    when /json/
      Oj.load response.body_str
    when /pdf/
      response.body_str
    end
  end
  
  def hashify(val)
    val.kind_of?(Array) ? val.map{|v| Hashie::Rash.new(v)} : Hashie::Rash.new(val)
  end
  
  def snakify(val)
    if val.is_a? Array
      val.map(&:to_snake_keys)
    else
      val.to_snake_keys
    end
  end

end