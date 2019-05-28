class crond::config inherits crond {

  file { $crond::params::root_cron_files:
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  file { $crond::params::root_cron_dirs:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  if($crond::allowed_users!=undef)
  {
    concat { '/etc/cron.allow':
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }

    concat::fragment{ '/etc/cron.allow default list':
      target  => '/etc/cron.allow',
      order   => '42',
      content => template("${module_name}/cronallow.erb"),
    }
  }
  else
  {
    file { '/etc/cron.allow':
      ensure => 'absent',
    }
  }

  if($crond::denied_users!=undef)
  {
    concat { '/etc/cron.deny':
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }

    concat::fragment{ '/etc/cron.deny default list':
      target  => '/etc/cron.deny',
      order   => '42',
      content => template("${module_name}/crondeny.erb"),
    }
  }
  else
  {
    file { '/etc/cron.deny':
      ensure => 'absent',
    }
  }

}
