puts '==> Filling the \'permissions\' table...'

# Deletes all existing records.
Permission.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('permissions')