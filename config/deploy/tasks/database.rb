# Database custom tasks...
namespace :database do
  desc 'Resets database (use it extremely carefully!)'
  task :reset do
    unless rails_env == 'production'
      queue %[echo "-----> Stoping #{rails_env} application."]
      invoke :'puma:stop'
      queue %[cd #{deploy_to}/current]
      queue %[echo "-----> Dropping the #{rails_env} database."]
      queue %[#{bundle_prefix} rake db:drop]
      queue %[echo "-----> Creating the #{rails_env} database."]
      queue %[#{bundle_prefix} rake db:create]
      queue %[echo "-----> Migrating the #{rails_env} database."]
      queue %[#{bundle_prefix} rake db:migrate]
      queue %[echo "-----> Seeding the #{rails_env} database."]
      queue %[#{bundle_prefix} rake db:seed]
      queue %[echo "-----> Starting #{rails_env} application."]
      invoke :'puma:start'
    else
      queue %[echo "-----> You are trying to reset #{rails_env} database!"]
    end
  end
end
