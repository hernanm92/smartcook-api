class FrequentUsersController < ApplicationController
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :frequent_user, class_name: 'User', foreign_key: 'frequent_user_id'
end
