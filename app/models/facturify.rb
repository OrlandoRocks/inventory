# -*- encoding : utf-8 -*-

require 'net/http'
require 'uri'
require 'json'
class Facturify

  def self.get_token

    uri = URI.parse("https://api.facturify.com/api/v1/auth")

    request = Net::HTTP::Post.new(uri.request_uri)

    request.content_type = "application/json"
    request["Postman-Token"] = "0ccb4c29-56a8-4684-9ccb-054abbb8da29"
    request["Cache-Control"] = "no-cache"
    request.body = {api_key: 'Yik3p4tbHlf5pzjf7bawbqMFp9wGuyhcJnqcxxQNU5mcXIcGdRJta0nBPKA7',
                    api_secret: 'zpm1MRLpAj94h6cWZnafYsLLrGyBTvmo'}.to_json

    req_options = {
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    token = JSON.parse(response.body)
    return token['jwt']['token']
  end

end
