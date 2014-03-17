#--
# Copyright (c) 2011 Peter Murach
# Copyright (c) 2014 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# Released under the MIT License
# http://opensource.org/licenses/MIT
#++

module Assonnato

class ApiFactory
  class << self
    def new(klass, options = {})
      return create_instance(klass, options) if klass
      raise ArgumentError, 'must provide API class to be instantiated'
    end

    def create_instance(klass, options)
      convert_to_constant(klass.to_s).new options
    end

    def convert_to_constant(classes)
      classes.split('::').inject(Assonnato) do |constant, klass|
        constant.const_get klass
      end
    end
  end
end

end