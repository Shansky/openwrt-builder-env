node default {
	package {
		[ 'build-essential', 'asciidoc', 'binutils', 'bzip2', 'gawk', 'gettext', 'git', 'libncurses5-dev', 'libz-dev', 'patch', 'unzip', 'zlib1g-dev', 'subversion', 'flex']:
			ensure => present,
			provider => apt;
	}

	file { '/opt':
		ensure => directory,
		owner  => 'vagrant',
		group  => 'vagrant'
	}

	vcsrepo { '/opt/attitude_adjustment':
 		ensure   => present,
  		provider => svn,
  		source   => 'svn://svn.openwrt.org/openwrt/branches/attitude_adjustment',
		require  => File['/opt'];
	} -> exec { 'chown_opt':
		command => 'chown -R vagrant:vagrant /opt/attitude_adjustment',
		path    => '/usr/bin:/usr/sbin:/bin:/sbin',
		user    => 'root',
	}
}
