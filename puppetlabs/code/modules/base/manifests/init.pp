class base {
	case $::osfamily{
		"redhat":{
			$pacotes = ["epel-release", "git", "vim", "sysstat", "htop", "sl", "figlet", "fish","fortune-mod"]
		}
		"debian":{
			exec{"atualizar_pacotes":
				command => "/usr/bin/apt update"
			}

			$pacotes = ["git","vim","sysstat","htop","cowsay","sl","figlet","fish","fortunes-br"]
		}	
	
	}

	file{"/root/.bash_logout":
		source => "puppet:///modules/base/bash_logout",
		ensure => present,
	}	

	package{$pacotes:
		ensure => present
	}
	
	user { "devops":
		ensure => present,
		managehome => true,
		shell => "/usr/bin/fish"
	
	}
}
