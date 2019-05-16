require 'rake'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'
require 'active_support'
require 'active_support/core_ext'

require_relative 'config'

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:spec)
task :default  => :specs
