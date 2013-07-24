# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-bee/version'

Gem::Specification.new do |gem|
  gem.name          = "vagrant-bee"
  gem.version       = VagrantPlugins::Bee::VERSION
  gem.authors       = ["James Cartledge"]
  gem.email         = ["jcartledge@gmail.com"]
  gem.description   = "Wrapper for https://github.com/jcartledge/bee task runner"
  gem.summary       = "Wrapper for https://github.com/jcartledge/bee task runner"
  gem.homepage      = ""

  gem.add_development_dependency "rake"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
