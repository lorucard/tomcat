tomcat_home = node['tomcat']['home']
server_file = File.join(tomcat_home, 'conf', 'server.xml')
user = node['tomcat']['user']
group = node['tomcat']['group']
port = node['tomcat']['port']

template server_file do
  source 'server.xml.erb'
  mode '0644'
  owner user
  group group
  variables(port: port)
end