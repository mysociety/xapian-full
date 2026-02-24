require 'mini_portile2'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

ver = '1.4.31'
package_root_dir = Dir.pwd

task :core do
  MiniPortile.new("xapian-core", ver).tap do |recipe|
    recipe.target = File.join(package_root_dir, 'ports')
    recipe.files << {
      url: "https://oligarchy.co.uk/xapian/#{ver}/xapian-core-#{ver}.tar.xz",
      sha256: 'fecf609ea2efdc8a64be369715aac733336a11f7480a6545244964ae6bc80811'
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
      sha256: 'a38cc7ba4188cc0bd27dc7369f03906772047087a1c54f1b93355d5e9103c304'
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
