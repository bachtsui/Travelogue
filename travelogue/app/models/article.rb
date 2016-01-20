class Article < ActiveRecord::Base
  belongs_to :user
  #Changed from plural to singular
end
