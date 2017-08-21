require 'pathname'

module Xpp
  class TemplateStore
    def self.store(path = './templates')
      new(path)
    end

    def initialize(path)
      @path = File.expand_path(path)
    end

    def load(file)
      path = Pathname.new(@path).join(file)
      File.read(path)
    end
  end
end
