class AddThankyouPhraseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :thankyou_phrase, :string, :default => "I give much props to these people:"
  end
end

