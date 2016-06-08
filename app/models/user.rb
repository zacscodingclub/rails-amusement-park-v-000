class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  enum role: [:user, :admin]
  after_initialize :init_role

  private
    def init_role
      self.role = 0
    end
end
