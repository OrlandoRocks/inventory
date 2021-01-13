module NumberToLetters
  module Numeric
    def self.included(recipiente)
      recipiente.extend(ClassMethods)
      recipiente.class_eval do
        include InstanceMethods
      end
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    MONEDA_SINGULAR = 'bolivar'
    MONEDA_PLURAL = 'bolivares'
    CENTIMOS_SINGULAR = 'centimo'
    CENTIMOS_PLURAL = 'centimos'
    MAX_NUMERO = 999_999_999_999
    UNIDADES = %w(cero uno dos tres cuatro cinco seis siete ocho nueve)
    DECENAS = %w(diez once doce trece catorce quince dieciseis diecisiete dieciocho diecinueve)
    DIEZ_DIEZ = %w(cero diez veinte treinta cuarenta cincuenta sesenta setenta ochenta noventa)
    CIENTOS = %w(_ ciento doscientos trescientos cuatroscientos quinientos seiscientos setecientos ochocientos novecientos)

    def a_letras
      numero_entero = self.to_i
      raise 'Rango soportado actualmente: [- +]999.999.999.999' if numero_entero > MAX_NUMERO

      return 'menos ' + self.abs.a_letras if numero_entero < 0

      parte_decimal = ((self.abs - numero_entero.abs) * 100).round
      if(parte_decimal > 9)
        letras_decimal = self.kind_of?(Float) ? " punto #{parte_decimal.a_letras}" : ''
      else
        letras_decimal = self.kind_of?(Float) ? " punto cero #{parte_decimal.a_letras}" : ''
      end

      case numero_entero
      when 0..99 then leer_decenas(numero_entero)
      when 100..999 then leer_centenas(numero_entero)
      when 1000..999999 then leer_miles(numero_entero)
      when 1000000..999999999 then leer_millones(numero_entero)
      when 1000000000..999999999999 then leer_millardos(numero_entero)
      end.gsub('_', ' ').squeeze(' ').strip.gsub('uno mil', 'un mil') + letras_decimal
    end

    def a_moneda
      numero_entero = self.to_i

      parte_decimal = ((self.abs - numero_entero.abs) * 100).round

      centimos = (parte_decimal == 1) ? CENTIMOS_SINGULAR : CENTIMOS_PLURAL
      moneda = (numero_entero == 1) ? MONEDA_SINGULAR : MONEDA_PLURAL

      letras = numero_entero.a_letras.gsub('uno', 'un')
      letras += ' de' if (letras =~ /(millon|millones)\z/)

      letras_decimal = " con #{parte_decimal.a_letras.gsub('uno', 'un')} #{centimos}" if self.kind_of?(Float)

      "#{letras} #{moneda}#{letras_decimal}"
    end

    def leer_decenas(numero)
      numero_entero = numero.to_i
      return UNIDADES[numero_entero] if numero_entero < 10
      decena, unidad = numero_entero.divmod(10)
      case numero_entero
      when 10..19, 0 then DECENAS[unidad]
      when 21..29 then "veinti#{UNIDADES[unidad]}"
      else DIEZ_DIEZ[decena] + (unidad > 0 ? " y #{UNIDADES[unidad]}" : '')
      end
    end

    def leer_centenas(numero)
      numero_entero = numero.to_i
      centena, decena = numero_entero.divmod(100)
      return 'cien' if numero_entero == 100
      CIENTOS[centena] + (decena > 0 ? " #{leer_decenas(decena)}" : '')
    end

    def leer_miles(numero)
      numero_entero = numero.to_i
      millar, centena = numero_entero.divmod(1000)
      millar_letras = case millar
      when 2..9 then UNIDADES[millar]
      when 10..99 then leer_decenas(millar)
      when 100..999 then leer_centenas(millar)
      else ''
      end + ' mil '
      millar_letras += leer_centenas(centena) if centena > 0
      millar_letras
    end

    def leer_millones(numero)
      numero_entero = numero.to_i
      millon, millar = numero_entero.divmod(1000000)
      millon_letras = case millon
      when 1 then ' un millon '
      when 2..9 then UNIDADES[millon]
      when 10..99 then leer_decenas(millon)
      when 100..999 then leer_centenas(millon)
      else ''
      end
      millon_letras += ' millones ' unless millon == 1
      millon_letras + case millar
      when 1..999 then leer_centenas(millar)
      when 1000..999999 then leer_miles(millar)
      else ''
      end
    end

    def leer_millardos(numero)
      numero_entero = numero.to_i
      millardo, millon = numero_entero.divmod(1000000)
      "#{leer_miles(millardo)} #{leer_millones(millon)}"
    end
  end
end

Numeric.send :include, NumberToLetters::Numeric