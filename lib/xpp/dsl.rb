module Xpp
  class DSL
    require 'xpp/dsl/generator'
    require 'xpp/dsl/task'
    require 'xpp/extension/project'
    require 'xpp/extension/group'
    require 'xpp/extension/file_reference'
    require 'xpp/template/template_renderer'
    require 'xpp/template/template_store'

    def self.load(path, options)
      new(options).tap do |dsl|
        dsl.load(path)
      end
    end

    def initialize(options)
      @config = Xpp::Configuration.new(options)
      @tasks = {}
    end

    def load(path)
      path = File.expand_path(path)
      instance_eval(File.read(path), path) if File.exist?(path)
    end

    # define DSL
    def project(path)
      @config.project = Xpp::ProjectLoader.load(path)
    end

    def group(path)
      @config.group = path
    end

    def templates(path)
      @config.template_store = Xpp::TemplateStore.store(path)
    end

    def task(name, &block)
      @tasks[name] = Xpp::Task.define_task(name, block)
    end

    # run
    def run(name)
      task = @tasks[name]
      if task.nil? then
        # Task is undefined.
        puts "Task is undefined. (#{name})"
        return
      end

      puts "Task: #{name}"
      task.run(@config)

      @config.project.save
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
