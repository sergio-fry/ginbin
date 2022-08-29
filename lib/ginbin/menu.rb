require "tty-prompt"

require_relative "items"
require_relative "items_from_config"

module Ginbin
  class Menu
    attr_reader :title

    def initialize(items: ItemsFromConfig.new, title: "Root")
      @items = items
      @title = title
    end

    def call
      prompt = TTY::Prompt.new

      prompt.enum_select("Choose command", choices).call
    end

    def choices
      Items.new(@items).map do |command|
        { name: command.title, value: command }
      end
    end
  end
end
