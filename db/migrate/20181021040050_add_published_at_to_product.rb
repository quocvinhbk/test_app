class AddPublishedAtToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :published_at, :datetime
  end
end
