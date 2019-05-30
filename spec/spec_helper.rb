require 'simplecov'

require 'link_header_parser'

Dir.glob(File.join(Dir.pwd, 'spec', 'support', '**', '*.rb')).sort.each { |f| require f }
