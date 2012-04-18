# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "brazilian-documents-validations/version"

Gem::Specification.new do |s|
  s.name        = "brazilian-documents-validations"
  s.version     = Brazilian::Documents::Validations::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Juan Maiz @joaomilho"]
  s.email       = ["juanmaiz@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Brazilian Documents Validations}
  s.description = %q{CPF & CNPJ...}
  s.add_dependency('rails','>= 3.0.7')
  
  s.rubyforge_project = "brazilian-documents-validations"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
