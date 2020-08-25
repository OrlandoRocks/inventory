require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Inventory
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2


    # Do not swallow errors in after_commit/after_rollback callbacks.
    # config.active_record.raise_in_transactional_callbacks = true

    # Contains the controllers that will be excluded from the permissions.
    config.x.controller_exceptions = %w(Home SetLanguage PasswordExpired Confirmation Password OmniauthCallback Session Application)



    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
    I18n.available_locales = [:es, :en]
    config.time_zone = 'Chihuahua'
    config.i18n.default_locale = :es

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
