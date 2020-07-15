# File system custom tasks...
namespace :utils do
  namespace :public do
    desc 'Clears public files (use it extremely carefully!)'
    task :clear do
      unless rails_env == 'production'
        queue %[echo "-----> Clearing #{rails_env} public application files!"]

        queue %[cd "#{deploy_to}/#{shared_path}/public/system/"]
        queue 'rm -rf *'
        queue %[echo '-----> System folder cleared!']

        queue %[cd "#{deploy_to}/#{shared_path}/public/websites/"]
        queue 'rm -rf *'
        queue %[echo '-----> Websites folder cleared!']

        queue %[cd "#{deploy_to}/#{shared_path}/public/resources/"]
        queue 'rm -rf *'
        queue %[echo '-----> Resources folder cleared!']
      else
        queue %[echo "-----> You are trying to clear #{rails_env} public files!"]
      end
    end
  end

  namespace :keydir do
    desc 'Clears ssh keys files (use it extremely carefully!)'
    task :clear do
      unless rails_env == 'production'
        queue %[echo "-----> Clearing #{rails_env} keydir application files!"]

        queue %[cd "#{deploy_to}/#{shared_path}/keydir/"]
        queue 'rm -rf *'
        queue %[echo '-----> Keydir folder cleared!']
      else
        queue %[echo "-----> You are trying to clear #{rails_env} public files!"]
      end
    end
  end
end
