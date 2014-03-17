#--
# Copyright (c) 2014 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# Released under the MIT License
# http://opensource.org/licenses/MIT
#++

module Assonnato

module Parser
  def parse(what)
    [].tap { |res|
      [what].flatten.each { |element|
        keys   = element.keys.map { |k| k.to_sym }
        values = element.values
        res << Struct.new(*keys).new(*values)
      }
    }
  end
end
  
end