initializer "output_html_not_xhtml.rb", <<-EOF
module ActionView::Helpers::TagHelper
  alias :old_tag :tag
  def tag(name, options = nil, open = true, escape = true)
    old_tag(name, options, open, escape)
  end
end
EOF

initializer "append_class_to_invalid_form_fields.rb", <<-EOF
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  tag = Nokogiri::HTML::fragment(html_tag).child
  tag['class'] = tag['class'].to_s.split(/\s+/).push('invalid').uniq.join " "
  tag.to_html.html_safe
end
EOF
