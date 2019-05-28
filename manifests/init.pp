class crond (
              $manage_package        = true,
              $package_ensure        = 'installed',
              $manage_service        = true,
              $manage_docker_service = true,
              $service_ensure        = 'running',
              $service_enable        = true,
              $allowed_users         = undef,
              $denied_users          = undef,
            ) inherits crond::params{

  class { '::crond::install': } ->
  class { '::crond::config': } ~>
  class { '::crond::service': } ->
  Class['::crond']

}
