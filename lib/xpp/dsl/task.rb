module Xpp
  class Task
    def self.define_task(name, block)
      new(name, block)
    end

    def initialize(name, block)
      @name = name
      @targets = []
      @generators = {}
      instance_eval(&block)
    end

    # define DSL
    def targets(names)
      @targets = names
    end

    def target(name)
      @targets << name
    end

    def generate(name, &block)
      @generators[name] = Xpp::Generator.define_generator(name, block)
    end

    # run
    def run(options)
      @generators.each do |name, generator|
        generator.run(name, @targets, options)
      end
    end
  end
end
