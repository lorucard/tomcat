tomcat_home = node['tomcat']['home']
java_home = node['java']['home']


bash 'tomcat stop' do
  cwd tomcat_home
  environment 'JAVA_HOME' => java_home
  code <<-EOH
    bin/shutdown.sh
    EOH
end