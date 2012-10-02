# Set up the execution environment. Load this file before trying to do
# anything else. This file assumes that the repo's been bootstrapped.

require "pathname"

# Make sure we're in the repo's root directory.

Dir.chdir Pathname.new(__FILE__).realpath + "../.."

# Load custom config.

load File.expand_path "../boxen.rb", __FILE__

# Load local config if it exists. This file is ignored by Git, and can
# be used for personal config.

local = File.expand_path "../local.rb", __FILE__
load local if File.file? local

# Add local deps to the load path.

require "rubygems"
require "bundler/setup"

# Add local lib to the front of the load path if it exists.

lib = File.expand_path "../../lib", __FILE__
$:.unshift lib if File.directory? lib
