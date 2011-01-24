git :init
git :add => '.'
if (name = ask("Git user name?")) and (email = ask("Git user email?"))
  git :config => "user.name \"#{name}\""
  git :config => "user.email \"#{email}\""
end
git :commit => '-m "initial commit."'
