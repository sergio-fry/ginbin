require "ginbin/command"
require 'yaml'

module Ginbin
  class Items
    include Enumerable 

    def initialize(items)
      @items = items
    end

    def each
      (@items).each do |item|
        if !item['menu'].nil?
          yield Menu.new(items: item['commands'], title: item['menu'])
        elsif item['title'].nil?
          yield Command.new(cmd: item, title: item)
        else
          yield Command.new(cmd: item['cmd'], title: item['title'])
        end
      end
    end
  end
end
