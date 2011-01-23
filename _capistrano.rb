gem "capistrano"

after_setup do
  capify!
end
