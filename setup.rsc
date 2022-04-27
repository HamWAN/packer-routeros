:global packerHost
:put "Fetching $packerHost/vagrant_insecure.key"
/tool fetch url="$packerHost/vagrant_insecure.key" keep-result=yes dst-path="vagrant.key"
:delay 5

:put "Adding 'vagrant' user"
/user add name=vagrant password=vagrant group=full
/user ssh-keys import user=vagrant public-key-file=vagrant.key

if ([:pick [/system package update get installed-version] 0 1] = "6") do={
  # https://wiki.mikrotik.com/wiki/Manual:System/Packages
  :put "Disabling packages"
  /system package disable calea,dude,gps,ipv6,kvm,lcd,ups
}

:put "Fetching $packerHost/vagrant_provision.rsc"
/tool fetch url="$packerHost/vagrant_provision.rsc" keep-result=yes dst-path="vagrant_provision.rsc"

/file remove setup.rsc