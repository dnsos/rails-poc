class User < ApplicationRecord
  # Currently we only have two roles:
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  private

  def set_default_role
    self.role ||= :user
  end
end
