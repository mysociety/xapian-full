require 'mini_portile2'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

ver = '1.4.21'
package_root_dir = Dir.pwd

task :core do
  MiniPortile.new("xapian-core", ver).tap do |recipe|
    recipe.target = File.join(package_root_dir, 'ports')
    recipe.files << {
      url: "https://oligarchy.co.uk/xapian/#{ver}/xapian-core-#{ver}.tar.xz",
      sha256: '80f86034d2fb55900795481dfae681bfaa10efbe818abad3622cdc0c55e06f88'
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
      sha256: 'e7bf1e4982b91f841289d19214021d88371ca2a6c7304df59049d7da78b83ced'
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
