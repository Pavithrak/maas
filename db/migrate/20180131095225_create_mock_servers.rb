class CreateMockServers < ActiveRecord::Migration[5.0]
  def change
    create_table :mock_servers do |t|
      t.string :name
      t.timestamps
    end
  end
end
