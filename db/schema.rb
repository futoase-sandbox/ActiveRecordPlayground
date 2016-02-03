ActiveRecord::Schema.define do
  create_table :fruits, force: true do |t|
    t.belongs_to :item_type,   index: true
    t.string     :name,        null: false
    t.integer    :price,       null: false
    t.timestamp                null: false
  end

  create_table :vegetables, force: true do |t|
    t.belongs_to :item_type,   index: true
    t.string     :name,        null: false
    t.integer    :price,       null: false
    t.timestamp                null: false
  end

  create_table :taxes, force: true do |t|
    t.references :tax_typable, polymorphic: true, index: true
    t.timestamp                null: false
  end

  create_table :tax_types, force: true do |t|
    t.belongs_to :tax,         index: true
    t.string     :name,        null: false
    t.timestamp                null: false
  end

  create_table :users, force: true do |t|
    t.references :buyable,      polymorphic: true, index: true
    t.string     :name,        null: false
    t.string     :mail,        null: false
    t.timestamp                null: false
  end
end
