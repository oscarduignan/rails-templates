file "app/stylesheets/_library.scss", <<-EOF
@import "compass/utilities";
@import "compass/css3";

@import "library/typography";
EOF

file "app/stylesheets/application.scss", <<-EOF
@import "compass/reset";

$column_count: 12 !default;
$column_width: 60px !default;
$gutter_width: 20px !default;
$side_gutter_width: 10px !default;
$layout_width: container($column_count, $column_width, $gutter_width, $side_gutter_width); // default 960px

$base_font_size: 16px !default;
$base_line_height: 24px !default;

@import "library";

body {
  @include body-font-family;
  font-size: $base_font_size / (16px / 100%);
  line-height: 1em * ($base_line_height / $base_font_size);
  width: $layout_width;
  margin: (($base_line_height / $base_font_size) * 2em) auto;
  color: #333;
}

html>body {
  font-size: $base_font_size;
}
EOF

file "app/stylesheets/library/_typography.scss", <<-EOF
@mixin font-size($font_size, $base_size: $base_font_size, $lines: ceil($font_size/$base_line_height)) {
  font-size: 1em * ($font_size / $base_size);
  @include line-height($lines, $font_size);
}

@mixin line-height($lines, $font_size: $base_font_size) {
  line-height: $lines * (1em * ($base_line_height / $font_size));
}

@mixin leading-above($lines, $font_size: $base_font_size, $property: "margin") {
  \#{$property}-top: $lines * (1em * ($base_line_height / $font_size));
}

@mixin leading-below($lines, $font_size: $base_font_size, $property: "margin") { 
  \#{$property}-bottom: $lines * (1em * ($base_line_height / $font_size));
}

@mixin leading($above, $below, $font_size: $base_font_size, $property: "margin") {
  @include leading-above($above, $font_size, $property);
  @include leading-below($below, $font_size, $property);
}

@mixin height($lines, $font_size: $base_font_size) {
  height: $lines * (1em * ($base_line_height / $font_size));
}

@mixin body-font-family() {
  font-family: arial, verdana, arial, sans-serif;
}
EOF
