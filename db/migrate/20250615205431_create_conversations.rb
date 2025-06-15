class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false

      t.timestamps
    end

    add_index :conversations, [:sender_id, :recipient_id], unique: true
  end
end
