class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true, length: { in: 5..30 }
  validates :email, uniqueness: true, presence: true, length: { in: 5..30 }
  validates :password, presence: true, length: { in: 5..30 }

  def self.find_by!(params)
    params[:username] = params.delete(:id) if params[:id]
    super params
  end
end
