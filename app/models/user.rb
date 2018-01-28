class User < ApplicationRecord
	
	has_many :articles
	include Gravtastic
  gravtastic
  
	before_save { self.email = email.downcase }
	has_secure_password

	VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :username,
						presence: true,
						uniqueness: {case_sensitive: false},
						length: {minimum: 3, maximum: 20}
	validates :email, 
						presence: true, 
						length: {maximum: 50},
						uniqueness: {case_sensitive: false},
						format: {with: VALID_EMAIL_REGEX }
	validates :password, presence: true



end
