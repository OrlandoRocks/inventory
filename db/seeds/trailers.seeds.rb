after :sub_categories do
  puts '==> Filling the \'Categories\' table...'

  # Deletes all existing records.
  Trailer.delete_all

  # Restarts ids to 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('trailers')

  # Content.

  #2
  Trailer.create(name: 'REMOLQUE REDILAS', model: 'CB4007M05T', sub_category_id: 1)
  Trailer.create(name: 'REMOLQUE CABALLOS', model: 'CB4008C05F', sub_category_id: 2)

end
