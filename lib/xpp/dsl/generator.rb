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
      @group = path
    end

    def template(name)
      @template = name
    end

    # run
    def run(targets, config)
      project = config.project
      targets = project.xpp_ref_targets(targets)
      group_path = config.build_group_path(@group)
      file_name = config.build_file_name(@template)

      # Create group
      group = project.xpp_ref_group(group_path.to_s, config.is_confirm)
      if group.nil?
        Xpp::UI.warning("Group is not found. '#{@name}' group creation was skipped.")
        return
      end

      # Create file reference
      file = group.xpp_new_file(file_name, targets)

      # Rendering
      template = config.template_loader.load(@template)
      if template.nil?
        Xpp::UI.error("Template file is not found.")
        return
      end
      renderer = Xpp::TemplateRenderer.new(project, config.name)
      data = renderer.render(template)

      # Save file data
      file.xpp_write_data(data)
    end
  end
end
