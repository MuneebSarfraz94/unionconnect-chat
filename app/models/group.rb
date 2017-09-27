class Group < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :type, :slug

  TYPE_STANDARD = 'StandardGroup'


end
