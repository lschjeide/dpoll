# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'dpoll'

set :repo_url, 'https://github.com/lschjeide/dpoll.git'
set :branch, 'origin/master'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app

set :deploy_to, '/tmp'

set :scm, :gitcopy
set :deploy_via, :copy

set :stages, %w(test production)

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5



namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
       within release_path do
         execute :bundle, 'install --deployment'
         execute :rake, "db:migrate RAILS_ENV=#{fetch(:rails_env)}"
         execute "/sbin/service unicorn stop"
         execute "rm -f /home/ec2-user/unicorn"
         execute "ln -s #{release_path} /home/ec2-user/unicorn"
         execute "/sbin/service unicorn start"
       end

# TODO ON THE BOX AFTER COPY

# bundle install --deployment
# bundle exec rake db:migrate RAILS_ENV=production
# bundle exec unicorn_rails --env production --daemonize


    end
  end

end
