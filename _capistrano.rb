if yes?("Capify?")
  gem "capistrano"

  after_setup do
    capify!
  end
end
