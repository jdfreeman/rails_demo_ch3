class User < ActiveRecord::Base
  validates :name,  presence: true,
                    length: { maximum: 255 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@([a-z\d\-]+\.)+[a-z]{2,6}\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX } ,
                    uniqueness: { case_senstive: false }

  has_many :microposts, dependent: :destroy
  before_save { self.email.downcase! }
  before_create :create_remember_token
  has_secure_password

  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
  # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("user_id = ?", id)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end