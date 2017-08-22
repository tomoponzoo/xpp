module Xpp
  class ProjectLoader
    def self.load(path = nil)
      path = path || find
      if path.nil?
        return nil
      end

      path = File.expand_path(path)
      unless File.exist?(path)
        return nil
      end

      Xcodeproj::Project.open(path)
    end

    def self.find
      Dir.glob('./*.xcodeproj').first
    end
  end
end
