puts '==> Creating the Fiscal Vauchers For AgroTrailers Planet...'

# Deletes all existing records.
FiscalVoucher.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('fiscal_vouchers')

# Content.

FiscalVoucher.create(name: 'Adquisición de mercancias', status:true)
FiscalVoucher.create(name: 'Aportaciones voluntarias al SAR', status:true)
FiscalVoucher.create(name: 'Comunicaciones satelitales', status:true)
FiscalVoucher.create(name: 'Comunicaciones telefónicas', status:true)
FiscalVoucher.create(name: 'Construcciones', status:true)
FiscalVoucher.create(name: 'Dados, troqueles, moldes, matrices y herramental', status:true)
FiscalVoucher.create(name: 'Depósitos en cuentas para el ahorro, primas que te..', status:true)
FiscalVoucher.create(name: 'Devoluciones, descuentos o bonificaciones', status:true)
FiscalVoucher.create(name: 'Donativos', status:true)
FiscalVoucher.create(name: 'Equipo de computo y accesorios', status:true)
FiscalVoucher.create(name: 'Equipo de transporte', status:true)
FiscalVoucher.create(name: 'Gastos de transportación escolar obligatoria', status:true)
FiscalVoucher.create(name: 'Gastos en general', status:true)
FiscalVoucher.create(name: 'Gastos funerales', status:true)
FiscalVoucher.create(name: 'Gastos médicos por incapacidad o discapacidad', status:true)
FiscalVoucher.create(name: 'Honorarios médicos, dentales y gastos hospitalarios', status:true)
FiscalVoucher.create(name: 'Intereses reales efectivamente pagados por crédito', status:true)
FiscalVoucher.create(name: 'Mobiliario y equipo de oficina por inversiones', status:true)
FiscalVoucher.create(name: 'Otra maquinaria y equipo', status:true)
FiscalVoucher.create(name: 'Pagos por servicios educativos (colegiaturas)', status:true)
FiscalVoucher.create(name: 'Por definir', status:true)
FiscalVoucher.create(name: 'Primas por seguros de gastos médicos', status:true)
