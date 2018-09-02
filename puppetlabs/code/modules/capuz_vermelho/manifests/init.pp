class capuz_vermelho{

	file{"/etc/puppetlabs/puppet/puppet.conf":
		source => "puppet:///modules/capuz_vermelho/puppet.conf",
		ensure => present,
	}
	
	service {'puppet':
		ensure => running,
		enable => true,
		subscribe => File['/etc/puppetlabs/puppet/puppet.conf']
	}

}
