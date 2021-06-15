class AddColumnReleaseDateToJobWebsite < ActiveRecord::Migration[6.1]
  def change
    add_column :job_websites, :release_date, :date
  end
end
