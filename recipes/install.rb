packages_path = node['tomcat']['packages_path']
tomcat_home = node['tomcat']['home']
file_name = "apache-tomcat-#{node['tomcat']['version']}"
binary_file = File.join(Chef::Config.cookbook_path,
                        'tomcat', 'files', 'default',
                        "#{file_name}.tar.gz")

bash 'Untar apache-tomcat' do
  code <<-EOH
    mkdir -p #{tomcat_home}
    tar xf #{binary_file} -C #{tomcat_home}
    mv #{tomcat_home}/*/* #{tomcat_home}/
    EOH
  not_if { File.exist?(tomcat_home) }
end
