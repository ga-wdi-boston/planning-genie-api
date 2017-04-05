class AddGithubUserNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :github_username, :string, null: false
  end
end
