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
  class Show
    attr_accessor :host
    include Request
    include Parser

    def initialize(host)
      @host = host
    end

    def all!
      parse get(@host, '/shows/all')
    end

    def search!(keyword)
      parse get(@host, "/shows/search/#{URI.escape keyword}")
    end

    def get!(show)
      parse get(@host, "/shows/get/#{URI.escape show}")
    end
  end
end