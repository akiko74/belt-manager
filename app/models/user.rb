class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter] 

 
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.name
      user.email = User.dummy_email(auth)
      user.password = Devise.friendly_token[0, 20] # ランダムなパスワードを作成
    end
  end

  private
  def self.dummy_email(auth)
   "#{auth.uid}-#{auth.provider}@dqx.belt-manager.jp"
  end
end
