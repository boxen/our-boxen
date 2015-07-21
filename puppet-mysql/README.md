# MySQL Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-mysql.png)](https://travis-ci.org/boxen/puppet-mysql)

## Usage

```puppet
include mysql

mysql::db { 'mydb': }
```

## Required Puppet Modules

* boxen
* homebrew
* stdlib

## Environment

**ATTENTION** Boxen uses a non standard **13306** port to avoid collisions.

Once installed, you can access the following variables in your environment, projects, etc:

* BOXEN_MYSQL_PORT: the configured MySQL port
* BOXEN_MYSQL_URL: the URL for MySQL, including localhost & port
* BOXEN_MYSQL_SOCKET: the path to the MySQL socket

#### Rails

In config/database.yml:

```yaml
<%
  socket = [
    ENV["BOXEN_MYSQL_SOCKET"],
    "/var/run/mysql5/mysqld.sock",
    "/tmp/mysql.sock"
  ].detect { |f| f && File.exist?(f) }

  port = ENV["BOXEN_MYSQL_PORT"] || "3306"
%>

development: &development
  adapter: mysql
  database: yourapp_development
  username: root
<% if socket %>
  host: localhost
  socket: <%= socket %>
<% else %>
  host: 127.0.0.1
  port: <%= port %>
<% end %>

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *development
  database: yourapp_test
```

## Developing

Write code.

Run `script/cibuild`.
