#--
# Copyright (c) 2014 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# Released under the MIT License
# http://opensource.org/licenses/MIT
#++

module Assonnato

class Client
  include Request

  attr_accessor :host, :port
  attr_reader   :cookies

  def initialize(host = 'pigro.omnivium.it', port = 80, ssl = false)
    @host    = host
    @port    = port
    @ssl     = ssl
    @cookies = CookieJar.new
  end

  def self.namespace(*names)
    options = names.last.is_a?(Hash) ? names.pop : {}
    names   = names.map(&:to_sym)
    name    = names.pop
    return if public_method_defined?(name)

    converted  = options.fetch(:full_name, name).to_s
    converted  = converted.split('_').map(&:capitalize).join
    class_name = ''
    class_name = "#{self.name.split('::').last}::" unless options.fetch(:root, false)
    class_name += converted

    define_method(name) do
      ApiFactory.new class_name, self
    end

    self
  end

  namespace :user,    root: true
  namespace :show,    root: true
  namespace :episode, root: true
end

end