#--
# Copyright (c) 2014 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# Released under the MIT License
# http://opensource.org/licenses/MIT
#++

module Assonnato

class Episode
  include Parser

  def initialize(client)
    @client = client
  end

  def all(show)
    parse @client.get("/api/v1/episodes/#{URI.escape show}")
  end

  def get(show, episode)
    all(show).select { |ep| ep.episode == episode }
  end

  def last(status)
    parse @client.get("/api/v1/episodes/last/#{status}")
  end

  def search(keyword)
    raise NotImplementedError, 'you cannot search episodes'
  end

  def add(name, episode, fields)
    path = '/api/v1/episode/add'
    data = { name: name, episode: episode, _csrf: @client.user.csrf_token }.merge fields

    @client.post path, data
  end

  def edit(name, episode, fields)
    path = '/api/v1/episode/edit'
    data = { name: name, episode: episode, _csrf: @client.user.csrf_token }.merge fields

    @client.post path, data
  end
end

end
