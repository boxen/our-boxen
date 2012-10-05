class projects::github::dbs {
  mysql::db { [
    'github_development',
    'github_enterprise',
    'github_test',
  ] : }
}
