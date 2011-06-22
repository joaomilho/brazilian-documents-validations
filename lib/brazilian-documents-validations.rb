require 'rails'
require "brazilian-documents-validations/cpf"
require "brazilian-documents-validations/cnpj"
class BrazilianDocumentsValidations < Rails::Railtie
  initializer 'brazilian-documents-validations' do
    ActiveSupport.on_load :active_record do
      require "brazilian-documents-validations/cpf_validator"
      require "brazilian-documents-validations/cnpj_validator"
    end
  end
end