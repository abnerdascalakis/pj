class Empresa < ApplicationRecord
  validates :cnpj, presence: true
  validates :nome, presence: true
  validates :tipo, presence: true
  validates :porte, presence: true

  # Permite que Ransack pesquise nesses campos
  def self.ransackable_attributes(auth_object = nil)
    [ "nome", "tipo", "cnpj", "porte", "created_at", "updated_at", "id" ]
  end
end
