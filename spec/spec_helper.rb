$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'gitguard'

Dir.glob( File.expand_path('../support/**/*.rb', __FILE__) ).sort.each{|f| require f}
