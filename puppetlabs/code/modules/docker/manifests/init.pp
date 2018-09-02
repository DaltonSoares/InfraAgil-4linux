class docker{

	case $::osfamily{
		"redhat":{
			$pacotes = [""]
		}
		"debian":{
			exec{"atualizar_pacotes":
				command => "/usr/bin/apt update"
			}

			$pacotes = ["apt-transport-https","ca-certificates","curl","software-properties-common"]
			
			exec{"Add Docker’s official GPG key":
				command => "/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
				
			}
			
			exec{"Add Repositorio Docker":
				command => "/usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable'"
			}

			
		}
	}

	package{$pacotes:
		ensure => present

	}

        exec{"atualizar_pacotes2":
        	command => "/usr/bin/apt update"
        }

	package{"docker-ce":
		ensure => present
	}

	service{"docker":
		ensure => running,
		enable => true,
		require => Package["docker-ce"]
	}


}
