class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  validates_presence_of :first_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
