class User < ActiveRecord::Base
  validates :name,  presence: true,
                    length: {maximum: 255}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@([a-z\d\-]+\.)+[a-z]{2,6}\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX} ,
                    uniqueness: { case_senstive: false}

  before_save { self.email.downcase! }
end