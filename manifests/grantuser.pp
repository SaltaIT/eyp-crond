define crond::grantuser(
                          $user = $name,
                          $action = 'allow',
                        ) {

  concat::fragment{ "/etc/cron.${action} ${user} ${name}":
    target  => "/etc/cron.${action}",
    order   => '42',
    content => "${user}\n",
  }
}
