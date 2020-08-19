# # Change to match your CPU core count
# workers 4
#
# # Min and Max threads per worker
# threads 1, 6
#
# # Default to production
# port ENV['INVENTORY_PORT'] || 3000
# rails_env = ENV['RAILS_ENV'] || 'development'
# environment rails_env
#
# # Puma logs.
# stdout_redirect 'log/puma.log', 'log/puma_error.log', true
#
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end