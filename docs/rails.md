# Using Boxen with Rails Projects

Boxen is designed to work extremely well with Rails.
Let's break down some of the basics:

## Project Management

We make a few assumptions about how you run Rails in development for ease and consistency:

* You use a web server that listens on a socket
* You use environment variables and something like [dotenv](https://github.com/bkeepers/dotenv) for managing secrets

A typical Rails app that uses things like MySQL, Resque, and phantomjs
might have a [project definition](../modules/projects/README.md) like so:

``` puppet
class projects::rails_app {
  include phantomjs

  boxen::project { 'rails_app':
    ruby   => '1.9.3',
    mysql  => true,
    redis  => true,
    nginx  => true,
    source => 'username/rails_app'
  }
}
```

This does a few things for you:

* Clones `https://github.com/username/rails_app.git` to `~/src/rails_app`
* Ensures the default 1.9.3 version of Ruby is installed
* Creates `~/src/rails_app/.ruby-version` with `1.9.3` in it
* Ensures mysql is installed and running
* Creates two mysql databases: `rails_app_test` and `rails_app_development`
* Ensures redis is installed and running
* Ensures nginx is installed and running
* Copies the [template nginx config](../modules/projects/templates/shared/nginx.conf.erb) into the nginx config dir

It won't necessarily do all of them in that order, but it will guarantee
that if they run successfully they're all done in a correct order.

See the section below for some handy configuration tips on how to configure
your app best to work with Boxen.

## Configuration

### MySQL

``` yaml
# config/database.yml

<%
  socket = [
    ENV["BOXEN_MYSQL_SOCKET"],
    "/var/run/mysql5/mysqld.sock",
    "/tmp/mysql.sock"
  ].compact.detect { |f| File.exist? f }

  port = ENV["BOXEN_MYSQL_PORT"] || "3306"
%>

development:
  adapter: mysql2
  database: rails_app_development
  username: root
  password:
<% if socket %>
  host: localhost
  socket: <%= socket %>
<% else %>
  host: 127.0.0.1
  port: <%= port %>
<% end %>

test:
  adapter: mysql2
  database: rails_app_test
  username: root
  password:
<% if socket %>
  host: localhost
  socket: <%= socket %>
<% else %>
  host: 127.0.0.1
  port: <%= port %>
<% end %>
```

### PostgreSQL

``` yaml
# config/database.yml

development:
  adapter: postgresql
  database: rails_app_development
  encoding: unicode
  port: <%= ENV["BOXEN_POSTGRESQL_PORT"] || 5432 %>
  host: localhost

test:
  adapter: postgresql
  database: rails_app_test
  encoding: unicode
  port: <%= ENV["BOXEN_POSTGRESQL_PORT"] || 5432 %>
  host: localhost
```

### Redis

``` ruby
# config/initializers/redis.rb

$redis = Redis.new(ENV['BOXEN_REDIS_URL'] || 'redis://localhost:6379/')
```

### Elasticsearch

``` ruby
# config/initializers/elasticsearch.rb

Tire.configure do
  url (ENV['BOXEN_ELASTICSEARCH_URL'] || 'http://localhost:9200/')
end
```

### MongoDB

``` yaml
# config/mongo.yml

development:
  host: 127.0.0.1
  port: <%= ENV['BOXEN_MONGODB_PORT'] || 27017 %>
  database: rails_app_development

test:
  host: 127.0.0.1
  port: <%= ENV['BOXEN_MONGODB_PORT'] || 27017 %>
  database: rails_app_test
```

### Memcached

``` ruby
# config/initializers/memcached.rb

$memcached = Dalli::Client.new(
  ENV['BOXEN_MEMCACHED_URL'] || 'memcached://localhost:11211/'
)
```

### Unicorn

``` ruby
# config/unicorn.rb

if ENV['RACK_ENV'] == 'development'
  worker_processes 1
  listen "#{ENV['BOXEN_SOCKET_DIR']}/rails_app", :backlog => 1024
  timeout 120
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end
```

``` shell
# script/server

#!/bin/sh

set -e

cd $(dirname "$0")/..
: ${RAILS_ENV:=development}
: ${RACK_ENV:=development}

export RAILS_ENV RACK_ENV

bin/unicorn_rails -E "$RAILS_ENV" -c config/unicorn.rb
```

