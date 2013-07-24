module VagrantPlugins
  module Bee
    class Command < Vagrant.plugin(2, :command)
      def execute
        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant bee [command]"
          o.separator ""
        end
        ret = 0
        argv = parse_options(opts)
        with_target_vms do |machine|
          guest_path = machine.config.vm.synced_folders.select {|k,v|
            v[:id] == "vagrant-root"
          }.values[0][:guestpath]
          cmd = "cd #{guest_path} && bee " << argv.join(" ")
          ret += machine.communicate.execute cmd do |type, data|
            case type
            when :stdout
              @env.ui.info(data, :new_line => false)
            when :stderr
              @env.ui.error(data, :new_line => false)
            end
          end
          break if ret > 0
        end
        ret
      end
    end
  end
end
