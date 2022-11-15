class CreateMunicipes < ActiveRecord::Migration[7.0]
  create_table :municipes do |t|
    t.string  :name,      null: false
    t.string  :cpf,       null: false
    t.string  :cns,       null: false
    t.string  :email,     null: false
    t.date    :birthdate, null: false
    t.string  :phone,     null: false
    t.string  :picture
    t.string  :status,    null: false

    t.timestamps
  end

  def down
    drop_table :municipes
  end
end
