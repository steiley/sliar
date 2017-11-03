class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  has_many :user_favorite_foods
  has_many :favorite_foods, through: :user_favorite_foods, source: :food

  # updateの時はパスワードは必須でなくて良い
  before_validation do |record|
    next if record.new_record?
    record.password = nil if (!record.password.nil? && record.password.empty?)
    record.password_confirmation = nil if (!record.password_confirmation.nil? && record.password_confirmation.empty?)
  end
end
