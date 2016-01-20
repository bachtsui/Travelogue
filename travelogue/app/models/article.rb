class Article < ActiveRecord::Base
  belongs_to :user
  has_many :cities
  #Changed from plural to singular
end
