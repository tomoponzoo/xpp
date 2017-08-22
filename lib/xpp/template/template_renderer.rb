module Xpp
  class TemplateRenderer
    require 'date'
    require 'erb'

    def initialize(project, name)
      @project = project.root_object.name
      @author = `finger $(whoami)`.match(/Name: (?<name>.+)\n/)[:name]
      @date = Time.now.strftime('%Y/%m/%d')
      @organization = project.root_object.attributes['ORGANIZATIONNAME']
      @name = name
    end

    def render(template)
      erb = ERB.new(template)
      erb.result(binding)
    end
  end
end
