require 'rbconfig'
c = Config::CONFIG

begin
    require 'bundler'
    have_bundler = true
rescue
    have_bundler = false
end

def system!(cmd)
	puts cmd
	system(cmd) or raise
end

ver = '1.2.9'
core = "xapian-core-#{ver}"
bindings = "xapian-bindings-#{ver}"

task :default do
	[core,bindings].each do |x|
		system! "tar -xzvf #{x}.tar.gz"
	end

	prefix = Dir.pwd

	Dir.chdir core do
		system! "./configure --prefix=#{prefix} --exec-prefix=#{prefix}"
		system! "make clean all"
		system! "make install"
	end

	Dir.chdir bindings do
		ENV['RUBY'] ||= "#{c['bindir']}/#{c['RUBY_INSTALL_NAME']}"
		ENV['XAPIAN_CONFIG'] = "#{prefix}/bin/xapian-config"
		system! "./configure --prefix=#{prefix} --exec-prefix=#{prefix} --with-ruby"
		if have_bundler
			# Maybe Bundler is building us in a temporary directory, and will move us to
			# the system ruby gems directory once built.
			system! "make clean all LDFLAGS='-R#{Bundler.rubygems.gem_dir}/gems/xapian-full-alaveteli-1.2.9.4/lib'"
		else
			system! "make clean all"
		end
	end

	system! "cp -RL #{bindings}/ruby/.libs/_xapian.* lib"
	system! "cp #{bindings}/ruby/xapian.rb lib"
end

