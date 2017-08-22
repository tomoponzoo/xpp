module Xpp
  class Configuration
    attr_accessor :project, :group, :template_loader
    attr_reader :path, :name, :is_confirm
    
    def initialize(options)
      @path = options[:path] || ''
      @name = options[:name]
      @is_confirm = options[:confirm]
      @project = Xpp::ProjectLoader.load
      @group = ''
      @template_loader = Xpp::TemplateLoader.new
    end

    def build_group_path(path)
      Pathname.new(@group).join(path).join(@path)
    end

    def build_file_name(template_name)
      suffix = Pathname.new(template_name).basename('.erb').to_s
      "#{@name}#{suffix}"
    end
  end
end
