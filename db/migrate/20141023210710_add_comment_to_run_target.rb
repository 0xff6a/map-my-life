class AddCommentToRunTarget < ActiveRecord::Migration
  def change
    add_column :targets, :comment, :text
  end
end
