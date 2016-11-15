# == Class: crond
#
# === crond::config documentation
#
class crond::config inherits crond {

  # han de tenir permisos 600
  # /etc/crontab, /etc/cron.hourly, /etc/cron.weekly, /etc/cron.monthly , /etc/cron.d
  # /etc/cron.allow ha d’existir i amb permisos 600

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
    file { '/etc/cron.allow':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
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
    file { '/etc/cron.deny':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
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
