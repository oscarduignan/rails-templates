gem 'compass'
gem 'compass-susy-plugin'

initializer "compass.rb", <<-EOF
require 'compass'
require 'compass/app_integration/rails'
Compass::AppIntegration::Rails.initialize!
EOF

file "config/compass.rb", <<-EOF
require 'susy'
project_type = :rails
project_path = Compass::AppIntegration::Rails.root
http_path = "/"
css_dir = "public/stylesheets"
sass_dir = "app/stylesheets"
environment = Compass::AppIntegration::Rails.env
EOF
