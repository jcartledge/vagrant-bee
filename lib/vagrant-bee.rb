require "vagrant-bee/version"

module VagrantPlugins
  module Bee
    class Bee < Vagrant.plugin("2")
      name "Bee"
      command "bee" do
        require_relative "vagrant-bee/command"
        Command
      end
    end
  end
end
