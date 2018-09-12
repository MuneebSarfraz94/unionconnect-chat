class Group < ActiveRecord::Base
  belongs_to :user
  has_one :conversation
  validates_presence_of :name, :type, :slug
  TYPE_STANDARD = 'StandardGroup'


end
