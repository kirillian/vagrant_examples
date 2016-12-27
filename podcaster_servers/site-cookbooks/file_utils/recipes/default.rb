#
# Cookbook Name:: file_utils
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "pdftk" do
  action :install
end

package "unoconv" do
  action :install
end

package "ghostscript" do
  action :install
end

%w(
  cmake
  libfontconfig1
  libssl0.9.8
  libxext6
  libxrender1
  fontconfig
  libjpeg8
  xfonts-base
  xfonts-75dpi
  zlib1g-dev
  libfreetype6-dev
  libx11-dev
  libgs-dev
).each do |p|
  package p
end

cache_dir = Chef::Config[:file_cache_path]
# download_dest = File.join(cache_dir, 'wkhtmltox-0.12.3_linux-generic-amd64.tar.xz')
download_dest = File.join(cache_dir, 'wkhtmltox-0.12.2.1_linux-trusty-amd64.deb')
# untarred_binary_folder = File.join(cache_dir, 'wkhtmltox/')
# untarred_binary = File.join(cache_dir, 'wkhtmltox/bin/wkhtmltopdf')
# final_binary_folder_dest = File.join('/user/local/bin', 'wkhtmltox/')
# final_binary_dest = File.join('/user/local/bin', 'wkhtmltox/bin/wkhtmltopdf')

remote_file download_dest do
  # source "http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz"
  source "http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb"
  mode '0644'
  action :create_if_missing
end

package "wkhtmltopdf" do
  source download_dest
  provider Chef::Provider::Package::Dpkg
end

# execute 'extract_some_tar' do
#   command "tar xf #{download_dest}"
#   cwd cache_dir
#   not_if { File.exists?(untarred_binary) }
# end

# execute 'copy wkhtmltopdf' do
#   command "cp #{untarred_binary_folder}/bin/* /user/local/bin/"
#   cwd cache_dir
#   not_if { File.exists?(untarred_binary) }
# end
