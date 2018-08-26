class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :url
      t.string :overview
      t.text :detail
      t.boolean :public

      t.timestamps
    end
  end
end
