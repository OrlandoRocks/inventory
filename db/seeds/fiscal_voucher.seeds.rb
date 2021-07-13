puts '==> Creating the Fiscal Vauchers For AgroTrailers Planet...'

# Deletes all existing records.
FiscalVoucher.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('fiscal_vouchers')

# Content.

FiscalVoucher.create(name: 'Adquisición de mercancias', status:true, cfdi: 'G01')
FiscalVoucher.create(name: 'Aportaciones voluntarias al SAR', status:true, cfdi: 'D06')
FiscalVoucher.create(name: 'Comunicaciones satelitales', status:true, cfdi: 'I07')
FiscalVoucher.create(name: 'Comunicaciones telefónicas', status:true, cfdi: 'I06')
FiscalVoucher.create(name: 'Construcciones', status:true, cfdi: 'I01')
FiscalVoucher.create(name: 'Dados, troqueles, moldes, matrices y herramental', status:true, cfdi: 'I05')
FiscalVoucher.create(name: 'Depósitos en cuentas para el ahorro, primas que te..', status:true, cfdi: 'D09')
FiscalVoucher.create(name: 'Devoluciones, descuentos o bonificaciones', status:true, cfdi: 'G02')
FiscalVoucher.create(name: 'Donativos', status:true, cfdi: 'D04')
FiscalVoucher.create(name: 'Equipo de computo y accesorios', status:true, cfdi: 'I04')
FiscalVoucher.create(name: 'Equipo de transporte', status:true, cfdi: 'I03')
FiscalVoucher.create(name: 'Gastos de transportación escolar obligatoria', status:true, cfdi: 'D08')
FiscalVoucher.create(name: 'Gastos en general', status:true, cfdi: 'G03')
FiscalVoucher.create(name: 'Gastos funerales', status:true, cfdi: 'D03')
FiscalVoucher.create(name: 'Gastos médicos por incapacidad o discapacidad', status:true, cfdi: 'D02')
FiscalVoucher.create(name: 'Honorarios médicos, dentales y gastos hospitalarios', status:true, cfdi: 'D01')
FiscalVoucher.create(name: 'Intereses reales efectivamente pagados por crédito', status:true, cfdi: 'D05')
FiscalVoucher.create(name: 'Mobiliario y equipo de oficina por inversiones', status:true, cfdi: 'I02')
FiscalVoucher.create(name: 'Otra maquinaria y equipo', status:true, cfdi: 'I08')
FiscalVoucher.create(name: 'Pagos por servicios educativos (colegiaturas)', status:true, cfdi: 'D10')
FiscalVoucher.create(name: 'Por definir', status:true, cfdi: 'P01')
FiscalVoucher.create(name: 'Primas por seguros de gastos médicos', status:true, cfdi: 'D07')
