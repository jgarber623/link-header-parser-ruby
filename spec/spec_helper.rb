# frozen_string_literal: true

require 'simplecov'

require 'link-header-parser'

Dir.glob(File.join(Dir.pwd, 'spec', 'support', '**', '*.rb')).sort.each { |f| require f }
