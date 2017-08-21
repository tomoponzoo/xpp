# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "xpp/version"

Gem::Specification.new do |spec|
  spec.name          = "xpp"
  spec.version       = Xpp::VERSION
  spec.authors       = ["tomoponzoo"]
  spec.email         = ["tomoponzoo@gmail.com"]

  spec.summary       = "Create and modify Xcode projects from Ruby."
  spec.description   = %(
    With Xpp you can create, delete, move, rename files.
    It can be reflected in the Xcode project at the same time.
  ).strip.gsub(/s+/, ' ')
  spec.homepage      = "https://github.com/tomoponzoo/xpp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables   = %w(xpp)
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "xcodeproj", "~> 1.5.1"
  spec.add_runtime_dependency "thor", "~> 0.20.0"
  spec.add_runtime_dependency "highline", "~> 1.7.0"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
