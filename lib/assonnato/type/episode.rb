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
      parse get(@host, '/api/v1', "/episodes/#{URI.escape show}")
    end

    def search!(keyword)
      raise NotImplementedError, 'you cannot search episodes'
    end

    def get!(show, episode)
      all!(show).select { |ep| ep.episode == episode }
    end
  end
end