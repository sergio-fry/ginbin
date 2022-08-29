require "tty-prompt"

require_relative "commands"

module Ginbin
  class Menu
    def call
      prompt = TTY::Prompt.new

      prompt.enum_select("Choose command", choices).call
    end

    def choices
      commands.map do |command|
        { name: command.title, value: command }
      end
    end

    def commands
      Commands.new
    end
  end
end
