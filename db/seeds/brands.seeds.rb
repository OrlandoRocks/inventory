
  puts '==> Filling the \'brands\' table...'

  # Deletes all existing records.
  Brand.delete_all

  # Restarts ids to 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('brands')

  # Content.
  Brand.create(name: 'ATOMICTHREE', description: 'ATOMICTHREE')
  Brand.create(name: 'BEST HOME', description: 'BEST HOME')
  Brand.create(name: 'AJHUA TECNOLOGIC', description: 'AJHUA TECNOLOGIC')
  Brand.create(name: 'DAHUA', description: 'DAHUA')
  Brand.create(name: 'DAEVON', description: 'DAEVON')
  Brand.create(name: 'ECONOSILLA', description: 'ECONOSILLA')
  Brand.create(name: 'EPCOM', description: 'EPCOM')
  Brand.create(name: 'GALES', description: 'GALES')
  Brand.create(name: 'GEBESA', description: 'GEBESA')
  Brand.create(name: 'GENERAL ELECTRIC', description: 'GENERAL ELECTRIC')
  Brand.create(name: 'GENOVA', description: 'GENOVA')
  Brand.create(name: 'HIKVISION', description: 'HIKVISION')
  Brand.create(name: 'IEM', description: 'IEM')
  Brand.create(name: 'KOOL TEK', description: 'KOOL TEK')
  Brand.create(name: 'LASKO', description: 'LASKO')
  Brand.create(name: 'LG', description: 'LG')
  Brand.create(name: 'LIFETIME', description: 'LIFETIME')
  Brand.create(name: 'MASTER', description: 'MASTER')
  Brand.create(name: 'MILFORD', description: 'MILFORD')
  Brand.create(name: 'MIRAGE', description: 'MIRAGE')
  Brand.create(name: 'MOTOROLA', description: 'MOTOROLA')
  Brand.create(name: 'N/A', description: 'N/A')
  Brand.create(name: 'MABE', description: 'MABE')
  Brand.create(name: 'MYTEC', description: 'MYTEC')
  Brand.create(name: 'NY', description: 'NY')
  Brand.create(name: 'OFFICE DEPOT', description: 'OFFICE DEPOT')
  Brand.create(name: 'OFFICE DESIGNS', description: 'OFFICE DESIGNS')
  Brand.create(name: 'OFFICE MAX', description: 'OFFICE MAX')
  Brand.create(name: 'PRIME', description: 'PRIME')
  Brand.create(name: 'PRINTAFORM', description: 'PRINTAFORM')
  Brand.create(name: 'RED TOP', description: 'RED TOP')
  Brand.create(name: 'RENZOR', description: 'RENZOR')
  Brand.create(name: 'SAMSUNG', description: 'SAMSUNG')
  Brand.create(name: 'SHARP', description: 'SHARP')
  Brand.create(name: 'STEREN', description: 'STEREN')
  Brand.create(name: 'SUPERMATIC', description: 'SUPERMATIC')
  Brand.create(name: 'TAM-MEX', description: 'TAM-MEX')
  Brand.create(name: 'TRANE-MIRAGE', description: 'TRANE-MIRAGE')
  Brand.create(name: 'VELVET', description: 'VELVET')
  Brand.create(name: 'VIDRIO PULIDO', description: 'VIDRIO PULIDO')
  Brand.create(name: 'VTECH', description: 'VTECH')
  Brand.create(name: 'WATERFRESH', description: 'WATERFRESH')
  Brand.create(name: 'WIRLPOOL', description: 'WIRLPOOL')
  Brand.create(name: 'YORK', description: 'YORK')
  Brand.create(name: 'VARIAS', description: 'VARIAS')
  Brand.create(name: 'VELVET', description: 'VELVET')
  Brand.create(name: 'VENCOL', description: 'VENCOL')



