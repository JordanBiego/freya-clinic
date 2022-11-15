class Municipe < ApplicationRecord
  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  has_one :Municipe, required: true

  validates :name,        presence: true, length: { maximum: 200 }
  validates :cpf,         presence: true, length: { maximum: 11 }, uniquiness: true
  validates :phone,       presence: true, length: { maximum: 15 }
  validates :cns,         presence: true, length: { maximum: 15 }, uniquiness: true
  validates :email,       presence: true, length: { maximum: 200 }

  validates :birth_date, comparison: { less_than_or_equal_to: Date.today }

end
