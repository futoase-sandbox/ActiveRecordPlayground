require 'bundler'

Bundler.setup(:default)

require 'active_record'
require 'enumerize'
require 'minitest/autorun'
require 'logger'
require 'sqlite3'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Base.logger = Logger.new(STDOUT)

require_relative '../models/fruit'
require_relative '../models/vegetable'
require_relative '../models/tax'
require_relative '../models/tax_type'
require_relative '../models/user'

require_relative '../db/schema'
require_relative '../db/seed'
