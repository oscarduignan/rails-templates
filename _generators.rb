generators = []
@generators.each { |k,v| generators << "g.#{k} #{v}" }

initializer "generators.rb", <<-EOF
Rails.application.config.generators do |g|
  #{(generators).join "\n  "}
end
EOF
