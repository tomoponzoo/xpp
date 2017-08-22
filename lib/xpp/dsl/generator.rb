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

      # グループ生成
      group = project.xpp_ref_group(group_path.to_s, config.is_confirm)
      if group.nil?
        Xpp::UI.warning("グループが存在しないため、#{name}の生成をスキップしました。")
        return
      end

      # ファイル生成
      file = group.xpp_new_file(file_name, targets)

      # テンプレートからレンダリング済みのデータを生成
      template = config.template_store.load(@template)
      renderer = Xpp::TemplateRenderer.new(project, config.name)
      data = renderer.render(template)

      # ファイルを保存
      file.xpp_write_data(data)
    end
  end
end
