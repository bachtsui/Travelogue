class AddCityIdToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :city, index: true, foreign_key: true
  end
end
