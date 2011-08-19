class AddWelcomePhraseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :welcome_phrase, :string, :default => "These people dig me:"
  end
end

