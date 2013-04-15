class User < ActiveRecord::Base
  attr_accessible :avatar, :email, :name
end
