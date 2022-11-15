class Municipe < ApplicationRecord
  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  has_one :adress, required: true
  accepts_nested_attributes_for :adress

  validates :name,        presence: true, length: { maximum: 200 }
  validates :cpf,         presence: true #cpf: true
  validates :phone,       presence: true, length: { maximum: 15 }
  validates :cns,         presence: true #'::CnsBrazil::Cns': true

  validates :email,       presence: true, confirmation: true, length: { maximum: 200 }
  validates :email,       email_format: { message: 'Email Inválido!' }

  validates :birthdate, comparison: { less_than_or_equal_to: Date.today }

end
