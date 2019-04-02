tomcat_home = node['tomcat']['home']
java_home = node['java']['home']


bash 'tomcat start' do
  cwd tomcat_home
  environment 'JAVA_HOME' => java_home
  code <<-EOH
    bin/startup.sh
    EOH
end