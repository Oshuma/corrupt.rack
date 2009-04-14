set :application, 'corrupt.rack'
set :environment, 'production'
set :domain, 'corrupt.save-state.net'
role :app, domain

set :runner, :oshuma
set :use_sudo, false

set :scm, :git
set :git_shallow_clone, 1
set :repository,  'git://github.com/Oshuma/corrupt.rack.git'
set :deploy_to, "/var/www/vhosts/save-state.net/subdomains/corrupt/#{application}"
set :deploy_via, :remote_cache

after 'deploy:setup' do
  run "cd #{deploy_to} && mkdir #{shared_dir}/config"
  run "cd #{deploy_to} && mkdir #{shared_dir}/database"
  find_and_execute_task 'util:upload_configs'
end

after 'deploy:symlink' do
  find_and_execute_task 'util:symlink_configs'
  find_and_execute_task 'util:symlink_database'
end

namespace :deploy do
  desc 'Restart the application'
  task :restart do
    run "touch #{latest_release}/tmp/restart.txt"
  end

  desc 'Migrate the database'
  task :migrate, :roles => :app do
    run "cd #{latest_release} && CORRUPT_ENV=#{environment} rake db:upgrade"
  end
end

namespace :util do
  desc 'Symlink the config files'
  task :symlink_configs do
    run "cd #{deploy_to} && ln -s #{deploy_to}/#{shared_dir}/config/app_config.yml #{latest_release}/config/"
  end

  desc 'Make a symlink to the SQLite database'
  task :symlink_database do
    run "cd #{deploy_to} && ln -s #{deploy_to}/#{shared_dir}/database/#{environment}.sqlite3 #{latest_release}/db/"
  end

  desc 'Upload the config files'
  task :upload_configs do
    %x(scp ./config/app_config.yml #{domain}:#{deploy_to}/#{shared_dir}/config/)
  end
end

# Override Rails specific shit.
task :finalize_update do; end
task :migrate do; end
