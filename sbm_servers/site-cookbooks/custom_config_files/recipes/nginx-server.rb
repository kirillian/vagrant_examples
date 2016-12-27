apt_package "libpq-dev"

node['vagrant']['sites'].each do |site|
  template "/etc/nginx/sites-available/#{site}" do
    owner     'root'
    group     'root'
    mode      '0644'
    source    "sites-available.erb"
    variables site: site
    notifies  :reload, 'service[nginx]'
  end

  template "/etc/nginx/sites-enabled/#{site}" do
    owner     'root'
    group     'root'
    mode      '0644'
    source    "sites-available.erb"
    variables site: site
    notifies  :reload, 'service[nginx]'
  end

  directory "/var/www" do
    owner 'www-data'
    group 'www-data'
    mode '2775'
    action :create
    notifies  :reload, 'service[nginx]'
  end

  directory "/var/www/#{site}" do
    owner 'www-data'
    group 'www-data'
    mode '2775'
    action :create
    notifies  :reload, 'service[nginx]'
  end

  directory "/var/www/#{site}/shared" do
    owner 'www-data'
    group 'www-data'
    mode '2775'
    action :create
    notifies  :reload, 'service[nginx]'
  end

  directory "/var/www/#{site}/shared/config" do
    owner 'www-data'
    group 'www-data'
    mode '2775'
    action :create
    notifies  :reload, 'service[nginx]'
  end

  template "/var/www/#{site}/shared/config/aws.yml" do
    owner     'www-data'
    group     'www-data'
    mode      '0664'
    source    "aws.yml.erb"
    notifies  :reload, 'service[nginx]'
  end

  template "/var/www/#{site}/shared/config/database.yml" do
    owner     'www-data'
    group     'www-data'
    mode      '0664'
    source    "database.yml.erb"
    notifies  :reload, 'service[nginx]'
  end

  template "/var/www/#{site}/shared/config/redis.yml" do
    owner     'www-data'
    group     'www-data'
    mode      '0664'
    source    "redis.yml.erb"
    notifies  :reload, 'service[nginx]'
  end

  template "/var/www/#{site}/shared/config/secrets.yml" do
    owner     'www-data'
    group     'www-data'
    mode      '0664'
    source    "secrets.yml.erb"
    notifies  :reload, 'service[nginx]'
  end
end

file '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies  :reload, 'service[nginx]'
end

file '/etc/nginx/sites-available/default' do
  action :delete
  notifies  :reload, 'service[nginx]'
end
