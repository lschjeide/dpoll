# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'dpoll'

set :repo_url, 'https://github.com/lschjeide/dpoll.git'
set :branch, 'origin/master'
set :keep_releases, 2

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app

set :deploy_to, '/deploy'

set :scm, :gitcopy
set :deploy_via, :copy

set :stages, %w(testprod production)

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# namespace :deploy do
#   desc "restart (upgrade) unicorn server"
#   task :restart, roles: :app, except: {no_release: true} do
#     run "service unicorn upgrade"
#   end
# end

namespace :deploy do

  desc 'Restart (upgrade) unicorn server'
  # task :restart do
  #   on roles(:app), in: :sequence, wait: 5 do
  #     execute 'sudo /sbin/service unicorn stop || echo unicorn not running'
  #     execute 'sudo /sbin/service unicorn start'
  #   end
  # end
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute 'sudo /sbin/service unicorn upgrade'
    end
  end

  # task :restart, roles: :app, except: {no_release: true} do
  #   run "service unicorn upgrade"
  # end

  after :publishing, :restart

  before :publishing, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :bundle, 'install --deployment'
        execute :bundle, "exec rake db:migrate RAILS_ENV=#{fetch(:rails_env)}"
        execute "echo #{fetch(:rails_env)} > /deploy/unicorn_environment"
        execute 'sudo /etc/init.d/nginx start'
      end
    end
  end

end
