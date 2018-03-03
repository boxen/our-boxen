source "https://rubygems.org"

gem "boxen",
  git: "https://github.com/boxen/boxen",
  ref: "high-sierra"
gem "hiera",                  "~> 3.0"
gem "librarian-puppet"
gem "puppet",                 "~> 4.0"
gem "librarianp",
  git: "https://github.com/jacobbednarz/librarian.git",
  branch: "be-explicit-about-git-env"
gem "puppet-lint",            "0.3.2"
gem "puppetlabs_spec_helper", "0.4.1"
gem "open4",                  "~> 1.3.4"
gem "rake",                   "10.3.2"
gem "rspec-puppet",           "1.0.1"
gem "deep_merge",             "~> 1.0"

group :test do
  gem "serverspec"
end

group :development do
  gem "aws-sdk-core", "~> 2.0.11"
  gem "net-ssh"
end
