inside "public/javascripts" do
  get "http://code.jquery.com/jquery-1.4.4.min.js", "jquery.min.js"
  get "https://github.com/rails/jquery-ujs/raw/master/src/rails.js", "rails.js" 
end

initializer "jquery.rb", <<-EOF
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults => %w(jquery.min rails)
EOF
