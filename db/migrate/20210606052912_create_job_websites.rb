class CreateJobWebsites < ActiveRecord::Migration[6.1]
  def change
    create_table :job_websites do |t|
      t.string :url, null: false
      t.string :title, null: false
      t.string :company_name
      t.string :place
      t.boolean :scraped, null: false, default: false

      t.timestamps
    end
    add_index :job_websites, :url, unique: true
  end
end
