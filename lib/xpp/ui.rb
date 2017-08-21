module Xpp
  class UI
    require 'highline/import'
    
    class << self
      def confirm(message)
        HighLine.agree("#{message} [Y/n]")
      end
    end
  end
end
