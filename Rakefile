require 'mini_portile2'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

ver = '1.4.23'
package_root_dir = Dir.pwd

task :core do
  MiniPortile.new("xapian-core", ver).tap do |recipe|
    recipe.target = File.join(package_root_dir, 'ports')
    recipe.files << {
      url: "https://oligarchy.co.uk/xapian/#{ver}/xapian-core-#{ver}.tar.xz",
      sha256: '30d3518172084f310dab86d262b512718a7f9a13635aaa1a188e61dc26b2288c'
    }
    recipe.configure_options = [] # removes MiniPortile defaults

    unless File.exist?(File.join(recipe.target, recipe.host, recipe.name, recipe.version))
      recipe.cook
    end

    recipe.activate
  end
end

task bindings: [:core] do
  ENV['RUBY_LIB'] = ENV['RUBY_LIB_ARCH'] = File.join(__dir__, 'lib')

  MiniPortile.new("xapian-bindings", ver).tap do |recipe|
    recipe.target = File.join(package_root_dir, 'ports')
    recipe.files << {
      url: "https://oligarchy.co.uk/xapian/#{ver}/xapian-bindings-#{ver}.tar.xz",
      sha256: 'e0bc8cc0ecf0568549c50b51fd59e4cffb5318d6f202afcd4465855ef5f33f7d'
    }
    recipe.configure_options = ['--with-ruby']

    unless File.exist?(File.join(recipe.target, recipe.host, recipe.name, recipe.version))
      recipe.cook
    end

    recipe.activate
  end
end

desc 'Compile all extensions'
task compile: [:bindings]

task default: [:compile]
