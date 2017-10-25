class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :nonce
      t.belongs_to :user
      t.timestamps
    end
  end
end
