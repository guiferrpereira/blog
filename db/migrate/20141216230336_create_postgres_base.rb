class CreatePostgresBase < ActiveRecord::Migration
  def change
    create_table :postgres_bases do |t|
      t.hstore :key
      t.binary :value
    end

    add_index :postgres_bases, [:key], using: :gin
  end
end
