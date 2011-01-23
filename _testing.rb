gem "rspec-rails", :group => [:development, :test]
gem "steak", :group => [:development, :test]
gem "capybara", :group => [:development, :test]
gem "factory_girl_rails", :group => [:development, :test]

after_setup do
  generate "rspec:install"
  generate "steak:install"
end

generator :test_framework, ":rspec, :fixture => false, :views => false"
generator :fixture_replacement, ":factory_girl, :dir => 'spec/factories'"
