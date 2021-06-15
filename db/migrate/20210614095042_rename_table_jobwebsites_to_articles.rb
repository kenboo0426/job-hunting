class RenameTableJobwebsitesToArticles < ActiveRecord::Migration[6.1]
  def change
    rename_table :job_websites, :articles
  end
end
