module Xpp
  class UI
    class << self
      def confirm(message, is_confirm = true)
        if is_confirm
          HighLine.agree("#{message} [Y/n]")
        else
          true
        end
      end

      def info(message)
        puts "[INFO] #{message}"
      end

      def warning(message)
        puts "[WARN] #{message}"
      end

      def error(message)
        puts "[ERROR] #{message}"
      end
    end
  end
end
