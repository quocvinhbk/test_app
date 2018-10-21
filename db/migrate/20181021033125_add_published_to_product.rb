class AddPublishedToProduct < ActiveRecord::Migration[5.2]
  def up
    add_column :products, :published, :boolean, null: false, default: false
  end

  def down
    remove_column :products, :published
  end
end
