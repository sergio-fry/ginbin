require "ginbin/command"
require 'yaml'

module Ginbin
  class Commands
    include Enumerable 

    def each
      (local_commads + home_commads).each do |command_desc|
        if command_desc['title'].nil?
          yield Command.new(cmd: command_desc, title: command_desc)
        else
          yield Command.new(cmd: command_desc['cmd'], title: command_desc['title'])
        end
      end
    end

    def local_commads
      return [] unless File.exists? '.ginbin.yml'
      YAML.load_file('.ginbin.yml')["commands"]
    end

    def home_commads
      return [] unless File.exists? File.join(Dir.home, '.ginbin.yml')

      YAML.load_file(File.join(Dir.home, '.ginbin.yml'))["commands"]
    end
  end
end
