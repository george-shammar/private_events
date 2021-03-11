class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :location
      t.date :date
      t.time :time
      t.string :title

      t.timestamps
    end
  end
end
