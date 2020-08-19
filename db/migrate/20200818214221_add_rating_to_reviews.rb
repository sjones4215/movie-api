class AddRatingToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column table_name :reviews, column_name :rating, type :float
  end
end
