#!/usr/bin/env ruby

module Xpp
  module DSL
    def task(name)
      puts name
    end
  end
end

module Xpp
  class Task
  end
end

class CleanRoom
  def initialize
    # オブジェクトの特異メソッドを定義
    self.extend Xpp::DSL
  end
end

path = File.expand_path('./testdsl')
clean_room = CleanRoom.new
clean_room.instance_eval File.read(path), path
