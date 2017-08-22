module Xpp
  class UI
    class << self
      def confirm(message)
        HighLine.agree("#{message} [Y/n]")
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
