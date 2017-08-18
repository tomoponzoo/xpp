module Xpp
  class DSL
    def self.load(path)
      new.tap do |dsl|
        dsl.load(path)
      end
    end

    def initialize
      @options = {}
      @options[:templates_directory] = './templates'
      @tasks = {}
    end

    def load(path)
      instance_eval(File.read(path), path) if File.exist?(path)
    end

    def base_group_path(path)
      @options[:base_group_path] = path
    end

    def templates_directory(path)
      @options[:templates_directory] = path
    end

    def task(name, &block)
      @tasks[name] = block
    end

    def run(name)
    end
  end
end

=begin

# xpp gen clean_architecture -p Purchase -n PurchseScout
> Generate 'ViewController'
> template: ViewController.swift.erb
> path: Classes/Presentation/ViewController/Purchase/PurchaseScoutViewController.swift
> Generate 'Presenter'
> template: Presenter.swift.erb
> path: Classes/Presentation/Presenter/Purchase/PurchaseScoutPresenter.swift
> ...

# xpp gen clean_architecture -p Purchase -n PurchaseScout --only Builder,Wireframe
> Generate 'Builder'
> template: Builder.swift.erb
> path: Classes/Application/Builder/Purchase/PurchaseScoutBuilder.swift
> Generate 'Wireframe'
> template: Wireframe.swift.erb
> path: Classes/Application/Wireframe/Purchase/PurchaseScoutWireframe.swift

=end
