include_recipe 'deploy'

node[:deploy].each do |application, deploy|
  execute 'rake db:migrate' do
    command 'bundle exec rake db:migrate'
    user 'deploy'
    cwd "#{deploy[:deploy_to]}/current"
    environment 'RAILS_ENV' => 'production'
  end
end
