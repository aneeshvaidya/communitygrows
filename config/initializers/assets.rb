# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( login.css ) #by Tony to compile login.css
Rails.application.config.assets.precompile += %w( dashboard.css ) #by Tony to compile dashboard.css
Rails.application.config.assets.precompile += %w( admin.css ) #by Tony to compile admin.css
Rails.application.config.assets.precompile += %w( committee.css ) #by Tony to compile committee.css
#Rails.application.config.assets.precompile += %w( documents.css ) #by Tony to compile documents.css
Rails.application.config.assets.precompile += %w( base.css ) #by Facundo to compile base.css

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
