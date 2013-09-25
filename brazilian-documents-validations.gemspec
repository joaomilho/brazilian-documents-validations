# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "brazilian-documents-validations/version"

Gem::Specification.new do |s|
  s.name             = "brazilian-documents-validations"
  s.version          = BrazilianDocumentsValidations::VERSION
  s.authors          = ["Maiz Lulkin"]
  s.email            = ["maiz@lulk.in"]
  s.summary          = %q{Brazilian Documents Validations}
  s.description      = %q{Validations for CPF and CNPJ}
  s.homepage         = %q{https://github.com/joaomilho/brazilian-documents-validations}
  s.extra_rdoc_files = ["README.md"]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_paths    = ["lib"]
  s.files            = `git ls-files --  lib/* bin/* README.md`.split("\n")

  s.add_dependency 'activemodel'

  s.add_development_dependency 'rake'
end
