# frozen_string_literal: true

# Adding belongs
class AddUsersToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, foreign_key: true
  end
end
