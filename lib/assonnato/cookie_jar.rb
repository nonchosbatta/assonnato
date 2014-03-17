#--
# Copyright (c) 2014 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# Released under the MIT License
# http://opensource.org/licenses/MIT
#++

module Assonnato

class CookieJar
  def initialize
    @cookies = ''
  end

  def set(cookie)
    @cookies = cookie
  end

  def get
    @cookies
  end

  def <<(cookie)
    @cookies << "; #{cookie}"
  end

  alias_method :append, :<<
  alias_method :to_s,   :get
end

end