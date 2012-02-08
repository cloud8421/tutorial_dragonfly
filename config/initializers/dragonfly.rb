require 'dragonfly'

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)

Dragonfly::App[:images].configure do |c|

  c.datastore = Dragonfly::DataStorage::S3DataStore.new

  c.datastore.configure do |d|
    d.bucket_name = 'dragonfly_tutorial'
    d.access_key_id = 'some_access_key_id'
    d.secret_access_key = 'some_secret_access_key'
  end

end unless %(development test cucumber).include? Rails.env

app.define_macro(ActiveRecord::Base, :image_accessor)