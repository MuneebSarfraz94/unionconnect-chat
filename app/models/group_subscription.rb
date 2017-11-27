class GroupSubscription < ActiveRecord::Base

  belongs_to :user
  belongs_to :standard_group
end
