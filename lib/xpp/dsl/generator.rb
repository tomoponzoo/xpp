module Xpp
  class Generator
    def self.define_generator(name, block)
      new(name, block)
    end

    def initialize(name, block)
      @name = name
      instance_eval(&block)
    end

    # define DSL
    def group(path)
    end

    # run
    def run(name, targets, options)
      
    end
  end
end
