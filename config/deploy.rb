set :application, "devinsampa"
set :user, "devinsampa"

set :deploy_to, "/home/devinsampa/rails"

set :scm, 'git'
set :repository, "git://github.com/tinogomes/devinsampa.git"
set :deploy_via, :remote_cache
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

set :use_sudo, false

server "devinsampa", :app, :web, :db, :primary => true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
      task t, :roles => :app do ; end
    end
end