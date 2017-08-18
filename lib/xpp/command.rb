module Xpp
  class Command < Thor
    require 'xpp/command/generate'
    require 'xpp/command/move'
    require 'xpp/command/remove'
    require 'xpp/command/touch'
    require 'xpp/command/make_directory'
    require 'xpp/command/remove_directory'
  end
end
