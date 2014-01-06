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
    attr_accessor :host, :path
    include Request
    include Parser

    def initialize(host, path = nil)
      @host = host
      @path = path || '/api/v1'
    end

    def all!(status = :ongoing, fansub = '')
      parse get(@host, @path, "/shows/all/#{status}/#{fansub}")
    end

    def search!(keyword)
      parse get(@host, @path, "/shows/search/#{URI.escape keyword}")
    end

    def get!(show_name)
      search!(show_name).select { |show|
        show.name == show_name
      }
    end
  end
end