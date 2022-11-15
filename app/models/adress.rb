class Adress < ApplicationRecord
  belongs_to :Municipe, class_name: 'Municipe', inverse_of: :Adress

  validates :postal_code, presence: true, length: { maximum: 200 }
  validates :street,      presence: true, length: { maximum: 200 }
  validates :district,    presence: true, length: { maximum: 200 }
  validates :city,        presence: true, length: { maximum: 200 }
  validates :state,       presence: true, length: { maximum: 200 }

  validates :complement,  length: { maximum: 200 }
  validates :ibge_code,   length: { maximum: 200 }

end
