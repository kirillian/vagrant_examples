apt_package "libpq-dev"

node['vagrant']['sites'].each do |site|
  directory "/var/www" do
    owner 'deploy'
    group 'www-data'
    mode '2755'
    recursive
    action :create
  end

  directory "/var/www/#{site}" do
    owner 'deploy'
    group 'www-data'
    mode '2755'
    action :create
  end

  directory "/var/www/#{site}/shared" do
    owner 'deploy'
    group 'www-data'
    mode '2755'
    action :create
  end

  directory "/var/www/#{site}/shared/config" do
    owner 'deploy'
    group 'www-data'
    mode '2755'
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

  template "/var/www/#{site}/shared/.env.production" do
    owner     'deploy'
    group     'www-data'
    mode      '0664'
    source    ".env.production.erb"
    notifies  :reload, 'service[nginx]'
  end
end
