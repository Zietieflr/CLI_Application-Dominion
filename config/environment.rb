require 'bundler/setup'
Bundler.require
require 'csv'
require 'tty-prompt'

require_all 'lib'

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

# binding.pry