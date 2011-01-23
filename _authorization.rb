if yes?("Install CanCan?")
  gem "cancan"

  after_setup do
    generate "cancan:ability"
  end
end
