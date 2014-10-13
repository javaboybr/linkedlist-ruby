# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'linkedlist/version'

Gem::Specification.new do |spec|
  spec.name          = "linkedlist"
  spec.version       = Linkedlist::VERSION
  spec.authors       = ["Thiago Gonzaga"]
  spec.email         = ["thi_gonzaga@yahoo.com.br"]
  spec.summary       = %q{An iterable doubly linked list}
  spec.description   = %q{An iterable doubly linked list which can be used as a stack, queue or array list}
  spec.homepage      = "https://github.com/javaboybr/linkedlist-ruby"
  spec.metadata      = {"issue_tracker" => "https://github.com/javaboybr/linkedlist-ruby/issues"}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
