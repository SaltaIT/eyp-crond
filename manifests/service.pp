class crond::service inherits crond {

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $crond::manage_docker_service)
  {
    if($crond::manage_service)
    {
      service { $crond::params::service_name:
        ensure => $crond::service_ensure,
        enable => $crond::service_enable,
      }
    }
  }
}
