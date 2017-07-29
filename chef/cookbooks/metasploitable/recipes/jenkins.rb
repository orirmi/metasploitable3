#
# Cookbook:: metasploitable
# Recipe:: jenkins
#
# Copyright:: 2017, The Authors, All Rights Reserved.

directory 'C:\Program Files\jenkins' do
  action :create
end

batch 'Copy files' do
  code <<-EOH
    copy C:\\vagrant\\resources\\jenkins\\jenkins.war "%ProgramFiles%\\jenkins"
    copy C:\\vagrant\\resources\\jenkins\\jenkins.exe "%ProgramFiles%\\jenkins"
  EOH
end

execute "\"C:\\Program Files\\jenkins\\jenkins.exe\" -Service Install" do
  action :run
end

windows_service 'jenkins' do
  action [:enable, :start]
  startup_type :automatic
end

