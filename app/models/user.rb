class User < ActiveRecord::Base
  validates :name, presence: true, length: {max: 255}
  validates :email, presence: true
end

