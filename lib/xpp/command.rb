module Xpp
  class Command < Thor
    desc 'gen [TASK]', 'Code generate and project modify command'
    def gen(task)
    end

    desc 'mv [FROM] [TO]', 'Move or rename file command'
    def mv(path_from, path_to)
    end

    desc 'rm [PATH]', 'Remove file command'
    def rm(path)
    end

    desc 'touch [PATH]', 'Create file command'
    def touch(path)
    end

    desc 'mkdir [PATH]', 'Create directory command'
    def mkdir(path)
    end

    desc 'rmdir [PATH]', 'Remove directory command'
    def rmdir(path)
    end
  end
end
