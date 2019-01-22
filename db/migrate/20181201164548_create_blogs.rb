class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.text :main_img

      t.timestamps
    end
  end
end
