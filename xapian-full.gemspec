# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{xapian-full-alaveteli}
  s.version = "1.4.20.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Adams", "Rich Lane", "Seb Bacon", "Alexey Pisarenko", "Louise Crow", "Ian Chard", "Sam Pearson"]
  s.homepage = %q{https://github.com/mysociety/xapian-full}
  s.date = %q{2022-12-06}
  s.description = %q{Xapian bindings for Ruby without dependency on system Xapian library}
  s.email = %q{mysociety@alaveteli.org}
  s.extensions = ["Rakefile"]
  s.files = [
     "lib/xapian.rb",
     "Rakefile",
     "xapian-bindings-1.4.20.tar.xz",
     "xapian-core-1.4.20.tar.xz",
     "xapian-full.gemspec",
  ]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.7.0"
  s.summary = %q{xapian-core + Ruby xapian-bindings}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3
  else
  end
end
