case node['platform_family']
when 'debian'
  node.set['apt']['compile_time_update'] = true

  include_recipe 'apt'
end

include_recipe 'build-essential'
include_recipe 'mongodb::mongo_gem'

users = []
admin = node['mongodb']['admin']

# If authentication is required,
# add the admin to the users array for adding/updating
users << admin if node['mongodb']['config']['auth'] == true

users.concat(node['mongodb']['users'])

service 'mongod' do
  action :restart
end

# Retry 5 times to make sure mongodb is started
execute 'wait for mongod' do
  command 'mongo'
  action :run
  retries 20
  retry_delay 10
end

# Add each user specified in attributes
users.each do |user|
  mongodb_user user['username'] do
    password user['password']
    roles user['roles']
    database user['database']
    connection node['mongodb']
    action :add
  end
end
