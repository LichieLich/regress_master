class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.belongs_to :sack, optional: true

      t.timestamps
    end
  end
end
