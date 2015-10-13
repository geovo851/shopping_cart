class User < ActiveRecord::Base
  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  before_create :set_role, unless: :role
  
  def role_symbols
    [role.title.to_sym]
  end

  def set_role
    role_user = Role.find_by(title: 'user')
    unless role_user
      role_user = Role.create(title: 'user')
    end
    self.role = role_user
  end
end
