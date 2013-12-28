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
  class Episode < Show
    def all!(show)
      parse get(@host, "/shows/get/#{URI.escape show}/episodes/list")
    end

    def search!(keyword)
      raise NotImplementedError, 'you can search only the shows'
    end

    def get!(show, episode)
      parse get(@host, "/shows/get/#{URI.escape show}/episodes/get/#{episode}")
    end
  end
end