ruby = ask("Which RVM Ruby should your app use? [default]")
ruby = "default" if ruby.blank?

gemset = ask("Which RVM Gemset should your app use? [#{@app_name}]")
gemset = @app_name if gemset.blank?

@ruby_gemset = "#{ruby}@#{gemset}"

file ".rvmrc", "rvm #{@ruby_gemset}"
