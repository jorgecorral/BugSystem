class AddImagemToBug < ActiveRecord::Migration[5.1]
  def change
    add_column :bugs, :imagem, :string
  end
end
