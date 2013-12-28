#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

module Assonnato
  module Parser

    def parse(what, format = :json)
      collection = case format.to_sym
        when :json             then JSON.parse what
        when :xml, :csv, :yaml then raise NotImplementedError, 'the support for XML, CSV or YAML data is not supported yet'
        else                        raise ArgumentError,       'format not recognized'
      end

      [].tap { |res|
        [collection].flatten.each { |element|
          keys   = element.keys.map { |k| k.to_sym }
          values = element.values
          res << Struct.new(*keys).new(*values)
        }
      }
    end
  end
end