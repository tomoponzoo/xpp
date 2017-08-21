module Xpp
  class Command
    desc 'gen [TASK]', 'Code generate and project modify command'
    option :path, :type => :string, :aliases => :p
    option :name, :type => :string, :aliases => :n, :required => true
    option :confirm, :type => :boolean, :aliases => :c, :default => false
    def gen(task)
      path = './Xppfile'
      unless File.exist?(path)
        # Not found Xppfile
        puts "Xppfile not found."
        return 1
      end

      dsl = Xpp::DSL.load(path, options)
      dsl.run(task)
    end
  end
end
