class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   # has_many :drives
  has_many :candidates
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable,
         :trackable
private

 def after_confirmation
    WelcomeMailer.send_greeting_notification(self).deliver_now
 end

 enum :user_type, [:admin, :candidate,:inter], default: :candidate
end
