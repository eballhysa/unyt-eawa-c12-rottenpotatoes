class Moviegoer < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :movies, through: :reviews

  def full_name
    "#{name} #{surname}"
  end
end
