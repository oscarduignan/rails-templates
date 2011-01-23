if yes?("Install Devise?")
  gem "devise"
  # required for generating views
  gem "hpricot", :group => :development
  gem "ruby_parser", :group => :development

  after_setup do
    generate "devise:install"
    generate "devise:user"
    generate "devise:views"
  end

  inject_into_file 'config/environments/development.rb', :before => "\nend" do
    "\n\n  config.action_mailer.default_url_options = { :host => 'localhost:3000' }\n"
  end

  apply_local ["_authorization.rb"]
end
