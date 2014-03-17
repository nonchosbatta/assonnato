Kernel.load 'lib/assonnato/version.rb'

Gem::Specification.new { |s|
  s.name          = 'assonnato'
  s.version       = Assonnato::VERSION
  s.author        = 'Giovanni Capuano'
  s.email         = 'webmaster@giovannicapuano.net'
  s.homepage      = 'http://www.giovannicapuano.net'
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'RESTful gem for wrapping Pigro\'s APIs'
  s.description   = 'RESTful wrapper gem for Pigro\'s APIs'
  s.licenses      = 'MIT'

  s.require_paths = ['lib']
  s.files         = Dir.glob('lib/**/*.rb')
  s.test_files    = Dir.glob('spec/**/*_spec.rb')

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
}