module Xcodeproj
  class Project
    def xpp_ref_group(path, is_confirm = false)
      main_group.xpp_ref_group(path, is_confirm)
    end

    def xpp_ref_targets(targets)
    end
  end
end
