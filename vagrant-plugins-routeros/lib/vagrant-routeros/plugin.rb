require "vagrant"

module VagrantPlugins
  module GuestRouterOS
    class Plugin < Vagrant.plugin("2")
      name "RouterOS"
      description "Mikroitik RouterOS support"

      guest("routeros") do
        require_relative "guest"
        Guest
      end

      guest_capability("routeros", "halt") do
        require_relative "cap/halt"
        Cap::Halt
      end

      provisioner "routeros_command" do
        require_relative "provisioner"
        CommandProvisioner
      end

      config("routeros_command", :provisioner) do
        require_relative "provisioner"
        CommandProvisionerConfig
      end

      provisioner "routeros_file" do
        require_relative "provisioner"
        FileProvisioner
      end

      config("routeros_file", :provisioner) do
        require_relative "provisioner"
        FileProvisionerConfig
      end
    end
  end
end