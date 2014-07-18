#--
# Copyright (c) 2014 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# Released under the MIT License
# http://opensource.org/licenses/MIT
#++

module Assonnato

class << self
  def new(host = 'pigro.omnivium.it', port = 80, ssl = false)
    Client.new host, port, ssl
  end

  def method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    new.send method, *args, &block
  end

  def respond_to?(method, include_private = false)
    new.respond_to?(method, include_private) || super(method, include_private)
  end
end

end