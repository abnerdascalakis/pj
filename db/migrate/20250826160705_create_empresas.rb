class CreateEmpresas < ActiveRecord::Migration[7.2]
  def change
    create_table :empresas do |t|
      t.string :cnpj
      t.string :tipo
      t.string :nome
      t.string :porte

      t.timestamps
    end
  end
end
