class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|

      t.string  :name, null: false
      t.integer  :thumbup, default: 0
      t.integer  :thumbdown, default: 0

      t.timestamps
    end
  end
end
