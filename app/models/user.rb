class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: { case_sensitive: false }

    has_many :comments, dependent: :destroy
    has_many :user_markers, dependent: :destroy 
    has_many :map_markers, through: :user_markers

end
