class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	before_save {email.downcase!}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates :name, presence: true,
    				 length: {maximum: 50}
    validates :email, presence: true,
    				  length: {maximum: 75},
    				  format: {with: VALID_EMAIL_REGEX},
    				  uniqueness: {case_sensitive: false}

    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependend: :destroy

end
