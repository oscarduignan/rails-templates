gem "haml-rails"

generator :template_engine, ":haml"

remove_file "app/views/layouts/application.html.erb"

file "app/views/layouts/application.html.haml", <<-EOF
!!! 5
<!--http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/-->
<!--[if lt IE 7]><html class="ie6" lang="en" class="no-js"><![endif]-->
<!--[if IE 7]><html class="ie7" lang="en" class="no-js"><![endif]-->
<!--[if IE 8]><html class="ie8" lang="en" class="no-js"><![endif]-->
<!--[if IE 9]><html class="ie9" lang="en" class="no-js"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en" class="no-js"><!--<![endif]-->
%head
  %meta{"http-equiv"=>"Content-Type", :content=>"text/html; charset=utf-8"}
  %meta{:name => 'csrf-token', :content => form_authenticity_token}
  %meta{:name => 'csrf-param', :content => 'authenticity_token'}
  %link{:href => "/stylesheets/application.css", :rel => "stylesheet"}
  %title
    = yield(:title) || "Untitled"
  = javascript_include_tag "modernizr"
  = yield(:extra_head)
%body{:class => (yield(:body_class) if content_for?(:body_class))}
  = render :partial => "shared/flashes"
  = yield
  = javascript_include_tag :defaults
  = yield(:extra_body)
</html>
EOF

file "app/views/shared/_flashes.html.haml", <<-EOF
- flash.each do |key, msg|
  .flash{:id => "flash_\#{key}"}= msg
EOF
