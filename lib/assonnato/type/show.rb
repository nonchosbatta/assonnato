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

    def all!(status = :ongoing, options = {})
      filters = ''.tap { |str|
        if options.has_key?    :fansub
          str += by_fansub options[:fansub]
        elsif options.has_key? :user
          if options.has_key?  :role
            str += by_role  options[:user], options[:role]
          else
            str += by_staff options[:user]
          end
        end
      }

      parse get(@host, @path, "#{filters}/shows/all/#{status}")
    end

    def search!(keyword)
      parse get(@host, @path, "/shows/search/#{URI.escape keyword}")
    end

    def get!(show_name)
      search!(show_name).select { |show|
        show.name == show_name
      }
    end

    private
    def by_fansub(fansub)
      "/fansubs/#{fansub}"
    end

    private
    def by_staff(user)
      "/users/#{user}"
    end

    private
    def by_role(user, role)
      "/users/#{user}/#{role}"
    end
  end
end