class CreateMunicipes < ActiveRecord::Migration[7.0]
  def up
    create_table :municipes do |t|
      t.text    :name,      null: false
      t.integer :cpf,       null: false
      t.integer :cns,       null: false
      t.string  :email,     null: false
      t.date    :birthdate, null: false
      t.integer :phone,     null: false
      t.string  :picture,   null: false
      t.string  :status,    null: false

      t.timestamps
    end
  end

  def down
    drop_table :municipes
  end
end
