class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  #Changed from plural to singular
end
