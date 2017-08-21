module Xpp
  class Project
    module Object
      class PBXGroup
        def xpp_ref_group(path, is_confirm = false)
          path.split('/').reduce(self) do |group, name|
            found_group = group.groups.find { |g| g.path == name or g.name == name }
            unless found_group.nil?
              next found_group
            end    
            group.xpp_new_group(name, name, is_confirm)
          end    
        end

        def xpp_new_group(name, is_confirm = false)
          is_new_group = !is_confirm || Xpp::UI.confirm("[#{name}]グループが存在しません。グループを作成しますか？")
          
          unless is_new_group
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

          is_new_directory = !is_confirm || Xpp::UI.confirm("[#{name}]グループに対応するディレクトリを作成しますか？")
          if is_new_directory
            FileUtils.mkdir_p(pathname)
            return name
          else
            return nil
          end
        end

        def xpp_new_file(path)
          
        end
      end
    end
  end
end
