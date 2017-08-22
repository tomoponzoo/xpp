require "xpp/version"

module Xpp
  require 'thor'
  require 'xcodeproj'
  require 'fileutils'
  require 'pathname'
  require 'highline/import'
  
  autoload :Command, 'xpp/command'
  autoload :Configuration, 'xpp/configuration'
  autoload :DSL, 'xpp/dsl'
  autoload :ProjectLoader, 'xpp/project_loader'
  autoload :UI, 'xpp/ui'
end
