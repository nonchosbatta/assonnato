#--
# Copyright (c) 2014 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# Released under the MIT License
# http://opensource.org/licenses/MIT
#++

module Assonnato
  
module Request
  def get(path, headers = {})
    request :get,  path, {}, headers
  end

  def post(path, data = {}, headers = {})
    request :post, path, data, headers
  end

  private
  def request(method, path, data, headers)
    headers['Cookie'] = @cookies.get

    Net::HTTP.start(@host, @port, use_ssl: @ssl) do |http|
      resp = case method.to_sym
        when :get
          http.get  path, headers
        when :post
          data = URI.encode_www_form data
          headers['Content-Type'] = 'application/x-www-form-urlencoded'

          http.post path, data, headers
        else raise ArgumentError, 'format not recognized'
      end

      @cookies << resp.response['set-cookie'].split('; ')[0] rescue @cookies.get
      JSON.parse resp.body
    end
  end
end

end