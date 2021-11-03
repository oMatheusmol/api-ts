object ServerMetodos: TServerMetodos
  OldCreateOrder = False
  Height = 651
  Width = 558
  object adcBancoDados: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 44
    Top = 16
  end
  object adcControle: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 122
    Top = 16
  end
  object qryCidades: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT  Municipios.Descricao AS Cidade,'
      '        Municipios.Estado,'
      '        Municipios.CodigoMunicipio,'
      '        EmpresaUnidades.DescricaoUnidade,'
      '        EmpresaUnidades.CNPJ,'
      '        EmpresaUnidades.CodigoEmpresa,'
      '        EmpresaUnidades.CodigoUnidade,'
      '        UnidadesCidadeAtendimento.ValorTaxaEntrega,'
      '        UnidadesCidadeAtendimento.ValorTaxaDevolucao,'
      '        UnidadesCidadeAtendimento.PercTaxaAdministrativa,'
      '        UnidadesCidadeAtendimento.SobConsulta,'
      '        UnidadesCidadeAtendimento.CodigoTipoDiversoTaxaEntrega,'
      '        UnidadesCidadeAtendimento.CodigoTipoDiversoTaxaDevolucao'
      'FROM UnidadesCidadeAtendimento'
      
        'INNER JOIN Municipios ON UnidadesCidadeAtendimento.CodigoMunicip' +
        'io = Municipios.CodigoMunicipio'
      
        'INNER JOIN EmpresaUnidades ON UnidadesCidadeAtendimento.CodigoUn' +
        'idade = EmpresaUnidades.CodigoUnidade AND'
      
        #9#9#9#9#9#9#9'  UnidadesCidadeAtendimento.CodigoEmpresa = EmpresaUnidad' +
        'es.CodigoEmpresa'
      
        'INNER JOIN Empresa ON EmpresaUnidades.CodigoEmpresa = Empresa.Co' +
        'digoEmpresa'
      'WHERE (EmpresaUnidades.Ativa = '#39'S'#39')'
      'ORDER BY Municipios.Descricao'
      '')
    UserID = 0
    ControlConnection = adcControle
    Left = 187
    Top = 16
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
    object qryCidadesDescricaoUnidade: TWideStringField
      FieldName = 'DescricaoUnidade'
      Size = 50
    end
    object qryCidadesCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryCidadesCodigoUnidade: TIntegerField
      FieldName = 'CodigoUnidade'
    end
    object qryCidadesCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 14
    end
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
        'e1, Email, HoraInicioFuncionamentoSegSex, UnidadesCidadeAtendime' +
        'nto.ValorTaxaEntrega,'
      
        '       HoraTerminoFuncionamentoSegSex, HoraInicioFuncionamentoSa' +
        'bado, HoraTerminoFuncionamentoSabado, EmpresaUnidades.CodigoMuni' +
        'cipio, UnidadesCidadeAtendimento.CodigoTipoDiversoTaxaEntrega, U' +
        'nidadesCidadeAtendimento.CodigoTipoDiversoTaxaDevolucao,'
      
        '       HoraInicioFuncionamentoDomingo, HoraTerminoFuncionamentoD' +
        'omingo, HorasAntecedenciaCancelamentoReservaWeb, UnidadesCidadeA' +
        'tendimento.ValorTaxaDevolucao,'
      
        '       MostrarTarifasKmLivre, ProtecaoYes, ProtecaoPlus, Percent' +
        'ualDescontoTarifaReservaWeb, HorasAntecedenciaAberturaReservaWeb' +
        ', UnidadesCidadeAtendimento.SobConsulta,'
      
        '       EmpresaUnidades.LimiteDiasAprovacaoWeb, UnidadesCidadeAte' +
        'ndimento.PercTaxaAdministrativa, Municipios.Descricao AS Municip' +
        'ioUnidade'
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
      '  AND (EmpresaUnidades.Ativa = '#39'S'#39')')
    UserID = 0
    ControlConnection = adcControle
    Left = 252
    Top = 15
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
    object qryUnidadesHoraInicioFuncionamentoSegSex: TStringField
      FieldName = 'HoraInicioFuncionamentoSegSex'
      Size = 4
    end
    object qryUnidadesValorTaxaEntrega: TBCDField
      FieldName = 'ValorTaxaEntrega'
      Precision = 19
    end
    object qryUnidadesHoraTerminoFuncionamentoSegSex: TStringField
      FieldName = 'HoraTerminoFuncionamentoSegSex'
      Size = 4
    end
    object qryUnidadesHoraInicioFuncionamentoSabado: TStringField
      FieldName = 'HoraInicioFuncionamentoSabado'
      Size = 4
    end
    object qryUnidadesHoraTerminoFuncionamentoSabado: TStringField
      FieldName = 'HoraTerminoFuncionamentoSabado'
      Size = 4
    end
    object qryUnidadesCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
    object qryUnidadesCodigoTipoDiversoTaxaEntrega: TIntegerField
      FieldName = 'CodigoTipoDiversoTaxaEntrega'
    end
    object qryUnidadesCodigoTipoDiversoTaxaDevolucao: TIntegerField
      FieldName = 'CodigoTipoDiversoTaxaDevolucao'
    end
    object qryUnidadesHoraInicioFuncionamentoDomingo: TStringField
      FieldName = 'HoraInicioFuncionamentoDomingo'
      Size = 4
    end
    object qryUnidadesHoraTerminoFuncionamentoDomingo: TStringField
      FieldName = 'HoraTerminoFuncionamentoDomingo'
      Size = 4
    end
    object qryUnidadesHorasAntecedenciaCancelamentoReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaCancelamentoReservaWeb'
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
    object qryUnidadesHorasAntecedenciaAberturaReservaWeb: TIntegerField
      FieldName = 'HorasAntecedenciaAberturaReservaWeb'
    end
    object qryUnidadesSobConsulta: TStringField
      FieldName = 'SobConsulta'
      Size = 1
    end
    object qryUnidadesLimiteDiasAprovacaoWeb: TIntegerField
      FieldName = 'LimiteDiasAprovacaoWeb'
    end
    object qryUnidadesPercTaxaAdministrativa: TFloatField
      FieldName = 'PercTaxaAdministrativa'
    end
    object qryUnidadesMunicipioUnidade: TWideStringField
      FieldName = 'MunicipioUnidade'
      Size = 100
    end
  end
  object qryGrupoVeiculos: TQueryPlus
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
      end>
    SQL.Strings = (
      'SELECT Letra + '#39' - '#39' +  Descricao As LetraDescricao,'
      '     Descricao, CodigoGrupo, Letra'
      'FROM VeiculosGrupos'
      'WHERE (CodigoEmpresa = :CodigoEmpresa)'
      '  AND ((:TodasLetras <> 0) OR (Letra = :Letra))'
      '  AND (SituacaoGrupo = '#39'A'#39')'
      'ORDER BY Letra + '#39' - '#39' +  Descricao')
    UserID = 0
    ControlConnection = adcControle
    Left = 334
    Top = 14
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
    object qryGrupoVeiculosLetra: TWideStringField
      FieldName = 'Letra'
      Size = 1
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
    Left = 442
    Top = 13
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
  object qryMenorTarifaPorGrupo: TQueryPlus
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
        DataType = ftInteger
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
        Name = 'CodigoEmpresa1'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade1'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo1'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo1'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas1'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoE'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataTerminiLocacaoE'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa5'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade5'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo5'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo5'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas5'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoE5'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataTerminiLocacaoE5'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas2'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoI'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa6'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade6'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo6'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo6'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas6'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoI6'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas4'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas3'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT MIN(ValorComDescontoDiario) ValorMinimo'
      'FROM ('
      
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
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa)'
      #9#9#9' AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade)'
      #9#9#9' AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo)'
      #9#9#9' AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9#9' AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9#9' AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9#9' AND (VeiculosTarifas.PeriodoTarifa  = :Periodo)'
      
        #9#9#9' AND ((:TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39')' +
        ')'
      #9#9#9' AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      #9#9#9' AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')'
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
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa1)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade1)'
      #9#9'  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo1)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo1)'
      
        #9#9'  AND ((:TodasTarifas1 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39 +
        '))'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      
        #9#9'  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.D' +
        'ataInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao' +
        ')'
      
        #9#9'  AND (CONVERT(DATETIME, :DataInicioLocacaoE, 103) BETWEEN  Ve' +
        'iculosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTermino' +
        'Locacao)'
      
        #9#9'  AND (CONVERT(DATETIME, :DataTerminiLocacaoE, 103) BETWEEN  V' +
        'eiculosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTermin' +
        'oLocacao)'
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
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa5)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade5)'
      #9#9'  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo5)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo5)'
      
        #9#9'  AND ((:TodasTarifas5 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39 +
        '))'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      #9#9'  AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      
        #9#9'  AND (CONVERT(DATETIME, :DataInicioLocacaoE5, 103) BETWEEN  V' +
        'eiculosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTermin' +
        'oLocacao)'
      
        #9#9'  AND (CONVERT(DATETIME, :DataTerminiLocacaoE5, 103) BETWEEN  ' +
        'VeiculosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTermi' +
        'noLocacao)'
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
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa2)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade2)'
      #9#9'  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo2)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo2)'
      
        #9#9'  AND ((:TodasTarifas2 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39 +
        '))'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')'
      
        #9#9'  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.D' +
        'ataInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao' +
        ')'
      
        #9#9'  AND (CONVERT(DATETIME, :DataInicioLocacaoI, 103) BETWEEN  Ve' +
        'iculosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTermino' +
        'Locacao)'
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
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa6)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade6)'
      #9#9'  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo6)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo6)'
      
        #9#9'  AND ((:TodasTarifas6 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39 +
        '))'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')'
      #9#9'  AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      
        #9#9'  AND (CONVERT(DATETIME, :DataInicioLocacaoI6, 103) BETWEEN  V' +
        'eiculosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTermin' +
        'oLocacao)'
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
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa4)'
      #9#9'  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade4)'
      #9#9'  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo4)'
      #9#9'  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9'  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9'  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo4)'
      
        #9#9'  AND ((:TodasTarifas4 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39 +
        '))'
      #9#9'  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')'
      
        #9#9'  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.D' +
        'ataInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao' +
        ')'
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
      #9#9'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa3)'
      #9#9#9' AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade3)'
      #9#9#9' AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo3)'
      #9#9#9' AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      #9#9#9' AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      #9#9#9' AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      #9#9#9' AND (VeiculosTarifas.PeriodoTarifa = 1)'
      #9#9#9' AND (VeiculosTarifas.DescricaoTarifa = '#39'Di'#225'ria B'#225'sica'#39')'
      
        #9#9#9' AND ((:TodasTarifas3 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39 +
        '))'
      ') AS Registros')
    UserID = 0
    ControlConnection = adcControle
    Left = 47
    Top = 78
    object qryMenorTarifaPorGrupoValorMinimo: TFloatField
      FieldName = 'ValorMinimo'
      ReadOnly = True
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
    Left = 165
    Top = 78
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
      'SELECT CodigoEmpresa, DefinirValorProtecaoPor'
      'FROM Empresa'
      'WHERE (Empresa.CodigoEmpresa = :CodigoEmpresa)')
    UserID = 0
    ControlConnection = adcControle
    Left = 280
    Top = 77
    object qryParametrosEmpresaCodigoEmpresa: TIntegerField
      FieldName = 'CodigoEmpresa'
    end
    object qryParametrosEmpresaDefinirValorProtecaoPor: TStringField
      FieldName = 'DefinirValorProtecaoPor'
      Size = 1
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
      #9#9#9#9#9#9#9'    ,:Valor)')
    UserID = 0
    ControlConnection = adcControle
    Left = 425
    Top = 76
  end
  object qryDescricaoTarifa: TQueryPlus
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
        Name = 'CodigoEmpresa1'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade1'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo1'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo1'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas1'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoE'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataTerminiLocacaoE'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa5'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade5'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo5'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo5'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas5'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoE5'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataTerminiLocacaoE5'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo2'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas2'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoI'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa6'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade6'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo6'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo6'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas6'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoI6'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo4'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas4'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas3'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.CodigoTarifaVeiculo'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa)'
      '      AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade)'
      '      AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo)'
      '      AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '      AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '      AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '      AND (VeiculosTarifas.PeriodoTarifa  = :Periodo)'
      
        '      AND ((:TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N' +
        #39'))'
      '      AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      '      AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.CodigoTarifaVeiculo'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa1)'
      '  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade1)'
      '  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo1)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo1)'
      '  AND ((:TodasTarifas1 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      
        '  AND (GETDATE()BETWEEN  VeiculosTarifas.DataInicioSolicitacao A' +
        'ND  VeiculosTarifas.DataTerminoSolicitacao)'
      
        '  AND (CONVERT(DATETIME, :DataInicioLocacaoE, 103) BETWEEN  Veic' +
        'ulosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLo' +
        'cacao)'
      
        '  AND (CONVERT(DATETIME, :DataTerminiLocacaoE, 103) BETWEEN  Vei' +
        'culosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoL' +
        'ocacao)'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.CodigoTarifaVeiculo'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa5)'
      '  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade5)'
      '  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo5)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo5)'
      '  AND ((:TodasTarifas5 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      '  AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      
        '  AND (CONVERT(DATETIME, :DataInicioLocacaoE5, 103) BETWEEN  Vei' +
        'culosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoL' +
        'ocacao)'
      
        '  AND (CONVERT(DATETIME, :DataTerminiLocacaoE5, 103) BETWEEN  Ve' +
        'iculosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTermino' +
        'Locacao)'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.CodigoTarifaVeiculo'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa2)'
      '  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade2)'
      '  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo2)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo2)'
      '  AND ((:TodasTarifas2 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')'
      
        '  AND (GETDATE()BETWEEN  VeiculosTarifas.DataInicioSolicitacao A' +
        'ND  VeiculosTarifas.DataTerminoSolicitacao)'
      
        '  AND (CONVERT(DATETIME, :DataInicioLocacaoI, 103) BETWEEN  Veic' +
        'ulosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLo' +
        'cacao)'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.CodigoTarifaVeiculo'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa6)'
      '  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade6)'
      '  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo6)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo6)'
      '  AND ((:TodasTarifas6 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')'
      '  AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      
        '  AND (CONVERT(DATETIME, :DataInicioLocacaoI6, 103) BETWEEN  Vei' +
        'culosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoL' +
        'ocacao)'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.CodigoTarifaVeiculo'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa4)'
      '  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade4)'
      '  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo4)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo4)'
      '  AND ((:TodasTarifas4 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')'
      
        '  AND (GETDATE()BETWEEN  VeiculosTarifas.DataInicioSolicitacao A' +
        'ND  VeiculosTarifas.DataTerminoSolicitacao)'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.CodigoTarifaVeiculo'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa3)'
      '      AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade3)'
      '      AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo3)'
      '      AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '      AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '      AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '      AND (VeiculosTarifas.PeriodoTarifa = 1)'
      '      AND (VeiculosTarifas.DescricaoTarifa = '#39'Di'#225'ria B'#225'sica'#39')'
      
        '      AND ((:TodasTarifas3 <> 0) OR (VeiculosTarifas.KmLivre = '#39 +
        'N'#39'))'
      'ORDER BY VeiculosTarifas.DescricaoTarifa'
      '')
    UserID = 0
    ControlConnection = adcControle
    Left = 43
    Top = 144
    object qryDescricaoTarifaDescricaoTarifa: TWideStringField
      FieldName = 'DescricaoTarifa'
      ReadOnly = True
      Size = 45
    end
    object qryDescricaoTarifaCodigoTarifaVeiculo: TIntegerField
      FieldName = 'CodigoTarifaVeiculo'
      ReadOnly = True
    end
  end
  object qryListaTarifaVeiculo: TQueryPlus
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
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      
        'WHERE (VeiculosTarifas.CodigoTarifaVeiculo = :CodigoTarifaVeicul' +
        'o)'
      '')
    UserID = 0
    ControlConnection = adcControle
    Left = 146
    Top = 143
    object qryListaTarifaVeiculoCodigoTarifaVeiculo: TIntegerField
      FieldName = 'CodigoTarifaVeiculo'
    end
    object qryListaTarifaVeiculoDescricaoTarifa: TWideStringField
      FieldName = 'DescricaoTarifa'
      Size = 45
    end
    object qryListaTarifaVeiculoPeriodoTarifa: TSmallintField
      FieldName = 'PeriodoTarifa'
    end
    object qryListaTarifaVeiculoDescricaoPeriodoTarifa: TWideStringField
      FieldName = 'DescricaoPeriodoTarifa'
      Size = 15
    end
    object qryListaTarifaVeiculoValorPeriodoVeiculo: TBCDField
      FieldName = 'ValorPeriodoVeiculo'
      Precision = 19
    end
    object qryListaTarifaVeiculoValorPeriodoSegAd: TBCDField
      FieldName = 'ValorPeriodoSegAd'
      Precision = 19
    end
    object qryListaTarifaVeiculoKmLivre: TWideStringField
      FieldName = 'KmLivre'
      Size = 1
    end
    object qryListaTarifaVeiculoValorKmRodado: TBCDField
      FieldName = 'ValorKmRodado'
      Precision = 19
    end
    object qryListaTarifaVeiculoFranquiaKmRodado: TIntegerField
      FieldName = 'FranquiaKmRodado'
    end
    object qryListaTarifaVeiculoMensal: TWideStringField
      FieldName = 'Mensal'
      Size = 1
    end
    object qryListaTarifaVeiculoTarifaNacional: TStringField
      FieldName = 'TarifaNacional'
      Size = 1
    end
    object qryListaTarifaVeiculoValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      ReadOnly = True
    end
    object qryListaTarifaVeiculoValorTarifa: TFloatField
      FieldName = 'ValorTarifa'
      ReadOnly = True
    end
    object qryListaTarifaVeiculoReservaWebPadrao: TStringField
      FieldName = 'ReservaWebPadrao'
      Size = 1
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
      'ORDER BY CodigoProtecao')
    UserID = 0
    ControlConnection = adcControle
    Left = 243
    Top = 142
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
    UserID = 0
    ControlConnection = adcControle
    Left = 344
    Top = 141
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
    object qryClienteCadastradoEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryClienteCadastradoCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 35
    end
    object qryClienteCadastradoCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
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
    Left = 451
    Top = 140
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
  object qryReservaServicoAdicional: TQueryPlus
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
      end
      item
        Name = 'CodigoServicoAdicional'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM ReservasServicosAdicionais'
      'WHERE (CodigoReserva = :CodigoReserva)'
      '  AND (CodigoServicoAdicional = :CodigoServicoAdicional)')
    UserID = 0
    ControlConnection = adcControle
    Left = 58
    Top = 206
    object qryReservaServicoAdicionalCodigoReserva: TIntegerField
      FieldName = 'CodigoReserva'
    end
    object qryReservaServicoAdicionalCodigoServicoAdicional: TIntegerField
      FieldName = 'CodigoServicoAdicional'
    end
    object qryReservaServicoAdicionalValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
    end
    object qryReservaServicoAdicionalObservacao: TWideMemoField
      FieldName = 'Observacao'
      BlobType = ftWideMemo
    end
  end
  object qryMunicipios: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Municipios')
    UserID = 0
    ControlConnection = adcControle
    Left = 164
    Top = 206
    object qryMunicipiosCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
    object qryMunicipiosDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qryMunicipiosEstado: TWideStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryMunicipiosCodigoRegiao: TIntegerField
      FieldName = 'CodigoRegiao'
    end
    object qryMunicipiosInseridoPor: TIntegerField
      FieldName = 'InseridoPor'
    end
    object qryMunicipiosInseridoEm: TDateTimeField
      FieldName = 'InseridoEm'
    end
    object qryMunicipiosModificadoPor: TIntegerField
      FieldName = 'ModificadoPor'
    end
    object qryMunicipiosModificadoEm: TDateTimeField
      FieldName = 'ModificadoEm'
    end
    object qryMunicipiosCodigoIBGE: TIntegerField
      FieldName = 'CodigoIBGE'
    end
    object qryMunicipiosCodigoMunicipioDetran: TIntegerField
      FieldName = 'CodigoMunicipioDetran'
    end
    object qryMunicipiosCodigoMunicipioBenner: TIntegerField
      FieldName = 'CodigoMunicipioBenner'
    end
  end
  object qryGravaCliente: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NomeFantasia'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'RazaoSocial'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 80
        Value = Null
      end
      item
        Name = 'CPF'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 11
        Value = Null
      end
      item
        Name = 'Email'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'Telefone'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 11
        Value = Null
      end
      item
        Name = 'Passaporte'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'CodigoEmpresa'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
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
        Name = 'Celular'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 11
        Value = Null
      end
      item
        Name = 'Sexo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'Identidade'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 13
        Value = Null
      end
      item
        Name = 'Logradouro'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'Bairro'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end
      item
        Name = 'Numero'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Complemento'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end
      item
        Name = 'Cep'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 8
        Value = Null
      end
      item
        Name = 'Estado'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'Cidade'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 35
        Value = Null
      end
      item
        Name = 'CodigoMunicipio'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO Clientes (CodigoCliente'
      '         ,NomeFantasia'
      #9#9#9#9' ,RazaoSocial'
      #9#9#9#9' ,CPF'
      #9#9#9#9' ,Email'
      #9#9#9#9' ,Telefone'
      #9#9#9#9' ,Passaporte'
      #9#9#9#9' ,CodigoEmpresa'
      #9#9#9#9' ,CodigoUnidade'
      #9#9#9#9' ,CodigoPais'
      #9#9#9#9' ,Tipo'
      #9#9#9#9' ,Situacao'
      #9#9#9#9' ,RetencaoPIS'
      #9#9#9#9' ,RetencaoCofins'
      #9#9#9#9' ,RetencaoContribuicaoSocial'
      #9#9#9#9' ,RetencaoIR'
      #9#9#9#9' ,RetencaoINSS'
      #9#9#9#9' ,RetencaoISS'
      #9#9#9#9' ,TipoFaturaDocumento'
      #9#9#9#9' ,TipoFaturaLocacao'
      #9#9#9#9' ,TipoFaturaDespesas'
      #9#9#9#9' ,TipoRetencaoImpostos'
      #9#9#9#9' ,TipoRetencaoISS'
      #9#9#9#9' ,Classificacao'
      #9#9#9#9' ,BloqueadoPor'
      '         ,Celular'
      '         ,Sexo'
      '         ,Identidade'
      '         ,Logradouro'
      '         ,Bairro'
      '         ,Numero'
      '         ,Complemento'
      '         ,Cep'
      '         ,Estado'
      '         ,Cidade'
      '         ,CodigoMunicipio'
      '         ,InseridoPor'
      '         ,InseridoEm)'
      #9#9'VALUES'
      #9#9#9#9'((SELECT MAX(CodigoCliente) +1'
      '          FROM Clientes'
      '         )'
      '         ,:NomeFantasia'
      #9#9#9#9' ,:RazaoSocial'
      #9#9#9#9' ,:CPF'
      #9#9#9#9' ,:Email'
      #9#9#9#9' ,:Telefone'
      #9#9#9#9' ,:Passaporte'
      #9#9#9#9' ,:CodigoEmpresa'
      #9#9#9#9' ,:CodigoUnidade'
      #9#9#9#9' ,1'
      #9#9#9#9' ,'#39'F'#39
      #9#9#9#9' ,'#39'C'#39
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,'#39'V'#39
      #9#9#9#9' ,'#39'J'#39
      #9#9#9#9' ,'#39'S'#39
      #9#9#9#9' ,'#39'T'#39
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      '         ,:Celular'
      '         ,:Sexo'
      '         ,:Identidade'
      '         ,:Logradouro'
      '         ,:Bairro'
      '         ,:Numero'
      '         ,:Complemento'
      '         ,:Cep'
      '         ,:Estado'
      '         ,:Cidade'
      '         ,:CodigoMunicipio'
      '         ,99'
      '         ,GETDATE())')
    TableName = 'Clientes'
    UserID = 0
    ControlConnection = adcControle
    Left = 244
    Top = 205
  end
  object qryProximoCodigoCliente: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'DECLARE @SQL VARCHAR(MAX);'
      'DECLARE @ProximoCodigo INT;'
      ''
      'SET @ProximoCodigo = (SELECT MAX(CodigoCliente) +1'
      #9#9#9#9'  FROM Clientes'
      #9#9#9#9' );'
      ''
      'SET @SQL = '#39'USE '#39' + DB_NAME() + '#39'_Controle '#39' +'
      #9'      '#39'UPDATE ProximoCodigo '#39' +'
      
        #9'      '#39'SET ProximoCodigo = '#39' + CONVERT(VARCHAR,@ProximoCodigo) ' +
        '+ '
      #9'      '#39' WHERE NomeTabela = '#39#39'Clientes'#39#39#39';'
      ''
      'EXEC(@SQL);')
    UserID = 0
    ControlConnection = adcControle
    Left = 368
    Top = 200
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
    Left = 451
    Top = 201
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
        Name = 'CodigoEmpresa1'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade1'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo1'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo1'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas1'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoE'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataTerminiLocacaoE'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa5'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade5'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo5'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo5'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas5'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoE5'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataTerminiLocacaoE5'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo2'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas2'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoI'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa6'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade6'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo6'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo6'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas6'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'DataInicioLocacaoI6'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Periodo4'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas4'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoEmpresa3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUnidade3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupo3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'TodasTarifas3'
        DataType = ftBoolean
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
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
      '       END AS ValorComDescontoDiario,'
      #9'  VeiculosTarifas.CodigoTarifaVeiculo AS ID, '
      #9'  VeiculosTarifas.DescricaoPeriodoTarifa,'
      #9'  VeiculosTarifas.ValorPeriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa)'
      '      AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade)'
      '      AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo)'
      '      AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '      AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '      AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '      AND (VeiculosTarifas.PeriodoTarifa  = :Periodo)'
      
        '      AND ((:TodasTarifas <> 0) OR (VeiculosTarifas.KmLivre = '#39'N' +
        #39'))'
      '      AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      '      AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
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
      '       END AS ValorComDescontoDiario,'
      #9'  VeiculosTarifas.CodigoTarifaVeiculo AS ID, '
      #9'  VeiculosTarifas.DescricaoPeriodoTarifa,'
      #9'  VeiculosTarifas.ValorPeriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa1)'
      '  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade1)'
      '  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo1)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo1)'
      '  AND ((:TodasTarifas1 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      
        '  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.Dat' +
        'aInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao)'
      
        '  AND (CONVERT(DATETIME, :DataInicioLocacaoE, 103) BETWEEN  Veic' +
        'ulosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLo' +
        'cacao)'
      
        '  AND (CONVERT(DATETIME, :DataTerminiLocacaoE, 103) BETWEEN  Vei' +
        'culosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoL' +
        'ocacao)'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
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
      '       END AS ValorComDescontoDiario,'
      #9'  VeiculosTarifas.CodigoTarifaVeiculo AS ID, '
      #9'  VeiculosTarifas.DescricaoPeriodoTarifa,'
      #9'  VeiculosTarifas.ValorPeriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa5)'
      '  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade5)'
      '  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo5)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo5)'
      '  AND ((:TodasTarifas5 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'E'#39')'
      '  AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      
        '  AND (CONVERT(DATETIME, :DataInicioLocacaoE5, 103) BETWEEN  Vei' +
        'culosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoL' +
        'ocacao)'
      
        '  AND (CONVERT(DATETIME, :DataTerminiLocacaoE5, 103) BETWEEN  Ve' +
        'iculosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTermino' +
        'Locacao)'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
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
      '       END AS ValorComDescontoDiario,'
      #9'  VeiculosTarifas.CodigoTarifaVeiculo AS ID, '
      #9'  VeiculosTarifas.DescricaoPeriodoTarifa,'
      #9'  VeiculosTarifas.ValorPeriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa2)'
      '  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade2)'
      '  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo2)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo2)'
      '  AND ((:TodasTarifas2 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')'
      
        '  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.Dat' +
        'aInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao)'
      
        '  AND (CONVERT(DATETIME, :DataInicioLocacaoI, 103) BETWEEN  Veic' +
        'ulosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoLo' +
        'cacao)'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
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
      '       END AS ValorComDescontoDiario,'
      #9'  VeiculosTarifas.CodigoTarifaVeiculo AS ID, '
      #9'  VeiculosTarifas.DescricaoPeriodoTarifa,'
      #9'  VeiculosTarifas.ValorPeriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa6)'
      '  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade6)'
      '  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo6)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo6)'
      '  AND ((:TodasTarifas6 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'I'#39')'
      '  AND (VeiculosTarifas.DataInicioSolicitacao IS NUll)'
      
        '  AND (CONVERT(DATETIME, :DataInicioLocacaoI6, 103) BETWEEN  Vei' +
        'culosTarifas.DataInicioLocacao AND  VeiculosTarifas.DataTerminoL' +
        'ocacao)'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
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
      '       END AS ValorComDescontoDiario, '
      #9'  VeiculosTarifas.CodigoTarifaVeiculo AS ID, '
      #9'  VeiculosTarifas.DescricaoPeriodoTarifa,'
      #9'  VeiculosTarifas.ValorPeriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa4)'
      '  AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade4)'
      '  AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo4)'
      '  AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '  AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '  AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '  AND (VeiculosTarifas.PeriodoTarifa  = :Periodo4)'
      '  AND ((:TodasTarifas4 <> 0) OR (VeiculosTarifas.KmLivre = '#39'N'#39'))'
      '  AND (VeiculosTarifas.ReferenciaPeriodoLocacao = '#39'Q'#39')'
      
        '  AND (dbo.fn_RemoveHora(GETDATE()) BETWEEN  VeiculosTarifas.Dat' +
        'aInicioSolicitacao AND  VeiculosTarifas.DataTerminoSolicitacao)'
      ''
      'UNION'
      
        'SELECT DISTINCT VeiculosTarifas.DescricaoTarifa, VeiculosTarifas' +
        '.ValorPeriodoVeiculo, VeiculosTarifas.ValorKmRodado,'
      
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
      '       END AS ValorComDescontoDiario,'
      #9'  VeiculosTarifas.CodigoTarifaVeiculo AS ID, '
      #9'  VeiculosTarifas.DescricaoPeriodoTarifa,'
      #9'  VeiculosTarifas.ValorPeriodoSegAd'
      'FROM VeiculosTarifas'
      
        'INNER JOIN EmpresaUnidades ON VeiculosTarifas.CodigoEmpresa = Em' +
        'presaUnidades.CodigoEmpresa AND'
      
        '                              VeiculosTarifas.CodigoUnidade = Em' +
        'presaUnidades.CodigoUnidade'
      'WHERE (VeiculosTarifas.CodigoEmpresa = :CodigoEmpresa3)'
      '      AND (VeiculosTarifas.CodigoUnidade = :CodigoUnidade3)'
      '      AND (VeiculosTarifas.CodigoGrupo = :CodigoGrupo3)'
      '      AND (VeiculosTarifas.Ativa <> '#39'N'#39')'
      '      AND (VeiculosTarifas.Mensal = '#39'N'#39')'
      '      AND (VeiculosTarifas.ReservaWeb = '#39'S'#39')'
      '      AND (VeiculosTarifas.PeriodoTarifa = 1)'
      '      AND (VeiculosTarifas.DescricaoTarifa = '#39'Di'#225'ria B'#225'sica'#39')'
      
        '      AND ((:TodasTarifas3 <> 0) OR (VeiculosTarifas.KmLivre = '#39 +
        'N'#39'))'
      'ORDER BY VeiculosTarifas.DescricaoTarifa')
    UserID = 0
    ControlConnection = adcControle
    Left = 59
    Top = 269
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
    object qryDescricaoTarifaProtecaoID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryDescricaoTarifaProtecaoDescricaoPeriodoTarifa: TWideStringField
      FieldName = 'DescricaoPeriodoTarifa'
      ReadOnly = True
      Size = 15
    end
    object qryDescricaoTarifaProtecaoValorPeriodoSegAd: TBCDField
      FieldName = 'ValorPeriodoSegAd'
      ReadOnly = True
      Precision = 19
    end
  end
  object IdSMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 160
    Top = 270
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
    Left = 241
    Top = 270
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
    Left = 343
    Top = 271
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
    Left = 452
    Top = 270
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
    Left = 60
    Top = 328
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
    Left = 148
    Top = 327
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
    Left = 228
    Top = 328
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
        'lor, ServicoAdicional.CalculoPorDiarias'
      'FROM ReservasServicosAdicionais'
      
        'INNER JOIN ServicoAdicional ON ReservasServicosAdicionais.Codigo' +
        'ServicoAdicional = ServicoAdicional.CodigoServicoAdicional'
      
        'WHERE (ReservasServicosAdicionais.CodigoReserva = :CodigoReserva' +
        ')'
      'ORDER BY ServicoAdicional.Descricao')
    UserID = 0
    ControlConnection = adcControle
    Left = 347
    Top = 328
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
    Top = 388
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
    Left = 194
    Top = 388
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
  object qryListaServicoAdicionalReserva: TQueryPlus
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
      'SELECT ServicoAdicional.Descricao'
      '      ,ReservasServicosAdicionais.Valor'
      #9' ,ReservasServicosAdicionais.CodigoReserva'
      #9' ,ReservasServicosAdicionais.CodigoServicoAdicional'
      '   ,ServicoAdicional.CalculoPorDiarias'
      'FROM ReservasServicosAdicionais'
      
        'INNER JOIN ServicoAdicional ON ReservasServicosAdicionais.Codigo' +
        'ServicoAdicional = ServicoAdicional.CodigoServicoAdicional'
      
        'WHERE (ReservasServicosAdicionais.CodigoReserva = :CodigoReserva' +
        ')')
    UserID = 0
    ControlConnection = adcControle
    Left = 336
    Top = 388
    object qryListaServicoAdicionalReservaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object qryListaServicoAdicionalReservaValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
    end
    object qryListaServicoAdicionalReservaCodigoReserva: TIntegerField
      FieldName = 'CodigoReserva'
    end
    object qryListaServicoAdicionalReservaCodigoServicoAdicional: TIntegerField
      FieldName = 'CodigoServicoAdicional'
    end
    object qryListaServicoAdicionalReservaCalculoPorDiarias: TStringField
      FieldName = 'CalculoPorDiarias'
      Size = 1
    end
  end
  object qryGravaReserva: TQueryPlus
    Connection = adcBancoDados
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
        Name = 'CodigoCliente'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'TipoCliente'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'ClienteCadastrado'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'NomeCliente'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 80
        Value = Null
      end
      item
        Name = 'TelefoneContato1'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 11
        Value = Null
      end
      item
        Name = 'Email'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'CPF'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 11
        Value = Null
      end
      item
        Name = 'Identidade'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 13
        Value = Null
      end
      item
        Name = 'Passaporte'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
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
        Name = 'HoraInicio'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 4
        Value = Null
      end
      item
        Name = 'DataHoraInicio'
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
      end
      item
        Name = 'HoraTermino'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 4
        Value = Null
      end
      item
        Name = 'DataHoraTermino'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'CodigoModelo'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CodigoMVA'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'LocalEntregaVeiculo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'LocalRetornoVeiculo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
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
        Name = 'ValorPeriodoVeiculo'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'ValorPeriodoSegAd'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'KmLivre'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'ValorKmRodado'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'FranquiaKmRodado'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'TipoCoberturaCasco'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'CoberturaTotal'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'CoberturaTerceiros'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'ValorFranquia'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'DataReserva'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'HoraReserva'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 8
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
        Name = 'LocalEntrega'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'LocalDevolucao'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'PercDescontoTempo'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'TaxaServico'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'ValorKmRodados'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 4
        Precision = 19
        Size = 8
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
        Name = 'CoberturaOcupantes'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'ValorFranquiaTerceiros'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'ValorFranquiaOcupantes'
        Attributes = [paSigned, paNullable]
        DataType = ftString
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'CodigoProtecao'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ReservaWeb'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'DataHoraLiberacao'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'Solicitacao'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'InseridoEm'
        Size = -1
        Value = Null
      end
      item
        Name = 'InseridoPor'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO Reservas (CodigoReserva'
      #9#9#9#9' ,CodigoEmpresa'
      #9#9#9#9' ,CodigoCliente'
      #9#9#9#9' ,TipoCliente'
      #9#9#9#9' ,ClienteCadastrado'
      #9#9#9#9' ,NomeCliente'
      #9#9#9#9' ,TelefoneContato1'
      #9#9#9#9' ,Email'
      #9#9#9#9' ,CPF'
      #9#9#9#9' ,Identidade'
      #9#9#9#9' ,Passaporte'
      #9#9#9#9' ,DataInicio'
      #9#9#9#9' ,HoraInicio'
      #9#9#9#9' ,DataHoraInicio'
      #9#9#9#9' ,DataTermino'
      #9#9#9#9' ,HoraTermino'
      #9#9#9#9' ,DataHoraTermino'
      #9#9#9#9' ,CodigoModelo'
      #9#9#9#9' ,CodigoMVA'
      #9#9#9#9' ,LocalEntregaVeiculo'
      #9#9#9#9' ,LocalRetornoVeiculo'
      #9#9#9#9' ,CodigoTarifaVeiculo'
      #9#9#9#9' ,ValorPeriodoVeiculo'
      #9#9#9#9' ,ValorPeriodoSegAd'
      #9#9#9#9' ,KmLivre'
      #9#9#9#9' ,ValorKmRodado'
      #9#9#9#9' ,FranquiaKmRodado'
      #9#9#9#9' ,ComMotorista'
      #9#9#9#9' ,Viagem'
      #9#9#9#9' ,CodigoTarifaMotorista'
      #9#9#9#9' ,ValorDiariaMotorista'
      #9#9#9#9' ,ValorHoraExtra'
      #9#9#9#9' ,ValorPorRefeicao'
      #9#9#9#9' ,ValorPernoite'
      #9#9#9#9' ,TipoCoberturaCasco'
      #9#9#9#9' ,CoberturaTotal'
      #9#9#9#9' ,CoberturaTerceiros'
      #9#9#9#9' ,Cobertura24h'
      #9#9#9#9' ,ValorFranquia'
      #9#9#9#9' ,Observacoes'
      #9#9#9#9' ,CodigoFormaPagamento'
      #9#9#9#9' ,DataReserva'
      #9#9#9#9' ,HoraReserva'
      #9#9#9#9' ,UsuarioReserva'
      #9#9#9#9' ,CodigoUnidade'
      #9#9#9#9' ,CodigoGrupoContratos'
      #9#9#9#9' ,QtdeCondutoresAdicionais'
      #9#9#9#9' ,ValorCondutoresAdicionais'
      #9#9#9#9' ,ValorTotalCondutoresAdicionais'
      #9#9#9#9' ,LocalEntrega'
      #9#9#9#9' ,LocalDevolucao'
      #9#9#9#9' ,DistanciaDevolucao'
      #9#9#9#9' ,ValorKmDevolucao'
      #9#9#9#9' ,ValorDevolucao'
      #9#9#9#9' ,CoberturaEspecial'
      #9#9#9#9' ,PrazoFatura'
      #9#9#9#9' ,ValorCash'
      #9#9#9#9' ,PercDescontoFatura'
      #9#9#9#9' ,PercDescontoKM'
      #9#9#9#9' ,PercDescontoTempo'
      #9#9#9#9' ,TaxaServico'
      #9#9#9#9' ,HorasExtrasCobradas'
      #9#9#9#9' ,DiariasCobradas'
      #9#9#9#9' ,PeriodosCobrados'
      #9#9#9#9' ,DiariasCobradasCobertura'
      #9#9#9#9' ,ValorCombustivel'
      #9#9#9#9' ,ValorLocacao'
      #9#9#9#9' ,CodigoConcessionaria'
      #9#9#9#9' ,OutrosCobertura'
      #9#9#9#9' ,ValorMotorista'
      #9#9#9#9' ,ValorKmRodados'
      #9#9#9#9' ,ValorTempo'
      #9#9#9#9' ,CodigoGrupoVeiculos'
      #9#9#9#9' ,Cancelada'
      #9#9#9#9' ,CoberturaOcupantes'
      #9#9#9#9' ,Origem'
      #9#9#9#9' ,ValorFranquiaTerceiros'
      #9#9#9#9' ,ValorFranquiaOcupantes'
      #9#9#9#9' ,CodigoProtecao'
      #9#9#9#9' ,ReservaWeb'
      #9#9#9#9' ,DataHoraLiberacao'
      #9#9#9#9' ,Solicitacao'
      '         ,InseridoEm'
      '         ,InseridoPor)'
      #9#9'   VALUES'
      #9#9#9#9'((SELECT MAX(CodigoReserva) +1'
      #9#9#9#9'  FROM Reservas'
      #9#9#9#9' )'
      #9#9#9#9' ,:CodigoEmpresa'
      #9#9#9#9' ,:CodigoCliente'
      #9#9#9#9' ,:TipoCliente'
      #9#9#9#9' ,:ClienteCadastrado'
      #9#9#9#9' ,:NomeCliente'
      #9#9#9#9' ,:TelefoneContato1'
      #9#9#9#9' ,:Email'
      #9#9#9#9' ,:CPF'
      #9#9#9#9' ,:Identidade'
      #9#9#9#9' ,:Passaporte'
      #9#9#9#9' ,:DataInicio'
      #9#9#9#9' ,:HoraInicio'
      #9#9#9#9' ,:DataHoraInicio'
      #9#9#9#9' ,:DataTermino'
      #9#9#9#9' ,:HoraTermino'
      #9#9#9#9' ,:DataHoraTermino'
      #9#9#9#9' ,:CodigoModelo'
      #9#9#9#9' ,:CodigoMVA'
      #9#9#9#9' ,:LocalEntregaVeiculo'
      #9#9#9#9' ,:LocalRetornoVeiculo'
      #9#9#9#9' ,:CodigoTarifaVeiculo'
      #9#9#9#9' ,CONVERT(FLOAT,:ValorPeriodoVeiculo)'
      #9#9#9#9' ,CONVERT(FLOAT,:ValorPeriodoSegAd)'
      #9#9#9#9' ,:KmLivre'
      #9#9#9#9' ,CONVERT(FLOAT,:ValorKmRodado)'
      #9#9#9#9' ,:FranquiaKmRodado'
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,:TipoCoberturaCasco'
      #9#9#9#9' ,:CoberturaTotal'
      #9#9#9#9' ,:CoberturaTerceiros'
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,CONVERT(FLOAT,:ValorFranquia)'
      #9#9#9#9' ,'#39#39
      #9#9#9#9' ,1'
      #9#9#9#9' ,:DataReserva'
      #9#9#9#9' ,:HoraReserva'
      #9#9#9#9' ,999'
      #9#9#9#9' ,:CodigoUnidade'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,:LocalEntrega'
      #9#9#9#9' ,:LocalDevolucao'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,15'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,CONVERT(FLOAT,:PercDescontoTempo)'
      #9#9#9#9' ,CONVERT(FLOAT,:TaxaServico)'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,0'
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,0'
      #9#9#9#9' ,CONVERT(FLOAT,:ValorKmRodados)'
      #9#9#9#9' ,0'
      #9#9#9#9' ,:CodigoGrupoVeiculos'
      #9#9#9#9' ,'#39'N'#39
      #9#9#9#9' ,:CoberturaOcupantes'
      #9#9#9#9' ,'#39'W'#39
      #9#9#9#9' ,CONVERT(FLOAT,:ValorFranquiaTerceiros)'
      #9#9#9#9' ,CONVERT(FLOAT,:ValorFranquiaOcupantes)'
      #9#9#9#9' ,:CodigoProtecao'
      #9#9#9#9' ,:ReservaWeb'
      #9#9#9#9' ,:DataHoraLiberacao'
      #9#9#9#9' ,:Solicitacao'
      '         ,:InseridoEm'
      '         ,:InseridoPor)')
    UserID = 0
    ControlConnection = adcControle
    Left = 479
    Top = 327
  end
  object qryProtecoes: TQueryPlus
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
      'WHERE (CodigoProtecao = :CodigoProtecao)'
      '')
    UserID = 0
    ControlConnection = adcControle
    Left = 479
    Top = 390
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
  object qryValidaVeiculosDisponiveis: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoGrupoVeiculo'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'LocalOndeSeEncontra'
        DataType = ftString
        Size = 2
        Value = #39#39
      end
      item
        Name = 'DataHoraInicioReserva1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraTerminoReserva1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraInicioReserva2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraInicioReserva3'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraInicioContrato1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraTerminoContrato1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraInicioContrato2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraInicioContrato3'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraInicioContratosGrupos1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraTerminoContratosGrupos1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraInicioContratosGrupos2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraInicioContratosGrupos3'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Veiculos.CodigoMVA, Veiculos.Placa'
      'FROM Veiculos'
      
        'LEFT JOIN VeiculosModelos ON Veiculos.CodigoModelo = VeiculosMod' +
        'elos.CodigoModelo'
      'WHERE (VeiculosModelos.CodigoGrupoVeiculo = :CodigoGrupoVeiculo)'
      '  AND (Veiculos.Status = '#39'D'#39')'
      '  AND (Veiculos.LocalOndeSeEncontra = :LocalOndeSeEncontra)'
      '  AND (SELECT MAX(Reservas.CodigoReserva)'
      #9'  FROM Reservas'
      
        #9'  LEFT OUTER JOIN Contratos ON Reservas.CodigoReserva = Contrat' +
        'os.CodigoReserva'
      #9'  WHERE (Contratos.CodigoReserva IS NULL)'
      #9'    AND (Reservas.CodigoMVA = Veiculos.CodigoMVA)'
      #9'    AND (Reservas.Cancelada = '#39'N'#39')'
      #9'    AND (((Reservas.DataHoraInicio <= :DataHoraInicioReserva1)'
      #9'    AND (Reservas.DataHoraTermino >= :DataHoraTerminoReserva1))'
      #9'    OR ((Reservas.DataHoraInicio <= :DataHoraInicioReserva2)'
      
        '         AND (Reservas.DataHoraInicio >= :DataHoraInicioReserva3' +
        ')))'
      '      ) IS NULL'
      '  AND (SELECT MAX(Contratos.CodigoContrato)'
      #9'  FROM Contratos'
      #9'  WHERE (Contratos.CodigoMVA = Veiculos.CodigoMVA)'
      
        '         AND (((Contratos.DataHoraInicio <= :DataHoraInicioContr' +
        'ato1)'
      
        #9'    AND (Contratos.DataHoraTermino >= :DataHoraTerminoContrato1' +
        '))'
      #9'    OR ((Contratos.DataHoraInicio <= :DataHoraInicioContrato2)'
      
        '         AND (Contratos.DataHoraInicio >= :DataHoraInicioContrat' +
        'o3)))'
      #9' ) IS NULL'
      '  AND (SELECT MAX(Contratos.CodigoContrato)'
      #9'  FROM Contratos'
      
        #9'  LEFT JOIN ContratosGrupos ON Contratos.CodigoGrupoContratos =' +
        ' ContratosGrupos.CodigoGrupoContratos'
      #9'  WHERE (Contratos.CodigoMVA = Veiculos.CodigoMVA)'
      
        '         AND (((ContratosGrupos.DataInicioContrato <= :DataHoraI' +
        'nicioContratosGrupos1)'
      
        #9'    AND (ContratosGrupos.DataTerminoContrato >= :DataHoraTermin' +
        'oContratosGrupos1))'
      
        #9'    OR ((ContratosGrupos.DataInicioContrato <= :DataHoraInicioC' +
        'ontratosGrupos2)'
      
        '         AND (ContratosGrupos.DataInicioContrato >= :DataHoraIni' +
        'cioContratosGrupos3)))'
      #9' ) IS NULL')
    UserID = 0
    ControlConnection = adcControle
    Left = 63
    Top = 448
    object qryValidaVeiculosDisponiveisCodigoMVA: TIntegerField
      FieldName = 'CodigoMVA'
    end
    object qryValidaVeiculosDisponiveisPlaca: TWideStringField
      FieldName = 'Placa'
      Size = 7
    end
  end
  object qryProximoCodigoReserva: TQueryPlus
    Connection = adcBancoDados
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'DECLARE @SQL VARCHAR(MAX);'
      'DECLARE @ProximoCodigo INT;'
      ''
      'SET @ProximoCodigo = (SELECT MAX(CodigoReserva) +1'
      #9#9#9#9'  FROM Reservas'
      #9#9#9#9' );'
      ''
      'SET @SQL = '#39'USE '#39' + DB_NAME() + '#39'_Controle '#39' +'
      #9'      '#39'UPDATE ProximoCodigo '#39' +'
      
        #9'      '#39'SET ProximoCodigo = '#39' + CONVERT(VARCHAR,@ProximoCodigo) ' +
        '+ '
      #9'      '#39' WHERE NomeTabela = '#39#39'Reservas'#39#39#39';'
      ''
      'EXEC(@SQL);')
    UserID = 0
    ControlConnection = adcControle
    Left = 207
    Top = 447
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
    Left = 328
    Top = 450
    object qryReservaCodigoReserva: TIntegerField
      FieldName = 'CodigoReserva'
    end
  end
  object qryAlterarReserva: TQueryPlus
    Connection = adcBancoDados
    Parameters = <
      item
        Name = 'ReservaWeb'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Solicitacao'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraLiberacao'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'Cancelada'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoUsuarioCancelamento'
        DataType = ftInteger
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
        Name = 'HoraInicio'
        DataType = ftString
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
        Name = 'DataTermino'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'HoraTermino'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DataHoraTermino'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'LocalEntregaVeiculo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'LocalEntrega'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'LocalRetornoVeiculo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'LocalDevolucao'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoTarifaVeiculo'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ValorPeriodoVeiculo'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'KmLivre'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ValorPeriodoSegAd'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'ValorKmRodado'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'FranquiaKmRodado'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ValorKmRodados'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'TipoCoberturaCasco'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CoberturaTotal'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CoberturaTerceiros'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ValorFranquia'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'CoberturaOcupantes'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ValorFranquiaTerceiros'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'ValorFranquiaOcupantes'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoProtecao'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoGrupoVeiculos'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'TaxaServico'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'PercDescontoTempo'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoMVA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'CodigoReserva'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE Reservas'
      'SET ReservaWeb = :ReservaWeb,'
      '    Solicitacao = :Solicitacao,'
      '    DataHoraLiberacao = :DataHoraLiberacao,'
      '    Cancelada = :Cancelada,'
      '    CodigoUsuarioCancelamento = :CodigoUsuarioCancelamento,'
      '    DataInicio = :DataInicio,'
      '    HoraInicio = :HoraInicio,'
      '    DataHoraInicio = :DataHoraInicio,'
      '    DataTermino = :DataTermino,'
      '    HoraTermino = :HoraTermino,'
      '    DataHoraTermino = :DataHoraTermino,'
      '    LocalEntregaVeiculo = :LocalEntregaVeiculo,'
      '    LocalEntrega = :LocalEntrega,'
      '    LocalRetornoVeiculo = :LocalRetornoVeiculo,'
      '    LocalDevolucao = :LocalDevolucao,'
      '    CodigoTarifaVeiculo = :CodigoTarifaVeiculo,'
      '    ValorPeriodoVeiculo = CONVERT(FLOAT,:ValorPeriodoVeiculo),'
      '    KmLivre = :KmLivre,'
      '    ValorPeriodoSegAd = CONVERT(FLOAT,:ValorPeriodoSegAd),'
      '    ValorKmRodado = CONVERT(FLOAT,:ValorKmRodado),'
      '    FranquiaKmRodado = :FranquiaKmRodado,'
      '    ValorKmRodados = CONVERT(FLOAT,:ValorKmRodados),'
      '    TipoCoberturaCasco = :TipoCoberturaCasco,'
      '    CoberturaTotal = :CoberturaTotal,'
      '    CoberturaTerceiros = :CoberturaTerceiros,'
      '    ValorFranquia = CONVERT(FLOAT,:ValorFranquia),'
      '    CoberturaOcupantes = :CoberturaOcupantes,'
      
        '    ValorFranquiaTerceiros = CONVERT(FLOAT,:ValorFranquiaTerceir' +
        'os),'
      
        '    ValorFranquiaOcupantes = CONVERT(FLOAT,:ValorFranquiaOcupant' +
        'es),'
      '    CodigoProtecao = :CodigoProtecao,'
      '    CodigoGrupoVeiculos = :CodigoGrupoVeiculos,'
      '    TaxaServico = CONVERT(FLOAT,:TaxaServico),'
      '    PercDescontoTempo = CONVERT(FLOAT,:PercDescontoTempo),'
      '    CodigoMVA = :CodigoMVA'
      'WHERE CodigoReserva = :CodigoReserva')
    UserID = 0
    ControlConnection = adcControle
    Left = 431
    Top = 451
  end
end
