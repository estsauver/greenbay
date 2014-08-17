# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'green_bay/version'

Gem::Specification.new do |spec|
  spec.name          = "green_bay"
  spec.version       = GreenBay::VERSION
  spec.authors       = ["Earl St Sauver"]
  spec.email         = ["estsauver@gmail.com"]
  spec.summary       = %q{A tool for managing the production of images using Packer.io}
  spec.description   = %q{While working with packer was very neat in the level of abstraction
                        it provides, I found managing the JSON a little less fun. This wrapper
                        makes it easier to generate the packer inputs.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2"
  spec.add_development_dependency "yard", "~> 0"
  spec.add_development_dependency "pry"
end
