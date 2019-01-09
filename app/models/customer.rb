class Customer < ApplicationRecord
  has_many :tickets

  accepts_nested_attributes_for :tickets

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # validates :name, presence: true
  # validates :phone_number, presence: true
  # validates :email, format: {with: VALID_EMAIL_REGEX}, allow_nil: true

  # before_save :downcase_email

  # private

  # def downcase_email
  #   email.downcase!
  # end
end
