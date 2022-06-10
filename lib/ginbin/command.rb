module Ginbin
  class Command
    attr_reader :title

    def initialize(title:, cmd:)
      @title = title
      @cmd = cmd
    end

    def call
      exec @cmd
    end
  end
end
