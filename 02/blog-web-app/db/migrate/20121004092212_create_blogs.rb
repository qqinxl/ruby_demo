class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :subject
      t.text :content
      t.datetime :publish_at
      t.references :user

      t.timestamps
    end
    add_index :blogs, :user_id
  end
end
