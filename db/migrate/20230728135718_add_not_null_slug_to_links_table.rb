class AddNotNullSlugToLinksTable < ActiveRecord::Migration[7.0]
  def change
    change_column :links, :slug, :string, :null => false
    change_column :links, :url, :string, :null => false
  end
end
