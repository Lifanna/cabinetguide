class User < ApplicationRecord
    validates :first_name, length: {minimum: 1, maximum: 50}, allow_blank: false
    validates :last_name, length: {minimum: 1, maximum: 50}, allow_blank: false
    validates :phone, format: { with: /\A\d+\z/, message: "разрешен ввод только цифр" }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "введите корректный email-адрес" }
    validates :first_name, uniqueness: { scope: [ :last_name, :email ] }

    has_one :request, dependent: :destroy, :inverse_of => :user
end
