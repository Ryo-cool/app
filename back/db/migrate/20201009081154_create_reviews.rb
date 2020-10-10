class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :text
      t.date :wentday
      t.integer :rating
      t.string :image
      t.integer :spot_id
      t.timestamps
    end
  end
end
