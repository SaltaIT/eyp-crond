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

}
