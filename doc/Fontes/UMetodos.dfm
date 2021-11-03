object Locavia: TLocavia
  OldCreateOrder = False
  Height = 543
  Width = 587
  object adcBancoDados: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 27
    Top = 9
  end
  object adcControle: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 111
    Top = 8
  end
  object qryCidades: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Descricao'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'SELECT DISTINCT Municipios.Descricao AS Cidade,'
      '        Municipios.Estado,'
      '        Municipios.CodigoMunicipio,'
      '        EmpresaUnidades.CNPJ, Empresa.MaximoHorasExtras,'
      '        EmpresaUnidades.CodigoEmpresa,'
      '        UnidadesCidadeAtendimento.ValorTaxaEntrega,'
      '        UnidadesCidadeAtendimento.ValorTaxaDevolucao,'
      '        UnidadesCidadeAtendimento.PercTaxaAdministrativa,'
      '        UnidadesCidadeAtendimento.SobConsulta,'
      '        UnidadesCidadeAtendimento.CodigoTipoDiversoTaxaEntrega,'
      
        '        UnidadesCidadeAtendimento.CodigoTipoDiversoTaxaDevolucao' +
        ','
      
        '        EmpresaUnidades.CodigoMunicipio AS CodigoMunicipioEmpres' +
        'a'
      'FROM UnidadesCidadeAtendimento'
      
        'INNER JOIN Municipios ON UnidadesCidadeAtendimento.CodigoMunicip' +
        'io = Municipios.CodigoMunicipio'
      
        'INNER JOIN EmpresaUnidades ON UnidadesCidadeAtendimento.CodigoUn' +
        'idade = EmpresaUnidades.CodigoUnidade'
      
        '        AND UnidadesCidadeAtendimento.CodigoEmpresa = EmpresaUni' +
        'dades.CodigoEmpresa'
      
        'INNER JOIN Empresa ON EmpresaUnidades.CodigoEmpresa = Empresa.Co' +
        'digoEmpresa'
      'WHERE (EmpresaUnidades.Ativa = '#39'S'#39')'
      '    AND (UnidadesCidadeAtendimento.Ativa = '#39'S'#39')'
      '    AND (Municipios.Descricao LIKE :Descricao)'
      '  AND (EmpresaUnidades.ExibirUnidadeAppReserva = '#39'S'#39')'
      'ORDER BY Municipios.Descricao')
    UserID = 0
    ControlConnection = adcControle
    Left = 31
    Top = 70
    object qryCidadesCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object qryCidadesEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryCidadesCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
    object qryCidadesValorTaxaEntrega: TBCDField
      FieldName = 'ValorTaxaEntrega'
      Precision = 19
    end
    object qryCidadesValorTaxaDevolucao: TBCDField
      FieldName = 'ValorTaxaDevolucao'
      Precision = 19
    end
    object qryCidadesPercTaxaAdministrativa: TFloatField
      FieldName = 'PercTaxaAdministrativa'
    end
    object qryCidadesSobConsulta: TStringField
      FieldName = 'SobConsulta'
      Size = 1
    end
    object qryCidadesCodigoTipoDiversoTaxaEntrega: TIntegerField
      FieldName = 'CodigoTipoDiversoTaxaEntrega'
    end
    object qryCidadesCodigoTipoDiversoTaxaDevolucao: TIntegerField
      FieldName = 'CodigoTipoDiversoTaxaDevolucao'
    end
    object qryCidadesCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryCidadesCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object qryCidadesCodigoMunicipioEmpresa: TIntegerField
      FieldName = 'CodigoMunicipioEmpresa'
    end
    object qryCidadesMaximoHorasExtras: TIntegerField
      FieldName = 'MaximoHorasExtras'
    end
  end
  object IdSMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 175
    Top = 8
  end
  object idmEnviarEmail: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 247
    Top = 10
  end
  object qryUnidades: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoMunicipio'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT DISTINCT EmpresaUnidades.CodigoEmpresa, EmpresaUnidades.C' +
        'odigoUnidade, DescricaoUnidade, Cidade,  Logradouro, Numero,'
      
        '       Complemento, Cep, Bairro, EmpresaUnidades.Estado, Telefon' +
        'e1, Email, UnidadesCidadeAtendimento.ValorTaxaEntrega,'
      
        '       EmpresaUnidades.CodigoMunicipio, UnidadesCidadeAtendiment' +
        'o.CodigoTipoDiversoTaxaEntrega, UnidadesCidadeAtendimento.Codigo' +
        'TipoDiversoTaxaDevolucao,'
      
        '       UnidadesCidadeAtendimento.ValorTaxaDevolucao, MostrarTari' +
        'fasKmLivre, ProtecaoYes, ProtecaoPlus, PercentualDescontoTarifaR' +
        'eservaWeb,'
      
        '       UnidadesCidadeAtendimento.SobConsulta, EmpresaUnidades.Li' +
        'miteDiasAprovacaoWeb,'
      
        '       Municipios.Descricao AS MunicipioUnidade, Empresa.TaxaSer' +
        'vicos AS TaxaServicoReservaWeb,'
      
        '       SubString(EmpresaUnidades.HoraInicioFuncionamentoSegSex,1' +
        ',2) + '#39':'#39' + SubString(EmpresaUnidades.HoraInicioFuncionamentoSeg' +
        'Sex,3,2)AS HoraInicioFuncionamentoSegSex,'
      
        '       SubString(EmpresaUnidades.HoraTerminoFuncionamentoSegSex,' +
        '1,2) + '#39':'#39' + SubString(EmpresaUnidades.HoraTerminoFuncionamentoS' +
        'egSex,3,2) AS HoraTerminoFuncionamentoSegSex,'
      
        '       SubString(EmpresaUnidades.HoraInicioFuncionamentoSabado,1' +
        ',2) + '#39':'#39' + SubString(EmpresaUnidades.HoraInicioFuncionamentoSab' +
        'ado,3,2) AS HoraInicioFuncionamentoSabado,'
      
        '       SubString(EmpresaUnidades.HoraTerminoFuncionamentoSabado,' +
        '1,2) + '#39':'#39' + SubString(EmpresaUnidades.HoraTerminoFuncionamentoS' +
        'abado,3,2) AS HoraTerminoFuncionamentoSabado,'
      
        '       SubString(EmpresaUnidades.HoraInicioFuncionamentoDomingo,' +
        '1,2) + '#39':'#39' + SubString(EmpresaUnidades.HoraInicioFuncionamentoDo' +
        'mingo,3,2) As HoraInicioFuncionamentoDomingo,'
      
        '       SubString(EmpresaUnidades.HoraTerminoFuncionamentoDomingo' +
        ',1,2) + '#39':'#39' + SubString(EmpresaUnidades.HoraTerminoFuncionamento' +
        'Domingo,3,2)AS HoraTerminoFuncionamentoDomingo,'
      
        '       EmpresaUnidades.HorasAntecedenciaCancelamentoReservaWeb, ' +
        'EmpresaUnidades.HorasAntecedenciaAberturaReservaWeb, Empresa.Max' +
        'imoHorasExtras, Empresa.MaximoHorasCortesia'
      'FROM EmpresaUnidades'
      
        'INNER JOIN Empresa ON EmpresaUnidades.CodigoEmpresa = Empresa.Co' +
        'digoEmpresa'
      
        'INNER JOIN UnidadesCidadeAtendimento ON EmpresaUnidades.CodigoUn' +
        'idade = UnidadesCidadeAtendimento.CodigoUnidade AND'
      
        '                                        EmpresaUnidades.CodigoEm' +
        'presa = UnidadesCidadeAtendimento.CodigoEmpresa'
      
        'LEFT JOIN Municipios ON UnidadesCidadeAtendimento.CodigoMunicipi' +
        'o = Municipios.CodigoMunicipio'
      
        'WHERE (UnidadesCidadeAtendimento.CodigoMunicipio = :CodigoMunici' +
        'pio)'
      '  AND (EmpresaUnidades.Ativa = '#39'S'#39')'
      '  AND (EmpresaUnidades.ExibirUnidadeAppReserva = '#39'S'#39')')
    UserID = 0
    ControlConnection = adcControle
    Left = 104
    Top = 66
    object qryUnidadesCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryUnidadesCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryUnidadesDescricaoUnidade: TWideStringField
      FieldName = 'DescricaoUnidade'
      Size = 50
    end
    object qryUnidadesCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 35
    end
    object qryUnidadesLogradouro: TWideStringField
      FieldName = 'Logradouro'
      Size = 40
    end
    object qryUnidadesNumero: TWideStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qryUnidadesComplemento: TWideStringField
      FieldName = 'Complemento'
    end
    object qryUnidadesCep: TWideStringField
      FieldName = 'Cep'
      Size = 8
    end
    object qryUnidadesBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object qryUnidadesEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryUnidadesTelefone1: TStringField
      FieldName = 'Telefone1'
      Size = 11
    end
    object qryUnidadesEmail: TWideStringField
      FieldName = 'Email'
      Size = 60
    end
    object qryUnidadesCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
    object qryUnidadesHoraInicioFuncionamentoSegSex: TStringField
      FieldName = 'HoraInicioFuncionamentoSegSex'
      Size = 5
    end
    object qryUnidadesHoraTerminoFuncionamentoSegSex: TStringField
      FieldName = 'HoraTerminoFuncionamentoSegSex'
      Size = 5
    end
    object qryUnidadesHoraInicioFuncionamentoSabado: TStringField
      FieldName = 'HoraInicioFuncionamentoSabado'
      Size = 5
    end
    object qryUnidadesHoraTerminoFuncionamentoSabado: TStringField
      FieldName = 'HoraTerminoFuncionamentoSabado'
      Size = 5
    end
    object qryUnidadesHoraInicioFuncionamentoDomingo: TStringField
      FieldName = 'HoraInicioFuncionamentoDomingo'
      Size = 5
    end
    object qryUnidadesHoraTerminoFuncionamentoDomingo: TStringField
      FieldName = 'HoraTerminoFuncionamentoDomingo'
      Size = 5
    end
    object qryUnidadesHorasAntecedenciaAberturaReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaAberturaReservaWeb'
    end
    object qryUnidadesHorasAntecedenciaCancelamentoReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaCancelamentoReservaWeb'
    end
    object qryUnidadesCodigoTipoDiversoTaxaDevolucao: TIntegerField
      FieldName = 'CodigoTipoDiversoTaxaDevolucao'
    end
    object qryUnidadesCodigoTipoDiversoTaxaEntrega: TIntegerField
      FieldName = 'CodigoTipoDiversoTaxaEntrega'
    end
    object qryUnidadesValorTaxaEntrega: TBCDField
      FieldName = 'ValorTaxaEntrega'
      Precision = 19
    end
    object qryUnidadesValorTaxaDevolucao: TBCDField
      FieldName = 'ValorTaxaDevolucao'
      Precision = 19
    end
    object qryUnidadesMostrarTarifasKmLivre: TStringField
      FieldName = 'MostrarTarifasKmLivre'
      Size = 1
    end
    object qryUnidadesProtecaoYes: TStringField
      FieldName = 'ProtecaoYes'
      Size = 1
    end
    object qryUnidadesProtecaoPlus: TStringField
      FieldName = 'ProtecaoPlus'
      Size = 1
    end
    object qryUnidadesPercentualDescontoTarifaReservaWeb: TFloatField
      FieldName = 'PercentualDescontoTarifaReservaWeb'
    end
    object qryUnidadesSobConsulta: TStringField
      FieldName = 'SobConsulta'
      Size = 1
    end
    object qryUnidadesLimiteDiasAprovacaoWeb: TIntegerField
      FieldName = 'LimiteDiasAprovacaoWeb'
    end
    object qryUnidadesTaxaServicoReservaWeb: TFloatField
      FieldName = 'TaxaServicoReservaWeb'
    end
    object qryUnidadesMunicipioUnidade: TWideStringField
      FieldName = 'MunicipioUnidade'
      Size = 100
    end
    object qryUnidadesMaximoHorasExtras: TIntegerField
      FieldName = 'MaximoHorasExtras'
    end
    object qryUnidadesMaximoHorasCortesia: TIntegerField
      FieldName = 'MaximoHorasCortesia'
    end
  end
  object qryGrupoVeiculos: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicio'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataTermino'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'PromoInicio'
        Size = -1
        Value = Null
      end
      item
        Name = 'PromoTermino'
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraInicio'
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraTermino'
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasLetras'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'Letra'
        DataType = ftString
        Size = 2
        Value = #39#39
      end
      item
        Name = 'TodosGrupos'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'TodosGruposDisponiveis'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @CodigoEmpresa INT;'
      'DECLARE @CodigoUnidade INT;'
      'DECLARE @Periodo INT;'
      'DECLARE @TodasTarifas INT;'
      'DECLARE @DataInicio DATETIME;'
      'DECLARE @DataTermino DATETIME;'
      'DECLARE @PromoInicio INT;'
      'DECLARE @PromoTermino INT;'
      'DECLARE @DataHoraInicio DATETIME;'
      'DECLARE @DataHoraTermino DATETIME;'
      ''
      'SET @CodigoEmpresa = :CodigoEmpresa;'
      'SET @CodigoUnidade = :CodigoUnidade;'
      'SET @Periodo = :Periodo;'
      'SET @TodasTarifas = :TodasTarifas;'
      'SET @DataInicio = :DataInicio;'
      'SET @DataTermino = :DataTermino;'
      'SET @PromoInicio = :PromoInicio;'
      'SET @PromoTermino = :PromoTermino;'
      'SET @DataHoraInicio = :DataHoraInicio;'
      'SET @DataHoraTermino = :DataHoraTermino;'
      ''
      
        'SELECT DISTINCT VeiculosGrupos.Letra + '#39' - '#39' +  VeiculosGrupos.D' +
        'escricao As LetraDescricao,'
      
        '     VeiculosGrupos.Descricao, VeiculosGrupos.CodigoGrupo, Veicu' +
        'losGrupos.Letra, VeiculosGrupos.URLImagem, VeiculosGrupos.SubDes' +
        'cricao,'
      '     (SELECT MIN(ValorComDescontoDiario) ValorMinimo'
      '      FROM ('
      
        #9#9'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarif' +
        'as.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      
        #9#9#9#9'  ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empres' +
        'aUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      #9#9#9'  END AS ValorDesconto,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN VeiculosT' +
        'arifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      #9#9#9#9'  ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      #9#9#9#9'  ELSE'
      
        #9#9#9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN ((Veicu' +
        'losTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidades.Percentu' +
        'alDescontoTarifaReservaWeb,1)) /100)/7'
      
        #9#9#9#9#9#9'  ELSE((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empre' +
        'saUnidades.PercentualDescontoTarifaReservaWeb,1)) /100) END'
      #9#9#9'  END AS ValorComDescontoDiario'
      #9#9'FROM VeiculosTarifas'
      
        #9#9'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = ' +
        'EmpresaUnidades.CodigoEmpresa AND'
      
        #9#9#9#9#9#9#9#9'VeiculosTarifas.CodigoUnidade = EmpresaUnidades.CodigoUn' +
        'idade'
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      #9#9#9' AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      
        #9#9#9' AND (VeiculosTarifas.CodigoGrupo = VeiculosGrupos.CodigoGrup' +
        'o)'
      #9#9#9' AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9#9' AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9#9' AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9#9' AND (VeiculosTarifas.PeriodoTarifa  = @Periodo)'
      
        #9#9#9' AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39')' +
        ')'
      #9#9#9' AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      #9#9#9' AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')'
      
        '                         AND (VeiculosTarifas.PromoInicio >= @Pr' +
        'omoInicio)'
      #9#9#9' AND (VeiculosTarifas.PromoTermino <= @PromoTermino)'
      ''
      #9#9'UNION'
      
        #9#9'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarif' +
        'as.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      
        #9#9#9#9'  ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empres' +
        'aUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      #9#9#9'  END AS ValorDesconto,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN VeiculosT' +
        'arifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      #9#9#9#9'  ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      #9#9#9#9'  ELSE'
      
        #9#9#9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN ((Veicu' +
        'losTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidades.Percentu' +
        'alDescontoTarifaReservaWeb,1)) /100)/7'
      
        #9#9#9#9#9#9'  ELSE((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empre' +
        'saUnidades.PercentualDescontoTarifaReservaWeb,1)) /100) END'
      #9#9#9'  END AS ValorComDescontoDiario'
      #9#9'FROM VeiculosTarifas'
      
        #9#9'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = ' +
        'EmpresaUnidades.CodigoEmpresa AND'
      
        #9#9#9#9#9#9#9#9'VeiculosTarifas.CodigoUnidade = EmpresaUnidades.CodigoUn' +
        'idade'
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      
        #9#9'  AND (VeiculosTarifas.CodigoGrupo = VeiculosGrupos.CodigoGrup' +
        'o)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  = @Periodo)'
      
        #9#9'  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39')' +
        ')'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      
        #9#9'  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.D' +
        'ataInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao' +
        ')'
      
        #9#9'  AND (CONVERT(DATETIME, @DataInicio, 103) BETWEEN  VeiculosTa' +
        'rifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao)'
      
        #9#9'  AND (CONVERT(DATETIME, @DataTermino, 103) BETWEEN  VeiculosT' +
        'arifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao' +
        ')'
      
        '                  AND (VeiculosTarifas.PromoInicio >= @PromoInic' +
        'io)'
      
        '                  AND (VeiculosTarifas.PromoTermino <= @PromoTer' +
        'mino)'
      ''
      #9#9'UNION'
      
        #9#9'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarif' +
        'as.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      
        #9#9#9#9'  ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empres' +
        'aUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      #9#9#9'  END AS ValorDesconto,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN VeiculosT' +
        'arifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      #9#9#9#9'  ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      #9#9#9#9'  ELSE'
      
        #9#9#9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN ((Veicu' +
        'losTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidades.Percentu' +
        'alDescontoTarifaReservaWeb,1)) /100)/7'
      
        #9#9#9#9#9#9'  ELSE((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empre' +
        'saUnidades.PercentualDescontoTarifaReservaWeb,1)) /100) END'
      #9#9#9'  END AS ValorComDescontoDiario'
      #9#9'FROM VeiculosTarifas'
      
        #9#9'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = ' +
        'EmpresaUnidades.CodigoEmpresa AND'
      
        #9#9#9#9#9#9#9#9'VeiculosTarifas.CodigoUnidade = EmpresaUnidades.CodigoUn' +
        'idade'
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      
        #9#9'  AND (VeiculosTarifas.CodigoGrupo = VeiculosGrupos.CodigoGrup' +
        'o)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  = @Periodo)'
      
        #9#9'  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39')' +
        ')'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      #9#9'  AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      
        #9#9'  AND (CONVERT(DATETIME, @DataInicio, 103) BETWEEN  VeiculosTa' +
        'rifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao)'
      
        #9#9'  AND (CONVERT(DATETIME, @DataTermino, 103) BETWEEN  VeiculosT' +
        'arifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao' +
        ')'
      
        '                  AND (VeiculosTarifas.PromoInicio >= @PromoInic' +
        'io)'
      
        '                  AND (VeiculosTarifas.PromoTermino <= @PromoTer' +
        'mino)'
      ''
      #9#9'UNION'
      
        #9#9'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarif' +
        'as.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      
        #9#9#9#9'  ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empres' +
        'aUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      #9#9#9'  END AS ValorDesconto,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN VeiculosT' +
        'arifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      #9#9#9#9'  ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      #9#9#9#9'  ELSE'
      
        #9#9#9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN ((Veicu' +
        'losTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidades.Percentu' +
        'alDescontoTarifaReservaWeb,1)) /100)/7'
      
        #9#9#9#9#9#9'  ELSE((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empre' +
        'saUnidades.PercentualDescontoTarifaReservaWeb,1)) /100) END'
      #9#9#9'  END AS ValorComDescontoDiario'
      #9#9'FROM VeiculosTarifas'
      
        #9#9'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = ' +
        'EmpresaUnidades.CodigoEmpresa AND'
      
        #9#9#9#9#9#9#9#9'VeiculosTarifas.CodigoUnidade = EmpresaUnidades.CodigoUn' +
        'idade'
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      
        #9#9'  AND (VeiculosTarifas.CodigoGrupo = VeiculosGrupos.CodigoGrup' +
        'o)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  = @Periodo)'
      
        #9#9'  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39')' +
        ')'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')'
      
        #9#9'  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.D' +
        'ataInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao' +
        ')'
      
        #9#9'  AND (CONVERT(DATETIME, @DataInicio, 103) BETWEEN  VeiculosTa' +
        'rifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao)'
      
        '                  AND (VeiculosTarifas.PromoInicio >= @PromoInic' +
        'io)'
      
        '                  AND (VeiculosTarifas.PromoTermino <= @PromoTer' +
        'mino)'
      ''
      #9#9'UNION'
      
        #9#9'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarif' +
        'as.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      
        #9#9#9#9'  ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empres' +
        'aUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      #9#9#9'  END AS ValorDesconto,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN VeiculosT' +
        'arifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      #9#9#9#9'  ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      #9#9#9#9'  ELSE'
      
        #9#9#9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN ((Veicu' +
        'losTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidades.Percentu' +
        'alDescontoTarifaReservaWeb,1)) /100)/7'
      
        #9#9#9#9#9#9'  ELSE((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empre' +
        'saUnidades.PercentualDescontoTarifaReservaWeb,1)) /100) END'
      #9#9#9'  END AS ValorComDescontoDiario'
      #9#9'FROM VeiculosTarifas'
      
        #9#9'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = ' +
        'EmpresaUnidades.CodigoEmpresa AND'
      
        #9#9#9#9#9#9#9#9'VeiculosTarifas.CodigoUnidade = EmpresaUnidades.CodigoUn' +
        'idade'
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      
        #9#9'  AND (VeiculosTarifas.CodigoGrupo = VeiculosGrupos.CodigoGrup' +
        'o)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  = @Periodo)'
      
        #9#9'  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39')' +
        ')'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')'
      #9#9'  AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      
        #9#9'  AND (CONVERT(DATETIME, @DataInicio, 103) BETWEEN  VeiculosTa' +
        'rifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao)'
      
        '                  AND (VeiculosTarifas.PromoInicio >= @PromoInic' +
        'io)'
      
        '                  AND (VeiculosTarifas.PromoTermino <= @PromoTer' +
        'mino)'
      ''
      #9#9'UNION'
      
        #9#9'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarif' +
        'as.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      
        #9#9#9#9'  ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empres' +
        'aUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      #9#9#9'  END AS ValorDesconto,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN VeiculosT' +
        'arifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      #9#9#9#9'  ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      #9#9#9#9'  ELSE'
      
        #9#9#9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN ((Veicu' +
        'losTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidades.Percentu' +
        'alDescontoTarifaReservaWeb,1)) /100)/7'
      
        #9#9#9#9#9#9'  ELSE((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empre' +
        'saUnidades.PercentualDescontoTarifaReservaWeb,1)) /100) END'
      #9#9#9'  END AS ValorComDescontoDiario'
      #9#9'FROM VeiculosTarifas'
      
        #9#9'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = ' +
        'EmpresaUnidades.CodigoEmpresa AND'
      
        #9#9#9#9#9#9#9#9'VeiculosTarifas.CodigoUnidade = EmpresaUnidades.CodigoUn' +
        'idade'
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      
        #9#9'  AND (VeiculosTarifas.CodigoGrupo = VeiculosGrupos.CodigoGrup' +
        'o)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  = @Periodo)'
      
        #9#9'  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39')' +
        ')'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')'
      
        #9#9'  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.D' +
        'ataInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao' +
        ')'
      
        '                  AND (VeiculosTarifas.PromoInicio >= @PromoInic' +
        'io)'
      
        '                  AND (VeiculosTarifas.PromoTermino <= @PromoTer' +
        'mino)'
      ''
      #9#9'UNION'
      
        #9#9'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarif' +
        'as.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      
        #9#9#9#9'  ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empres' +
        'aUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      #9#9#9'  END AS ValorDesconto,'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN VeiculosT' +
        'arifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      #9#9#9#9'  ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        #9#9#9'  CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(Em' +
        'presaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN 0'
      #9#9#9#9'  ELSE'
      
        #9#9#9#9#9'  CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN ((Veicu' +
        'losTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidades.Percentu' +
        'alDescontoTarifaReservaWeb,1)) /100)/7'
      
        #9#9#9#9#9#9'  ELSE((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(Empre' +
        'saUnidades.PercentualDescontoTarifaReservaWeb,1)) /100) END'
      #9#9#9'  END AS ValorComDescontoDiario'
      #9#9'FROM VeiculosTarifas'
      
        #9#9'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = ' +
        'EmpresaUnidades.CodigoEmpresa AND'
      
        #9#9#9#9#9#9#9#9'VeiculosTarifas.CodigoUnidade = EmpresaUnidades.CodigoUn' +
        'idade'
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      #9#9#9' AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      
        #9#9#9' AND (VeiculosTarifas.CodigoGrupo = VeiculosGrupos.CodigoGrup' +
        'o)'
      #9#9#9' AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9#9' AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9#9' AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9#9' AND (VeiculosTarifas.PeriodoTarifa = 1)'
      #9#9#9' AND (VeiculosTarifas.DescricaoTarifa = '#39'Di'#225'ria B'#225'sica'#39')'
      
        #9#9#9' AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39')' +
        ')'
      
        '                         AND (VeiculosTarifas.PromoInicio >= @Pr' +
        'omoInicio)'
      #9#9#9' AND (VeiculosTarifas.PromoTermino <= @PromoTermino)'
      '      ) AS Registros )As ValorMinimo'
      'FROM VeiculosGrupos'
      
        'INNER JOIN VeiculosTarifas ON VeiculosGrupos.CodigoGrupo = Veicu' +
        'losTarifas.CodigoGrupo'
      'WHERE (VeiculosGrupos.CodigoEmpresa = @CodigoEmpresa)'
      '  AND ((:TodasLetras <> 0) OR (VeiculosGrupos.Letra = :Letra))'
      
        '  AND ((:TodosGrupos <> 0) OR (VeiculosGrupos.CodigoGrupo = :Cod' +
        'igoGrupo))'
      '  AND (VeiculosGrupos.SituacaoGrupo = '#39'A'#39')'
      '  AND (VeiculosTarifas.Ativa = '#39'S'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      
        '  AND (:TodosGruposDisponiveis <> 0 OR (SELECT COUNT(*) FROM Vei' +
        'culos INNER JOIN VeiculosModelos ON (Veiculos.CodigoModelo= Veic' +
        'ulosModelos.CodigoModelo) '
      
        #9#9#9#9#9'WHERE VeiculosModelos.CodigoGrupoVeiculo = VeiculosTarifas.' +
        'CodigoGrupo AND Veiculos.CodigoEmpresa = VeiculosGrupos.CodigoEm' +
        'presa'
      
        #9#9#9#9#9#9'  AND Veiculos.CodigoUnidade = VeiculosGrupos.CodigoUnidad' +
        'e AND Veiculos.Status = '#39'D'#39
      #9#9#9#9#9#9'  AND (SELECT Max(Reservas.CodigoReserva) FROM Reservas'
      
        #9#9#9#9#9#9#9'   INNER JOIN Empresa ON Reservas.CodigoEmpresa = Empresa' +
        '.CodigoEmpresa'
      
        #9#9#9#9#9#9#9'   LEFT OUTER JOIN Contratos ON Reservas.CodigoReserva = ' +
        'Contratos.CodigoReserva'
      
        #9#9#9#9#9#9#9'   WHERE (Contratos.CodigoReserva IS NULL) AND (Reservas.' +
        'CodigoMVA = Veiculos.CodigoMVA)'
      
        #9#9#9#9#9#9#9#9' AND (((Reservas.DataHoraInicio <= @DataHoraInicio) AND ' +
        '(Reservas.DataHoraTermino >= @DataHoraInicio))'
      
        #9#9#9#9#9#9#9#9'   OR ((Reservas.DataHoraInicio <= @DataHoraTermino) AND' +
        ' (Reservas.DataHoraInicio >= @DataHoraInicio)))'
      
        #9#9#9#9#9#9#9#9' AND (Reservas.Cancelada = '#39'N'#39' and Reservas.CodigoUnidad' +
        'e = @CodigoUnidade)) IS NULL'
      #9#9#9#9' ) > 0)'
      
        'ORDER BY VeiculosGrupos.Letra + '#39' - '#39' +  VeiculosGrupos.Descrica' +
        'o')
    UserID = 0
    ControlConnection = adcControle
    Left = 180
    Top = 65
    object qryGrupoVeiculosLetraDescricao: TWideStringField
      FieldName = 'LetraDescricao'
      ReadOnly = True
      Size = 104
    end
    object qryGrupoVeiculosDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qryGrupoVeiculosCodigoGrupo: TIntegerField
      FieldName = 'CodigoGrupo'
    end
    object qryGrupoVeiculosURLImagem: TStringField
      FieldName = 'URLImagem'
      Size = 4000
    end
    object qryGrupoVeiculosSubDescricao: TStringField
      FieldName = 'SubDescricao'
      Size = 80
    end
    object qryGrupoVeiculosLetra: TStringField
      FieldName = 'Letra'
      Size = 2
    end
    object qryGrupoVeiculosValorMinimo: TFloatField
      FieldName = 'ValorMinimo'
      ReadOnly = True
    end
  end
  object qryListaServicoAdicionais: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT CodigoServicoAdicional, Descricao, Valor, CalculoPorDiari' +
        'as, Permanente'
      'FROM ServicoAdicional'
      'WHERE (Ativa = '#39'S'#39')'
      '  AND (ReservaWeb = '#39'S'#39')'
      '  AND (CodigoEmpresa = :CodigoEmpresa)')
    UserID = 0
    ControlConnection = adcControle
    Left = 448
    Top = 64
    object qryListaServicoAdicionaisCodigoServicoAdicional: TIntegerField
      FieldName = 'CodigoServicoAdicional'
    end
    object qryListaServicoAdicionaisDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object qryListaServicoAdicionaisValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
    end
    object qryListaServicoAdicionaisCalculoPorDiarias: TStringField
      FieldName = 'CalculoPorDiarias'
      Size = 1
    end
    object qryListaServicoAdicionaisPermanente: TStringField
      FieldName = 'Permanente'
      Size = 1
    end
  end
  object qryGrupoVeiculosCaracteristicas: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoGrupo'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  VeiculosCaracteristicas.Descricao, VeiculosGruposCaracte' +
        'risticas.CodigoCaracteristica'
      'FROM VeiculosGruposCaracteristicas'
      
        'INNER JOIN VeiculosCaracteristicas ON VeiculosGruposCaracteristi' +
        'cas.CodigoCaracteristica = VeiculosCaracteristicas.CodigoCaracte' +
        'ristica'
      'WHERE (VeiculosGruposCaracteristicas.CodigoGrupo = :CodigoGrupo)'
      'ORDER BY VeiculosCaracteristicas.Descricao')
    UserID = 0
    ControlConnection = adcControle
    Left = 305
    Top = 64
    object qryGrupoVeiculosCaracteristicasDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
  end
  object qryClienteCadastrado: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CPF'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 11
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Clientes.CodigoCliente, Clientes.RazaoSocial, Clientes.Si' +
        'tuacao,'
      
        '       Clientes.CodigoEmpresa, Clientes.CodigoUnidade, Clientes.' +
        'Tipo, Clientes.CNPJ,'
      
        '       Clientes.InscricaoEstadual, Clientes.CPF, Clientes.Identi' +
        'dade, Clientes.NomeFantasia,'
      
        '       Clientes.Email, Clientes.Telefone, Clientes.Fax, Clientes' +
        '.Passaporte, Clientes.Celular,'
      
        '       Clientes.CodigoFormaPagamento, Clientes.Classificacao, Cl' +
        'ientes.PercDesconto,'
      
        #9'  Clientes.Sexo, Clientes.Logradouro, Clientes.Bairro, Clientes' +
        '.Numero,'
      
        #9'  Clientes.Complemento, Clientes.Cep, Clientes.Estado, Clientes' +
        '.Cidade, Clientes.CodigoMunicipio'
      'FROM Clientes'
      'WHERE (Clientes.Situacao NOT IN ('#39'I'#39','#39'R'#39'))'
      '  AND (Clientes.CPF = :CPF)'
      'ORDER BY Clientes.RazaoSocial ')
    TableName = 'Clientes'
    UserID = 0
    ControlConnection = adcControle
    Left = 42
    Top = 120
    object qryClienteCadastradoCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object qryClienteCadastradoRazaoSocial: TWideStringField
      FieldName = 'RazaoSocial'
      Size = 80
    end
    object qryClienteCadastradoSituacao: TWideStringField
      FieldName = 'Situacao'
      Size = 1
    end
    object qryClienteCadastradoCodigoEmpresa: TSmallintField
      FieldName = 'CodigoEmpresa'
    end
    object qryClienteCadastradoCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryClienteCadastradoTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryClienteCadastradoCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object qryClienteCadastradoInscricaoEstadual: TWideStringField
      FieldName = 'InscricaoEstadual'
    end
    object qryClienteCadastradoCPF: TWideStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryClienteCadastradoIdentidade: TWideStringField
      FieldName = 'Identidade'
      Size = 13
    end
    object qryClienteCadastradoNomeFantasia: TWideStringField
      FieldName = 'NomeFantasia'
      Size = 50
    end
    object qryClienteCadastradoEmail: TWideStringField
      FieldName = 'Email'
      Size = 50
    end
    object qryClienteCadastradoTelefone: TStringField
      FieldName = 'Telefone'
      Size = 11
    end
    object qryClienteCadastradoFax: TStringField
      FieldName = 'Fax'
      Size = 11
    end
    object qryClienteCadastradoPassaporte: TStringField
      FieldName = 'Passaporte'
    end
    object qryClienteCadastradoCelular: TStringField
      FieldName = 'Celular'
      Size = 11
    end
    object qryClienteCadastradoCodigoFormaPagamento: TIntegerField
      FieldName = 'CodigoFormaPagamento'
    end
    object qryClienteCadastradoClassificacao: TWideStringField
      FieldName = 'Classificacao'
      Size = 1
    end
    object qryClienteCadastradoPercDesconto: TFloatField
      FieldName = 'PercDesconto'
    end
    object qryClienteCadastradoSexo: TWideStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object qryClienteCadastradoLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 50
    end
    object qryClienteCadastradoBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object qryClienteCadastradoNumero: TIntegerField
      FieldName = 'Numero'
    end
    object qryClienteCadastradoComplemento: TWideStringField
      FieldName = 'Complemento'
      Size = 30
    end
    object qryClienteCadastradoCep: TWideStringField
      FieldName = 'Cep'
      Size = 8
    end
    object qryClienteCadastradoCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 35
    end
    object qryClienteCadastradoEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryClienteCadastradoCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
  end
  object qryProximoCodigoCliente: TQueryPlus
    Connection = adcControle
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select NomeTabela, ProximoCodigo'
      'FROM ProximoCodigo'
      'WHERE (NomeTabela = '#39'Clientes'#39')')
    UserID = 0
    ControlConnection = adcControle
    Left = 244
    Top = 118
    object qryProximoCodigoClienteProximoCodigo: TIntegerField
      FieldName = 'ProximoCodigo'
    end
    object qryProximoCodigoClienteNomeTabela: TWideStringField
      FieldName = 'NomeTabela'
      Size = 35
    end
  end
  object qryCliente: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoCliente'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Clientes'
      'WHERE (CodigoCliente = :CodigoCliente)')
    UserID = 0
    ControlConnection = adcControle
    Left = 337
    Top = 118
    object qryClienteCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object qryClienteRazaoSocial: TWideStringField
      FieldName = 'RazaoSocial'
      Size = 80
    end
    object qryClienteCodigoEmpresa: TSmallintField
      FieldName = 'CodigoEmpresa'
    end
    object qryClienteCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryClienteNomeFantasia: TWideStringField
      FieldName = 'NomeFantasia'
      Size = 50
    end
    object qryClienteTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryClienteCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object qryClienteInscricaoEstadual: TWideStringField
      FieldName = 'InscricaoEstadual'
    end
    object qryClienteCPF: TWideStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryClienteIdentidade: TWideStringField
      FieldName = 'Identidade'
      Size = 13
    end
    object qryClienteComplemento: TWideStringField
      FieldName = 'Complemento'
      Size = 30
    end
    object qryClienteNumero: TIntegerField
      FieldName = 'Numero'
    end
    object qryClienteLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 50
    end
    object qryClienteCep: TWideStringField
      FieldName = 'Cep'
      Size = 8
    end
    object qryClienteBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object qryClienteCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 35
    end
    object qryClienteCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
    object qryClienteEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryClienteCodigoPais: TIntegerField
      FieldName = 'CodigoPais'
    end
    object qryClienteTelefone: TStringField
      FieldName = 'Telefone'
      Size = 11
    end
    object qryClienteFax: TStringField
      FieldName = 'Fax'
      Size = 11
    end
    object qryClienteEmail: TWideStringField
      FieldName = 'Email'
      Size = 50
    end
    object qryClienteCodigoClienteAreaAtuacao: TIntegerField
      FieldName = 'CodigoClienteAreaAtuacao'
    end
    object qryClienteHomePage: TWideStringField
      FieldName = 'HomePage'
      Size = 50
    end
    object qryClienteLogradouroCobranca: TWideStringField
      FieldName = 'LogradouroCobranca'
      Size = 40
    end
    object qryClienteComplementoCobranca: TWideStringField
      FieldName = 'ComplementoCobranca'
      Size = 30
    end
    object qryClienteNumeroCobranca: TIntegerField
      FieldName = 'NumeroCobranca'
    end
    object qryClienteCepCobranca: TWideStringField
      FieldName = 'CepCobranca'
      Size = 8
    end
    object qryClienteBairroCobranca: TWideStringField
      FieldName = 'BairroCobranca'
      Size = 30
    end
    object qryClienteCidadeCobranca: TWideStringField
      FieldName = 'CidadeCobranca'
      Size = 35
    end
    object qryClienteCodigoMunicipioCobranca: TIntegerField
      FieldName = 'CodigoMunicipioCobranca'
    end
    object qryClienteEstadoCobranca: TWideStringField
      FieldName = 'EstadoCobranca'
      Size = 2
    end
    object qryClienteCodigoPaisCobranca: TIntegerField
      FieldName = 'CodigoPaisCobranca'
    end
    object qryClienteTelefoneCobranca: TStringField
      FieldName = 'TelefoneCobranca'
      Size = 11
    end
    object qryClienteFaxCobranca: TStringField
      FieldName = 'FaxCobranca'
      Size = 11
    end
    object qryClienteNomeEmpresaCobranca: TWideStringField
      FieldName = 'NomeEmpresaCobranca'
      Size = 80
    end
    object qryClienteProfissaoFuncao: TWideStringField
      FieldName = 'ProfissaoFuncao'
    end
    object qryClienteDataNascimento: TDateTimeField
      FieldName = 'DataNascimento'
    end
    object qryClienteClassificacao: TWideStringField
      FieldName = 'Classificacao'
      Size = 1
    end
    object qryClienteCodigoUsuarioPromotor: TIntegerField
      FieldName = 'CodigoUsuarioPromotor'
    end
    object qryClienteCodigoFormaPagamento: TIntegerField
      FieldName = 'CodigoFormaPagamento'
    end
    object qryClienteAprovadoPor: TIntegerField
      FieldName = 'AprovadoPor'
    end
    object qryClientePercPromotora: TFloatField
      FieldName = 'PercPromotora'
    end
    object qryClientePercDesconto: TFloatField
      FieldName = 'PercDesconto'
    end
    object qryClienteKmLivre: TWideStringField
      FieldName = 'KmLivre'
      Size = 1
    end
    object qryClienteFranquiaKm: TIntegerField
      FieldName = 'FranquiaKm'
    end
    object qryClienteObservacoes: TWideMemoField
      FieldName = 'Observacoes'
      BlobType = ftWideMemo
    end
    object qryClienteOrgaoEmissorIdentidade: TWideStringField
      FieldName = 'OrgaoEmissorIdentidade'
      Size = 8
    end
    object qryClientePassaporte: TStringField
      FieldName = 'Passaporte'
    end
    object qryClienteNomeRefPessoal: TWideStringField
      FieldName = 'NomeRefPessoal'
      Size = 30
    end
    object qryClienteTelefoneRefPessoal: TStringField
      FieldName = 'TelefoneRefPessoal'
      Size = 11
    end
    object qryClienteNomeRefComercial: TWideStringField
      FieldName = 'NomeRefComercial'
      Size = 30
    end
    object qryClienteTelefoneRefComercial: TStringField
      FieldName = 'TelefoneRefComercial'
      Size = 11
    end
    object qryClienteChecPesFaladoCom: TWideStringField
      FieldName = 'ChecPesFaladoCom'
    end
    object qryClienteChecPesGrauFaladoCom: TWideStringField
      FieldName = 'ChecPesGrauFaladoCom'
      Size = 15
    end
    object qryClienteChecComFaladoCom: TWideStringField
      FieldName = 'ChecComFaladoCom'
    end
    object qryClienteChecComCargoFaladoCom: TWideStringField
      FieldName = 'ChecComCargoFaladoCom'
      Size = 15
    end
    object qryClienteChecInformouQue: TWideMemoField
      FieldName = 'ChecInformouQue'
      BlobType = ftWideMemo
    end
    object qryClienteChecResponsavelPor: TIntegerField
      FieldName = 'ChecResponsavelPor'
    end
    object qryClienteSituacao: TWideStringField
      FieldName = 'Situacao'
      Size = 1
    end
    object qryClienteCodigoFornecedorLink: TIntegerField
      FieldName = 'CodigoFornecedorLink'
    end
    object qryClienteNotas: TWideMemoField
      FieldName = 'Notas'
      BlobType = ftWideMemo
    end
    object qryClienteRetencaoPIS: TWideStringField
      FieldName = 'RetencaoPIS'
      Size = 1
    end
    object qryClientePercentualPIS: TFloatField
      FieldName = 'PercentualPIS'
    end
    object qryClienteRetencaoCofins: TWideStringField
      FieldName = 'RetencaoCofins'
      Size = 1
    end
    object qryClientePercentualCofins: TFloatField
      FieldName = 'PercentualCofins'
    end
    object qryClienteRetencaoContribuicaoSocial: TWideStringField
      FieldName = 'RetencaoContribuicaoSocial'
      Size = 1
    end
    object qryClientePercentualContribuicaoSocial: TFloatField
      FieldName = 'PercentualContribuicaoSocial'
    end
    object qryClienteRetencaoIR: TWideStringField
      FieldName = 'RetencaoIR'
      Size = 1
    end
    object qryClientePercentualIR: TFloatField
      FieldName = 'PercentualIR'
    end
    object qryClienteRetencaoINSS: TWideStringField
      FieldName = 'RetencaoINSS'
      Size = 1
    end
    object qryClientePercentualINSS: TFloatField
      FieldName = 'PercentualINSS'
    end
    object qryClienteRetencaoISS: TWideStringField
      FieldName = 'RetencaoISS'
      Size = 1
    end
    object qryClienteTipoRetencaoISS: TWideStringField
      FieldName = 'TipoRetencaoISS'
      Size = 1
    end
    object qryClientePercentualISS: TFloatField
      FieldName = 'PercentualISS'
    end
    object qryClienteTipoFaturaDocumento: TWideStringField
      FieldName = 'TipoFaturaDocumento'
      Size = 1
    end
    object qryClienteTipoFaturaLocacao: TWideStringField
      FieldName = 'TipoFaturaLocacao'
      Size = 1
    end
    object qryClienteTipoFaturaDespesas: TWideStringField
      FieldName = 'TipoFaturaDespesas'
      Size = 1
    end
    object qryClienteTipoRetencaoImpostos: TWideStringField
      FieldName = 'TipoRetencaoImpostos'
      Size = 1
    end
    object qryClienteCodigoAntigo: TWideStringField
      FieldName = 'CodigoAntigo'
      Size = 8
    end
    object qryClienteInseridoPor: TIntegerField
      FieldName = 'InseridoPor'
    end
    object qryClienteInseridoEm: TDateTimeField
      FieldName = 'InseridoEm'
    end
    object qryClienteModificadoPor: TIntegerField
      FieldName = 'ModificadoPor'
    end
    object qryClienteModificadoEm: TDateTimeField
      FieldName = 'ModificadoEm'
    end
    object qryClienteCodigoTipoMarketing: TIntegerField
      FieldName = 'CodigoTipoMarketing'
    end
    object qryClienteCodigoSubTipoMarketing: TIntegerField
      FieldName = 'CodigoSubTipoMarketing'
    end
    object qryClienteComplementoMarketing: TWideStringField
      FieldName = 'ComplementoMarketing'
      Size = 30
    end
    object qryClienteCodigoUsuarioResponsavel: TIntegerField
      FieldName = 'CodigoUsuarioResponsavel'
    end
    object qryClienteCodigoMotivoBloqueio: TIntegerField
      FieldName = 'CodigoMotivoBloqueio'
    end
    object qryClienteBloqueadoPor: TIntegerField
      FieldName = 'BloqueadoPor'
    end
    object qryClienteNumeroCartaoFidelidade: TIntegerField
      FieldName = 'NumeroCartaoFidelidade'
    end
    object qryClienteSaldoCartaoFidelidade: TIntegerField
      FieldName = 'SaldoCartaoFidelidade'
    end
    object qryClienteDataFidelizacao: TDateTimeField
      FieldName = 'DataFidelizacao'
    end
    object qryClienteCelular: TStringField
      FieldName = 'Celular'
      Size = 11
    end
    object qryClienteProtestarAutomaticamente: TWideStringField
      FieldName = 'ProtestarAutomaticamente'
      Size = 1
    end
    object qryClienteDataHoraExportacao: TDateTimeField
      FieldName = 'DataHoraExportacao'
    end
    object qryClienteCodigoPlanoContas: TIntegerField
      FieldName = 'CodigoPlanoContas'
    end
    object qryClienteSexo: TWideStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object qryClienteCodigoInterno: TIntegerField
      FieldName = 'CodigoInterno'
    end
    object qryClienteCodigoCentroCusto: TIntegerField
      FieldName = 'CodigoCentroCusto'
    end
    object qryClienteCodigoCondutorLink: TIntegerField
      FieldName = 'CodigoCondutorLink'
    end
    object qryClienteLongitude: TStringField
      FieldName = 'Longitude'
      Size = 30
    end
    object qryClienteLatitude: TStringField
      FieldName = 'Latitude'
      Size = 30
    end
    object qryClienteTaxaAdministrativaMultas: TFloatField
      FieldName = 'TaxaAdministrativaMultas'
    end
    object qryClienteSuframa: TStringField
      FieldName = 'Suframa'
      FixedChar = True
      Size = 9
    end
    object qryClienteEstrangeiro: TStringField
      FieldName = 'Estrangeiro'
      Size = 1
    end
    object qryClienteCodigoBanco: TIntegerField
      FieldName = 'CodigoBanco'
    end
    object qryClienteAgencia: TIntegerField
      FieldName = 'Agencia'
    end
    object qryClienteConta: TIntegerField
      FieldName = 'Conta'
    end
    object qryClienteTipoConta: TStringField
      FieldName = 'TipoConta'
      Size = 1
    end
    object qryClienteDescreverImpostosFatura: TStringField
      FieldName = 'DescreverImpostosFatura'
      Size = 1
    end
    object qryClienteTipoFaturaCombustivel: TStringField
      FieldName = 'TipoFaturaCombustivel'
      Size = 10
    end
    object qryClienteTipoCliente: TStringField
      FieldName = 'TipoCliente'
      Size = 1
    end
    object qryClienteCodigoConsultaMVR: TIntegerField
      FieldName = 'CodigoConsultaMVR'
    end
    object qryClienteEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
    end
    object qryClienteNomeEmpresaTrabalho: TStringField
      FieldName = 'NomeEmpresaTrabalho'
      Size = 80
    end
    object qryClienteCepTrabalho: TStringField
      FieldName = 'CepTrabalho'
      Size = 8
    end
    object qryClienteLogradouroTrabalho: TStringField
      FieldName = 'LogradouroTrabalho'
      Size = 120
    end
    object qryClienteNumeroTrabalho: TIntegerField
      FieldName = 'NumeroTrabalho'
    end
    object qryClienteComplementoTrabalho: TStringField
      FieldName = 'ComplementoTrabalho'
      Size = 30
    end
    object qryClienteBairroTrabalho: TStringField
      FieldName = 'BairroTrabalho'
      Size = 30
    end
    object qryClienteCidadeTrabalho: TStringField
      FieldName = 'CidadeTrabalho'
      Size = 35
    end
    object qryClienteEstadoTrabalho: TStringField
      FieldName = 'EstadoTrabalho'
      Size = 2
    end
    object qryClienteCodigoPaisTrabalho: TIntegerField
      FieldName = 'CodigoPaisTrabalho'
    end
    object qryClienteTelefoneTrabalho: TStringField
      FieldName = 'TelefoneTrabalho'
      Size = 11
    end
    object qryClienteFaxTrabalho: TStringField
      FieldName = 'FaxTrabalho'
      Size = 11
    end
    object qryClienteCodigoCargoTrabalho: TIntegerField
      FieldName = 'CodigoCargoTrabalho'
    end
    object qryClienteTempoTrabalho: TIntegerField
      FieldName = 'TempoTrabalho'
    end
    object qryClienteSalarioTrabalho: TFloatField
      FieldName = 'SalarioTrabalho'
    end
    object qryClienteZipCode: TIntegerField
      FieldName = 'ZipCode'
    end
    object qryClienteInstituicaoGovernamental: TWideStringField
      FieldName = 'InstituicaoGovernamental'
      Size = 1
    end
    object qryClienteCodigoLoteBenner: TIntegerField
      FieldName = 'CodigoLoteBenner'
    end
  end
  object qryParametrosUnidade: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoUnidade'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoEmpresa'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT HoraInicioFuncionamentoSegSex, ValorTaxaRetorno, TaxaServ' +
        'icoReservaWeb, CodigoProtecaoPadraoReservaWeb,'
      
        '       HoraTerminoFuncionamentoSegSex, HoraInicioFuncionamentoSa' +
        'bado, HoraTerminoFuncionamentoSabado, Telefone2,'
      
        '       HoraInicioFuncionamentoDomingo, HoraTerminoFuncionamentoD' +
        'omingo, HorasAntecedenciaCancelamentoReservaWeb, EmpresaUnidades' +
        '.CodigoMunicipio,'
      
        '       MostrarTarifasKmLivre, ProtecaoYes, ProtecaoPlus, Percent' +
        'ualDescontoTarifaReservaWeb, HorasAntecedenciaAberturaReservaWeb' +
        ','
      
        '       EntregaForaHorarioFuncionamento, TaxaValorReserva, Percen' +
        'tualValorReserva, EmpresaUnidades.DescricaoUnidade, EmpresaUnida' +
        'des.LimiteDiasAprovacaoWeb,'
      '       EmpresaUnidades.HorasAjusteFusoHorario'
      'FROM EmpresaUnidades'
      'WHERE (CodigoUnidade = :CodigoUnidade)'
      '  AND (CodigoEmpresa = :CodigoEmpresa)'
      '  AND (EmpresaUnidades.Ativa = '#39'S'#39')')
    UserID = 0
    ControlConnection = adcControle
    Left = 160
    Top = 180
    object qryParametrosUnidadeHoraInicioFuncionamentoSegSex: TStringField
      FieldName = 'HoraInicioFuncionamentoSegSex'
      Size = 4
    end
    object qryParametrosUnidadeValorTaxaRetorno: TBCDField
      FieldName = 'ValorTaxaRetorno'
      Precision = 19
    end
    object qryParametrosUnidadeTaxaServicoReservaWeb: TFloatField
      FieldName = 'TaxaServicoReservaWeb'
    end
    object qryParametrosUnidadeCodigoProtecaoPadraoReservaWeb: TIntegerField
      FieldName = 'CodigoProtecaoPadraoReservaWeb'
    end
    object qryParametrosUnidadeHoraTerminoFuncionamentoSegSex: TStringField
      FieldName = 'HoraTerminoFuncionamentoSegSex'
      Size = 4
    end
    object qryParametrosUnidadeHoraInicioFuncionamentoSabado: TStringField
      FieldName = 'HoraInicioFuncionamentoSabado'
      Size = 4
    end
    object qryParametrosUnidadeHoraTerminoFuncionamentoSabado: TStringField
      FieldName = 'HoraTerminoFuncionamentoSabado'
      Size = 4
    end
    object qryParametrosUnidadeTelefone2: TStringField
      FieldName = 'Telefone2'
      Size = 11
    end
    object qryParametrosUnidadeHoraInicioFuncionamentoDomingo: TStringField
      FieldName = 'HoraInicioFuncionamentoDomingo'
      Size = 4
    end
    object qryParametrosUnidadeHoraTerminoFuncionamentoDomingo: TStringField
      FieldName = 'HoraTerminoFuncionamentoDomingo'
      Size = 4
    end
    object qryParametrosUnidadeHorasAntecedenciaCancelamentoReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaCancelamentoReservaWeb'
    end
    object qryParametrosUnidadeMostrarTarifasKmLivre: TStringField
      FieldName = 'MostrarTarifasKmLivre'
      Size = 1
    end
    object qryParametrosUnidadeProtecaoYes: TStringField
      FieldName = 'ProtecaoYes'
      Size = 1
    end
    object qryParametrosUnidadeProtecaoPlus: TStringField
      FieldName = 'ProtecaoPlus'
      Size = 1
    end
    object qryParametrosUnidadePercentualDescontoTarifaReservaWeb: TFloatField
      FieldName = 'PercentualDescontoTarifaReservaWeb'
    end
    object qryParametrosUnidadeHorasAntecedenciaAberturaReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaAberturaReservaWeb'
    end
    object qryParametrosUnidadeEntregaForaHorarioFuncionamento: TStringField
      FieldName = 'EntregaForaHorarioFuncionamento'
      Size = 1
    end
    object qryParametrosUnidadeTaxaValorReserva: TBCDField
      FieldName = 'TaxaValorReserva'
      Precision = 19
    end
    object qryParametrosUnidadePercentualValorReserva: TFloatField
      FieldName = 'PercentualValorReserva'
    end
    object qryParametrosUnidadeDescricaoUnidade: TWideStringField
      FieldName = 'DescricaoUnidade'
      Size = 50
    end
    object qryParametrosUnidadeLimiteDiasAprovacaoWeb: TIntegerField
      FieldName = 'LimiteDiasAprovacaoWeb'
    end
    object qryParametrosUnidadeCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
    object qryParametrosUnidadeHorasAjusteFusoHorario: TIntegerField
      FieldName = 'HorasAjusteFusoHorario'
    end
  end
  object qryParametrosEmpresa: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT CodigoEmpresa, DefinirValorProtecaoPor, MaximoHorasExtras' +
        ', CodigoProtecaoDefaultReservaWeb, MaximoHorasCortesia, AceitaRe' +
        'servaConflitante'
      'FROM Empresa'
      'WHERE (Empresa.CodigoEmpresa = :CodigoEmpresa)')
    UserID = 0
    ControlConnection = adcControle
    Left = 46
    Top = 181
    object qryParametrosEmpresaCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryParametrosEmpresaDefinirValorProtecaoPor: TStringField
      FieldName = 'DefinirValorProtecaoPor'
      Size = 1
    end
    object qryParametrosEmpresaMaximoHorasExtras: TIntegerField
      FieldName = 'MaximoHorasExtras'
    end
    object qryParametrosEmpresaCodigoProtecaoDefaultReservaWeb: TIntegerField
      FieldName = 'CodigoProtecaoDefaultReservaWeb'
    end
    object qryParametrosEmpresaMaximoHorasCortesia: TIntegerField
      FieldName = 'MaximoHorasCortesia'
    end
    object qryParametrosEmpresaAceitaReservaConflitante: TWideStringField
      FieldName = 'AceitaReservaConflitante'
      Size = 1
    end
  end
  object qryFeriados: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoUnidade'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DataInicio'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DataTermino'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM Feriados'
      'WHERE CodigoEmpresa = :CodigoEmpresa'
      '  AND CodigoUnidade  = :CodigoUnidade'
      '  AND ((Data = :DataInicio) OR (Data = :DataTermino))')
    UserID = 0
    ControlConnection = adcControle
    Left = 249
    Top = 178
    object qryFeriadosCodigoFeriado: TIntegerField
      FieldName = 'CodigoFeriado'
    end
    object qryFeriadosData: TDateTimeField
      FieldName = 'Data'
    end
    object qryFeriadosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qryFeriadosCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryFeriadosCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
  end
  object qryGravaReservaServicoAdicional: TQueryPlus
    Connection = adcBancoDados
    Parameters = <
      item
        Name = 'CodigoReserva'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoServicoAdicional'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Valor'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO ReservasServicosAdicionais (CodigoReserva'
      #9#9#9#9#9#9#9'    ,CodigoServicoAdicional'
      #9#9#9#9#9#9#9'    ,Valor)'
      #9#9#9#9#9#9'VALUES'
      #9#9#9#9#9#9#9'    (:CodigoReserva'
      #9#9#9#9#9#9#9'    ,:CodigoServicoAdicional'
      #9#9#9#9#9#9#9'    ,CONVERT(FLOAT,:Valor))')
    UserID = 0
    ControlConnection = adcControle
    Left = 365
    Top = 177
  end
  object qryParametrosEmail: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoUnidade'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT EmpresaUnidades.SMTPServidor, EmpresaUnidades.SMTPPorta, ' +
        'EmpresaUnidades.DescricaoUnidade,'
      '       EmpresaUnidades.SMTPTimeout, EmpresaUnidades.SMTPUsuario,'
      
        '       EmpresaUnidades.SMTPSenha, EmpresaUnidades.RequerAutentic' +
        'acao,'
      
        '       EmpresaUnidades.Email, EmpresaUnidades.TipoConexaoCriptog' +
        'rafada,'
      
        '       EmpresaUnidades.CaminhoLogoWeb,EmpresaUnidades.CaminhoAss' +
        'inatura'
      'FROM EmpresaUnidades'
      'WHERE (EmpresaUnidades.CodigoEmpresa = :CodigoEmpresa)'
      '     AND ( EmpresaUnidades.CodigoUnidade = :CodigoUnidade)')
    UserID = 0
    ControlConnection = adcControle
    Left = 350
    Top = 10
    object qryParametrosEmailSMTPServidor: TWideStringField
      FieldName = 'SMTPServidor'
      Size = 50
    end
    object qryParametrosEmailSMTPPorta: TIntegerField
      FieldName = 'SMTPPorta'
    end
    object qryParametrosEmailDescricaoUnidade: TWideStringField
      FieldName = 'DescricaoUnidade'
      Size = 50
    end
    object qryParametrosEmailSMTPTimeout: TIntegerField
      FieldName = 'SMTPTimeout'
    end
    object qryParametrosEmailSMTPUsuario: TWideStringField
      FieldName = 'SMTPUsuario'
      Size = 50
    end
    object qryParametrosEmailSMTPSenha: TWideStringField
      FieldName = 'SMTPSenha'
      Size = 30
    end
    object qryParametrosEmailRequerAutenticacao: TWideStringField
      FieldName = 'RequerAutenticacao'
      Size = 1
    end
    object qryParametrosEmailEmail: TWideStringField
      FieldName = 'Email'
      Size = 60
    end
    object qryParametrosEmailTipoConexaoCriptografada: TStringField
      FieldName = 'TipoConexaoCriptografada'
      Size = 1
    end
    object qryParametrosEmailCaminhoLogoWeb: TWideStringField
      FieldName = 'CaminhoLogoWeb'
      Size = 200
    end
    object qryParametrosEmailCaminhoAssinatura: TStringField
      FieldName = 'CaminhoAssinatura'
      Size = 300
    end
  end
  object qryInformacoesGrupoVeiculo: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoGrupo'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Descricao, CodigoGrupo, Letra'
      'FROM VeiculosGrupos'
      'WHERE (CodigoGrupo = :CodigoGrupo)')
    UserID = 0
    ControlConnection = adcControle
    Left = 62
    Top = 249
    object qryInformacoesGrupoVeiculoDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qryInformacoesGrupoVeiculoCodigoGrupo: TIntegerField
      FieldName = 'CodigoGrupo'
    end
    object qryInformacoesGrupoVeiculoLetra: TWideStringField
      FieldName = 'Letra'
      Size = 1
    end
  end
  object qryUnidadeRetirada: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoUnidade'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     EmpresaUnidades.CodigoEmpresa,'
      '                 EmpresaUnidades.CodigoUnidade, '
      '                 EmpresaUnidades.DescricaoUnidade, '
      
        '                 EmpresaUnidades.ObservacaoReserva, EmpresaUnida' +
        'des.Email,'
      
        '                 EmpresaUnidades.Logradouro, EmpresaUnidades.Num' +
        'ero,'
      
        '                 EmpresaUnidades.Telefone1, EmpresaUnidades.Comp' +
        'lemento,'
      '                 EmpresaUnidades.Bairro'
      'FROM         EmpresaUnidades '
      'WHERE     (EmpresaUnidades.CodigoEmpresa = :CodigoEmpresa)'
      '  AND (EmpresaUnidades.CodigoUnidade = :CodigoUnidade)'
      'ORDER BY EmpresaUnidades.DescricaoUnidade'
      '')
    UserID = 0
    ControlConnection = adcControle
    Left = 186
    Top = 249
    object qryUnidadeRetiradaCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryUnidadeRetiradaCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryUnidadeRetiradaDescricaoUnidade: TWideStringField
      FieldName = 'DescricaoUnidade'
      Size = 50
    end
    object qryUnidadeRetiradaObservacaoReserva: TWideMemoField
      FieldName = 'ObservacaoReserva'
      BlobType = ftWideMemo
    end
    object qryUnidadeRetiradaEmail: TWideStringField
      FieldName = 'Email'
      Size = 60
    end
    object qryUnidadeRetiradaLogradouro: TWideStringField
      FieldName = 'Logradouro'
      Size = 40
    end
    object qryUnidadeRetiradaNumero: TWideStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qryUnidadeRetiradaTelefone1: TStringField
      FieldName = 'Telefone1'
      Size = 11
    end
    object qryUnidadeRetiradaComplemento: TWideStringField
      FieldName = 'Complemento'
    end
    object qryUnidadeRetiradaBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 30
    end
  end
  object qryConsultaReserva: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoReserva'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Reservas'
      'WHERE (CodigoReserva = :CodigoReserva)')
    UserID = 0
    ControlConnection = adcControle
    Left = 290
    Top = 248
    object qryConsultaReservaCodigoReserva: TIntegerField
      FieldName = 'CodigoReserva'
    end
    object qryConsultaReservaCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryConsultaReservaCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryConsultaReservaCodigoGrupoContratos: TIntegerField
      FieldName = 'CodigoGrupoContratos'
    end
    object qryConsultaReservaClienteCadastrado: TWideStringField
      FieldName = 'ClienteCadastrado'
      Size = 1
    end
    object qryConsultaReservaTipoCliente: TWideStringField
      FieldName = 'TipoCliente'
      Size = 1
    end
    object qryConsultaReservaCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object qryConsultaReservaNomeCliente: TWideStringField
      FieldName = 'NomeCliente'
      Size = 80
    end
    object qryConsultaReservaContatoCliente: TWideStringField
      FieldName = 'ContatoCliente'
      Size = 30
    end
    object qryConsultaReservaTelefoneContato1: TStringField
      FieldName = 'TelefoneContato1'
      Size = 11
    end
    object qryConsultaReservaTelefoneContato2: TStringField
      FieldName = 'TelefoneContato2'
      Size = 11
    end
    object qryConsultaReservaDataInicio: TDateTimeField
      FieldName = 'DataInicio'
    end
    object qryConsultaReservaHoraInicio: TWideStringField
      FieldName = 'HoraInicio'
      Size = 4
    end
    object qryConsultaReservaDataHoraInicio: TDateTimeField
      FieldName = 'DataHoraInicio'
    end
    object qryConsultaReservaDataTermino: TDateTimeField
      FieldName = 'DataTermino'
    end
    object qryConsultaReservaHoraTermino: TWideStringField
      FieldName = 'HoraTermino'
      Size = 4
    end
    object qryConsultaReservaDataHoraTermino: TDateTimeField
      FieldName = 'DataHoraTermino'
    end
    object qryConsultaReservaCodigoModelo: TIntegerField
      FieldName = 'CodigoModelo'
    end
    object qryConsultaReservaCodigoMVA: TIntegerField
      FieldName = 'CodigoMVA'
    end
    object qryConsultaReservaDataReserva: TDateTimeField
      FieldName = 'DataReserva'
    end
    object qryConsultaReservaHoraReserva: TWideStringField
      FieldName = 'HoraReserva'
      Size = 8
    end
    object qryConsultaReservaUsuarioReserva: TIntegerField
      FieldName = 'UsuarioReserva'
    end
    object qryConsultaReservaLocalEntregaVeiculo: TWideStringField
      FieldName = 'LocalEntregaVeiculo'
      Size = 50
    end
    object qryConsultaReservaLocalRetornoVeiculo: TWideStringField
      FieldName = 'LocalRetornoVeiculo'
      Size = 50
    end
    object qryConsultaReservaCodigoTarifaVeiculo: TIntegerField
      FieldName = 'CodigoTarifaVeiculo'
    end
    object qryConsultaReservaValorPeriodoVeiculo: TBCDField
      FieldName = 'ValorPeriodoVeiculo'
      Precision = 19
    end
    object qryConsultaReservaValorPeriodoSegAd: TBCDField
      FieldName = 'ValorPeriodoSegAd'
      Precision = 19
    end
    object qryConsultaReservaKmLivre: TWideStringField
      FieldName = 'KmLivre'
      Size = 1
    end
    object qryConsultaReservaValorKmRodado: TBCDField
      FieldName = 'ValorKmRodado'
      Precision = 19
    end
    object qryConsultaReservaFranquiaKmRodado: TIntegerField
      FieldName = 'FranquiaKmRodado'
    end
    object qryConsultaReservaTaxaServico: TFloatField
      FieldName = 'TaxaServico'
    end
    object qryConsultaReservaComMotorista: TWideStringField
      FieldName = 'ComMotorista'
      Size = 1
    end
    object qryConsultaReservaViagem: TWideStringField
      FieldName = 'Viagem'
      Size = 1
    end
    object qryConsultaReservaCodigoTarifaMotorista: TIntegerField
      FieldName = 'CodigoTarifaMotorista'
    end
    object qryConsultaReservaValorDiariaMotorista: TBCDField
      FieldName = 'ValorDiariaMotorista'
      Precision = 19
    end
    object qryConsultaReservaValorHoraExtra: TBCDField
      FieldName = 'ValorHoraExtra'
      Precision = 19
    end
    object qryConsultaReservaValorPorRefeicao: TBCDField
      FieldName = 'ValorPorRefeicao'
      Precision = 19
    end
    object qryConsultaReservaValorPernoite: TBCDField
      FieldName = 'ValorPernoite'
      Precision = 19
    end
    object qryConsultaReservaCoberturaTotal: TWideStringField
      FieldName = 'CoberturaTotal'
      Size = 1
    end
    object qryConsultaReservaCodigoFormaPagamento: TIntegerField
      FieldName = 'CodigoFormaPagamento'
    end
    object qryConsultaReservaObservacoes: TWideMemoField
      FieldName = 'Observacoes'
      BlobType = ftWideMemo
    end
    object qryConsultaReservaEstimativaKmRodados: TIntegerField
      FieldName = 'EstimativaKmRodados'
    end
    object qryConsultaReservaInseridoPor: TIntegerField
      FieldName = 'InseridoPor'
    end
    object qryConsultaReservaInseridoEm: TDateTimeField
      FieldName = 'InseridoEm'
    end
    object qryConsultaReservaModificadoPor: TIntegerField
      FieldName = 'ModificadoPor'
    end
    object qryConsultaReservaModificadoEm: TDateTimeField
      FieldName = 'ModificadoEm'
    end
    object qryConsultaReservaQtdeCondutoresAdicionais: TIntegerField
      FieldName = 'QtdeCondutoresAdicionais'
    end
    object qryConsultaReservaValorCondutoresAdicionais: TBCDField
      FieldName = 'ValorCondutoresAdicionais'
      Precision = 19
    end
    object qryConsultaReservaValorTotalCondutoresAdicionais: TBCDField
      FieldName = 'ValorTotalCondutoresAdicionais'
      Precision = 19
    end
    object qryConsultaReservaLocalEntrega: TWideStringField
      FieldName = 'LocalEntrega'
      Size = 50
    end
    object qryConsultaReservaDistanciaEntrega: TIntegerField
      FieldName = 'DistanciaEntrega'
    end
    object qryConsultaReservaValorKmEntrega: TBCDField
      FieldName = 'ValorKmEntrega'
      Precision = 19
    end
    object qryConsultaReservaValorEntrega: TBCDField
      FieldName = 'ValorEntrega'
      Precision = 19
    end
    object qryConsultaReservaLocalDevolucao: TWideStringField
      FieldName = 'LocalDevolucao'
      Size = 50
    end
    object qryConsultaReservaDistanciaDevolucao: TIntegerField
      FieldName = 'DistanciaDevolucao'
    end
    object qryConsultaReservaValorKmDevolucao: TBCDField
      FieldName = 'ValorKmDevolucao'
      Precision = 19
    end
    object qryConsultaReservaValorDevolucao: TBCDField
      FieldName = 'ValorDevolucao'
      Precision = 19
    end
    object qryConsultaReservaCoberturaEspecial: TWideStringField
      FieldName = 'CoberturaEspecial'
      Size = 1
    end
    object qryConsultaReservaCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object qryConsultaReservaInscricaoEstadual: TWideStringField
      FieldName = 'InscricaoEstadual'
    end
    object qryConsultaReservaCPF: TWideStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryConsultaReservaIdentidade: TWideStringField
      FieldName = 'Identidade'
      Size = 13
    end
    object qryConsultaReservaNomeUsuario: TWideStringField
      FieldName = 'NomeUsuario'
      Size = 50
    end
    object qryConsultaReservaUsuarioAberturaReserva: TIntegerField
      FieldName = 'UsuarioAberturaReserva'
    end
    object qryConsultaReservaTipoCartao: TStringField
      FieldName = 'TipoCartao'
      Size = 40
    end
    object qryConsultaReservaNumeroCartao: TStringField
      FieldName = 'NumeroCartao'
      Size = 32
    end
    object qryConsultaReservaValidadeCartao: TStringField
      FieldName = 'ValidadeCartao'
      Size = 10
    end
    object qryConsultaReservaIdentificacaoCartao: TStringField
      FieldName = 'IdentificacaoCartao'
      Size = 10
    end
    object qryConsultaReservaValorCartao: TBCDField
      FieldName = 'ValorCartao'
      Precision = 19
    end
    object qryConsultaReservaAutorizacaoCartao: TWideStringField
      FieldName = 'AutorizacaoCartao'
      Size = 6
    end
    object qryConsultaReservaPrazoFatura: TSmallintField
      FieldName = 'PrazoFatura'
    end
    object qryConsultaReservaValorCash: TBCDField
      FieldName = 'ValorCash'
      Precision = 19
    end
    object qryConsultaReservaOrgaoEmissorIdentidade: TWideStringField
      FieldName = 'OrgaoEmissorIdentidade'
      Size = 8
    end
    object qryConsultaReservaHabilitacao: TWideStringField
      FieldName = 'Habilitacao'
      Size = 11
    end
    object qryConsultaReservaCategoria: TWideStringField
      FieldName = 'Categoria'
      Size = 2
    end
    object qryConsultaReservaOrgaoEmissorHabilitacao: TWideStringField
      FieldName = 'OrgaoEmissorHabilitacao'
      Size = 4
    end
    object qryConsultaReservaValidade: TDateTimeField
      FieldName = 'Validade'
    end
    object qryConsultaReservaSolicitadoPor: TWideStringField
      FieldName = 'SolicitadoPor'
      Size = 25
    end
    object qryConsultaReservaPercDescontoFatura: TFloatField
      FieldName = 'PercDescontoFatura'
    end
    object qryConsultaReservaPercDescontoKM: TFloatField
      FieldName = 'PercDescontoKM'
    end
    object qryConsultaReservaPercDescontoTempo: TFloatField
      FieldName = 'PercDescontoTempo'
    end
    object qryConsultaReservaHorasExtrasCobradas: TSmallintField
      FieldName = 'HorasExtrasCobradas'
    end
    object qryConsultaReservaDiariasCobradas: TSmallintField
      FieldName = 'DiariasCobradas'
    end
    object qryConsultaReservaPeriodosCobrados: TSmallintField
      FieldName = 'PeriodosCobrados'
    end
    object qryConsultaReservaDiariasCobradasCobertura: TSmallintField
      FieldName = 'DiariasCobradasCobertura'
    end
    object qryConsultaReservaValorCombustivel: TBCDField
      FieldName = 'ValorCombustivel'
      Precision = 19
    end
    object qryConsultaReservaValorLocacao: TBCDField
      FieldName = 'ValorLocacao'
      Precision = 19
    end
    object qryConsultaReservaCodigoConcessionaria: TIntegerField
      FieldName = 'CodigoConcessionaria'
    end
    object qryConsultaReservaTipoCoberturaCasco: TWideStringField
      FieldName = 'TipoCoberturaCasco'
      Size = 2
    end
    object qryConsultaReservaCoberturaTerceiros: TWideStringField
      FieldName = 'CoberturaTerceiros'
      Size = 1
    end
    object qryConsultaReservaCobertura24h: TWideStringField
      FieldName = 'Cobertura24h'
      Size = 1
    end
    object qryConsultaReservaValorFranquia: TBCDField
      FieldName = 'ValorFranquia'
      Precision = 19
    end
    object qryConsultaReservaOutrosCobertura: TWideStringField
      FieldName = 'OutrosCobertura'
      Size = 30
    end
    object qryConsultaReservaValorMotorista: TBCDField
      FieldName = 'ValorMotorista'
      Precision = 19
    end
    object qryConsultaReservaValorKmRodados: TBCDField
      FieldName = 'ValorKmRodados'
      Precision = 19
    end
    object qryConsultaReservaValorTempo: TBCDField
      FieldName = 'ValorTempo'
      Precision = 19
    end
    object qryConsultaReservaEmail: TWideStringField
      FieldName = 'Email'
      Size = 50
    end
    object qryConsultaReservaPassaporte: TStringField
      FieldName = 'Passaporte'
    end
    object qryConsultaReservaCodigoGrupoVeiculos: TIntegerField
      FieldName = 'CodigoGrupoVeiculos'
    end
    object qryConsultaReservaCancelada: TWideStringField
      FieldName = 'Cancelada'
      Size = 1
    end
    object qryConsultaReservaCodigoMotivoCancelamento: TIntegerField
      FieldName = 'CodigoMotivoCancelamento'
    end
    object qryConsultaReservaCodigoUsuarioCancelamento: TIntegerField
      FieldName = 'CodigoUsuarioCancelamento'
    end
    object qryConsultaReservaDataHoraCancelamento: TDateTimeField
      FieldName = 'DataHoraCancelamento'
    end
    object qryConsultaReservaCoberturaOcupantes: TWideStringField
      FieldName = 'CoberturaOcupantes'
      Size = 1
    end
    object qryConsultaReservaValorFranquiaTerceiros: TBCDField
      FieldName = 'ValorFranquiaTerceiros'
      Precision = 19
    end
    object qryConsultaReservaValorFranquiaOcupantes: TBCDField
      FieldName = 'ValorFranquiaOcupantes'
      Precision = 19
    end
    object qryConsultaReservaOrigem: TWideStringField
      FieldName = 'Origem'
      Size = 1
    end
    object qryConsultaReservaCodigoProtecao: TIntegerField
      FieldName = 'CodigoProtecao'
    end
    object qryConsultaReservaLocacaoBonificada: TStringField
      FieldName = 'LocacaoBonificada'
      FixedChar = True
      Size = 1
    end
    object qryConsultaReservaCodigoCondutor: TIntegerField
      FieldName = 'CodigoCondutor'
    end
    object qryConsultaReservaEquipBlindagem: TWideStringField
      FieldName = 'EquipBlindagem'
      Size = 1
    end
    object qryConsultaReservaEquipAirBag: TWideStringField
      FieldName = 'EquipAirBag'
      Size = 1
    end
    object qryConsultaReservaEquipAlarme: TWideStringField
      FieldName = 'EquipAlarme'
      Size = 1
    end
    object qryConsultaReservaEquipAr: TWideStringField
      FieldName = 'EquipAr'
      Size = 1
    end
    object qryConsultaReservaEquipDirecao: TWideStringField
      FieldName = 'EquipDirecao'
      Size = 1
    end
    object qryConsultaReservaEquipVidroTrava: TWideStringField
      FieldName = 'EquipVidroTrava'
      Size = 1
    end
    object qryConsultaReservaEquipCD: TWideStringField
      FieldName = 'EquipCD'
      Size = 1
    end
    object qryConsultaReservaEquipRadio: TWideStringField
      FieldName = 'EquipRadio'
      Size = 1
    end
    object qryConsultaReservaCodigoSolicitante: TIntegerField
      FieldName = 'CodigoSolicitante'
    end
    object qryConsultaReservaLocalTransito: TStringField
      FieldName = 'LocalTransito'
      Size = 80
    end
    object qryConsultaReservaTelefoneTransito: TStringField
      FieldName = 'TelefoneTransito'
      Size = 11
    end
    object qryConsultaReservaReservaWeb: TStringField
      FieldName = 'ReservaWeb'
      Size = 1
    end
    object qryConsultaReservaDataHoraLiberacao: TDateTimeField
      FieldName = 'DataHoraLiberacao'
    end
    object qryConsultaReservaCodigoUsuarioAprovacao: TIntegerField
      FieldName = 'CodigoUsuarioAprovacao'
    end
    object qryConsultaReservaSolicitacao: TStringField
      FieldName = 'Solicitacao'
      Size = 1
    end
  end
  object qryUnidadeDevolucao: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Cidade'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT EmpresaUnidades.CodigoEmpresa, EmpresaUnidades.CodigoUnid' +
        'ade, DescricaoUnidade, Cidade,  Logradouro, Numero,'
      
        '       Complemento, Cep, Bairro, Estado, Telefone1, Email, HoraI' +
        'nicioFuncionamentoSegSex, UnidadesCidadeAtendimento.ValorTaxaEnt' +
        'rega,'
      
        '       HoraTerminoFuncionamentoSegSex, HoraInicioFuncionamentoSa' +
        'bado, HoraTerminoFuncionamentoSabado, EmpresaUnidades.CodigoMuni' +
        'cipio,'
      
        '       HoraInicioFuncionamentoDomingo, HoraTerminoFuncionamentoD' +
        'omingo, HorasAntecedenciaCancelamentoReservaWeb,'
      
        '       MostrarTarifasKmLivre, ProtecaoYes, ProtecaoPlus, Percent' +
        'ualDescontoTarifaReservaWeb, HorasAntecedenciaAberturaReservaWeb'
      'FROM EmpresaUnidades'
      
        'INNER JOIN Empresa ON EmpresaUnidades.CodigoEmpresa = Empresa.Co' +
        'digoEmpresa'
      
        'INNER JOIN UnidadesCidadeAtendimento ON EmpresaUnidades.CodigoUn' +
        'idade = UnidadesCidadeAtendimento.CodigoUnidade AND'
      
        '                                        EmpresaUnidades.CodigoEm' +
        'presa = UnidadesCidadeAtendimento.CodigoEmpresa'
      'WHERE ( EmpresaUnidades.DescricaoUnidade = :Cidade)')
    UserID = 0
    ControlConnection = adcControle
    Left = 404
    Top = 245
    object qryUnidadeDevolucaoCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryUnidadeDevolucaoCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryUnidadeDevolucaoDescricaoUnidade: TWideStringField
      FieldName = 'DescricaoUnidade'
      Size = 50
    end
    object qryUnidadeDevolucaoCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 35
    end
    object qryUnidadeDevolucaoLogradouro: TWideStringField
      FieldName = 'Logradouro'
      Size = 40
    end
    object qryUnidadeDevolucaoNumero: TWideStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qryUnidadeDevolucaoComplemento: TWideStringField
      FieldName = 'Complemento'
    end
    object qryUnidadeDevolucaoCep: TWideStringField
      FieldName = 'Cep'
      Size = 8
    end
    object qryUnidadeDevolucaoBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object qryUnidadeDevolucaoEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryUnidadeDevolucaoTelefone1: TStringField
      FieldName = 'Telefone1'
      Size = 11
    end
    object qryUnidadeDevolucaoEmail: TWideStringField
      FieldName = 'Email'
      Size = 60
    end
    object qryUnidadeDevolucaoHoraInicioFuncionamentoSegSex: TStringField
      FieldName = 'HoraInicioFuncionamentoSegSex'
      Size = 4
    end
    object qryUnidadeDevolucaoValorTaxaEntrega: TBCDField
      FieldName = 'ValorTaxaEntrega'
      Precision = 19
    end
    object qryUnidadeDevolucaoHoraTerminoFuncionamentoSegSex: TStringField
      FieldName = 'HoraTerminoFuncionamentoSegSex'
      Size = 4
    end
    object qryUnidadeDevolucaoHoraInicioFuncionamentoSabado: TStringField
      FieldName = 'HoraInicioFuncionamentoSabado'
      Size = 4
    end
    object qryUnidadeDevolucaoHoraTerminoFuncionamentoSabado: TStringField
      FieldName = 'HoraTerminoFuncionamentoSabado'
      Size = 4
    end
    object qryUnidadeDevolucaoCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
    object qryUnidadeDevolucaoHoraInicioFuncionamentoDomingo: TStringField
      FieldName = 'HoraInicioFuncionamentoDomingo'
      Size = 4
    end
    object qryUnidadeDevolucaoHoraTerminoFuncionamentoDomingo: TStringField
      FieldName = 'HoraTerminoFuncionamentoDomingo'
      Size = 4
    end
    object qryUnidadeDevolucaoHorasAntecedenciaCancelamentoReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaCancelamentoReservaWeb'
    end
    object qryUnidadeDevolucaoMostrarTarifasKmLivre: TStringField
      FieldName = 'MostrarTarifasKmLivre'
      Size = 1
    end
    object qryUnidadeDevolucaoProtecaoYes: TStringField
      FieldName = 'ProtecaoYes'
      Size = 1
    end
    object qryUnidadeDevolucaoProtecaoPlus: TStringField
      FieldName = 'ProtecaoPlus'
      Size = 1
    end
    object qryUnidadeDevolucaoPercentualDescontoTarifaReservaWeb: TFloatField
      FieldName = 'PercentualDescontoTarifaReservaWeb'
    end
    object qryUnidadeDevolucaoHorasAntecedenciaAberturaReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaAberturaReservaWeb'
    end
  end
  object qryListarReservaServicoAdicional: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoReserva'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT ServicoAdicional.Descricao, ReservasServicosAdicionais.Va' +
        'lor, ServicoAdicional.CalculoPorDiarias, ServicoAdicional.Perman' +
        'ente'
      'FROM ReservasServicosAdicionais'
      
        'INNER JOIN ServicoAdicional ON ReservasServicosAdicionais.Codigo' +
        'ServicoAdicional = ServicoAdicional.CodigoServicoAdicional'
      
        'WHERE (ReservasServicosAdicionais.CodigoReserva = :CodigoReserva' +
        ')'
      'ORDER BY ServicoAdicional.Descricao')
    UserID = 0
    ControlConnection = adcControle
    Left = 313
    Top = 303
    object qryListarReservaServicoAdicionalDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object qryListarReservaServicoAdicionalValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
    end
    object qryListarReservaServicoAdicionalCalculoPorDiarias: TStringField
      FieldName = 'CalculoPorDiarias'
      Size = 1
    end
    object qryListarReservaServicoAdicionalPermanente: TStringField
      FieldName = 'Permanente'
      Size = 1
    end
  end
  object qryDescricaoTarifaProtecao: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicio'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataTermino'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'PromoInicio'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'PromoTermino'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @CodigoEmpresa INT;'
      'DECLARE @CodigoUnidade INT;'
      'DECLARE @CodigoGrupo INT;'
      'DECLARE @Periodo INT;'
      'DECLARE @TodasTarifas INT;'
      'DECLARE @DataInicio DATETIME;'
      'DECLARE @DataTermino DATETIME;'
      'DECLARE @PromoInicio INT;'
      'DECLARE @PromoTermino INT;'
      ''
      'SET @CodigoEmpresa = :CodigoEmpresa;'
      'SET @CodigoUnidade = :CodigoUnidade;'
      'SET @CodigoGrupo = :CodigoGrupo;'
      'SET @Periodo = :Periodo;'
      'SET @TodasTarifas = :TodasTarifas;'
      'SET @DataInicio = :DataInicio;'
      'SET @DataTermino = :DataTermino;'
      'SET @PromoInicio = :PromoInicio;'
      'SET @PromoTermino = :PromoTermino;'
      ''
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado, VeiculosTar' +
        'ifas.KmLivre,'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      
        '            ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      '       END AS ValorDesconto,'
      
        '       CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN Veiculo' +
        'sTarifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      '            ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      '            ELSE'
      
        '                 CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 TH' +
        'EN ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidade' +
        's.PercentualDescontoTarifaReservaWeb,1)) /100)/7'
      
        '                      ELSE((VeiculosTarifas.ValorPeriodoVeiculo ' +
        '* ISNULL(EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) ' +
        '/100) END'
      
        '       END AS ValorComDescontoDiario, VeiculosTarifas.PeriodoTar' +
        'ifa, VeiculosTarifas.CodigoTarifaVeiculo, VeiculosTarifas.ValorP' +
        'eriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '      AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '      AND (VeiculosTarifas.CodigoGrupo = @CodigoGrupo)'
      '      AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '      AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '      AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '      AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      
        '      AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N' +
        #39'))'
      '      AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      '      AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')'
      '      AND (VeiculosTarifas.PromoInicio >= @PromoInicio)'
      '      AND (VeiculosTarifas.PromoTermino <= @PromoTermino)'
      
        '      AND (VeiculosTarifas.PeriodoTarifa = (SELECT Max(PeriodoTa' +
        'rifa) FROM VeiculosTarifas'
      '          WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      
        '              AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidad' +
        'e)'
      '              AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '              AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '              AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '              AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      
        '              AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLi' +
        'vre = '#39'N'#39'))'
      
        '              AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q' +
        #39')))'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado, VeiculosTar' +
        'ifas.KmLivre,'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      
        '            ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      '       END AS ValorDesconto,'
      
        '       CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN Veiculo' +
        'sTarifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      '            ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      '            ELSE'
      
        '                 CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 TH' +
        'EN ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidade' +
        's.PercentualDescontoTarifaReservaWeb,1)) /100)/7'
      
        '                      ELSE((VeiculosTarifas.ValorPeriodoVeiculo ' +
        '* ISNULL(EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) ' +
        '/100) END'
      
        '       END AS ValorComDescontoDiario, VeiculosTarifas.PeriodoTar' +
        'ifa, VeiculosTarifas.CodigoTarifaVeiculo, VeiculosTarifas.ValorP' +
        'eriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '  AND (VeiculosTarifas.CodigoGrupo = @CodigoGrupo)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      '  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      
        '  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.Dat' +
        'aInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao)'
      
        '  AND (CONVERT(DATETIME, @DataInicio, 103) BETWEEN  VeiculosTari' +
        'fas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao)'
      
        '  AND (CONVERT(DATETIME, @DataTermino, 103) BETWEEN  VeiculosTar' +
        'ifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao)'
      '  AND (VeiculosTarifas.PromoInicio >= @PromoInicio)'
      '  AND (VeiculosTarifas.PromoTermino <= @PromoTermino)'
      
        '  AND (VeiculosTarifas.PeriodoTarifa = (SELECT Max(PeriodoTarifa' +
        ') FROM VeiculosTarifas'
      #9'    WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '          AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '          AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '          AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '          AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '          AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      
        '          AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre ' +
        '= '#39'N'#39'))'
      '          AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')))'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado, VeiculosTar' +
        'ifas.KmLivre,'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      
        '            ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      '       END AS ValorDesconto,'
      
        '       CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN Veiculo' +
        'sTarifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      '            ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      '            ELSE'
      
        '                 CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 TH' +
        'EN ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidade' +
        's.PercentualDescontoTarifaReservaWeb,1)) /100)/7'
      
        '                      ELSE((VeiculosTarifas.ValorPeriodoVeiculo ' +
        '* ISNULL(EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) ' +
        '/100) END'
      
        '       END AS ValorComDescontoDiario, VeiculosTarifas.PeriodoTar' +
        'ifa, VeiculosTarifas.CodigoTarifaVeiculo, VeiculosTarifas.ValorP' +
        'eriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '  AND (VeiculosTarifas.CodigoGrupo = @CodigoGrupo)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      '  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      '  AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      
        '  AND (CONVERT(DATETIME, @DataInicio, 103) BETWEEN  VeiculosTari' +
        'fas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao)'
      
        '  AND (CONVERT(DATETIME, @DataTermino, 103) BETWEEN  VeiculosTar' +
        'ifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao)'
      '  AND (VeiculosTarifas.PromoInicio >= @PromoInicio)'
      '  AND (VeiculosTarifas.PromoTermino <= @PromoTermino)'
      
        '  AND (VeiculosTarifas.PeriodoTarifa = (SELECT Max(PeriodoTarifa' +
        ') FROM VeiculosTarifas'
      #9'    WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '          AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '          AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '          AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '          AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '          AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      
        '          AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre ' +
        '= '#39'N'#39'))'
      '          AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')))'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado, VeiculosTar' +
        'ifas.KmLivre,'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      
        '            ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      '       END AS ValorDesconto,'
      
        '       CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN Veiculo' +
        'sTarifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      '            ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      '            ELSE'
      
        '                 CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 TH' +
        'EN ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidade' +
        's.PercentualDescontoTarifaReservaWeb,1)) /100)/7'
      
        '                      ELSE((VeiculosTarifas.ValorPeriodoVeiculo ' +
        '* ISNULL(EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) ' +
        '/100) END'
      
        '       END AS ValorComDescontoDiario, VeiculosTarifas.PeriodoTar' +
        'ifa, VeiculosTarifas.CodigoTarifaVeiculo, VeiculosTarifas.ValorP' +
        'eriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '  AND (VeiculosTarifas.CodigoGrupo = @CodigoGrupo)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      '  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')'
      
        '  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.Dat' +
        'aInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao)'
      
        '  AND (CONVERT(DATETIME, @DataInicio, 103) BETWEEN  VeiculosTari' +
        'fas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao)'
      '  AND (VeiculosTarifas.PromoInicio >= @PromoInicio)'
      '  AND (VeiculosTarifas.PromoTermino <= @PromoTermino)'
      
        '  AND (VeiculosTarifas.PeriodoTarifa = (SELECT Max(PeriodoTarifa' +
        ') FROM VeiculosTarifas'
      '      WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '          AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '          AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '          AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '          AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '          AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      
        '          AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre ' +
        '= '#39'N'#39'))'
      '          AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')))'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado, VeiculosTar' +
        'ifas.KmLivre,'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      
        '            ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      '       END AS ValorDesconto,'
      
        '       CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN Veiculo' +
        'sTarifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      '            ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      '            ELSE'
      
        '                 CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 TH' +
        'EN ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidade' +
        's.PercentualDescontoTarifaReservaWeb,1)) /100)/7'
      
        '                      ELSE((VeiculosTarifas.ValorPeriodoVeiculo ' +
        '* ISNULL(EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) ' +
        '/100) END'
      
        '       END AS ValorComDescontoDiario, VeiculosTarifas.PeriodoTar' +
        'ifa, VeiculosTarifas.CodigoTarifaVeiculo, VeiculosTarifas.ValorP' +
        'eriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '  AND (VeiculosTarifas.CodigoGrupo = @CodigoGrupo)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      '  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')'
      '  AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      
        '  AND (CONVERT(DATETIME, @DataInicio, 103) BETWEEN  VeiculosTari' +
        'fas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLocacao)'
      '  AND (VeiculosTarifas.PromoInicio >= @PromoInicio)'
      '  AND (VeiculosTarifas.PromoTermino <= @PromoTermino)'
      
        '  AND (VeiculosTarifas.PeriodoTarifa = (SELECT Max(PeriodoTarifa' +
        ') FROM VeiculosTarifas'
      '      WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '          AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '          AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '          AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '          AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '          AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      
        '          AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre ' +
        '= '#39'N'#39'))'
      '          AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')))'
      ''
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado, VeiculosTar' +
        'ifas.KmLivre,'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      
        '            ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      '       END AS ValorDesconto,'
      
        '       CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN Veiculo' +
        'sTarifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      '            ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      '            ELSE'
      
        '                 CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 TH' +
        'EN ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidade' +
        's.PercentualDescontoTarifaReservaWeb,1)) /100)/7'
      
        '                      ELSE((VeiculosTarifas.ValorPeriodoVeiculo ' +
        '* ISNULL(EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) ' +
        '/100) END'
      
        '       END AS ValorComDescontoDiario, VeiculosTarifas.PeriodoTar' +
        'ifa, VeiculosTarifas.CodigoTarifaVeiculo, VeiculosTarifas.ValorP' +
        'eriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '  AND (VeiculosTarifas.CodigoGrupo = @CodigoGrupo)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      '  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')'
      
        '  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.Dat' +
        'aInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao)'
      '  AND (VeiculosTarifas.PromoInicio >= @PromoInicio)'
      '  AND (VeiculosTarifas.PromoTermino <= @PromoTermino)'
      
        '  AND (VeiculosTarifas.PeriodoTarifa = (SELECT Max(PeriodoTarifa' +
        ') FROM VeiculosTarifas'
      '      WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '          AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '          AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '          AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '          AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '          AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      
        '          AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre ' +
        '= '#39'N'#39'))'
      '          AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')))'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado, VeiculosTar' +
        'ifas.KmLivre,'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      
        '            ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      '       END AS ValorDesconto,'
      
        '       CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 THEN Veiculo' +
        'sTarifas.ValorPeriodoVeiculo / VeiculosTarifas.PeriodoTarifa'
      '            ELSE VeiculosTarifas.ValorPeriodoVeiculo END -'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      '            ELSE'
      
        '                 CASE WHEN VeiculosTarifas.PeriodoTarifa >= 7 TH' +
        'EN ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidade' +
        's.PercentualDescontoTarifaReservaWeb,1)) /100)/7'
      
        '                      ELSE((VeiculosTarifas.ValorPeriodoVeiculo ' +
        '* ISNULL(EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) ' +
        '/100) END'
      
        '       END AS ValorComDescontoDiario, VeiculosTarifas.PeriodoTar' +
        'ifa, VeiculosTarifas.CodigoTarifaVeiculo, VeiculosTarifas.ValorP' +
        'eriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      '      AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      '      AND (VeiculosTarifas.CodigoGrupo = @CodigoGrupo)'
      '      AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '      AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '      AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '      AND (VeiculosTarifas.PeriodoTarifa = 1)'
      '      AND (VeiculosTarifas.DescricaoTarifa = '#39'Di'#225'ria B'#225'sica'#39')'
      
        '      AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N' +
        #39'))'
      '      AND (VeiculosTarifas.PromoInicio >= @PromoInicio)'
      '      AND (VeiculosTarifas.PromoTermino <= @PromoTermino)'
      
        '      AND (VeiculosTarifas.PeriodoTarifa = (SELECT Max(PeriodoTa' +
        'rifa) FROM VeiculosTarifas'
      '          WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      
        '              AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidad' +
        'e)'
      '              AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '              AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '              AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '              AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      
        '              AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLi' +
        'vre = '#39'N'#39'))'
      
        '              AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E' +
        #39')))'
      'ORDER BY VeiculosTarifas.DescricaoTarifa'
      '')
    UserID = 0
    ControlConnection = adcControle
    Left = 59
    Top = 304
    object qryDescricaoTarifaProtecaoCodigoTarifaVeiculo: TIntegerField
      FieldName = 'CodigoTarifaVeiculo'
      ReadOnly = True
    end
    object qryDescricaoTarifaProtecaoDescricaoTarifa: TWideStringField
      FieldName = 'DescricaoTarifa'
      ReadOnly = True
      Size = 45
    end
    object qryDescricaoTarifaProtecaoValorPeriodoVeiculo: TBCDField
      FieldName = 'ValorPeriodoVeiculo'
      ReadOnly = True
      Precision = 19
    end
    object qryDescricaoTarifaProtecaoValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      ReadOnly = True
    end
    object qryDescricaoTarifaProtecaoValorComDescontoDiario: TFloatField
      FieldName = 'ValorComDescontoDiario'
      ReadOnly = True
    end
    object qryDescricaoTarifaProtecaoValorKmRodado: TBCDField
      FieldName = 'ValorKmRodado'
      ReadOnly = True
      Precision = 19
    end
    object qryDescricaoTarifaProtecaoPeriodoTarifa: TSmallintField
      FieldName = 'PeriodoTarifa'
      ReadOnly = True
    end
    object qryDescricaoTarifaProtecaoKmLivre: TWideStringField
      FieldName = 'KmLivre'
      ReadOnly = True
      Size = 1
    end
    object qryDescricaoTarifaProtecaoValorPeriodoSegAd: TBCDField
      FieldName = 'ValorPeriodoSegAd'
      ReadOnly = True
      Precision = 19
    end
  end
  object qryListaProtecao: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Protecao'
      'WHERE (Protecao.ProtecaoWeb = '#39'S'#39')'
      '  AND (Protecao.Ativa = '#39'S'#39')'
      '-- Filtro de protecao reserva'
      'ORDER BY CodigoProtecao')
    UserID = 0
    ControlConnection = adcControle
    Left = 181
    Top = 304
    object qryListaProtecaoCodigoProtecao: TIntegerField
      FieldName = 'CodigoProtecao'
    end
    object qryListaProtecaoNomeProtecao: TStringField
      FieldName = 'NomeProtecao'
      Size = 80
    end
    object qryListaProtecaoCondicoes: TStringField
      FieldName = 'Condicoes'
      Size = 4000
    end
    object qryListaProtecaoCoberturaCasco: TStringField
      FieldName = 'CoberturaCasco'
      FixedChar = True
      Size = 1
    end
    object qryListaProtecaoCoberturaTerceiros: TStringField
      FieldName = 'CoberturaTerceiros'
      FixedChar = True
      Size = 1
    end
    object qryListaProtecaoCoberturaOcupantes: TStringField
      FieldName = 'CoberturaOcupantes'
      FixedChar = True
      Size = 1
    end
    object qryListaProtecaoValorCasco: TFloatField
      FieldName = 'ValorCasco'
    end
    object qryListaProtecaoValorTerceiros: TFloatField
      FieldName = 'ValorTerceiros'
    end
    object qryListaProtecaoValorOcupantes: TFloatField
      FieldName = 'ValorOcupantes'
    end
    object qryListaProtecaoTipoFranquia: TStringField
      FieldName = 'TipoFranquia'
      FixedChar = True
      Size = 1
    end
    object qryListaProtecaoAtiva: TStringField
      FieldName = 'Ativa'
      Size = 1
    end
    object qryListaProtecaoPadraoAberturaContrato: TStringField
      FieldName = 'PadraoAberturaContrato'
      Size = 1
    end
    object qryListaProtecaoProtecaoYes: TStringField
      FieldName = 'ProtecaoYes'
      Size = 1
    end
    object qryListaProtecaoProtecaoPlus: TStringField
      FieldName = 'ProtecaoPlus'
      Size = 1
    end
    object qryListaProtecaoProtecaoWeb: TStringField
      FieldName = 'ProtecaoWeb'
      Size = 1
    end
    object qryListaProtecaoValorProtecao: TBCDField
      FieldName = 'ValorProtecao'
      Precision = 19
    end
  end
  object qryTarifa: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoTarifaVeiculo'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT VeiculosTarifas.CodigoTarifaVeiculo, VeiculosTarifas.Desc' +
        'ricaoTarifa, VeiculosTarifas.PeriodoTarifa,'
      
        '       VeiculosTarifas.DescricaoPeriodoTarifa, VeiculosTarifas.V' +
        'alorPeriodoVeiculo,'
      
        '       VeiculosTarifas.ValorPeriodoSegAd, VeiculosTarifas.KmLivr' +
        'e, VeiculosTarifas.ValorKmRodado,'
      
        '       VeiculosTarifas.FranquiaKmRodado, VeiculosTarifas.Mensal,' +
        ' VeiculosTarifas.TarifaNacional,'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        '0'
      
        '            ELSE ((VeiculosTarifas.ValorPeriodoVeiculo * ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,1)) /100)'
      '       END AS ValorDesconto,'
      
        '       CASE WHEN VeiculosTarifas.TarifaNacional = '#39'N'#39' OR ISNULL(' +
        'EmpresaUnidades.PercentualDescontoTarifaReservaWeb,0) <= 0 THEN ' +
        'VeiculosTarifas.ValorPeriodoVeiculo'
      
        '            ELSE VeiculosTarifas.ValorPeriodoVeiculo - ((Veiculo' +
        'sTarifas.ValorPeriodoVeiculo * ISNULL(EmpresaUnidades.Percentual' +
        'DescontoTarifaReservaWeb,1)) /100)'
      '       END AS ValorTarifa, VeiculosTarifas.ReservaWebPadrao'
      'FROM VeiculosTarifas'
      
        'LEFT JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Emp' +
        'resaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      
        'WHERE (VeiculosTarifas.CodigoTarifaVeiculo = :CodigoTarifaVeicul' +
        'o)')
    UserID = 0
    ControlConnection = adcControle
    Left = 480
    Top = 176
    object qryTarifaCodigoTarifaVeiculo: TIntegerField
      FieldName = 'CodigoTarifaVeiculo'
    end
    object qryTarifaDescricaoTarifa: TWideStringField
      FieldName = 'DescricaoTarifa'
      Size = 45
    end
    object qryTarifaPeriodoTarifa: TSmallintField
      FieldName = 'PeriodoTarifa'
    end
    object qryTarifaDescricaoPeriodoTarifa: TWideStringField
      FieldName = 'DescricaoPeriodoTarifa'
      Size = 15
    end
    object qryTarifaValorPeriodoVeiculo: TBCDField
      FieldName = 'ValorPeriodoVeiculo'
      Precision = 19
    end
    object qryTarifaValorPeriodoSegAd: TBCDField
      FieldName = 'ValorPeriodoSegAd'
      Precision = 19
    end
    object qryTarifaKmLivre: TWideStringField
      FieldName = 'KmLivre'
      Size = 1
    end
    object qryTarifaValorKmRodado: TBCDField
      FieldName = 'ValorKmRodado'
      Precision = 19
    end
    object qryTarifaFranquiaKmRodado: TIntegerField
      FieldName = 'FranquiaKmRodado'
    end
    object qryTarifaMensal: TWideStringField
      FieldName = 'Mensal'
      Size = 1
    end
    object qryTarifaTarifaNacional: TStringField
      FieldName = 'TarifaNacional'
      Size = 1
    end
    object qryTarifaValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      ReadOnly = True
    end
    object qryTarifaValorTarifa: TFloatField
      FieldName = 'ValorTarifa'
      ReadOnly = True
    end
    object qryTarifaReservaWebPadrao: TStringField
      FieldName = 'ReservaWebPadrao'
      Size = 1
    end
  end
  object qryProtecao: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoProtecao'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Protecao'
      'WHERE (Protecao.CodigoProtecao = :CodigoProtecao)')
    UserID = 0
    ControlConnection = adcControle
    Left = 441
    Top = 120
    object qryProtecaoCodigoProtecao: TIntegerField
      FieldName = 'CodigoProtecao'
    end
    object qryProtecaoNomeProtecao: TStringField
      FieldName = 'NomeProtecao'
      Size = 80
    end
    object qryProtecaoCondicoes: TStringField
      FieldName = 'Condicoes'
      Size = 4000
    end
    object qryProtecaoCoberturaCasco: TStringField
      FieldName = 'CoberturaCasco'
      FixedChar = True
      Size = 1
    end
    object qryProtecaoCoberturaTerceiros: TStringField
      FieldName = 'CoberturaTerceiros'
      FixedChar = True
      Size = 1
    end
    object qryProtecaoCoberturaOcupantes: TStringField
      FieldName = 'CoberturaOcupantes'
      FixedChar = True
      Size = 1
    end
    object qryProtecaoValorCasco: TFloatField
      FieldName = 'ValorCasco'
    end
    object qryProtecaoValorTerceiros: TFloatField
      FieldName = 'ValorTerceiros'
    end
    object qryProtecaoValorOcupantes: TFloatField
      FieldName = 'ValorOcupantes'
    end
    object qryProtecaoTipoFranquia: TStringField
      FieldName = 'TipoFranquia'
      FixedChar = True
      Size = 1
    end
    object qryProtecaoInseridoPor: TIntegerField
      FieldName = 'InseridoPor'
    end
    object qryProtecaoInseridoEm: TDateTimeField
      FieldName = 'InseridoEm'
    end
    object qryProtecaoModificadoPor: TIntegerField
      FieldName = 'ModificadoPor'
    end
    object qryProtecaoModificadoEm: TDateTimeField
      FieldName = 'ModificadoEm'
    end
    object qryProtecaoTipoProtecaoReservaWeb: TStringField
      FieldName = 'TipoProtecaoReservaWeb'
      Size = 1
    end
    object qryProtecaoAtiva: TStringField
      FieldName = 'Ativa'
      Size = 1
    end
    object qryProtecaoPadraoAberturaContrato: TStringField
      FieldName = 'PadraoAberturaContrato'
      Size = 1
    end
    object qryProtecaoProtecaoYes: TStringField
      FieldName = 'ProtecaoYes'
      Size = 1
    end
    object qryProtecaoProtecaoPlus: TStringField
      FieldName = 'ProtecaoPlus'
      Size = 1
    end
    object qryProtecaoProtecaoWeb: TStringField
      FieldName = 'ProtecaoWeb'
      Size = 1
    end
    object qryProtecaoValorProtecao: TBCDField
      FieldName = 'ValorProtecao'
      Precision = 19
    end
  end
  object qryGravaReserva: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT CodigoReserva, CodigoEmpresa, CodigoCliente, TipoCliente,' +
        ' ClienteCadastrado, NomeCliente, TelefoneContato1, Email, CPF, I' +
        'dentidade, Passaporte, DataInicio, HoraInicio, DataHoraInicio,'
      
        '       DataTermino, HoraTermino, DataHoraTermino, CodigoModelo, ' +
        'CodigoMVA, LocalEntregaVeiculo, LocalRetornoVeiculo, CodigoTarif' +
        'aVeiculo, ValorPeriodoVeiculo, ValorPeriodoSegAd, KmLivre,'
      
        '       ValorKmRodado, FranquiaKmRodado, ComMotorista, Viagem, Co' +
        'digoTarifaMotorista, ValorDiariaMotorista, ValorHoraExtra, Valor' +
        'PorRefeicao, ValorPernoite, Cobertura24h, ValorFranquia,'
      
        '       Observacoes, CodigoFormaPagamento, DataReserva, HoraReser' +
        'va, UsuarioReserva, CodigoUnidade, CodigoGrupoContratos, QtdeCon' +
        'dutoresAdicionais, ValorCondutoresAdicionais,'
      
        '       ValorTotalCondutoresAdicionais, LocalEntrega, LocalDevolu' +
        'cao, DistanciaDevolucao, ValorKmDevolucao, ValorDevolucao, Cober' +
        'turaEspecial, PrazoFatura, ValorCash, PercDescontoFatura,'
      
        '       PercDescontoKM, PercDescontoTempo, TaxaServico, HorasExtr' +
        'asCobradas, DiariasCobradas, PeriodosCobrados, DiariasCobradasCo' +
        'bertura, ValorCombustivel, ValorLocacao,'
      
        '       CodigoConcessionaria, OutrosCobertura, ValorMotorista, Va' +
        'lorKmRodados, ValorTempo, CodigoGrupoVeiculos, Cancelada, Origem' +
        ', ValorFranquiaTerceiros, ValorFranquiaOcupantes,'
      
        '       CodigoProtecao, ReservaWeb, DataHoraLiberacao, Solicitaca' +
        'o, InseridoEm, InseridoPor, CoberturaTotal, ComMotorista, Cobert' +
        'uraTerceiros, CoberturaOcupantes, EstimativaKmRodados'
      'FROM Reservas'
      'WHERE (CodigoReserva = 0)')
    UserID = 0
    ControlConnection = adcControle
    Left = 47
    Top = 364
    object qryGravaReservaCodigoReserva: TIntegerField
      FieldName = 'CodigoReserva'
    end
    object qryGravaReservaCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryGravaReservaCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object qryGravaReservaTipoCliente: TWideStringField
      FieldName = 'TipoCliente'
      Size = 1
    end
    object qryGravaReservaClienteCadastrado: TWideStringField
      FieldName = 'ClienteCadastrado'
      Size = 1
    end
    object qryGravaReservaNomeCliente: TWideStringField
      FieldName = 'NomeCliente'
      Size = 80
    end
    object qryGravaReservaTelefoneContato1: TStringField
      FieldName = 'TelefoneContato1'
      Size = 11
    end
    object qryGravaReservaEmail: TWideStringField
      FieldName = 'Email'
      Size = 50
    end
    object qryGravaReservaCPF: TWideStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryGravaReservaIdentidade: TWideStringField
      FieldName = 'Identidade'
      Size = 13
    end
    object qryGravaReservaPassaporte: TStringField
      FieldName = 'Passaporte'
    end
    object qryGravaReservaDataInicio: TDateTimeField
      FieldName = 'DataInicio'
    end
    object qryGravaReservaHoraInicio: TWideStringField
      FieldName = 'HoraInicio'
      Size = 4
    end
    object qryGravaReservaDataHoraInicio: TDateTimeField
      FieldName = 'DataHoraInicio'
    end
    object qryGravaReservaDataTermino: TDateTimeField
      FieldName = 'DataTermino'
    end
    object qryGravaReservaHoraTermino: TWideStringField
      FieldName = 'HoraTermino'
      Size = 4
    end
    object qryGravaReservaDataHoraTermino: TDateTimeField
      FieldName = 'DataHoraTermino'
    end
    object qryGravaReservaCodigoModelo: TIntegerField
      FieldName = 'CodigoModelo'
    end
    object qryGravaReservaCodigoMVA: TIntegerField
      FieldName = 'CodigoMVA'
    end
    object qryGravaReservaLocalEntregaVeiculo: TWideStringField
      FieldName = 'LocalEntregaVeiculo'
      Size = 50
    end
    object qryGravaReservaLocalRetornoVeiculo: TWideStringField
      FieldName = 'LocalRetornoVeiculo'
      Size = 50
    end
    object qryGravaReservaCodigoTarifaVeiculo: TIntegerField
      FieldName = 'CodigoTarifaVeiculo'
    end
    object qryGravaReservaValorPeriodoVeiculo: TBCDField
      FieldName = 'ValorPeriodoVeiculo'
      Precision = 19
    end
    object qryGravaReservaValorPeriodoSegAd: TBCDField
      FieldName = 'ValorPeriodoSegAd'
      Precision = 19
    end
    object qryGravaReservaKmLivre: TWideStringField
      FieldName = 'KmLivre'
      Size = 1
    end
    object qryGravaReservaValorKmRodado: TBCDField
      FieldName = 'ValorKmRodado'
      Precision = 19
    end
    object qryGravaReservaFranquiaKmRodado: TIntegerField
      FieldName = 'FranquiaKmRodado'
    end
    object qryGravaReservaComMotorista: TWideStringField
      FieldName = 'ComMotorista'
      Size = 1
    end
    object qryGravaReservaViagem: TWideStringField
      FieldName = 'Viagem'
      Size = 1
    end
    object qryGravaReservaCodigoTarifaMotorista: TIntegerField
      FieldName = 'CodigoTarifaMotorista'
    end
    object qryGravaReservaValorDiariaMotorista: TBCDField
      FieldName = 'ValorDiariaMotorista'
      Precision = 19
    end
    object qryGravaReservaValorHoraExtra: TBCDField
      FieldName = 'ValorHoraExtra'
      Precision = 19
    end
    object qryGravaReservaValorPorRefeicao: TBCDField
      FieldName = 'ValorPorRefeicao'
      Precision = 19
    end
    object qryGravaReservaValorPernoite: TBCDField
      FieldName = 'ValorPernoite'
      Precision = 19
    end
    object qryGravaReservaCobertura24h: TWideStringField
      FieldName = 'Cobertura24h'
      Size = 1
    end
    object qryGravaReservaValorFranquia: TBCDField
      FieldName = 'ValorFranquia'
      Precision = 19
    end
    object qryGravaReservaObservacoes: TWideMemoField
      FieldName = 'Observacoes'
      BlobType = ftWideMemo
    end
    object qryGravaReservaCodigoFormaPagamento: TIntegerField
      FieldName = 'CodigoFormaPagamento'
    end
    object qryGravaReservaDataReserva: TDateTimeField
      FieldName = 'DataReserva'
    end
    object qryGravaReservaHoraReserva: TWideStringField
      FieldName = 'HoraReserva'
      Size = 8
    end
    object qryGravaReservaUsuarioReserva: TIntegerField
      FieldName = 'UsuarioReserva'
    end
    object qryGravaReservaCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryGravaReservaCodigoGrupoContratos: TIntegerField
      FieldName = 'CodigoGrupoContratos'
    end
    object qryGravaReservaQtdeCondutoresAdicionais: TIntegerField
      FieldName = 'QtdeCondutoresAdicionais'
    end
    object qryGravaReservaValorCondutoresAdicionais: TBCDField
      FieldName = 'ValorCondutoresAdicionais'
      Precision = 19
    end
    object qryGravaReservaValorTotalCondutoresAdicionais: TBCDField
      FieldName = 'ValorTotalCondutoresAdicionais'
      Precision = 19
    end
    object qryGravaReservaLocalEntrega: TWideStringField
      FieldName = 'LocalEntrega'
      Size = 50
    end
    object qryGravaReservaLocalDevolucao: TWideStringField
      FieldName = 'LocalDevolucao'
      Size = 50
    end
    object qryGravaReservaDistanciaDevolucao: TIntegerField
      FieldName = 'DistanciaDevolucao'
    end
    object qryGravaReservaValorKmDevolucao: TBCDField
      FieldName = 'ValorKmDevolucao'
      Precision = 19
    end
    object qryGravaReservaValorDevolucao: TBCDField
      FieldName = 'ValorDevolucao'
      Precision = 19
    end
    object qryGravaReservaCoberturaEspecial: TWideStringField
      FieldName = 'CoberturaEspecial'
      Size = 1
    end
    object qryGravaReservaPrazoFatura: TSmallintField
      FieldName = 'PrazoFatura'
    end
    object qryGravaReservaValorCash: TBCDField
      FieldName = 'ValorCash'
      Precision = 19
    end
    object qryGravaReservaPercDescontoFatura: TFloatField
      FieldName = 'PercDescontoFatura'
    end
    object qryGravaReservaPercDescontoKM: TFloatField
      FieldName = 'PercDescontoKM'
    end
    object qryGravaReservaPercDescontoTempo: TFloatField
      FieldName = 'PercDescontoTempo'
    end
    object qryGravaReservaTaxaServico: TFloatField
      FieldName = 'TaxaServico'
    end
    object qryGravaReservaHorasExtrasCobradas: TSmallintField
      FieldName = 'HorasExtrasCobradas'
    end
    object qryGravaReservaDiariasCobradas: TSmallintField
      FieldName = 'DiariasCobradas'
    end
    object qryGravaReservaPeriodosCobrados: TSmallintField
      FieldName = 'PeriodosCobrados'
    end
    object qryGravaReservaDiariasCobradasCobertura: TSmallintField
      FieldName = 'DiariasCobradasCobertura'
    end
    object qryGravaReservaValorCombustivel: TBCDField
      FieldName = 'ValorCombustivel'
      Precision = 19
    end
    object qryGravaReservaValorLocacao: TBCDField
      FieldName = 'ValorLocacao'
      Precision = 19
    end
    object qryGravaReservaCodigoConcessionaria: TIntegerField
      FieldName = 'CodigoConcessionaria'
    end
    object qryGravaReservaOutrosCobertura: TWideStringField
      FieldName = 'OutrosCobertura'
      Size = 30
    end
    object qryGravaReservaValorMotorista: TBCDField
      FieldName = 'ValorMotorista'
      Precision = 19
    end
    object qryGravaReservaValorKmRodados: TBCDField
      FieldName = 'ValorKmRodados'
      Precision = 19
    end
    object qryGravaReservaValorTempo: TBCDField
      FieldName = 'ValorTempo'
      Precision = 19
    end
    object qryGravaReservaCodigoGrupoVeiculos: TIntegerField
      FieldName = 'CodigoGrupoVeiculos'
    end
    object qryGravaReservaCancelada: TWideStringField
      FieldName = 'Cancelada'
      Size = 1
    end
    object qryGravaReservaOrigem: TWideStringField
      FieldName = 'Origem'
      Size = 1
    end
    object qryGravaReservaValorFranquiaTerceiros: TBCDField
      FieldName = 'ValorFranquiaTerceiros'
      Precision = 19
    end
    object qryGravaReservaValorFranquiaOcupantes: TBCDField
      FieldName = 'ValorFranquiaOcupantes'
      Precision = 19
    end
    object qryGravaReservaCodigoProtecao: TIntegerField
      FieldName = 'CodigoProtecao'
    end
    object qryGravaReservaReservaWeb: TStringField
      FieldName = 'ReservaWeb'
      Size = 1
    end
    object qryGravaReservaDataHoraLiberacao: TDateTimeField
      FieldName = 'DataHoraLiberacao'
    end
    object qryGravaReservaSolicitacao: TStringField
      FieldName = 'Solicitacao'
      Size = 1
    end
    object qryGravaReservaInseridoEm: TDateTimeField
      FieldName = 'InseridoEm'
    end
    object qryGravaReservaInseridoPor: TIntegerField
      FieldName = 'InseridoPor'
    end
    object qryGravaReservaCoberturaTotal: TWideStringField
      FieldName = 'CoberturaTotal'
      Size = 1
    end
    object qryGravaReservaCoberturaTerceiros: TWideStringField
      FieldName = 'CoberturaTerceiros'
      Size = 1
    end
    object qryGravaReservaCoberturaOcupantes: TWideStringField
      FieldName = 'CoberturaOcupantes'
      Size = 1
    end
    object qryGravaReservaEstimativaKmRodados: TIntegerField
      FieldName = 'EstimativaKmRodados'
    end
  end
  object qryValidaVeiculosDisponiveis: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraInicio'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraTermino'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @CodigoEmpresa INT;'
      'DECLARE @CodigoUnidade INT;'
      'DECLARE @CodigoGrupo INT;'
      'DECLARE @DataHoraInicio DATETIME;'
      'DECLARE @DataHoraTermino DATETIME;'
      ''
      'SET @CodigoEmpresa = :CodigoEmpresa;'
      'SET @CodigoUnidade = :CodigoUnidade;'
      'SET @CodigoGrupo = :CodigoGrupo;'
      'SET @DataHoraInicio = :DataHoraInicio;'
      'SET @DataHoraTermino = :DataHoraTermino;'
      ''
      'SELECT Veiculos.CodigoMVA, Veiculos.Placa'
      'FROM Veiculos'
      
        'LEFT OUTER JOIN VeiculosModelos ON Veiculos.CodigoModelo = Veicu' +
        'losModelos.CodigoModelo'
      
        'LEFT OUTER JOIN EmpresaUnidades ON Veiculos.CodigoEmpresa = Empr' +
        'esaUnidades.CodigoEmpresa AND Veiculos.CodigoUnidade = EmpresaUn' +
        'idades.CodigoUnidade'
      
        'LEFT OUTER JOIN VeiculosGrupos ON VeiculosModelos.CodigoGrupoVei' +
        'culo = VeiculosGrupos.CodigoGrupo'
      'WHERE (Veiculos.Status = '#39'D'#39')'
      '  AND (Veiculos.CodigoEmpresa = @CodigoEmpresa)'
      '  AND (Veiculos.CodigoUnidade = @CodigoUnidade)'
      '  AND (VeiculosGrupos.CodigoGrupo = @CodigoGrupo)'
      '  AND (SELECT Max(Reservas.CodigoReserva)'
      '       FROM Reservas'
      
        '       INNER JOIN Empresa ON Reservas.CodigoEmpresa = Empresa.Co' +
        'digoEmpresa'
      
        '       LEFT OUTER JOIN Contratos ON Reservas.CodigoReserva = Con' +
        'tratos.CodigoReserva'
      '       WHERE (Contratos.CodigoReserva IS NULL)'
      '         AND (Reservas.CodigoMVA = Veiculos.CodigoMVA)'
      '         AND (((Reservas.DataHoraInicio <= @DataHoraInicio)'
      '           AND (Reservas.DataHoraTermino >= @DataHoraInicio))'
      '           OR ((Reservas.DataHoraInicio <= @DataHoraTermino)'
      '           AND (Reservas.DataHoraInicio >= @DataHoraInicio)))'
      '         AND (Reservas.Cancelada = '#39'N'#39')) IS NULL'
      'UNION'
      'SELECT Veiculos.CodigoMVA, Veiculos.Placa'
      'FROM Veiculos'
      
        'LEFT OUTER JOIN VeiculosModelos ON Veiculos.CodigoModelo = Veicu' +
        'losModelos.CodigoModelo'
      
        'LEFT OUTER JOIN EmpresaUnidades ON Veiculos.CodigoEmpresa = Empr' +
        'esaUnidades.CodigoEmpresa AND Veiculos.CodigoUnidade = EmpresaUn' +
        'idades.CodigoUnidade'
      
        'LEFT OUTER JOIN VeiculosGrupos ON VeiculosModelos.CodigoGrupoVei' +
        'culo = VeiculosGrupos.CodigoGrupo'
      
        'LEFT OUTER JOIN Contratos ON Veiculos.CodigoMVA = Contratos.Codi' +
        'goMVA'
      'WHERE (Veiculos.Status = '#39'A'#39')'
      '  AND (Veiculos.CodigoEmpresa = @CodigoEmpresa)'
      '  AND (Veiculos.CodigoUnidade = @CodigoUnidade)'
      '  AND (VeiculosGrupos.CodigoGrupo = @CodigoGrupo)'
      '  AND (SELECT Max(Reservas.CodigoReserva)'
      '       FROM Reservas'
      
        '       INNER JOIN Empresa ON Reservas.CodigoEmpresa = Empresa.Co' +
        'digoEmpresa'
      
        '       LEFT OUTER JOIN Contratos ON Reservas.CodigoReserva = Con' +
        'tratos.CodigoReserva'
      '       WHERE (Contratos.CodigoReserva IS NULL)'
      '         AND (Reservas.CodigoMVA = Veiculos.CodigoMVA)'
      '         AND (((Reservas.DataHoraInicio <= @DataHoraInicio)'
      '           AND (Reservas.DataHoraTermino >= @DataHoraInicio))'
      '           OR ((Reservas.DataHoraInicio <= @DataHoraTermino)'
      '           AND (Reservas.DataHoraInicio >= @DataHoraInicio)))'
      '         AND (Reservas.Cancelada = '#39'N'#39')) IS NULL'
      '  AND (SELECT Max(Contratos_1.CodigoContrato)'
      '       FROM Contratos AS Contratos_1'
      
        '       INNER JOIN Empresa AS Empresa_1 ON Contratos_1.CodigoEmpr' +
        'esa = Empresa_1.CodigoEmpresa'
      '       WHERE (Contratos_1.CodigoMVA = Veiculos.CodigoMVA)'
      '         AND (((Contratos_1.DataHoraInicio <= @DataHoraInicio'
      '           AND (Contratos_1.DataHoraTermino >= @DataHoraInicio))'
      '           OR ((Contratos_1.DataHoraInicio <= @DataHoraTermino)'
      
        '           AND (Contratos_1.DataHoraInicio >= @DataHoraInicio)))' +
        ')) IS NULL'
      '  AND (SELECT Max(Contratos_1.CodigoContrato)'
      '       FROM Contratos AS Contratos_1'
      
        '       LEFT JOIN ContratosGrupos ON Contratos_1.CodigoGrupoContr' +
        'atos = ContratosGrupos.CodigoGrupoContratos'
      
        '       INNER JOIN Empresa AS Empresa_1 ON Contratos_1.CodigoEmpr' +
        'esa = Empresa_1.CodigoEmpresa'
      '       WHERE (Contratos_1.CodigoMVA = Veiculos.CodigoMVA)'
      
        '         AND (((ContratosGrupos.DataInicioContrato <= @DataHoraI' +
        'nicio'
      
        '           AND (ContratosGrupos.DataTerminoContrato >= @DataHora' +
        'Inicio))'
      
        '           OR ((ContratosGrupos.DataInicioContrato <= @DataHoraT' +
        'ermino)'
      
        '           AND (ContratosGrupos.DataInicioContrato >= @DataHoraI' +
        'nicio))))) IS NULL'
      'UNION'
      'SELECT Veiculos.CodigoMVA, Veiculos.Placa'
      'FROM Veiculos'
      
        'LEFT OUTER JOIN VeiculosModelos ON Veiculos.CodigoModelo = Veicu' +
        'losModelos.CodigoModelo'
      
        'LEFT OUTER JOIN EmpresaUnidades ON Veiculos.CodigoEmpresa = Empr' +
        'esaUnidades.CodigoEmpresa AND Veiculos.CodigoUnidade = EmpresaUn' +
        'idades.CodigoUnidade'
      
        'LEFT OUTER JOIN VeiculosGrupos ON VeiculosModelos.CodigoGrupoVei' +
        'culo = VeiculosGrupos.CodigoGrupo'
      'WHERE (Veiculos.Status = '#39'E'#39')'
      '  AND (Veiculos.CodigoEmpresa = @CodigoEmpresa)'
      '  AND (Veiculos.CodigoUnidade = @CodigoUnidade)'
      '  AND (VeiculosGrupos.CodigoGrupo = @CodigoGrupo)'
      '  AND (SELECT Max(Reservas.CodigoReserva)'
      '       FROM Reservas'
      
        '       INNER JOIN Empresa ON Reservas.CodigoEmpresa = Empresa.Co' +
        'digoEmpresa'
      
        '       LEFT OUTER JOIN Contratos ON Reservas.CodigoReserva = Con' +
        'tratos.CodigoReserva'
      '       WHERE (Contratos.CodigoReserva IS NULL)'
      '         AND (Reservas.CodigoMVA = Veiculos.CodigoMVA)'
      '         AND (((Reservas.DataHoraInicio <= @DataHoraInicio)'
      '           AND (Reservas.DataHoraTermino >= @DataHoraInicio))'
      '           OR ((Reservas.DataHoraInicio <= @DataHoraTermino)'
      '           AND (Reservas.DataHoraInicio >= @DataHoraInicio)))'
      '           AND (Reservas.Cancelada = '#39'N'#39')) IS NULL'
      '  AND (SELECT Max(OS.CodigoOS)'
      '       FROM OS'
      
        '       INNER JOIN Empresa ON OS.CodigoEmpresa = Empresa.CodigoEm' +
        'presa'
      '       WHERE (OS.CodigoMVA = Veiculos.CodigoMVA)'
      '         AND (OS.Cancelada = '#39'N'#39')'
      '         AND (((OS.DataAbertura <= @DataHoraInicio)'
      '           AND (OS.DataPrevFecham >= @DataHoraInicio))'
      '           OR ((OS.DataAbertura <= @DataHoraTermino)'
      '           AND (OS.DataAbertura >= @DataHoraInicio)))) IS NULL'
      'ORDER BY CodigoMVA, Placa'
      '')
    UserID = 0
    ControlConnection = adcControle
    Left = 177
    Top = 364
    object qryValidaVeiculosDisponiveisCodigoMVA: TIntegerField
      FieldName = 'CodigoMVA'
    end
    object qryValidaVeiculosDisponiveisPlaca: TWideStringField
      FieldName = 'Placa'
      Size = 7
    end
  end
  object qryProximoCodigoReserva: TQueryPlus
    Connection = adcControle
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select NomeTabela, ProximoCodigo'
      'FROM ProximoCodigo'
      'WHERE (NomeTabela = '#39'Reservas'#39')')
    UserID = 0
    ControlConnection = adcControle
    Left = 320
    Top = 363
    object qryProximoCodigoReservaNomeTabela: TWideStringField
      FieldName = 'NomeTabela'
      Size = 35
    end
    object qryProximoCodigoReservaProximoCodigo: TIntegerField
      FieldName = 'ProximoCodigo'
    end
  end
  object qryReserva: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoUnidade'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoCliente'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoTarifaVeiculo'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoGrupoVeiculos'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DataInicio'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DataTermino'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Reservas'
      'WHERE (CodigoEmpresa = :CodigoEmpresa)'
      '  AND (CodigoUnidade = :CodigoUnidade)'
      '  AND (CodigoCliente = :CodigoCliente)'
      '  AND (CodigoTarifaVeiculo = :CodigoTarifaVeiculo)'
      '  AND (CodigoGrupoVeiculos = :CodigoGrupoVeiculos)'
      '  AND (DataInicio = :DataInicio)'
      '  AND (DataTermino = :DataTermino)'
      
        '  AND (dbo.fn_RemoveHora(InseridoEm) = dbo.fn_RemoveHora(GETDATE' +
        '()))'
      'ORDER BY CodigoReserva DESC')
    UserID = 0
    ControlConnection = adcControle
    Left = 420
    Top = 361
    object qryReservaCodigoReserva: TIntegerField
      FieldName = 'CodigoReserva'
    end
  end
  object qryServicoAdicionais: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoServicoAdicional'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT CodigoServicoAdicional, Descricao, Valor, CalculoPorDiari' +
        'as, Permanente'
      'FROM ServicoAdicional'
      'WHERE (CodigoServicoAdicional = :CodigoServicoAdicional)')
    UserID = 0
    ControlConnection = adcControle
    Left = 449
    Top = 302
    object qryServicoAdicionaisCodigoServicoAdicional: TIntegerField
      FieldName = 'CodigoServicoAdicional'
    end
    object qryServicoAdicionaisDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object qryServicoAdicionaisValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
    end
    object qryServicoAdicionaisCalculoPorDiarias: TStringField
      FieldName = 'CalculoPorDiarias'
      Size = 1
    end
    object qryServicoAdicionaisPermanente: TStringField
      FieldName = 'Permanente'
      Size = 1
    end
  end
  object qryProtecoes: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Protecao')
    UserID = 0
    ControlConnection = adcControle
    Left = 51
    Top = 418
    object qryProtecoesCodigoProtecao: TIntegerField
      FieldName = 'CodigoProtecao'
    end
    object qryProtecoesNomeProtecao: TStringField
      FieldName = 'NomeProtecao'
      Size = 80
    end
    object qryProtecoesCondicoes: TStringField
      FieldName = 'Condicoes'
      Size = 4000
    end
    object qryProtecoesCoberturaCasco: TStringField
      FieldName = 'CoberturaCasco'
      FixedChar = True
      Size = 1
    end
    object qryProtecoesCoberturaTerceiros: TStringField
      FieldName = 'CoberturaTerceiros'
      FixedChar = True
      Size = 1
    end
    object qryProtecoesCoberturaOcupantes: TStringField
      FieldName = 'CoberturaOcupantes'
      FixedChar = True
      Size = 1
    end
    object qryProtecoesValorCasco: TFloatField
      FieldName = 'ValorCasco'
    end
    object qryProtecoesValorTerceiros: TFloatField
      FieldName = 'ValorTerceiros'
    end
    object qryProtecoesValorOcupantes: TFloatField
      FieldName = 'ValorOcupantes'
    end
    object qryProtecoesTipoFranquia: TStringField
      FieldName = 'TipoFranquia'
      FixedChar = True
      Size = 1
    end
    object qryProtecoesInseridoPor: TIntegerField
      FieldName = 'InseridoPor'
    end
    object qryProtecoesInseridoEm: TDateTimeField
      FieldName = 'InseridoEm'
    end
    object qryProtecoesModificadoPor: TIntegerField
      FieldName = 'ModificadoPor'
    end
    object qryProtecoesModificadoEm: TDateTimeField
      FieldName = 'ModificadoEm'
    end
    object qryProtecoesTipoProtecaoReservaWeb: TStringField
      FieldName = 'TipoProtecaoReservaWeb'
      Size = 1
    end
    object qryProtecoesAtiva: TStringField
      FieldName = 'Ativa'
      Size = 1
    end
    object qryProtecoesPadraoAberturaContrato: TStringField
      FieldName = 'PadraoAberturaContrato'
      Size = 1
    end
    object qryProtecoesProtecaoYes: TStringField
      FieldName = 'ProtecaoYes'
      Size = 1
    end
    object qryProtecoesProtecaoPlus: TStringField
      FieldName = 'ProtecaoPlus'
      Size = 1
    end
    object qryProtecoesProtecaoWeb: TStringField
      FieldName = 'ProtecaoWeb'
      Size = 1
    end
    object qryProtecoesValorProtecao: TBCDField
      FieldName = 'ValorProtecao'
      Precision = 19
    end
  end
  object qryHistoricoReservas: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TOP 10 Reservas.CodigoReserva, LocalEntregaVeiculo, Reser' +
        'vas.LocalRetornoVeiculo, Reservas.CodigoEmpresa, Reservas.Codigo' +
        'Unidade,'
      
        '       Reservas.CodigoGrupoVeiculos, Reservas.CodigoProtecao, Re' +
        'servas.CodigoCliente, Reservas.TaxaServico, Reservas.ValorPeriod' +
        'oSegAd,'
      
        '       Reservas.DataInicio,  SubString(Reservas.HoraInicio,1,2) ' +
        '+ '#39':'#39'+ SubString(Reservas.HoraInicio,3,2)As HoraInicio,'
      
        '       Reservas.DataTermino, SubString(Reservas.HoraTermino,1,2)' +
        ' +'#39':'#39' + SubString(Reservas.HoraTermino,3,2)AS HoraTermino,'
      
        '       Reservas.Cancelada, VeiculosGrupos.Descricao As GrupoVeic' +
        'ulo, Reservas.CodigoTarifaVeiculo, VeiculosTarifas.PeriodoTarifa' +
        ','
      
        '       VeiculosTarifas.DescricaoTarifa, VeiculosTarifas.ValorKmR' +
        'odado, VeiculosTarifas.ValorPeriodoVeiculo, Reservas.ReservaWeb'
      'FROM Reservas'
      
        'INNER JOIN VeiculosGrupos ON Reservas.CodigoGrupoVeiculos = Veic' +
        'ulosGrupos.CodigoGrupo'
      
        'INNER JOIN VeiculosTarifas ON Reservas.CodigoTarifaVeiculo = Vei' +
        'culosTarifas.CodigoTarifaVeiculo'
      'WHERE (Reservas.CPF = '#39'72282037634'#39')'
      'ORDER BY Reservas.DataHoraInicio DESC')
    UserID = 0
    ControlConnection = adcControle
    Left = 148
    Top = 416
    object qryHistoricoReservasCodigoReserva: TIntegerField
      FieldName = 'CodigoReserva'
    end
    object qryHistoricoReservasDataInicio: TDateTimeField
      FieldName = 'DataInicio'
    end
    object qryHistoricoReservasHoraInicio: TWideStringField
      FieldName = 'HoraInicio'
      ReadOnly = True
      Size = 5
    end
    object qryHistoricoReservasDataTermino: TDateTimeField
      FieldName = 'DataTermino'
    end
    object qryHistoricoReservasHoraTermino: TWideStringField
      FieldName = 'HoraTermino'
      ReadOnly = True
      Size = 5
    end
    object qryHistoricoReservasGrupoVeiculo: TWideStringField
      FieldName = 'GrupoVeiculo'
      Size = 100
    end
    object qryHistoricoReservasCancelada: TStringField
      FieldName = 'Cancelada'
      ReadOnly = True
      Size = 3
    end
    object qryHistoricoReservasLocalEntregaVeiculo: TWideStringField
      FieldName = 'LocalEntregaVeiculo'
      Size = 50
    end
    object qryHistoricoReservasLocalRetornoVeiculo: TWideStringField
      FieldName = 'LocalRetornoVeiculo'
      Size = 50
    end
    object qryHistoricoReservasCodigoTarifaVeiculo: TIntegerField
      FieldName = 'CodigoTarifaVeiculo'
    end
    object qryHistoricoReservasDescricaoTarifa: TWideStringField
      FieldName = 'DescricaoTarifa'
      Size = 45
    end
    object qryHistoricoReservasValorKmRodado: TBCDField
      FieldName = 'ValorKmRodado'
      Precision = 19
    end
    object qryHistoricoReservasValorPeriodoVeiculo: TBCDField
      FieldName = 'ValorPeriodoVeiculo'
      Precision = 19
    end
    object qryHistoricoReservasCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryHistoricoReservasCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryHistoricoReservasPeriodoTarifa: TSmallintField
      FieldName = 'PeriodoTarifa'
    end
    object qryHistoricoReservasCodigoGrupoVeiculos: TIntegerField
      FieldName = 'CodigoGrupoVeiculos'
    end
    object qryHistoricoReservasCodigoProtecao: TIntegerField
      FieldName = 'CodigoProtecao'
    end
    object qryHistoricoReservasCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object qryHistoricoReservasReservaWeb: TStringField
      FieldName = 'ReservaWeb'
      Size = 1
    end
    object qryHistoricoReservasTaxaServico: TFloatField
      FieldName = 'TaxaServico'
    end
    object qryHistoricoReservasValorPeriodoSegAd: TBCDField
      FieldName = 'ValorPeriodoSegAd'
      Precision = 19
    end
  end
  object qryVeiculosModelos: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoGrupo'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoEmpresa'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Descricao'
      'FROM VeiculosModelos'
      'WHERE (CodigoGrupoVeiculo = :CodigoGrupo)'
      '  AND   (CodigoEmpresa = :CodigoEmpresa)')
    UserID = 0
    ControlConnection = adcControle
    Left = 284
    Top = 412
    object qryVeiculosModelosDescricao: TWideStringField
      DisplayLabel = 'Modelos'
      FieldName = 'Descricao'
      Size = 80
    end
  end
  object qryLocalizaMunicipios: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Descricao'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'SELECT DISTINCT Descricao AS Cidade, Estado, CodigoMunicipio'
      'FROM Municipios'
      'WHERE (Descricao LIKE :Descricao)'
      'ORDER BY Descricao')
    UserID = 0
    ControlConnection = adcControle
    Left = 424
    Top = 416
    object qryLocalizaMunicipiosCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object qryLocalizaMunicipiosEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryLocalizaMunicipiosCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
  end
  object qryReservaCancelar: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoReserva'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CodigoReserva, CodigoEmpresa, CodigoUnidade, Cancelada,'
      
        '             CodigoMotivoCancelamento, CodigoUsuarioCancelamento' +
        ', '
      '             DataHoraCancelamento'
      'FROM  Reservas'
      'WHERE   (CodigoReserva = :CodigoReserva)')
    UserID = 0
    ControlConnection = adcControle
    Left = 39
    Top = 476
    object qryReservaCancelarCodigoReserva: TIntegerField
      FieldName = 'CodigoReserva'
    end
    object qryReservaCancelarCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryReservaCancelarCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryReservaCancelarCancelada: TWideStringField
      FieldName = 'Cancelada'
      Size = 1
    end
    object qryReservaCancelarCodigoMotivoCancelamento: TIntegerField
      FieldName = 'CodigoMotivoCancelamento'
    end
    object qryReservaCancelarCodigoUsuarioCancelamento: TIntegerField
      FieldName = 'CodigoUsuarioCancelamento'
    end
    object qryReservaCancelarDataHoraCancelamento: TDateTimeField
      FieldName = 'DataHoraCancelamento'
    end
  end
  object qryReservaRecuperar: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT CodigoReserva, DataHoraInicio, CPF, Email, Passaporte,'
      '       DataInicio, HoraInicio'
      'FROM Reservas'
      'WHERE (DataHoraInicio >= GetDate()) '
      '  AND (Cancelada = '#39'N'#39')'
      '  AND ((CPF = '#39'23416739884'#39') OR (Passaporte = '#39#39'))'
      'Order by DataHoraInicio ')
    UserID = 0
    ControlConnection = adcControle
    Left = 147
    Top = 476
    object qryReservaRecuperarCodigoReserva: TIntegerField
      FieldName = 'CodigoReserva'
    end
    object qryReservaRecuperarDataHoraInicio: TDateTimeField
      FieldName = 'DataHoraInicio'
    end
    object qryReservaRecuperarCPF: TWideStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryReservaRecuperarEmail: TWideStringField
      FieldName = 'Email'
      Size = 50
    end
    object qryReservaRecuperarPassaporte: TStringField
      FieldName = 'Passaporte'
    end
    object qryReservaRecuperarDataInicio: TDateTimeField
      FieldName = 'DataInicio'
    end
    object qryReservaRecuperarHoraInicio: TWideStringField
      FieldName = 'HoraInicio'
      Size = 4
    end
  end
  object qryIDUnidade: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DescricaoUnidade'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT EmpresaUnidades.CodigoEmpresa, EmpresaUnidades.CodigoUnid' +
        'ade, EmpresaUnidades.DescricaoUnidade, EmpresaUnidades.Cidade, E' +
        'mpresaUnidades.Estado,'
      
        '       EmpresaUnidades.CodigoMunicipio, EmpresaUnidades.TaxaServ' +
        'icoReservaWeb, EmpresaUnidades.HorasAntecedenciaAberturaReservaW' +
        'eb,'
      
        '       EmpresaUnidades.HorasAntecedenciaCancelamentoReservaWeb, ' +
        'Empresa.MaximoHorasExtras,'
      
        '       SubString(EmpresaUnidades.HoraInicioFuncionamentoSegSex,1' +
        ',2) + '#39':'#39' + SubString(EmpresaUnidades.HoraInicioFuncionamentoSeg' +
        'Sex,3,2)AS HoraInicioFuncionamentoSegSex,'
      
        '       SubString(EmpresaUnidades.HoraTerminoFuncionamentoSegSex,' +
        '1,2) + '#39':'#39' + SubString(EmpresaUnidades.HoraTerminoFuncionamentoS' +
        'egSex,3,2) AS HoraTerminoFuncionamentoSegSex,'
      
        '       SubString(EmpresaUnidades.HoraInicioFuncionamentoSabado,1' +
        ',2) + '#39':'#39' + SubString(EmpresaUnidades.HoraInicioFuncionamentoSab' +
        'ado,3,2) AS HoraInicioFuncionamentoSabado,'
      
        '       SubString(EmpresaUnidades.HoraTerminoFuncionamentoSabado,' +
        '1,2) + '#39':'#39' + SubString(EmpresaUnidades.HoraTerminoFuncionamentoS' +
        'abado,3,2) AS HoraTerminoFuncionamentoSabado,'
      
        '       SubString(EmpresaUnidades.HoraInicioFuncionamentoDomingo,' +
        '1,2) + '#39':'#39' + SubString(EmpresaUnidades.HoraInicioFuncionamentoDo' +
        'mingo,3,2) As HoraInicioFuncionamentoDomingo,'
      
        '       SubString(EmpresaUnidades.HoraTerminoFuncionamentoDomingo' +
        ',1,2) + '#39':'#39' + SubString(EmpresaUnidades.HoraTerminoFuncionamento' +
        'Domingo,3,2)AS HoraTerminoFuncionamentoDomingo'
      'FROM EmpresaUnidades'
      
        'INNER JOIN Empresa ON EmpresaUnidades.CodigoEmpresa = Empresa.Co' +
        'digoEmpresa'
      'WHERE (EmpresaUnidades.DescricaoUnidade = :DescricaoUnidade)')
    UserID = 0
    ControlConnection = adcControle
    Left = 276
    Top = 476
    object qryIDUnidadeCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryIDUnidadeCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryIDUnidadeDescricaoUnidade: TWideStringField
      FieldName = 'DescricaoUnidade'
      Size = 50
    end
    object qryIDUnidadeCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 35
    end
    object qryIDUnidadeEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryIDUnidadeCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
    object qryIDUnidadeTaxaServicoReservaWeb: TFloatField
      FieldName = 'TaxaServicoReservaWeb'
    end
    object qryIDUnidadeHorasAntecedenciaAberturaReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaAberturaReservaWeb'
    end
    object qryIDUnidadeHorasAntecedenciaCancelamentoReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaCancelamentoReservaWeb'
    end
    object qryIDUnidadeHoraInicioFuncionamentoSegSex: TStringField
      FieldName = 'HoraInicioFuncionamentoSegSex'
      ReadOnly = True
      Size = 5
    end
    object qryIDUnidadeHoraTerminoFuncionamentoSegSex: TStringField
      FieldName = 'HoraTerminoFuncionamentoSegSex'
      ReadOnly = True
      Size = 5
    end
    object qryIDUnidadeHoraInicioFuncionamentoSabado: TStringField
      FieldName = 'HoraInicioFuncionamentoSabado'
      ReadOnly = True
      Size = 5
    end
    object qryIDUnidadeHoraTerminoFuncionamentoSabado: TStringField
      FieldName = 'HoraTerminoFuncionamentoSabado'
      ReadOnly = True
      Size = 5
    end
    object qryIDUnidadeHoraInicioFuncionamentoDomingo: TStringField
      FieldName = 'HoraInicioFuncionamentoDomingo'
      ReadOnly = True
      Size = 5
    end
    object qryIDUnidadeHoraTerminoFuncionamentoDomingo: TStringField
      FieldName = 'HoraTerminoFuncionamentoDomingo'
      ReadOnly = True
      Size = 5
    end
    object qryIDUnidadeMaximoHorasExtras: TIntegerField
      FieldName = 'MaximoHorasExtras'
    end
  end
  object qryListaUnidades: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT CodigoEmpresa, CodigoUnidade, DescricaoUnidade, Cnpj, Log' +
        'radouro, Numero, Complemento, Cep,'
      
        '       Bairro, Cidade, Estado, Telefone1, Telefone2, Email, Raza' +
        'oSocial,'
      
        '       SubString(HoraInicioFuncionamentoSegSex,1,2) + '#39':'#39' + SubS' +
        'tring(HoraInicioFuncionamentoSegSex,3,2)AS HoraInicioFuncionamen' +
        'toSegSex,'
      
        '       SubString(HoraTerminoFuncionamentoSegSex,1,2) + '#39':'#39' + Sub' +
        'String(HoraTerminoFuncionamentoSegSex,3,2) AS HoraTerminoFuncion' +
        'amentoSegSex,'
      
        '       SubString(HoraInicioFuncionamentoSabado,1,2) + '#39':'#39' + SubS' +
        'tring(HoraInicioFuncionamentoSabado,3,2) AS HoraInicioFuncioname' +
        'ntoSabado,'
      
        '       SubString(HoraTerminoFuncionamentoSabado,1,2) + '#39':'#39' + Sub' +
        'String(HoraTerminoFuncionamentoSabado,3,2) AS HoraTerminoFuncion' +
        'amentoSabado,'
      
        '       SubString(HoraInicioFuncionamentoDomingo,1,2) + '#39':'#39' + Sub' +
        'String(HoraInicioFuncionamentoDomingo,3,2) As HoraInicioFunciona' +
        'mentoDomingo,'
      
        '       SubString(HoraTerminoFuncionamentoDomingo,1,2) + '#39':'#39' + Su' +
        'bString(HoraTerminoFuncionamentoDomingo,3,2)AS HoraTerminoFuncio' +
        'namentoDomingo,'
      
        '       HorasAntecedenciaCancelamentoReservaWeb, HorasAntecedenci' +
        'aAberturaReservaWeb'
      'FROM EmpresaUnidades'
      'WHERE (Ativa = '#39'S'#39')'
      'ORDER BY Cidade')
    UserID = 0
    ControlConnection = adcControle
    Left = 416
    Top = 476
    object qryListaUnidadesCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryListaUnidadesCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryListaUnidadesRazaoSocial: TWideStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object qryListaUnidadesDescricaoUnidade: TWideStringField
      FieldName = 'DescricaoUnidade'
      Size = 50
    end
    object qryListaUnidadesCnpj: TWideStringField
      FieldName = 'Cnpj'
      Size = 14
    end
    object qryListaUnidadesLogradouro: TWideStringField
      FieldName = 'Logradouro'
      Size = 40
    end
    object qryListaUnidadesNumero: TWideStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qryListaUnidadesComplemento: TWideStringField
      FieldName = 'Complemento'
    end
    object qryListaUnidadesCep: TWideStringField
      FieldName = 'Cep'
      Size = 8
    end
    object qryListaUnidadesBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object qryListaUnidadesCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 35
    end
    object qryListaUnidadesEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryListaUnidadesTelefone1: TStringField
      FieldName = 'Telefone1'
      Size = 11
    end
    object qryListaUnidadesTelefone2: TStringField
      FieldName = 'Telefone2'
      Size = 11
    end
    object qryListaUnidadesEmail: TWideStringField
      FieldName = 'Email'
      Size = 60
    end
    object qryListaUnidadesHoraInicioFuncionamentoSegSex: TStringField
      DisplayWidth = 5
      FieldName = 'HoraInicioFuncionamentoSegSex'
      Size = 5
    end
    object qryListaUnidadesHoraTerminoFuncionamentoSegSex: TStringField
      DisplayWidth = 5
      FieldName = 'HoraTerminoFuncionamentoSegSex'
      Size = 5
    end
    object qryListaUnidadesHoraInicioFuncionamentoSabado: TStringField
      DisplayWidth = 5
      FieldName = 'HoraInicioFuncionamentoSabado'
      Size = 5
    end
    object qryListaUnidadesHoraTerminoFuncionamentoSabado: TStringField
      DisplayWidth = 5
      FieldName = 'HoraTerminoFuncionamentoSabado'
      Size = 5
    end
    object qryListaUnidadesHoraInicioFuncionamentoDomingo: TStringField
      DisplayWidth = 5
      FieldName = 'HoraInicioFuncionamentoDomingo'
      Size = 5
    end
    object qryListaUnidadesHoraTerminoFuncionamentoDomingo: TStringField
      DisplayWidth = 5
      FieldName = 'HoraTerminoFuncionamentoDomingo'
      Size = 5
    end
    object qryListaUnidadesHorasAntecedenciaAberturaReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaAberturaReservaWeb'
    end
    object qryListaUnidadesHorasAntecedenciaCancelamentoReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaCancelamentoReservaWeb'
    end
  end
  object qryValidaFeriados: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoUnidade'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT DATEPART(day, Data)As Dia, DATEPART(month, Data)As Mes, D' +
        'escricao As Motivo'
      'FROM Feriados'
      'WHERE (Data >= getdate())'
      '  AND (CodigoEmpresa = :CodigoEmpresa)'
      '  AND (CodigoUnidade = :CodigoUnidade)')
    UserID = 0
    ControlConnection = adcControle
    Left = 521
    Top = 122
    object qryValidaFeriadosDia: TIntegerField
      FieldName = 'Dia'
      ReadOnly = True
    end
    object qryValidaFeriadosMes: TIntegerField
      FieldName = 'Mes'
      ReadOnly = True
    end
    object qryValidaFeriadosMotivo: TStringField
      FieldName = 'Motivo'
      Size = 30
    end
  end
  object qryPromocao: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Promo'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @promo INT;'
      'SET @promo = :Promo;'
      ' '
      'SELECT TOP 1  CodigoGrupo, PromoInicio, PromoTermino'
      'FROM VeiculosTarifas'
      
        'WHERE (PromoInicio BETWEEN 1 AND @promo)AND (Promotermino >= @pr' +
        'omo)'
      '  AND (Ativa = '#39'S'#39')'
      '  AND (ReservaWeb = '#39'S'#39')')
    UserID = 0
    ControlConnection = adcControle
    Left = 516
    Top = 232
    object qryPromocaoCodigoGrupo: TIntegerField
      FieldName = 'CodigoGrupo'
    end
    object qryPromocaoPromoInicio: TIntegerField
      FieldName = 'PromoInicio'
    end
    object qryPromocaoPromoTermino: TIntegerField
      FieldName = 'PromoTermino'
    end
  end
  object qryGravaCliente: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Clientes.*'
      'FROM Clientes'
      'WHERE (CodigoCliente = 0)')
    TableName = 'Clientes'
    UserID = 0
    ControlConnection = adcControle
    Left = 140
    Top = 119
    object qryGravaClienteCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object qryGravaClienteRazaoSocial: TWideStringField
      FieldName = 'RazaoSocial'
      Size = 80
    end
    object qryGravaClienteCodigoEmpresa: TSmallintField
      FieldName = 'CodigoEmpresa'
    end
    object qryGravaClienteCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryGravaClienteNomeFantasia: TWideStringField
      FieldName = 'NomeFantasia'
      Size = 80
    end
    object qryGravaClienteTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qryGravaClienteCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object qryGravaClienteInscricaoEstadual: TWideStringField
      FieldName = 'InscricaoEstadual'
    end
    object qryGravaClienteCPF: TWideStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryGravaClienteIdentidade: TWideStringField
      FieldName = 'Identidade'
      Size = 13
    end
    object qryGravaClienteComplemento: TWideStringField
      FieldName = 'Complemento'
      Size = 30
    end
    object qryGravaClienteNumero: TIntegerField
      FieldName = 'Numero'
    end
    object qryGravaClienteLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 120
    end
    object qryGravaClienteCep: TWideStringField
      FieldName = 'Cep'
      Size = 8
    end
    object qryGravaClienteBairro: TStringField
      FieldName = 'Bairro'
      Size = 80
    end
    object qryGravaClienteCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 35
    end
    object qryGravaClienteCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
    object qryGravaClienteEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryGravaClienteCodigoPais: TIntegerField
      FieldName = 'CodigoPais'
    end
    object qryGravaClienteTelefone: TStringField
      FieldName = 'Telefone'
      Size = 11
    end
    object qryGravaClienteFax: TStringField
      FieldName = 'Fax'
      Size = 11
    end
    object qryGravaClienteEmail: TWideStringField
      FieldName = 'Email'
      Size = 50
    end
    object qryGravaClienteCodigoClienteAreaAtuacao: TIntegerField
      FieldName = 'CodigoClienteAreaAtuacao'
    end
    object qryGravaClienteHomePage: TWideStringField
      FieldName = 'HomePage'
      Size = 50
    end
    object qryGravaClienteLogradouroCobranca: TWideStringField
      FieldName = 'LogradouroCobranca'
      Size = 40
    end
    object qryGravaClienteComplementoCobranca: TWideStringField
      FieldName = 'ComplementoCobranca'
      Size = 30
    end
    object qryGravaClienteNumeroCobranca: TIntegerField
      FieldName = 'NumeroCobranca'
    end
    object qryGravaClienteCepCobranca: TWideStringField
      FieldName = 'CepCobranca'
      Size = 8
    end
    object qryGravaClienteBairroCobranca: TWideStringField
      FieldName = 'BairroCobranca'
      Size = 30
    end
    object qryGravaClienteCidadeCobranca: TWideStringField
      FieldName = 'CidadeCobranca'
      Size = 35
    end
    object qryGravaClienteCodigoMunicipioCobranca: TIntegerField
      FieldName = 'CodigoMunicipioCobranca'
    end
    object qryGravaClienteEstadoCobranca: TWideStringField
      FieldName = 'EstadoCobranca'
      Size = 2
    end
    object qryGravaClienteCodigoPaisCobranca: TIntegerField
      FieldName = 'CodigoPaisCobranca'
    end
    object qryGravaClienteTelefoneCobranca: TStringField
      FieldName = 'TelefoneCobranca'
      Size = 11
    end
    object qryGravaClienteFaxCobranca: TStringField
      FieldName = 'FaxCobranca'
      Size = 11
    end
    object qryGravaClienteNomeEmpresaCobranca: TWideStringField
      FieldName = 'NomeEmpresaCobranca'
      Size = 80
    end
    object qryGravaClienteProfissaoFuncao: TWideStringField
      FieldName = 'ProfissaoFuncao'
    end
    object qryGravaClienteDataNascimento: TDateTimeField
      FieldName = 'DataNascimento'
    end
    object qryGravaClienteClassificacao: TWideStringField
      FieldName = 'Classificacao'
      Size = 1
    end
    object qryGravaClienteCodigoUsuarioPromotor: TIntegerField
      FieldName = 'CodigoUsuarioPromotor'
    end
    object qryGravaClienteCodigoFormaPagamento: TIntegerField
      FieldName = 'CodigoFormaPagamento'
    end
    object qryGravaClienteAprovadoPor: TIntegerField
      FieldName = 'AprovadoPor'
    end
    object qryGravaClientePercPromotora: TFloatField
      FieldName = 'PercPromotora'
    end
    object qryGravaClientePercDesconto: TFloatField
      FieldName = 'PercDesconto'
    end
    object qryGravaClienteKmLivre: TWideStringField
      FieldName = 'KmLivre'
      Size = 1
    end
    object qryGravaClienteFranquiaKm: TIntegerField
      FieldName = 'FranquiaKm'
    end
    object qryGravaClienteObservacoes: TWideMemoField
      FieldName = 'Observacoes'
      BlobType = ftWideMemo
    end
    object qryGravaClienteOrgaoEmissorIdentidade: TWideStringField
      FieldName = 'OrgaoEmissorIdentidade'
      Size = 8
    end
    object qryGravaClientePassaporte: TStringField
      FieldName = 'Passaporte'
    end
    object qryGravaClienteNomeRefPessoal: TWideStringField
      FieldName = 'NomeRefPessoal'
      Size = 30
    end
    object qryGravaClienteTelefoneRefPessoal: TStringField
      FieldName = 'TelefoneRefPessoal'
      Size = 11
    end
    object qryGravaClienteNomeRefComercial: TWideStringField
      FieldName = 'NomeRefComercial'
      Size = 30
    end
    object qryGravaClienteTelefoneRefComercial: TStringField
      FieldName = 'TelefoneRefComercial'
      Size = 11
    end
    object qryGravaClienteChecPesFaladoCom: TWideStringField
      FieldName = 'ChecPesFaladoCom'
    end
    object qryGravaClienteChecPesGrauFaladoCom: TWideStringField
      FieldName = 'ChecPesGrauFaladoCom'
      Size = 15
    end
    object qryGravaClienteChecComFaladoCom: TWideStringField
      FieldName = 'ChecComFaladoCom'
    end
    object qryGravaClienteChecComCargoFaladoCom: TWideStringField
      FieldName = 'ChecComCargoFaladoCom'
      Size = 15
    end
    object qryGravaClienteChecInformouQue: TWideMemoField
      FieldName = 'ChecInformouQue'
      BlobType = ftWideMemo
    end
    object qryGravaClienteChecResponsavelPor: TIntegerField
      FieldName = 'ChecResponsavelPor'
    end
    object qryGravaClienteSituacao: TWideStringField
      FieldName = 'Situacao'
      Size = 1
    end
    object qryGravaClienteCodigoFornecedorLink: TIntegerField
      FieldName = 'CodigoFornecedorLink'
    end
    object qryGravaClienteNotas: TWideMemoField
      FieldName = 'Notas'
      BlobType = ftWideMemo
    end
    object qryGravaClienteRetencaoPIS: TWideStringField
      FieldName = 'RetencaoPIS'
      Size = 1
    end
    object qryGravaClientePercentualPIS: TFloatField
      FieldName = 'PercentualPIS'
    end
    object qryGravaClienteRetencaoCofins: TWideStringField
      FieldName = 'RetencaoCofins'
      Size = 1
    end
    object qryGravaClientePercentualCofins: TFloatField
      FieldName = 'PercentualCofins'
    end
    object qryGravaClienteRetencaoContribuicaoSocial: TWideStringField
      FieldName = 'RetencaoContribuicaoSocial'
      Size = 1
    end
    object qryGravaClientePercentualContribuicaoSocial: TFloatField
      FieldName = 'PercentualContribuicaoSocial'
    end
    object qryGravaClienteRetencaoIR: TWideStringField
      FieldName = 'RetencaoIR'
      Size = 1
    end
    object qryGravaClientePercentualIR: TFloatField
      FieldName = 'PercentualIR'
    end
    object qryGravaClienteRetencaoINSS: TWideStringField
      FieldName = 'RetencaoINSS'
      Size = 1
    end
    object qryGravaClientePercentualINSS: TFloatField
      FieldName = 'PercentualINSS'
    end
    object qryGravaClienteRetencaoISS: TWideStringField
      FieldName = 'RetencaoISS'
      Size = 1
    end
    object qryGravaClienteTipoRetencaoISS: TWideStringField
      FieldName = 'TipoRetencaoISS'
      Size = 1
    end
    object qryGravaClientePercentualISS: TFloatField
      FieldName = 'PercentualISS'
    end
    object qryGravaClienteTipoFaturaDocumento: TWideStringField
      FieldName = 'TipoFaturaDocumento'
      Size = 1
    end
    object qryGravaClienteTipoFaturaLocacao: TWideStringField
      FieldName = 'TipoFaturaLocacao'
      Size = 1
    end
    object qryGravaClienteTipoFaturaDespesas: TWideStringField
      FieldName = 'TipoFaturaDespesas'
      Size = 1
    end
    object qryGravaClienteTipoRetencaoImpostos: TWideStringField
      FieldName = 'TipoRetencaoImpostos'
      Size = 1
    end
    object qryGravaClienteCodigoAntigo: TWideStringField
      FieldName = 'CodigoAntigo'
      Size = 8
    end
    object qryGravaClienteInseridoPor: TIntegerField
      FieldName = 'InseridoPor'
    end
    object qryGravaClienteInseridoEm: TDateTimeField
      FieldName = 'InseridoEm'
    end
    object qryGravaClienteModificadoPor: TIntegerField
      FieldName = 'ModificadoPor'
    end
    object qryGravaClienteModificadoEm: TDateTimeField
      FieldName = 'ModificadoEm'
    end
    object qryGravaClienteCodigoTipoMarketing: TIntegerField
      FieldName = 'CodigoTipoMarketing'
    end
    object qryGravaClienteCodigoSubTipoMarketing: TIntegerField
      FieldName = 'CodigoSubTipoMarketing'
    end
    object qryGravaClienteComplementoMarketing: TWideStringField
      FieldName = 'ComplementoMarketing'
      Size = 30
    end
    object qryGravaClienteCodigoUsuarioResponsavel: TIntegerField
      FieldName = 'CodigoUsuarioResponsavel'
    end
    object qryGravaClienteCodigoMotivoBloqueio: TIntegerField
      FieldName = 'CodigoMotivoBloqueio'
    end
    object qryGravaClienteBloqueadoPor: TIntegerField
      FieldName = 'BloqueadoPor'
    end
    object qryGravaClienteCelular: TStringField
      FieldName = 'Celular'
      Size = 11
    end
    object qryGravaClienteNumeroCartaoFidelidade: TIntegerField
      FieldName = 'NumeroCartaoFidelidade'
    end
    object qryGravaClienteSaldoCartaoFidelidade: TIntegerField
      FieldName = 'SaldoCartaoFidelidade'
    end
    object qryGravaClienteDataFidelizacao: TDateTimeField
      FieldName = 'DataFidelizacao'
    end
    object qryGravaClienteDataHoraExportacao: TDateTimeField
      FieldName = 'DataHoraExportacao'
    end
    object qryGravaClienteCodigoPlanoContas: TIntegerField
      FieldName = 'CodigoPlanoContas'
    end
    object qryGravaClienteSexo: TWideStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object qryGravaClienteProtestarAutomaticamente: TWideStringField
      FieldName = 'ProtestarAutomaticamente'
      Size = 1
    end
    object qryGravaClienteCodigoInterno: TIntegerField
      FieldName = 'CodigoInterno'
    end
    object qryGravaClienteCodigoCentroCusto: TIntegerField
      FieldName = 'CodigoCentroCusto'
    end
    object qryGravaClienteCodigoCondutorLink: TIntegerField
      FieldName = 'CodigoCondutorLink'
    end
    object qryGravaClienteLongitude: TStringField
      FieldName = 'Longitude'
      Size = 30
    end
    object qryGravaClienteLatitude: TStringField
      FieldName = 'Latitude'
      Size = 30
    end
    object qryGravaClienteTaxaAdministrativaMultas: TFloatField
      FieldName = 'TaxaAdministrativaMultas'
    end
    object qryGravaClienteSuframa: TStringField
      FieldName = 'Suframa'
      FixedChar = True
      Size = 9
    end
    object qryGravaClienteEstrangeiro: TStringField
      FieldName = 'Estrangeiro'
      Size = 1
    end
    object qryGravaClienteCodigoBanco: TIntegerField
      FieldName = 'CodigoBanco'
    end
    object qryGravaClienteAgencia: TIntegerField
      FieldName = 'Agencia'
    end
    object qryGravaClienteConta: TIntegerField
      FieldName = 'Conta'
    end
    object qryGravaClienteTipoConta: TStringField
      FieldName = 'TipoConta'
      Size = 1
    end
    object qryGravaClienteDescreverImpostosFatura: TStringField
      FieldName = 'DescreverImpostosFatura'
      Size = 1
    end
    object qryGravaClienteTipoFaturaCombustivel: TStringField
      FieldName = 'TipoFaturaCombustivel'
      Size = 10
    end
    object qryGravaClienteTipoCliente: TStringField
      FieldName = 'TipoCliente'
      Size = 1
    end
    object qryGravaClienteCodigoConsultaMVR: TIntegerField
      FieldName = 'CodigoConsultaMVR'
    end
    object qryGravaClienteEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
    end
    object qryGravaClienteNomeEmpresaTrabalho: TStringField
      FieldName = 'NomeEmpresaTrabalho'
      Size = 80
    end
    object qryGravaClienteCepTrabalho: TStringField
      FieldName = 'CepTrabalho'
      Size = 8
    end
    object qryGravaClienteLogradouroTrabalho: TStringField
      FieldName = 'LogradouroTrabalho'
      Size = 120
    end
    object qryGravaClienteNumeroTrabalho: TIntegerField
      FieldName = 'NumeroTrabalho'
    end
    object qryGravaClienteComplementoTrabalho: TStringField
      FieldName = 'ComplementoTrabalho'
      Size = 30
    end
    object qryGravaClienteBairroTrabalho: TStringField
      FieldName = 'BairroTrabalho'
      Size = 30
    end
    object qryGravaClienteCidadeTrabalho: TStringField
      FieldName = 'CidadeTrabalho'
      Size = 35
    end
    object qryGravaClienteEstadoTrabalho: TStringField
      FieldName = 'EstadoTrabalho'
      Size = 2
    end
    object qryGravaClienteCodigoPaisTrabalho: TIntegerField
      FieldName = 'CodigoPaisTrabalho'
    end
    object qryGravaClienteTelefoneTrabalho: TStringField
      FieldName = 'TelefoneTrabalho'
      Size = 11
    end
    object qryGravaClienteFaxTrabalho: TStringField
      FieldName = 'FaxTrabalho'
      Size = 11
    end
    object qryGravaClienteCodigoCargoTrabalho: TIntegerField
      FieldName = 'CodigoCargoTrabalho'
    end
    object qryGravaClienteTempoTrabalho: TIntegerField
      FieldName = 'TempoTrabalho'
    end
    object qryGravaClienteSalarioTrabalho: TFloatField
      FieldName = 'SalarioTrabalho'
    end
    object qryGravaClienteZipCode: TIntegerField
      FieldName = 'ZipCode'
    end
    object qryGravaClienteInstituicaoGovernamental: TWideStringField
      FieldName = 'InstituicaoGovernamental'
      Size = 1
    end
    object qryGravaClienteCodigoLoteBenner: TIntegerField
      FieldName = 'CodigoLoteBenner'
    end
    object qryGravaClienteTaxaAdministrativaMulta: TFloatField
      FieldName = 'TaxaAdministrativaMulta'
    end
    object qryGravaClienteValorTaxaAdministrativaMulta: TBCDField
      FieldName = 'ValorTaxaAdministrativaMulta'
      Precision = 19
    end
    object qryGravaClienteTipoTaxaAdministrativaMulta: TStringField
      FieldName = 'TipoTaxaAdministrativaMulta'
      Size = 1
    end
    object qryGravaClienteFuncionarioGrupo: TStringField
      FieldName = 'FuncionarioGrupo'
      Size = 1
    end
    object qryGravaClienteCorretor: TStringField
      FieldName = 'Corretor'
      Size = 1
    end
    object qryGravaClienteDataEmissaoIdentidade: TDateTimeField
      FieldName = 'DataEmissaoIdentidade'
    end
    object qryGravaClienteFumante: TStringField
      FieldName = 'Fumante'
      Size = 1
    end
    object qryGravaClienteInscricaoMunicipal: TStringField
      FieldName = 'InscricaoMunicipal'
    end
    object qryGravaClienteEmailSecundario: TStringField
      FieldName = 'EmailSecundario'
      Size = 50
    end
    object qryGravaClienteFotografia: TBlobField
      FieldName = 'Fotografia'
    end
    object qryGravaClienteTaxaAdministrativaAvaria: TFloatField
      FieldName = 'TaxaAdministrativaAvaria'
    end
    object qryGravaClienteValorTaxaAdministrativaAvaria: TBCDField
      FieldName = 'ValorTaxaAdministrativaAvaria'
      Precision = 19
    end
    object qryGravaClienteTipoTaxaAdministrativaAvaria: TStringField
      FieldName = 'TipoTaxaAdministrativaAvaria'
      Size = 1
    end
  end
  object IdHTTPCL: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 476
    Top = 12
  end
  object qryVeiculosTarifa: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoEmpresa'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @CodigoEmpresa INT;'
      'DECLARE @CodigoUnidade INT;'
      'DECLARE @Periodo INT;'
      'DECLARE @TodasTarifas INT;'
      ''
      'SET @CodigoEmpresa = :CodigoEmpresa;'
      'SET @CodigoUnidade = :CodigoUnidade;'
      'SET @Periodo = :Periodo;'
      'SET @TodasTarifas = :TodasTarifas;'
      'SELECT PeriodoTarifa,* FROM VeiculosTarifas'
      #9'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      
        #9#9'  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39')' +
        ')'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      
        #9#9'  AND (VeiculosTarifas.PeriodoTarifa = (SELECT Max(PeriodoTari' +
        'fa) FROM VeiculosTarifas'
      #9'WHERE (VeiculosTarifas.CodigoEmpresa = @CodigoEmpresa)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = @CodigoUnidade)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  <= @Periodo)'
      
        #9#9'  AND ((@TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39')' +
        ')'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')))')
    UserID = 0
    ControlConnection = adcControle
    Left = 516
    Top = 364
  end
end
