# config valid only for current version of Capistrano
lock '3.3.5'
# require "bundler/capistrano"
# require 'capistrano/bundler'

set :application, 'btinfoactivweb_service'
set :repo_url, 'http://54.169.59.80/anantha/btinfoactivweb_service.git'
set :branch, :master
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/home/deploy/dev/btinfoactivweb_service'

# Default value for :scm is :git
# set :scm, :git
# set :scm, :git

# set :scm_username, "balaji"
# set :scm_passphrase, "Welcome1015"
set :git_http_username, 'balaji'
set :git_http_password, 'Welcome1015'
set :use_sudo, false
set :rails_env, "development"
set :deploy_via, :copy
# set :deploy_via, :remote_cache
# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  task :test do
  	on "balaji@192.168.1.63" do 
  	  execute "echo extrapass | sudo -S  cp -rf /var/www/html/angular /home/balaji/ruby-trial/ui"  
    end 
  end 
end
