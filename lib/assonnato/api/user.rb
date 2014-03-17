#--
# Copyright (c) 2014 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# Released under the MIT License
# http://opensource.org/licenses/MIT
#++

module Assonnato

class User
  def initialize(client)
    @client = client
  end

  def login(username, password)
    path = '/api/v1/user/login'
    data = { username: username, password: password }

    @client.post path, data
  end

  def logout
    path = '/api/v1/user/logout'
    data = { _csrf: @client.user.csrf_token }

    @client.post path, data
  end

  def csrf_token
    path = '/api/v1/user/csrf_token'

    @client.get(path)['message']
  end
end

end