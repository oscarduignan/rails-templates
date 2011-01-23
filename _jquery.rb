inside "public/javascripts" do
  get "http://code.jquery.com/jquery-1.4.4.min.js", "jquery.min.js"
  get "http://railswizard.org/19705026db6e90a362f8.rb", "rails.js"
  get "http://www.modernizr.com/downloadjs", "modernizr.min.js"
end

initializer "jquery.rb", <<-EOF
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults => %w(jquery.min rails)
EOF
