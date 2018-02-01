class CreateMocks < ActiveRecord::Migration[5.0]
  def change
    create_table :mocks do |t|
      t.text :url
      t.text :body
      t.text :result
      t.string :method
      t.integer :mock_server_id, :references => [:mock_servers, :id]
    end
  end
end
