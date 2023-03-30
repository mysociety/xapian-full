# xapian-full-alaveteli

This is a gem containing the [Xapian Ruby bindings](https://xapian.org/docs/bindings/ruby/), together with a build of xapian-core. These are compiled natively on installation and installed in the `lib/` directory - the file there is a placeholder, but should reflect the current version.

## Updating

The process for updating the gem is as follows:

* Update the `Rakefile`:
    * `ver` should match the Xapian version
    * `sha256` should match the hash for each Xapian archive.
* Clear the `lib` directory.
* Run `rake compile` to download the Xapian bindings for the version specified and compiles:
    * `lib/xapian.rb` Ruby Xapian bindings
    * `lib/_xapian.{so,bundle}` shared library for the current platform.
* Run `rake test` to check the Xapian bindings can be loaded in Ruby.
* Update `xapian-full.gemspec`:
    * `s.version` should be the Xapian version, followed by the iteration of the gem, e.g. `1.4.11.1`
    * `s.file` will need updating to reflect the new archive file names
    * `s.date` and `s.authors` should be updated appropriately
    * `s.required_ruby_version` may need updating, consult the Xapian release notes for any changes.
* Run `gem build xapian-full.gemspec` and push to Rubygems.
* Make sure any code using the bindings has been updated to reflect [any changes](https://trac.xapian.org/wiki/ReleaseNotes).
