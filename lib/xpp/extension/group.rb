module Xcodeproj
  class Project
    module Object
      class PBXGroup
        def xpp_ref_group(path, is_confirm = false)
          path.split('/').reduce(self) do |group, name|
            if group.nil?
              break
            end

            found_group = group.groups.find { |g| g.path == name or g.name == name }
            unless found_group.nil?
              next found_group
            end    
            group.xpp_new_group(name, is_confirm)
          end    
        end

        def xpp_new_group(name, is_confirm = false)
          unless Xpp::UI.confirm("'#{name}' group is not found. Would you like to create group?", is_confirm)
            return nil
          end

          path = xpp_new_group_directory(name, is_confirm)
          new_group(name, path)
        end

        def xpp_new_group_directory(name, is_confirm = false)
          pathname = Pathname.new(real_path).join(name)
          if FileTest.exists?(pathname)
            return name
          end

          if Xpp::UI.confirm("Do you want to create a directory corresponding to the '#{name}' group?", is_confirm)
            FileUtils.mkdir_p(pathname)
            return name
          else
            return nil
          end
        end

        def xpp_new_file(path, targets)
          targets = targets || []

          file = files.find { |f| f.path == path }
          if file.nil?
            file = new_file(path)
          end

          targets.each { |target| target.add_file_references([file]) }
          file
        end
      end
    end
  end
end
