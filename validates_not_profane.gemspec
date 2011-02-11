# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validates_not_profane/version"

Gem::Specification.new do |s|
  s.name        = "validates_not_profane"
  s.version     = ValidatesNotProfane::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ben Marini", "Michael j. Edgar"]
  s.email       = ["bmarini@gmail.com"]
  s.homepage    = "http://github.com/akqa/validates_not_profane"
  s.summary     = %q{Rails 3 profanity validator for active model}
  s.description = %q{Rails 3 profanity validator for active model}

  s.rubyforge_project = "validates_not_profane"

  s.add_dependency "profanalyzer", "~> 1.0"
  s.add_dependency "activemodel", "~> 3.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
