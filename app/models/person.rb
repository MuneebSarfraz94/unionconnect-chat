class Person < ApplicationRecord
  belongs_to :connected_user, :class_name => "User" ,:foreign_key => :user_id
end
