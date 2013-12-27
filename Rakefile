#! /usr/bin/env ruby
require 'rake'

task :default => [ :install, :test ]

task :install do
  sh 'gem install rspec --no-force'
  sh 'gem build   *.gemspec'
  sh 'gem install *.gem'
end

task :test do
  FileUtils.cd 'spec' do
    sh 'rspec show_spec.rb    --backtrace --color --format doc'
    sh 'rspec episode_spec.rb --backtrace --color --format doc'
  end
end