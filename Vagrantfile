#vars
$apt_get_update = <<EOF
/usr/bin/wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
/usr/bin/dpkg -i puppetlabs-release-precise.deb
/usr/bin/apt-get update
/usr/bin/apt-get -y install puppet
EOF

Vagrant.configure("2") do |config|

  config.cache.auto_detect = true
  {
    :default => {
      :box     => 'ubuntu/trusty64',
      :ip      => '10.0.3.10',
    }
  }.each do |name,cfg|
    config.vm.define name do |local|
      local.vm.box = cfg[:box]
      local.vm.box_url = cfg[:box_url]
      local.vm.network :private_network, ip: cfg[:ip]
    	local.vm.provider :virtualbox do |vb|
	      vb.memory = 2048
	      vb.cpus = 2
      end
      local.vm.host_name = ENV['VAGRANT_HOSTNAME'] || name.to_s.downcase.gsub(/_/, '-').concat(".example42.com")
      local.vm.provision :shell, :inline => $apt_get_update
      local.vm.provision :puppet do |puppet|
        puppet.hiera_config_path = 'deploy/hiera.yaml'
        puppet.module_path = "deploy/modules"
        puppet.manifests_path = "deploy"
        puppet.manifest_file = "site.pp"
        puppet.options = [
         '--verbose',
         '--report',
         '--show_diff',
         '--pluginsync',
         '--summarize',
        ]
      end
    end
  end
end
