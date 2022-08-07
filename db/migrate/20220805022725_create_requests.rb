class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :client_name
      t.string :product_name
      t.float :value
      t.string :state
      t.datetime :create_time

      t.timestamps
    end
  end
end
