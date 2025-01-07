require 'mini_portile2'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

ver = '1.4.22'
package_root_dir = Dir.pwd

task :core do
  MiniPortile.new("xapian-core", ver).tap do |recipe|
    recipe.target = File.join(package_root_dir, 'ports')
    recipe.files << {
      url: "https://oligarchy.co.uk/xapian/#{ver}/xapian-core-#{ver}.tar.xz",
      sha256: '05884af00b06702ce486057d62a3bfbe6606cf965ada0f5ea570b328a2fa1ea8'
    }
    recipe.configure_options = [] # removes MiniPortile defaults

    unless File.exist?(File.join(recipe.target, recipe.host, recipe.name, recipe.version))
      recipe.cook
    end

    recipe.activate
  end
end

task bindings: [:core] do
  ENV['LIBS'] = RbConfig::CONFIG["LIBRUBYARG"]
  ENV['RUBY_LIB'] = ENV['RUBY_LIB_ARCH'] = File.join(__dir__, 'lib')

  MiniPortile.new("xapian-bindings", ver).tap do |recipe|
    recipe.target = File.join(package_root_dir, 'ports')
    recipe.files << {
      url: "https://oligarchy.co.uk/xapian/#{ver}/xapian-bindings-#{ver}.tar.xz",
      sha256: '6b5454833ac52a3e32c0bb3a7290a5a2b50488d8918f2a45269557e4de9a31e5'
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
