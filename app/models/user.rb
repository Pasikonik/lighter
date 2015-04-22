class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ratyrate_rater
  has_many :entries
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
