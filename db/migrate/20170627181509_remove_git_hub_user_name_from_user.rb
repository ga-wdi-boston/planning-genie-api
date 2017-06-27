class RemoveGitHubUserNameFromUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :github_username, :string, null: true
  end
end
