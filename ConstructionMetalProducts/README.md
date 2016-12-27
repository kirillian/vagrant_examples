###Starting up the App

```shell
git clone https://github.com/derick/ConstructionMetalProducts.git
cd ContructionMetalProducts

rbenv install 2.1.5
rbenv local 2.1.5
gem install bundler
bundle
rake rails:update:bin
```

### Create database.yml
```yaml
# PostgreSQL. Versions 7.4 and 8.x are supported.
#
# Install the pg driver:
#   gem install pg
# On Mac OS X with macports:
#   gem install pg -- --with-pg-config=/opt/local/lib/postgresql84/bin/pg_config
# On Windows:
#   gem install pg
#       Choose the win32 build.
#       Install PostgreSQL and put its /bin directory on your path.
development:
  adapter: postgresql
  encoding: unicode
  database: cmp_development
  pool: 5
  username: test-postgres (or your username if PostgreSQL installed by Homebrew)
  password:

  # Connect on a TCP socket. Omitted by default since the client uses a
  # domain socket that doesn't need configuration. Windows does not have
  # domain sockets, so uncomment these lines.
  #host: localhost
  #port: 5432

  # Schema search path. The server defaults to $user,public
  #schema_search_path: myapp,sharedapp,public

  # Minimum log levels, in increasing order:
  #   debug5, debug4, debug3, debug2, debug1,
  #   log, notice, warning, error, fatal, and panic
  # The server defaults to notice.
  #min_messages: warning

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  adapter: postgresql
  encoding: unicode
  database: cmp_test
  pool: 5
  username: test-postgres (or your username if PostgreSQL installed by Homebrew)
  password:

production:
  adapter: postgresql
  encoding: unicode
  database: test-postgres_production
  pool: 5
  username: test-postgres
  password:
```

### Setup Database

```shell
rake db:create
rake db:migrate
rake db:seed
```

### Run Server
```shell
rails s puma
```
