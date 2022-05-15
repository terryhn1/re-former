class User < ApplicationRecord
    validates :email, presence: true, email: true, uniqueness: true
    validates :username, presence: true, uniqueness: true, length: {minimum: 8, maximum: 60}
    validates :password, presence: true, length: {minimum: 8}
end
