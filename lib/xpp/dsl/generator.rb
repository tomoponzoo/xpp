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
      targets = project.xpp_targets(targets)
      group_path = config.build_group_path(@group)
      file_name = config.build_file_name(@template)

      group = project.xpp_ref_group(group_path.to_s, config.is_confirm)
      file = group.xpp_new_file(file_name, targets)

      # STEP1: テンプレートからファイル生成
      # STEP2: ファイルを保存
    end
  end
end
