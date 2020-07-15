# Change to match your CPU core count
workers 4

# Min and Max threads per worker
threads 1, 6

# Default to production
port ENV['INVENTORY_PORT'] || 3000
rails_env = ENV['RAILS_ENV'] || 'production'
environment rails_env

# Puma logs.
stdout_redirect 'log/puma.log', 'log/puma_error.log', true