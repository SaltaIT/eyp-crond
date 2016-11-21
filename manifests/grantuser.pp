define crond::grantuser(
                          $user = $name,
                          $action = 'allow',
                        ) {
  validate_re($action, [ '^allow$', '^deny$' ], 'Not a valid action: allow/deny')

  concat::fragment{ "/etc/cron.${action} ${user} ${name}":
    target  => "/etc/cron.${action}",
    order   => '42',
    content => "${user}\n",
  }
}
