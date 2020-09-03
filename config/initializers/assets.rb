# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.


# Rails.application.config.assets.paths << Rails.root.join('node_modules')




Rails.application.config.assets.paths += [
    Rails.root.join('vendor', 'assets', 'componentes').to_s
]

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += [
    Rails.root.join('vendor/assets/componentes/angular/*').to_s,
    Rails.root.join('vendor/assets/componentes/angular-modal-service/*').to_s,
    Rails.root.join('vendor/assets/componentes/fastclick/*').to_s,
    Rails.root.join('vendor/assets/componentes/ng-file-upload/*').to_s,
    Rails.root.join('vendor/assets/componentes/ng-file-upload-shim/*').to_s,
    Rails.root.join('vendor/assets/componentes/ng-switchery*').to_s,
    Rails.root.join('vendor/assets/componentes/switchery/*').to_s,
    Rails.root.join('vendor/assets/componentes/transitionize/*').to_s,
    Rails.root.join('vendor/assets/javascripts/*').to_s,
    Rails.root.join('vendor/assets/stylesheets/*').to_s
]


Rails.application.config.assets.precompile += %w( out_system.js )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
