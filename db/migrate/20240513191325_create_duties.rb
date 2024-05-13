class CreateDuties < ActiveRecord::Migration[7.0]
  def change
    create_table :duties do |t|
      t.belongs_to :user, optional: true
      t.datetime :date

      t.timestamps
    end
  end
end
