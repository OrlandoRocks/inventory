puts '==> Filling the \'roles_permissions\' table...'

# Deletes all existing records.
PermissionRole.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('permission_roles')