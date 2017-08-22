require 'pathname'

module Xpp
  class TemplateLoader
    def initialize(path = './templates')
      @path = File.expand_path(path)
    end

    def load(file)
      path = Pathname.new(@path).join(file)
      FileTest.exists?(path) ? File.read(path) : nil
    end
  end
end
