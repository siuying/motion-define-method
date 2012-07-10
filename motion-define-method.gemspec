# -*- encoding: utf-8 -*-
require File.expand_path('../lib/define-method/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = ["Francis Chong"]
  gem.email = ["francis@ignition.hk"]
  gem.description = "A hack to use define_method in RubyMotion."
  gem.summary = "A hack to use define_method in RubyMotion."
  gem.homepage = "https://github.com/siuying/motion-define-method"

  gem.files = `git ls-files`.split($\)
  gem.test_files = gem.files.grep(%r{^(test|spec|lib_spec|features)/})
  gem.name = "motion-define-method"
  gem.require_paths = ["lib"]
  gem.version = Motion::DefineMethod::VERSION

  gem.add_development_dependency 'motion-redgreen'
  gem.add_development_dependency 'rake'
end