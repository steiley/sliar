class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :emoji, null: false

      t.timestamps
    end
  end
end
