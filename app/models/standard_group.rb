class StandardGroup < Group
  has_many :group_subscriptions, dependent: :destroy

  has_many :members, :through => :group_subscriptions, :class_name => "User", :source => :user
  def self.model_name
    Group.model_name
  end


  # SCOPES

end
