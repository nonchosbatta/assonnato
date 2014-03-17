#--
# Copyright (c) 2014 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# Released under the MIT License
# http://opensource.org/licenses/MIT
#++

module Assonnato

class Show
  include Parser

  def initialize(client)
    @client = client
  end

  def all(status = :ongoing, options = {})
    filters = ''.tap { |str|
      if options.has_key? :fansub
        str << by_fansub(options[:fansub])
      elsif options.has_key? :user
        if options.has_key?  :role
          str << by_role(options[:user], options[:role])
        else
          str << by_staff(options[:user])
        end
      end
    }

    parse @client.get("/api/v1/#{filters}/shows/all/#{status}")
  end

  def get(show_name)
    search(show_name).select { |show| show.name == show_name }
  end

  def last!(status)
    raise NotImplementedError, 'Show#last is not implemented'
  end

  def search(keyword)
    parse @client.get("/api/v1/shows/search/#{URI.escape keyword}")
  end

  def edit(name, episode, fields)
    path = '/api/v1/episode/edit'
    data = { name: name, episode: episode, _csrf: @client.user.csrf_token }.merge fields
    
    @client.post path, data
  end

  private
  def by_fansub(fansub)
    "/fansubs/#{URI.escape fansub}"
  end

  private
  def by_staff(user)
    "/users/#{URI.escape user}"
  end

  private
  def by_role(user, role)
    "/users/#{URI.escape user}/#{role}"
  end
end

end