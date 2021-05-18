threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 16)
threads threads_count, threads_count

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"


bind "unix://#{shared_dir}/sockets/puma.sock"


stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true


pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
activate_control_app

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RAILS_ENV'] || 'development'

