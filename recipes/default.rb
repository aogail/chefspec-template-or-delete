template '/etc/config.conf' do
  variables(
      :setting => node['chefspec-render-file']['setting']
  )
  source 'config.conf.erb'
  not_if {node['chefspec-render-file']['setting'].nil?}
end

file '/etc/config.conf' do
  action :delete
  only_if {node['chefspec-render-file']['setting'].nil?}
end
