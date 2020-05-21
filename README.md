# xapian-full-alaveteli

This is a gem containing the [Xapian Ruby bindings](https://xapian.org/docs/bindings/ruby/), together with a build of xapian-core. These are compiled natively on installation and installed in the `lib/` directory - the file there is a placeholder, but should reflect the current version.

## Updating

The process for updating the gem is as follows:

* [Download](https://xapian.org/download) the versions of the xapian-core and xapian-bindings from the Xapian site.
* Replace the existing archives in the root of the repository with these files.
* Update the `Rakefile`:
    * `ver` should match the Xapian version
    * `iter` is for versioning the gem, so usually `1`, but if you are rebuilding the gem for some reason on the same Xapian version this should be incremented
 * Check that the various archiving commands are still correct - the format of the source archives has changed in the past.
* Extract `ruby/xapian.rb` from the new xapian-bindings archive and copy into `lib/` for reference.
* Update `xapian-full.gemspec`:
    * `s.version` should be the Xapian version, followed by the iteration of the gem, e.g. `1.4.11.1`
    * `s.file` will need updating to reflect the new archive file names
    * `s.date` and `s.authors` should be updated appropriately
    * `s.required_ruby_version` may need updating, consult the Xapian release notes for any changes.
* Run `gem build xapian-full.gemspec` and push to Rubygems.
* Make sure any code using the bindings has been updated to reflect [any changes](https://trac.xapian.org/wiki/ReleaseNotes).
