class Municipe < ApplicationRecord
  include MunicipeSearcheable

  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb_40, resize_to_limit: [40, 40]
    attachable.variant :thumb_80, resize_to_limit: [80, 80]
  end
  
  has_one :adress, required: true
  accepts_nested_attributes_for :adress

  validates :name,        presence: true, length: { maximum: 200 }
  validates :cpf,         presence: true, cpf: true
  validates :phone,       presence: true, length: { maximum: 15 }
  validates :cns,         presence: true, '::CnsBrazil::Cns': true

  validates :email,       presence: true, confirmation: true, length: { maximum: 200 }
  validates :email,       email_format: { message: 'Email Inválido!' }

  validates :birthdate,   presence: true
  validates :birthdate,   comparison: { less_than_or_equal_to: Date.today }

end
