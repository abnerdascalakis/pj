require "httparty"

class CnpjService
  include HTTParty
  base_uri "https://brasilapi.com.br/api/cnpj/v1"

  def self.consultar(cnpj)
    response = get("/#{cnpj}")
    if response.success?
      response.parsed_response
    else
      { error: "CNPJ não encontrado" }
    end
  end
end
