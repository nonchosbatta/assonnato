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
    attr_accessor :host, :format
    include Request
    include Parser

    def initialize(host, format = :json)
      @host   = host
      @format = format
    end

    def all!
      parse get(@host, "/shows/all.#{@format}"), @format
    end

    def search!(keyword)
      parse get(@host, "/shows/search/#{URI.escape keyword}.#{@format}"), @format
    end

    def get!(show)
      parse get(@host, "/shows/get/#{URI.escape show}.#{@format}"), @format
    end
  end
end