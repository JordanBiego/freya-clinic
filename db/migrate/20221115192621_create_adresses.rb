class CreateAdresses < ActiveRecord::Migration[7.0]
  def up
    create_table :adresses do |t|
      t.string  :postal_code, null: false
      t.string  :street, null: false
      t.string  :complement, null: true
      t.string  :district, null: false
      t.string  :city, null: false
      t.string  :state, null: false
      t.string  :ibge_code, null: true

      t.belongs_to :municipe, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end

  def down
    drop_table :adresses
    drop_table :municipes
  end
end
