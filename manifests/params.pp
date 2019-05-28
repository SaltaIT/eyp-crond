class crond::params {

  $root_cron_files = [
    '/etc/crontab',
  ]

  $root_cron_dirs = [
    '/etc/cron.d',
    '/etc/cron.hourly',
    '/etc/cron.weekly',
    '/etc/cron.monthly',
    '/etc/cron.daily',
  ]

  case $::osfamily
  {
    'redhat':
    {
      $service_name='crond'

      case $::operatingsystemrelease
      {
        /^5.*$/:
        {
          $package_name='vixie-cron'
        }
        /^[6-8].*$/:
        {
          $package_name='cronie'
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      $service_name='cron'

      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^1[468].*$/:
            {
              $package_name='cron'
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
