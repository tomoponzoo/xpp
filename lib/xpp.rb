require "xpp/version"

module Xpp
  require 'thor'

  autoload :Command, 'xpp/command'
  autoload :DSL, 'xpp/dsl'
  autoload :UI, 'xpp/ui'
end
