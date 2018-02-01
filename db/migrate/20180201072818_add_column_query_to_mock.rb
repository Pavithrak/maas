class AddColumnQueryToMock < ActiveRecord::Migration[5.0]
  def change
    add_column :mocks, :query, :string
  end
end
