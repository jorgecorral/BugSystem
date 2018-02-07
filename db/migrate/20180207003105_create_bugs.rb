class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :descricao
      t.string :solucao
      t.integer :solucionado
      t.references :projeto, foreign_key: true

      t.timestamps
    end
  end
end
