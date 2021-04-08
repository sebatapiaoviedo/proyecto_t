class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.integer :origin_tweet

      t.timestamps
    end
  end
end
