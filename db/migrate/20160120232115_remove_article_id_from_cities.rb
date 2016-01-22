class RemoveArticleIdFromCities < ActiveRecord::Migration
  def change
    remove_reference :cities, :article, index: true, foreign_key: true
  end
end
