require 'pathname'
require 'pg'
require 'active_record'
require 'logger'
require 'sinatra/activerecord'

## Load all files and configure the db

APP_ROOT = Pathname.new(File.expand_path(File.dirname(__FILE__)))

APP_NAME = APP_ROOT.basename.to_s

if ENV['DEBUG']
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

Dir[APP_ROOT.join('models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end
