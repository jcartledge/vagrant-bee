module VagrantPlugins
  module Bee
    class Command < Vagrant.plugin(2, :command)
      def execute
        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant bee [command]"
          o.separator ""
        end
        argv = parse_options(opts)
        puts argv
        0
      end
    end
  end
end
