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

    def all!(status = :ongoing, fansub = '')
      parse get(@host, '/api/v1', "/shows/all/#{status}/#{fansub}")
    end

    def search!(keyword)
      parse get(@host, '/api/v1', "/shows/search/#{URI.escape keyword}")
    end

    def get!(show_name)
      search!(show_name).select { |show|
        show.name == show_name
      }
    end
  end
end