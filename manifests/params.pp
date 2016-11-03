class crond::params {

  $root_cron_files = [
    '/etc/crontab',
    '/etc/cron.hourly',
    '/etc/cron.weekly',
    '/etc/cron.monthly',
    '/etc/cron.d',
    '/etc/cron.allow',
  ]

  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^5.*$/:
        {
          $package_name='vixie-cron'
        }
        /^[67].*$/:
        {
          $package_name='cronie'
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^14.*$/:
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
