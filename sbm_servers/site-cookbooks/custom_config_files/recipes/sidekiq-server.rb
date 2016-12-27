apt_package "libpq-dev"

node['vagrant']['sites'].each do |site|
  directory "/var/www" do
    owner 'www-data'
    group 'www-data'
    mode '2775'
    recursive
    action :create
  end

  directory "/var/www/#{site}" do
    owner 'www-data'
    group 'www-data'
    mode '2775'
    action :create
  end

  directory "/var/www/#{site}/shared" do
    owner 'www-data'
    group 'www-data'
    mode '2775'
    action :create
  end

  directory "/var/www/#{site}/shared/config" do
    owner 'www-data'
    group 'www-data'
    mode '2775'
    action :create
  end

  template "/var/www/#{site}/shared/config/aws.yml" do
    owner     'root'
    group     'root'
    mode      '0664'
    source    "aws.yml.erb"
  end

  template "/var/www/#{site}/shared/config/database.yml" do
    owner     'root'
    group     'root'
    mode      '0664'
    source    "database.yml.erb"
  end

  template "/var/www/#{site}/shared/config/redis.yml" do
    owner     'root'
    group     'root'
    mode      '0664'
    source    "redis.yml.erb"
  end

  template "/var/www/#{site}/shared/config/secrets.yml" do
    owner     'root'
    group     'root'
    mode      '0664'
    source    "secrets.yml.erb"
  end

  template "/var/www/#{site}/shared/config/sidekiq.yml" do
    owner     'root'
    group     'root'
    mode      '0664'
    source    "sidekiq.yml.erb"
  end
end
