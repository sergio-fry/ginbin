require "tty-prompt"

require_relative "items"

module Ginbin
  class Menu
    def call
      prompt = TTY::Prompt.new

      prompt.enum_select("Choose command", choices).call
    end

    def choices
      items.map do |command|
        { name: command.title, value: command }
      end
    end

    def items
      Items.new
    end
  end
end
