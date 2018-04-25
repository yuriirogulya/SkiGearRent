class ChangeReviewsColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :entity_id, :reviewable_id
    rename_column :reviews, :entity_type, :reviewable_type
  end
end
