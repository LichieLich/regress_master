class CreateSacks < ActiveRecord::Migration[7.0]
  def change
    create_table :sacks do |t|
      t.timestamps
    end
  end
end
