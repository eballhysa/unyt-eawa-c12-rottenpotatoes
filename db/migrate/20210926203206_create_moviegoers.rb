class CreateMoviegoers < ActiveRecord::Migration[6.0]
  def change
    create_table :moviegoers do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
