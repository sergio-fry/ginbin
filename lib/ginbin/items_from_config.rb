require 'yaml'

module Ginbin
  class ItemsFromConfig
    include Enumerable 

    def each
      (local_items + home_items).each do |item|
        yield item
      end
    end

    def local_items
      return [] if at_home?
      return [] unless File.exist? '.ginbin.yml'
      YAML.load_file('.ginbin.yml')["commands"]
    end

    def home_items
      return [] unless File.exist? File.join(Dir.home, '.ginbin.yml')

      YAML.load_file(File.join(Dir.home, '.ginbin.yml'))["commands"]
    end

    def at_home?
      Dir.getwd == Dir.home
    end
  end
end
