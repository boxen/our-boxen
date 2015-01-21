# Beaker tests

Beaker is a tool to run given Puppet code on a

These Beaker tests download an OSX Vagrant Box, then copy over the `our-boxen` directory, then run

# How

In this directory, run:

  $ bundle install --gemfile spec/Gemfile.beaker

When the install completes, run a given acceptance test:

  $ BUNDLE_GEMFILE=spec/Gemfile.beaker bundle exec rspec spec/acceptance/sanity_spec.rb

