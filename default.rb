# rails new APPNAME --skip-prototype --skip-test-unit --database=DATABASE --template=TEMPLATE

@after_setup = []
def after_setup(&block)
  @after_setup << block
end

@generators = {}
def generator(k, v)
  @generators[k] = v
end

@cwd = File.dirname(__FILE__)
def apply_local(files)
  files.each { |f| apply "#{@cwd}/#{f}" }
end

apply_local [
  "_cleanup.rb",
  "_rvm.rb",
  "_haml.rb",
  "_sass.rb",
  "_compass.rb",
  "_jquery.rb",
  "_modernizr.rb",
  "_forms.rb",
  "_security.rb",
  "_testing.rb",
  "_capistrano.rb",
  "_authentication.rb",
  "_generators.rb",
  "_bundle.rb",
  "_pages.rb"
]

@after_setup.each { |b| b.call }

apply_local ["_git.rb"]
