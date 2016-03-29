include_recipe 'deploy'

node[:deploy].each do |application, deploy|
  deploy = node[:deploy][application]

  execute 'bundle exec rake assets:precompile' do
    command 'bundle exec rake assets:precompile'
    user 'deploy'
    cwd "#{deploy[:deploy_to]}/current"
    environment 'RAILS_GROUPS' => 'assets', 'RAILS_ENV' => 'production'
  end
end
