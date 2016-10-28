class crond::service inherits crond {

  #
  validate_bool($crond::manage_docker_service)
  validate_bool($crond::manage_service)
  validate_bool($crond::service_enable)

  validate_re($crond::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${crond::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $crond::manage_docker_service)
  {
    if($crond::manage_service)
    {
      #service or exec here
    }
  }
}
