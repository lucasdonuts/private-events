class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :event, null: false, foreign_key: { to_table: :events }, index: true
      t.references :attendee, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
