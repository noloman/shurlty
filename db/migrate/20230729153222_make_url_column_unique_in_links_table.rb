# frozen_string_literal: true

class MakeUrlColumnUniqueInLinksTable < ActiveRecord::Migration[7.0]
  def change
    add_index :links, %i[url slug], unique: true
  end
end
