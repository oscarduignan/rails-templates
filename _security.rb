initializer "disable_mass_assignment.rb", <<-EOF
ActiveRecord::Base.send(:attr_accessible, nil)
EOF
