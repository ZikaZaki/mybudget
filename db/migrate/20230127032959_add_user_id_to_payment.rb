class AddUserIdToPayment < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :author, null: false, foreign_key: { to_table: :users }
  end
end