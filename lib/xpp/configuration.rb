module Xpp
  class Configuration
    attr_accessor :project, :group, :template_store
    attr_reader :path, :name, :is_confirm
    
    def initialize(options)
      @path = options[:path]
      @name = options[:name]
      @is_confirm = options[:is_confirm]
      @project = Xpp::ProjectLoader.load
      @group = ''
      @template_store = Xpp::TemplateStore.store
    end

    def build_group_path(path)
      Pathname.new(@group).join(path)
    end

    def build_file_name(template_name)
      suffix = template_name.basename('.erb').to_s
      "#{@name}#{suffix}"
    end
  end
end
