module Xcodeproj
  class Project
    module Object
      class PBXFileReference
        def xpp_write_data(data)
          writable = true
          if FileTest.exists?(real_path)
            writable = Xpp::UI.confirm("既に同名のファイルが存在します。上書きしますか？")
          end

          if writable
            Pathname.new(real_path).open('w') { |f| f.puts data }
          end
        end
      end
    end
  end
end
