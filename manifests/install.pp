# == Class: crond
#
# === crond::install documentation
#
class crond::install inherits crond {

  if($crond::manage_package)
  {
    # package here, for example: 
    #package { $crond::params::package_name:
    #  ensure => $crond::package_ensure,
    #}
  }

}
