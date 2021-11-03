﻿unit UMetodos;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  Data.DB, Data.Win.ADODB, QueryPlus, IniFiles, IWSystem, URotinasSistema,
  IdHashMessageDigest, DBXJSON, Web.HTTPApp, IdMessage, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, DateUtils, IdAttachmentFile, IdSSLOpenSSL,
  IdText, Variants, IdIOHandler, IdIOHandlerSocket, DBXPlatform, windows,
  Datasnap.DSHTTPWebBroker, Vcl.Forms, Data.DBXJSONReflect, IdHTTP;

type
{$METHODINFO ON}
  TLocavia = class(TDataModule)
    adcBancoDados: TADOConnection;
    adcControle: TADOConnection;
    qryCidades: TQueryPlus;
    qryCidadesCidade: TWideStringField;
    qryCidadesEstado: TWideStringField;
    qryCidadesCodigoMunicipio: TIntegerField;
    qryCidadesValorTaxaEntrega: TBCDField;
    qryCidadesValorTaxaDevolucao: TBCDField;
    qryCidadesPercTaxaAdministrativa: TFloatField;
    qryCidadesSobConsulta: TStringField;
    qryCidadesCodigoTipoDiversoTaxaEntrega: TIntegerField;
    qryCidadesCodigoTipoDiversoTaxaDevolucao: TIntegerField;
    qryCidadesCodigoEmpresa: TIntegerField;
    qryCidadesCNPJ: TWideStringField;
    qryCidadesCodigoMunicipioEmpresa: TIntegerField;
    IdSMTP: TIdSMTP;
    idmEnviarEmail: TIdMessage;
    qryUnidades: TQueryPlus;
    qryUnidadesCodigoEmpresa: TIntegerField;
    qryUnidadesCodigoUnidade: TIntegerField;
    qryUnidadesDescricaoUnidade: TWideStringField;
    qryUnidadesCidade: TWideStringField;
    qryUnidadesLogradouro: TWideStringField;
    qryUnidadesNumero: TWideStringField;
    qryUnidadesComplemento: TWideStringField;
    qryUnidadesCep: TWideStringField;
    qryUnidadesBairro: TWideStringField;
    qryUnidadesEstado: TWideStringField;
    qryUnidadesTelefone1: TStringField;
    qryUnidadesEmail: TWideStringField;
    qryUnidadesHoraInicioFuncionamentoSegSex: TStringField;
    qryUnidadesValorTaxaEntrega: TBCDField;
    qryUnidadesHoraTerminoFuncionamentoSegSex: TStringField;
    qryUnidadesHoraInicioFuncionamentoSabado: TStringField;
    qryUnidadesHoraTerminoFuncionamentoSabado: TStringField;
    qryUnidadesCodigoMunicipio: TIntegerField;
    qryUnidadesCodigoTipoDiversoTaxaEntrega: TIntegerField;
    qryUnidadesCodigoTipoDiversoTaxaDevolucao: TIntegerField;
    qryUnidadesHoraInicioFuncionamentoDomingo: TStringField;
    qryUnidadesHoraTerminoFuncionamentoDomingo: TStringField;
    qryUnidadesHorasAntecedenciaCancelamentoReservaWeb: TIntegerField;
    qryUnidadesValorTaxaDevolucao: TBCDField;
    qryUnidadesMostrarTarifasKmLivre: TStringField;
    qryUnidadesProtecaoYes: TStringField;
    qryUnidadesProtecaoPlus: TStringField;
    qryUnidadesPercentualDescontoTarifaReservaWeb: TFloatField;
    qryUnidadesHorasAntecedenciaAberturaReservaWeb: TIntegerField;
    qryUnidadesSobConsulta: TStringField;
    qryUnidadesLimiteDiasAprovacaoWeb: TIntegerField;
    qryUnidadesMunicipioUnidade: TWideStringField;
    qryGrupoVeiculos: TQueryPlus;
    qryGrupoVeiculosLetraDescricao: TWideStringField;
    qryGrupoVeiculosDescricao: TWideStringField;
    qryGrupoVeiculosCodigoGrupo: TIntegerField;
    qryGrupoVeiculosURLImagem: TStringField;
    qryGrupoVeiculosSubDescricao: TStringField;
    qryGrupoVeiculosLetra: TStringField;
    qryListaServicoAdicionais: TQueryPlus;
    qryListaServicoAdicionaisCodigoServicoAdicional: TIntegerField;
    qryListaServicoAdicionaisDescricao: TStringField;
    qryListaServicoAdicionaisValor: TBCDField;
    qryListaServicoAdicionaisCalculoPorDiarias: TStringField;
    qryListaServicoAdicionaisPermanente: TStringField;
    qryGrupoVeiculosCaracteristicas: TQueryPlus;
    qryGrupoVeiculosCaracteristicasDescricao: TStringField;
    qryClienteCadastrado: TQueryPlus;
    qryClienteCadastradoCodigoCliente: TIntegerField;
    qryClienteCadastradoRazaoSocial: TWideStringField;
    qryClienteCadastradoSituacao: TWideStringField;
    qryClienteCadastradoCodigoEmpresa: TSmallintField;
    qryClienteCadastradoCodigoUnidade: TIntegerField;
    qryClienteCadastradoTipo: TWideStringField;
    qryClienteCadastradoCNPJ: TWideStringField;
    qryClienteCadastradoInscricaoEstadual: TWideStringField;
    qryClienteCadastradoCPF: TWideStringField;
    qryClienteCadastradoIdentidade: TWideStringField;
    qryClienteCadastradoNomeFantasia: TWideStringField;
    qryClienteCadastradoEmail: TWideStringField;
    qryClienteCadastradoTelefone: TStringField;
    qryClienteCadastradoFax: TStringField;
    qryClienteCadastradoPassaporte: TStringField;
    qryClienteCadastradoCelular: TStringField;
    qryClienteCadastradoCodigoFormaPagamento: TIntegerField;
    qryClienteCadastradoClassificacao: TWideStringField;
    qryClienteCadastradoPercDesconto: TFloatField;
    qryClienteCadastradoSexo: TWideStringField;
    qryClienteCadastradoLogradouro: TStringField;
    qryClienteCadastradoBairro: TWideStringField;
    qryClienteCadastradoNumero: TIntegerField;
    qryClienteCadastradoComplemento: TWideStringField;
    qryClienteCadastradoCep: TWideStringField;
    qryClienteCadastradoEstado: TWideStringField;
    qryClienteCadastradoCidade: TWideStringField;
    qryClienteCadastradoCodigoMunicipio: TIntegerField;
    qryProximoCodigoCliente: TQueryPlus;
    qryProximoCodigoClienteProximoCodigo: TIntegerField;
    qryProximoCodigoClienteNomeTabela: TWideStringField;
    qryCliente: TQueryPlus;
    qryClienteCodigoCliente: TIntegerField;
    qryClienteRazaoSocial: TWideStringField;
    qryClienteCodigoEmpresa: TSmallintField;
    qryClienteCodigoUnidade: TIntegerField;
    qryClienteNomeFantasia: TWideStringField;
    qryClienteTipo: TWideStringField;
    qryClienteCNPJ: TWideStringField;
    qryClienteInscricaoEstadual: TWideStringField;
    qryClienteCPF: TWideStringField;
    qryClienteIdentidade: TWideStringField;
    qryClienteComplemento: TWideStringField;
    qryClienteNumero: TIntegerField;
    qryClienteLogradouro: TStringField;
    qryClienteCep: TWideStringField;
    qryClienteBairro: TWideStringField;
    qryClienteCidade: TWideStringField;
    qryClienteCodigoMunicipio: TIntegerField;
    qryClienteEstado: TWideStringField;
    qryClienteCodigoPais: TIntegerField;
    qryClienteTelefone: TStringField;
    qryClienteFax: TStringField;
    qryClienteEmail: TWideStringField;
    qryClienteCodigoClienteAreaAtuacao: TIntegerField;
    qryClienteHomePage: TWideStringField;
    qryClienteLogradouroCobranca: TWideStringField;
    qryClienteComplementoCobranca: TWideStringField;
    qryClienteNumeroCobranca: TIntegerField;
    qryClienteCepCobranca: TWideStringField;
    qryClienteBairroCobranca: TWideStringField;
    qryClienteCidadeCobranca: TWideStringField;
    qryClienteCodigoMunicipioCobranca: TIntegerField;
    qryClienteEstadoCobranca: TWideStringField;
    qryClienteCodigoPaisCobranca: TIntegerField;
    qryClienteTelefoneCobranca: TStringField;
    qryClienteFaxCobranca: TStringField;
    qryClienteNomeEmpresaCobranca: TWideStringField;
    qryClienteProfissaoFuncao: TWideStringField;
    qryClienteDataNascimento: TDateTimeField;
    qryClienteClassificacao: TWideStringField;
    qryClienteCodigoUsuarioPromotor: TIntegerField;
    qryClienteCodigoFormaPagamento: TIntegerField;
    qryClienteAprovadoPor: TIntegerField;
    qryClientePercPromotora: TFloatField;
    qryClientePercDesconto: TFloatField;
    qryClienteKmLivre: TWideStringField;
    qryClienteFranquiaKm: TIntegerField;
    qryClienteObservacoes: TWideMemoField;
    qryClienteOrgaoEmissorIdentidade: TWideStringField;
    qryClientePassaporte: TStringField;
    qryClienteNomeRefPessoal: TWideStringField;
    qryClienteTelefoneRefPessoal: TStringField;
    qryClienteNomeRefComercial: TWideStringField;
    qryClienteTelefoneRefComercial: TStringField;
    qryClienteChecPesFaladoCom: TWideStringField;
    qryClienteChecPesGrauFaladoCom: TWideStringField;
    qryClienteChecComFaladoCom: TWideStringField;
    qryClienteChecComCargoFaladoCom: TWideStringField;
    qryClienteChecInformouQue: TWideMemoField;
    qryClienteChecResponsavelPor: TIntegerField;
    qryClienteSituacao: TWideStringField;
    qryClienteCodigoFornecedorLink: TIntegerField;
    qryClienteNotas: TWideMemoField;
    qryClienteRetencaoPIS: TWideStringField;
    qryClientePercentualPIS: TFloatField;
    qryClienteRetencaoCofins: TWideStringField;
    qryClientePercentualCofins: TFloatField;
    qryClienteRetencaoContribuicaoSocial: TWideStringField;
    qryClientePercentualContribuicaoSocial: TFloatField;
    qryClienteRetencaoIR: TWideStringField;
    qryClientePercentualIR: TFloatField;
    qryClienteRetencaoINSS: TWideStringField;
    qryClientePercentualINSS: TFloatField;
    qryClienteRetencaoISS: TWideStringField;
    qryClienteTipoRetencaoISS: TWideStringField;
    qryClientePercentualISS: TFloatField;
    qryClienteTipoFaturaDocumento: TWideStringField;
    qryClienteTipoFaturaLocacao: TWideStringField;
    qryClienteTipoFaturaDespesas: TWideStringField;
    qryClienteTipoRetencaoImpostos: TWideStringField;
    qryClienteCodigoAntigo: TWideStringField;
    qryClienteInseridoPor: TIntegerField;
    qryClienteInseridoEm: TDateTimeField;
    qryClienteModificadoPor: TIntegerField;
    qryClienteModificadoEm: TDateTimeField;
    qryClienteCodigoTipoMarketing: TIntegerField;
    qryClienteCodigoSubTipoMarketing: TIntegerField;
    qryClienteComplementoMarketing: TWideStringField;
    qryClienteCodigoUsuarioResponsavel: TIntegerField;
    qryClienteCodigoMotivoBloqueio: TIntegerField;
    qryClienteBloqueadoPor: TIntegerField;
    qryClienteNumeroCartaoFidelidade: TIntegerField;
    qryClienteSaldoCartaoFidelidade: TIntegerField;
    qryClienteDataFidelizacao: TDateTimeField;
    qryClienteCelular: TStringField;
    qryClienteProtestarAutomaticamente: TWideStringField;
    qryClienteDataHoraExportacao: TDateTimeField;
    qryClienteCodigoPlanoContas: TIntegerField;
    qryClienteSexo: TWideStringField;
    qryClienteCodigoInterno: TIntegerField;
    qryClienteCodigoCentroCusto: TIntegerField;
    qryClienteCodigoCondutorLink: TIntegerField;
    qryClienteLongitude: TStringField;
    qryClienteLatitude: TStringField;
    qryClienteTaxaAdministrativaMultas: TFloatField;
    qryClienteSuframa: TStringField;
    qryClienteEstrangeiro: TStringField;
    qryClienteCodigoBanco: TIntegerField;
    qryClienteAgencia: TIntegerField;
    qryClienteConta: TIntegerField;
    qryClienteTipoConta: TStringField;
    qryClienteDescreverImpostosFatura: TStringField;
    qryClienteTipoFaturaCombustivel: TStringField;
    qryClienteTipoCliente: TStringField;
    qryClienteCodigoConsultaMVR: TIntegerField;
    qryClienteEstadoCivil: TStringField;
    qryClienteNomeEmpresaTrabalho: TStringField;
    qryClienteCepTrabalho: TStringField;
    qryClienteLogradouroTrabalho: TStringField;
    qryClienteNumeroTrabalho: TIntegerField;
    qryClienteComplementoTrabalho: TStringField;
    qryClienteBairroTrabalho: TStringField;
    qryClienteCidadeTrabalho: TStringField;
    qryClienteEstadoTrabalho: TStringField;
    qryClienteCodigoPaisTrabalho: TIntegerField;
    qryClienteTelefoneTrabalho: TStringField;
    qryClienteFaxTrabalho: TStringField;
    qryClienteCodigoCargoTrabalho: TIntegerField;
    qryClienteTempoTrabalho: TIntegerField;
    qryClienteSalarioTrabalho: TFloatField;
    qryClienteZipCode: TIntegerField;
    qryClienteInstituicaoGovernamental: TWideStringField;
    qryClienteCodigoLoteBenner: TIntegerField;
    qryParametrosUnidade: TQueryPlus;
    qryParametrosUnidadeHoraInicioFuncionamentoSegSex: TStringField;
    qryParametrosUnidadeValorTaxaRetorno: TBCDField;
    qryParametrosUnidadeTaxaServicoReservaWeb: TFloatField;
    qryParametrosUnidadeCodigoProtecaoPadraoReservaWeb: TIntegerField;
    qryParametrosUnidadeHoraTerminoFuncionamentoSegSex: TStringField;
    qryParametrosUnidadeHoraInicioFuncionamentoSabado: TStringField;
    qryParametrosUnidadeHoraTerminoFuncionamentoSabado: TStringField;
    qryParametrosUnidadeTelefone2: TStringField;
    qryParametrosUnidadeHoraInicioFuncionamentoDomingo: TStringField;
    qryParametrosUnidadeHoraTerminoFuncionamentoDomingo: TStringField;
    qryParametrosUnidadeHorasAntecedenciaCancelamentoReservaWeb: TIntegerField;
    qryParametrosUnidadeMostrarTarifasKmLivre: TStringField;
    qryParametrosUnidadeProtecaoYes: TStringField;
    qryParametrosUnidadeProtecaoPlus: TStringField;
    qryParametrosUnidadePercentualDescontoTarifaReservaWeb: TFloatField;
    qryParametrosUnidadeHorasAntecedenciaAberturaReservaWeb: TIntegerField;
    qryParametrosUnidadeEntregaForaHorarioFuncionamento: TStringField;
    qryParametrosUnidadeTaxaValorReserva: TBCDField;
    qryParametrosUnidadePercentualValorReserva: TFloatField;
    qryParametrosUnidadeDescricaoUnidade: TWideStringField;
    qryParametrosUnidadeLimiteDiasAprovacaoWeb: TIntegerField;
    qryParametrosUnidadeCodigoMunicipio: TIntegerField;
    qryParametrosUnidadeHorasAjusteFusoHorario: TIntegerField;
    qryParametrosEmpresa: TQueryPlus;
    qryParametrosEmpresaCodigoEmpresa: TIntegerField;
    qryParametrosEmpresaDefinirValorProtecaoPor: TStringField;
    qryParametrosEmpresaMaximoHorasExtras: TIntegerField;
    qryFeriados: TQueryPlus;
    qryFeriadosCodigoFeriado: TIntegerField;
    qryFeriadosData: TDateTimeField;
    qryFeriadosDescricao: TStringField;
    qryFeriadosCodigoUnidade: TIntegerField;
    qryFeriadosCodigoEmpresa: TIntegerField;
    qryGravaReservaServicoAdicional: TQueryPlus;
    qryParametrosEmail: TQueryPlus;
    qryParametrosEmailSMTPServidor: TWideStringField;
    qryParametrosEmailSMTPPorta: TIntegerField;
    qryParametrosEmailDescricaoUnidade: TWideStringField;
    qryParametrosEmailSMTPTimeout: TIntegerField;
    qryParametrosEmailSMTPUsuario: TWideStringField;
    qryParametrosEmailSMTPSenha: TWideStringField;
    qryParametrosEmailRequerAutenticacao: TWideStringField;
    qryParametrosEmailEmail: TWideStringField;
    qryParametrosEmailTipoConexaoCriptografada: TStringField;
    qryParametrosEmailCaminhoLogoWeb: TWideStringField;
    qryParametrosEmailCaminhoAssinatura: TStringField;
    qryInformacoesGrupoVeiculo: TQueryPlus;
    qryInformacoesGrupoVeiculoDescricao: TWideStringField;
    qryInformacoesGrupoVeiculoCodigoGrupo: TIntegerField;
    qryInformacoesGrupoVeiculoLetra: TWideStringField;
    qryUnidadeRetirada: TQueryPlus;
    qryUnidadeRetiradaCodigoEmpresa: TIntegerField;
    qryUnidadeRetiradaCodigoUnidade: TIntegerField;
    qryUnidadeRetiradaDescricaoUnidade: TWideStringField;
    qryUnidadeRetiradaObservacaoReserva: TWideMemoField;
    qryUnidadeRetiradaEmail: TWideStringField;
    qryUnidadeRetiradaLogradouro: TWideStringField;
    qryUnidadeRetiradaNumero: TWideStringField;
    qryUnidadeRetiradaTelefone1: TStringField;
    qryUnidadeRetiradaComplemento: TWideStringField;
    qryUnidadeRetiradaBairro: TWideStringField;
    qryConsultaReserva: TQueryPlus;
    qryConsultaReservaCodigoReserva: TIntegerField;
    qryConsultaReservaCodigoEmpresa: TIntegerField;
    qryConsultaReservaCodigoUnidade: TIntegerField;
    qryConsultaReservaCodigoGrupoContratos: TIntegerField;
    qryConsultaReservaClienteCadastrado: TWideStringField;
    qryConsultaReservaTipoCliente: TWideStringField;
    qryConsultaReservaCodigoCliente: TIntegerField;
    qryConsultaReservaNomeCliente: TWideStringField;
    qryConsultaReservaContatoCliente: TWideStringField;
    qryConsultaReservaTelefoneContato1: TStringField;
    qryConsultaReservaTelefoneContato2: TStringField;
    qryConsultaReservaDataInicio: TDateTimeField;
    qryConsultaReservaHoraInicio: TWideStringField;
    qryConsultaReservaDataHoraInicio: TDateTimeField;
    qryConsultaReservaDataTermino: TDateTimeField;
    qryConsultaReservaHoraTermino: TWideStringField;
    qryConsultaReservaDataHoraTermino: TDateTimeField;
    qryConsultaReservaCodigoModelo: TIntegerField;
    qryConsultaReservaCodigoMVA: TIntegerField;
    qryConsultaReservaDataReserva: TDateTimeField;
    qryConsultaReservaHoraReserva: TWideStringField;
    qryConsultaReservaUsuarioReserva: TIntegerField;
    qryConsultaReservaLocalEntregaVeiculo: TWideStringField;
    qryConsultaReservaLocalRetornoVeiculo: TWideStringField;
    qryConsultaReservaCodigoTarifaVeiculo: TIntegerField;
    qryConsultaReservaValorPeriodoVeiculo: TBCDField;
    qryConsultaReservaValorPeriodoSegAd: TBCDField;
    qryConsultaReservaKmLivre: TWideStringField;
    qryConsultaReservaValorKmRodado: TBCDField;
    qryConsultaReservaFranquiaKmRodado: TIntegerField;
    qryConsultaReservaTaxaServico: TFloatField;
    qryConsultaReservaComMotorista: TWideStringField;
    qryConsultaReservaViagem: TWideStringField;
    qryConsultaReservaCodigoTarifaMotorista: TIntegerField;
    qryConsultaReservaValorDiariaMotorista: TBCDField;
    qryConsultaReservaValorHoraExtra: TBCDField;
    qryConsultaReservaValorPorRefeicao: TBCDField;
    qryConsultaReservaValorPernoite: TBCDField;
    qryConsultaReservaCoberturaTotal: TWideStringField;
    qryConsultaReservaCodigoFormaPagamento: TIntegerField;
    qryConsultaReservaObservacoes: TWideMemoField;
    qryConsultaReservaEstimativaKmRodados: TIntegerField;
    qryConsultaReservaInseridoPor: TIntegerField;
    qryConsultaReservaInseridoEm: TDateTimeField;
    qryConsultaReservaModificadoPor: TIntegerField;
    qryConsultaReservaModificadoEm: TDateTimeField;
    qryConsultaReservaQtdeCondutoresAdicionais: TIntegerField;
    qryConsultaReservaValorCondutoresAdicionais: TBCDField;
    qryConsultaReservaValorTotalCondutoresAdicionais: TBCDField;
    qryConsultaReservaLocalEntrega: TWideStringField;
    qryConsultaReservaDistanciaEntrega: TIntegerField;
    qryConsultaReservaValorKmEntrega: TBCDField;
    qryConsultaReservaValorEntrega: TBCDField;
    qryConsultaReservaLocalDevolucao: TWideStringField;
    qryConsultaReservaDistanciaDevolucao: TIntegerField;
    qryConsultaReservaValorKmDevolucao: TBCDField;
    qryConsultaReservaValorDevolucao: TBCDField;
    qryConsultaReservaCoberturaEspecial: TWideStringField;
    qryConsultaReservaCNPJ: TWideStringField;
    qryConsultaReservaInscricaoEstadual: TWideStringField;
    qryConsultaReservaCPF: TWideStringField;
    qryConsultaReservaIdentidade: TWideStringField;
    qryConsultaReservaNomeUsuario: TWideStringField;
    qryConsultaReservaUsuarioAberturaReserva: TIntegerField;
    qryConsultaReservaTipoCartao: TStringField;
    qryConsultaReservaNumeroCartao: TStringField;
    qryConsultaReservaValidadeCartao: TStringField;
    qryConsultaReservaIdentificacaoCartao: TStringField;
    qryConsultaReservaValorCartao: TBCDField;
    qryConsultaReservaAutorizacaoCartao: TWideStringField;
    qryConsultaReservaPrazoFatura: TSmallintField;
    qryConsultaReservaValorCash: TBCDField;
    qryConsultaReservaOrgaoEmissorIdentidade: TWideStringField;
    qryConsultaReservaHabilitacao: TWideStringField;
    qryConsultaReservaCategoria: TWideStringField;
    qryConsultaReservaOrgaoEmissorHabilitacao: TWideStringField;
    qryConsultaReservaValidade: TDateTimeField;
    qryConsultaReservaSolicitadoPor: TWideStringField;
    qryConsultaReservaPercDescontoFatura: TFloatField;
    qryConsultaReservaPercDescontoKM: TFloatField;
    qryConsultaReservaPercDescontoTempo: TFloatField;
    qryConsultaReservaHorasExtrasCobradas: TSmallintField;
    qryConsultaReservaDiariasCobradas: TSmallintField;
    qryConsultaReservaPeriodosCobrados: TSmallintField;
    qryConsultaReservaDiariasCobradasCobertura: TSmallintField;
    qryConsultaReservaValorCombustivel: TBCDField;
    qryConsultaReservaValorLocacao: TBCDField;
    qryConsultaReservaCodigoConcessionaria: TIntegerField;
    qryConsultaReservaTipoCoberturaCasco: TWideStringField;
    qryConsultaReservaCoberturaTerceiros: TWideStringField;
    qryConsultaReservaCobertura24h: TWideStringField;
    qryConsultaReservaValorFranquia: TBCDField;
    qryConsultaReservaOutrosCobertura: TWideStringField;
    qryConsultaReservaValorMotorista: TBCDField;
    qryConsultaReservaValorKmRodados: TBCDField;
    qryConsultaReservaValorTempo: TBCDField;
    qryConsultaReservaEmail: TWideStringField;
    qryConsultaReservaPassaporte: TStringField;
    qryConsultaReservaCodigoGrupoVeiculos: TIntegerField;
    qryConsultaReservaCancelada: TWideStringField;
    qryConsultaReservaCodigoMotivoCancelamento: TIntegerField;
    qryConsultaReservaCodigoUsuarioCancelamento: TIntegerField;
    qryConsultaReservaDataHoraCancelamento: TDateTimeField;
    qryConsultaReservaCoberturaOcupantes: TWideStringField;
    qryConsultaReservaValorFranquiaTerceiros: TBCDField;
    qryConsultaReservaValorFranquiaOcupantes: TBCDField;
    qryConsultaReservaOrigem: TWideStringField;
    qryConsultaReservaCodigoProtecao: TIntegerField;
    qryConsultaReservaLocacaoBonificada: TStringField;
    qryConsultaReservaCodigoCondutor: TIntegerField;
    qryConsultaReservaEquipBlindagem: TWideStringField;
    qryConsultaReservaEquipAirBag: TWideStringField;
    qryConsultaReservaEquipAlarme: TWideStringField;
    qryConsultaReservaEquipAr: TWideStringField;
    qryConsultaReservaEquipDirecao: TWideStringField;
    qryConsultaReservaEquipVidroTrava: TWideStringField;
    qryConsultaReservaEquipCD: TWideStringField;
    qryConsultaReservaEquipRadio: TWideStringField;
    qryConsultaReservaCodigoSolicitante: TIntegerField;
    qryConsultaReservaLocalTransito: TStringField;
    qryConsultaReservaTelefoneTransito: TStringField;
    qryConsultaReservaReservaWeb: TStringField;
    qryConsultaReservaDataHoraLiberacao: TDateTimeField;
    qryConsultaReservaCodigoUsuarioAprovacao: TIntegerField;
    qryConsultaReservaSolicitacao: TStringField;
    qryUnidadeDevolucao: TQueryPlus;
    qryUnidadeDevolucaoCodigoEmpresa: TIntegerField;
    qryUnidadeDevolucaoCodigoUnidade: TIntegerField;
    qryUnidadeDevolucaoDescricaoUnidade: TWideStringField;
    qryUnidadeDevolucaoCidade: TWideStringField;
    qryUnidadeDevolucaoLogradouro: TWideStringField;
    qryUnidadeDevolucaoNumero: TWideStringField;
    qryUnidadeDevolucaoComplemento: TWideStringField;
    qryUnidadeDevolucaoCep: TWideStringField;
    qryUnidadeDevolucaoBairro: TWideStringField;
    qryUnidadeDevolucaoEstado: TWideStringField;
    qryUnidadeDevolucaoTelefone1: TStringField;
    qryUnidadeDevolucaoEmail: TWideStringField;
    qryUnidadeDevolucaoHoraInicioFuncionamentoSegSex: TStringField;
    qryUnidadeDevolucaoValorTaxaEntrega: TBCDField;
    qryUnidadeDevolucaoHoraTerminoFuncionamentoSegSex: TStringField;
    qryUnidadeDevolucaoHoraInicioFuncionamentoSabado: TStringField;
    qryUnidadeDevolucaoHoraTerminoFuncionamentoSabado: TStringField;
    qryUnidadeDevolucaoCodigoMunicipio: TIntegerField;
    qryUnidadeDevolucaoHoraInicioFuncionamentoDomingo: TStringField;
    qryUnidadeDevolucaoHoraTerminoFuncionamentoDomingo: TStringField;
    qryUnidadeDevolucaoHorasAntecedenciaCancelamentoReservaWeb: TIntegerField;
    qryUnidadeDevolucaoMostrarTarifasKmLivre: TStringField;
    qryUnidadeDevolucaoProtecaoYes: TStringField;
    qryUnidadeDevolucaoProtecaoPlus: TStringField;
    qryUnidadeDevolucaoPercentualDescontoTarifaReservaWeb: TFloatField;
    qryUnidadeDevolucaoHorasAntecedenciaAberturaReservaWeb: TIntegerField;
    qryListarReservaServicoAdicional: TQueryPlus;
    qryListarReservaServicoAdicionalDescricao: TStringField;
    qryListarReservaServicoAdicionalValor: TBCDField;
    qryListarReservaServicoAdicionalCalculoPorDiarias: TStringField;
    qryGrupoVeiculosValorMinimo: TFloatField;
    qryDescricaoTarifaProtecao: TQueryPlus;
    qryDescricaoTarifaProtecaoCodigoTarifaVeiculo: TIntegerField;
    qryDescricaoTarifaProtecaoDescricaoTarifa: TWideStringField;
    qryDescricaoTarifaProtecaoValorPeriodoVeiculo: TBCDField;
    qryDescricaoTarifaProtecaoValorDesconto: TFloatField;
    qryDescricaoTarifaProtecaoValorComDescontoDiario: TFloatField;
    qryDescricaoTarifaProtecaoValorKmRodado: TBCDField;
    qryListaProtecao: TQueryPlus;
    qryListaProtecaoCodigoProtecao: TIntegerField;
    qryListaProtecaoNomeProtecao: TStringField;
    qryListaProtecaoCondicoes: TStringField;
    qryListaProtecaoCoberturaCasco: TStringField;
    qryListaProtecaoCoberturaTerceiros: TStringField;
    qryListaProtecaoCoberturaOcupantes: TStringField;
    qryListaProtecaoValorCasco: TFloatField;
    qryListaProtecaoValorTerceiros: TFloatField;
    qryListaProtecaoValorOcupantes: TFloatField;
    qryListaProtecaoTipoFranquia: TStringField;
    qryListaProtecaoAtiva: TStringField;
    qryListaProtecaoPadraoAberturaContrato: TStringField;
    qryListaProtecaoProtecaoYes: TStringField;
    qryListaProtecaoProtecaoPlus: TStringField;
    qryListaProtecaoProtecaoWeb: TStringField;
    qryListaProtecaoValorProtecao: TBCDField;
    qryTarifa: TQueryPlus;
    qryTarifaCodigoTarifaVeiculo: TIntegerField;
    qryTarifaDescricaoTarifa: TWideStringField;
    qryTarifaPeriodoTarifa: TSmallintField;
    qryTarifaDescricaoPeriodoTarifa: TWideStringField;
    qryTarifaValorPeriodoVeiculo: TBCDField;
    qryTarifaValorPeriodoSegAd: TBCDField;
    qryTarifaKmLivre: TWideStringField;
    qryTarifaValorKmRodado: TBCDField;
    qryTarifaFranquiaKmRodado: TIntegerField;
    qryTarifaMensal: TWideStringField;
    qryTarifaTarifaNacional: TStringField;
    qryTarifaValorDesconto: TFloatField;
    qryTarifaValorTarifa: TFloatField;
    qryTarifaReservaWebPadrao: TStringField;
    qryProtecao: TQueryPlus;
    qryProtecaoCodigoProtecao: TIntegerField;
    qryProtecaoNomeProtecao: TStringField;
    qryProtecaoCondicoes: TStringField;
    qryProtecaoCoberturaCasco: TStringField;
    qryProtecaoCoberturaTerceiros: TStringField;
    qryProtecaoCoberturaOcupantes: TStringField;
    qryProtecaoValorCasco: TFloatField;
    qryProtecaoValorTerceiros: TFloatField;
    qryProtecaoValorOcupantes: TFloatField;
    qryProtecaoTipoFranquia: TStringField;
    qryProtecaoInseridoPor: TIntegerField;
    qryProtecaoInseridoEm: TDateTimeField;
    qryProtecaoModificadoPor: TIntegerField;
    qryProtecaoModificadoEm: TDateTimeField;
    qryProtecaoTipoProtecaoReservaWeb: TStringField;
    qryProtecaoAtiva: TStringField;
    qryProtecaoPadraoAberturaContrato: TStringField;
    qryProtecaoProtecaoYes: TStringField;
    qryProtecaoProtecaoPlus: TStringField;
    qryProtecaoProtecaoWeb: TStringField;
    qryProtecaoValorProtecao: TBCDField;
    qryGravaReserva: TQueryPlus;
    qryValidaVeiculosDisponiveis: TQueryPlus;
    qryValidaVeiculosDisponiveisCodigoMVA: TIntegerField;
    qryValidaVeiculosDisponiveisPlaca: TWideStringField;
    qryProximoCodigoReserva: TQueryPlus;
    qryProximoCodigoReservaNomeTabela: TWideStringField;
    qryProximoCodigoReservaProximoCodigo: TIntegerField;
    qryReserva: TQueryPlus;
    qryReservaCodigoReserva: TIntegerField;
    qryServicoAdicionais: TQueryPlus;
    qryServicoAdicionaisCodigoServicoAdicional: TIntegerField;
    qryServicoAdicionaisDescricao: TStringField;
    qryServicoAdicionaisValor: TBCDField;
    qryServicoAdicionaisCalculoPorDiarias: TStringField;
    qryServicoAdicionaisPermanente: TStringField;
    qryProtecoes: TQueryPlus;
    qryProtecoesCodigoProtecao: TIntegerField;
    qryProtecoesNomeProtecao: TStringField;
    qryProtecoesCondicoes: TStringField;
    qryProtecoesCoberturaCasco: TStringField;
    qryProtecoesCoberturaTerceiros: TStringField;
    qryProtecoesCoberturaOcupantes: TStringField;
    qryProtecoesValorCasco: TFloatField;
    qryProtecoesValorTerceiros: TFloatField;
    qryProtecoesValorOcupantes: TFloatField;
    qryProtecoesTipoFranquia: TStringField;
    qryProtecoesInseridoPor: TIntegerField;
    qryProtecoesInseridoEm: TDateTimeField;
    qryProtecoesModificadoPor: TIntegerField;
    qryProtecoesModificadoEm: TDateTimeField;
    qryProtecoesTipoProtecaoReservaWeb: TStringField;
    qryProtecoesAtiva: TStringField;
    qryProtecoesPadraoAberturaContrato: TStringField;
    qryProtecoesProtecaoYes: TStringField;
    qryProtecoesProtecaoPlus: TStringField;
    qryProtecoesProtecaoWeb: TStringField;
    qryProtecoesValorProtecao: TBCDField;
    qryHistoricoReservas: TQueryPlus;
    qryHistoricoReservasCodigoReserva: TIntegerField;
    qryHistoricoReservasDataInicio: TDateTimeField;
    qryHistoricoReservasHoraInicio: TWideStringField;
    qryHistoricoReservasDataTermino: TDateTimeField;
    qryHistoricoReservasHoraTermino: TWideStringField;
    qryHistoricoReservasCancelada: TStringField;
    qryHistoricoReservasGrupoVeiculo: TWideStringField;
    qryVeiculosModelos: TQueryPlus;
    qryVeiculosModelosDescricao: TWideStringField;
    qryLocalizaMunicipios: TQueryPlus;
    qryLocalizaMunicipiosCidade: TWideStringField;
    qryLocalizaMunicipiosEstado: TWideStringField;
    qryLocalizaMunicipiosCodigoMunicipio: TIntegerField;
    qryReservaCancelar: TQueryPlus;
    qryReservaCancelarCodigoReserva: TIntegerField;
    qryReservaCancelarCodigoEmpresa: TIntegerField;
    qryReservaCancelarCodigoUnidade: TIntegerField;
    qryReservaCancelarCancelada: TWideStringField;
    qryReservaCancelarCodigoMotivoCancelamento: TIntegerField;
    qryReservaCancelarCodigoUsuarioCancelamento: TIntegerField;
    qryReservaCancelarDataHoraCancelamento: TDateTimeField;
    qryReservaRecuperar: TQueryPlus;
    qryReservaRecuperarCodigoReserva: TIntegerField;
    qryReservaRecuperarDataHoraInicio: TDateTimeField;
    qryReservaRecuperarCPF: TWideStringField;
    qryReservaRecuperarEmail: TWideStringField;
    qryReservaRecuperarPassaporte: TStringField;
    qryReservaRecuperarDataInicio: TDateTimeField;
    qryReservaRecuperarHoraInicio: TWideStringField;
    qryIDUnidade: TQueryPlus;
    qryIDUnidadeCodigoEmpresa: TIntegerField;
    qryIDUnidadeCodigoUnidade: TIntegerField;
    qryIDUnidadeDescricaoUnidade: TWideStringField;
    qryIDUnidadeCidade: TWideStringField;
    qryIDUnidadeCodigoMunicipio: TIntegerField;
    qryHistoricoReservasLocalEntregaVeiculo: TWideStringField;
    qryHistoricoReservasLocalRetornoVeiculo: TWideStringField;
    qryHistoricoReservasCodigoTarifaVeiculo: TIntegerField;
    qryHistoricoReservasDescricaoTarifa: TWideStringField;
    qryHistoricoReservasValorKmRodado: TBCDField;
    qryHistoricoReservasValorPeriodoVeiculo: TBCDField;
    qryHistoricoReservasCodigoEmpresa: TIntegerField;
    qryHistoricoReservasCodigoUnidade: TIntegerField;
    qryHistoricoReservasPeriodoTarifa: TSmallintField;
    qryHistoricoReservasCodigoGrupoVeiculos: TIntegerField;
    qryHistoricoReservasCodigoProtecao: TIntegerField;
    qryListarReservaServicoAdicionalPermanente: TStringField;
    qryHistoricoReservasCodigoCliente: TIntegerField;
    qryIDUnidadeEstado: TWideStringField;
    qryListaUnidades: TQueryPlus;
    qryListaUnidadesCodigoUnidade: TIntegerField;
    qryListaUnidadesDescricaoUnidade: TWideStringField;
    qryListaUnidadesCnpj: TWideStringField;
    qryListaUnidadesLogradouro: TWideStringField;
    qryListaUnidadesNumero: TWideStringField;
    qryListaUnidadesComplemento: TWideStringField;
    qryListaUnidadesCep: TWideStringField;
    qryListaUnidadesBairro: TWideStringField;
    qryListaUnidadesCidade: TWideStringField;
    qryListaUnidadesEstado: TWideStringField;
    qryListaUnidadesTelefone1: TStringField;
    qryListaUnidadesTelefone2: TStringField;
    qryListaUnidadesEmail: TWideStringField;
    qryListaUnidadesRazaoSocial: TWideStringField;
    qryListaUnidadesHoraInicioFuncionamentoSegSex: TStringField;
    qryListaUnidadesHoraTerminoFuncionamentoSegSex: TStringField;
    qryListaUnidadesHoraInicioFuncionamentoSabado: TStringField;
    qryListaUnidadesHoraTerminoFuncionamentoSabado: TStringField;
    qryListaUnidadesHoraInicioFuncionamentoDomingo: TStringField;
    qryListaUnidadesHoraTerminoFuncionamentoDomingo: TStringField;
    qryListaUnidadesHorasAntecedenciaCancelamentoReservaWeb: TIntegerField;
    qryListaUnidadesHorasAntecedenciaAberturaReservaWeb: TIntegerField;
    qryListaUnidadesCodigoEmpresa: TIntegerField;
    qryIDUnidadeTaxaServicoReservaWeb: TFloatField;
    qryUnidadesTaxaServicoReservaWeb: TFloatField;
    qryIDUnidadeHorasAntecedenciaAberturaReservaWeb: TIntegerField;
    qryIDUnidadeHorasAntecedenciaCancelamentoReservaWeb: TIntegerField;
    qryIDUnidadeHoraInicioFuncionamentoSegSex: TStringField;
    qryIDUnidadeHoraTerminoFuncionamentoSegSex: TStringField;
    qryIDUnidadeHoraInicioFuncionamentoSabado: TStringField;
    qryIDUnidadeHoraTerminoFuncionamentoSabado: TStringField;
    qryIDUnidadeHoraInicioFuncionamentoDomingo: TStringField;
    qryIDUnidadeHoraTerminoFuncionamentoDomingo: TStringField;
    qryCidadesMaximoHorasExtras: TIntegerField;
    qryDescricaoTarifaProtecaoKmLivre: TWideStringField;
    qryIDUnidadeMaximoHorasExtras: TIntegerField;
    qryValidaFeriados: TQueryPlus;
    qryValidaFeriadosDia: TIntegerField;
    qryValidaFeriadosMes: TIntegerField;
    qryValidaFeriadosMotivo: TStringField;
    qryUnidadesMaximoHorasExtras: TIntegerField;
    qryPromocao: TQueryPlus;
    qryPromocaoCodigoGrupo: TIntegerField;
    qryPromocaoPromoInicio: TIntegerField;
    qryPromocaoPromoTermino: TIntegerField;
    qryGravaCliente: TQueryPlus;
    qryGravaClienteCodigoCliente: TIntegerField;
    qryGravaClienteRazaoSocial: TWideStringField;
    qryGravaClienteCodigoEmpresa: TSmallintField;
    qryGravaClienteCodigoUnidade: TIntegerField;
    qryGravaClienteNomeFantasia: TWideStringField;
    qryGravaClienteTipo: TWideStringField;
    qryGravaClienteCNPJ: TWideStringField;
    qryGravaClienteInscricaoEstadual: TWideStringField;
    qryGravaClienteCPF: TWideStringField;
    qryGravaClienteIdentidade: TWideStringField;
    qryGravaClienteComplemento: TWideStringField;
    qryGravaClienteNumero: TIntegerField;
    qryGravaClienteLogradouro: TStringField;
    qryGravaClienteCep: TWideStringField;
    qryGravaClienteBairro: TStringField;
    qryGravaClienteCidade: TWideStringField;
    qryGravaClienteCodigoMunicipio: TIntegerField;
    qryGravaClienteEstado: TWideStringField;
    qryGravaClienteCodigoPais: TIntegerField;
    qryGravaClienteTelefone: TStringField;
    qryGravaClienteFax: TStringField;
    qryGravaClienteEmail: TWideStringField;
    qryGravaClienteCodigoClienteAreaAtuacao: TIntegerField;
    qryGravaClienteHomePage: TWideStringField;
    qryGravaClienteLogradouroCobranca: TWideStringField;
    qryGravaClienteComplementoCobranca: TWideStringField;
    qryGravaClienteNumeroCobranca: TIntegerField;
    qryGravaClienteCepCobranca: TWideStringField;
    qryGravaClienteBairroCobranca: TWideStringField;
    qryGravaClienteCidadeCobranca: TWideStringField;
    qryGravaClienteCodigoMunicipioCobranca: TIntegerField;
    qryGravaClienteEstadoCobranca: TWideStringField;
    qryGravaClienteCodigoPaisCobranca: TIntegerField;
    qryGravaClienteTelefoneCobranca: TStringField;
    qryGravaClienteFaxCobranca: TStringField;
    qryGravaClienteNomeEmpresaCobranca: TWideStringField;
    qryGravaClienteProfissaoFuncao: TWideStringField;
    qryGravaClienteDataNascimento: TDateTimeField;
    qryGravaClienteClassificacao: TWideStringField;
    qryGravaClienteCodigoUsuarioPromotor: TIntegerField;
    qryGravaClienteCodigoFormaPagamento: TIntegerField;
    qryGravaClienteAprovadoPor: TIntegerField;
    qryGravaClientePercPromotora: TFloatField;
    qryGravaClientePercDesconto: TFloatField;
    qryGravaClienteKmLivre: TWideStringField;
    qryGravaClienteFranquiaKm: TIntegerField;
    qryGravaClienteObservacoes: TWideMemoField;
    qryGravaClienteOrgaoEmissorIdentidade: TWideStringField;
    qryGravaClientePassaporte: TStringField;
    qryGravaClienteNomeRefPessoal: TWideStringField;
    qryGravaClienteTelefoneRefPessoal: TStringField;
    qryGravaClienteNomeRefComercial: TWideStringField;
    qryGravaClienteTelefoneRefComercial: TStringField;
    qryGravaClienteChecPesFaladoCom: TWideStringField;
    qryGravaClienteChecPesGrauFaladoCom: TWideStringField;
    qryGravaClienteChecComFaladoCom: TWideStringField;
    qryGravaClienteChecComCargoFaladoCom: TWideStringField;
    qryGravaClienteChecInformouQue: TWideMemoField;
    qryGravaClienteChecResponsavelPor: TIntegerField;
    qryGravaClienteSituacao: TWideStringField;
    qryGravaClienteCodigoFornecedorLink: TIntegerField;
    qryGravaClienteNotas: TWideMemoField;
    qryGravaClienteRetencaoPIS: TWideStringField;
    qryGravaClientePercentualPIS: TFloatField;
    qryGravaClienteRetencaoCofins: TWideStringField;
    qryGravaClientePercentualCofins: TFloatField;
    qryGravaClienteRetencaoContribuicaoSocial: TWideStringField;
    qryGravaClientePercentualContribuicaoSocial: TFloatField;
    qryGravaClienteRetencaoIR: TWideStringField;
    qryGravaClientePercentualIR: TFloatField;
    qryGravaClienteRetencaoINSS: TWideStringField;
    qryGravaClientePercentualINSS: TFloatField;
    qryGravaClienteRetencaoISS: TWideStringField;
    qryGravaClienteTipoRetencaoISS: TWideStringField;
    qryGravaClientePercentualISS: TFloatField;
    qryGravaClienteTipoFaturaDocumento: TWideStringField;
    qryGravaClienteTipoFaturaLocacao: TWideStringField;
    qryGravaClienteTipoFaturaDespesas: TWideStringField;
    qryGravaClienteTipoRetencaoImpostos: TWideStringField;
    qryGravaClienteCodigoAntigo: TWideStringField;
    qryGravaClienteInseridoPor: TIntegerField;
    qryGravaClienteInseridoEm: TDateTimeField;
    qryGravaClienteModificadoPor: TIntegerField;
    qryGravaClienteModificadoEm: TDateTimeField;
    qryGravaClienteCodigoTipoMarketing: TIntegerField;
    qryGravaClienteCodigoSubTipoMarketing: TIntegerField;
    qryGravaClienteComplementoMarketing: TWideStringField;
    qryGravaClienteCodigoUsuarioResponsavel: TIntegerField;
    qryGravaClienteCodigoMotivoBloqueio: TIntegerField;
    qryGravaClienteBloqueadoPor: TIntegerField;
    qryGravaClienteCelular: TStringField;
    qryGravaClienteNumeroCartaoFidelidade: TIntegerField;
    qryGravaClienteSaldoCartaoFidelidade: TIntegerField;
    qryGravaClienteDataFidelizacao: TDateTimeField;
    qryGravaClienteDataHoraExportacao: TDateTimeField;
    qryGravaClienteCodigoPlanoContas: TIntegerField;
    qryGravaClienteSexo: TWideStringField;
    qryGravaClienteProtestarAutomaticamente: TWideStringField;
    qryGravaClienteCodigoInterno: TIntegerField;
    qryGravaClienteCodigoCentroCusto: TIntegerField;
    qryGravaClienteCodigoCondutorLink: TIntegerField;
    qryGravaClienteLongitude: TStringField;
    qryGravaClienteLatitude: TStringField;
    qryGravaClienteTaxaAdministrativaMultas: TFloatField;
    qryGravaClienteSuframa: TStringField;
    qryGravaClienteEstrangeiro: TStringField;
    qryGravaClienteCodigoBanco: TIntegerField;
    qryGravaClienteAgencia: TIntegerField;
    qryGravaClienteConta: TIntegerField;
    qryGravaClienteTipoConta: TStringField;
    qryGravaClienteDescreverImpostosFatura: TStringField;
    qryGravaClienteTipoFaturaCombustivel: TStringField;
    qryGravaClienteTipoCliente: TStringField;
    qryGravaClienteCodigoConsultaMVR: TIntegerField;
    qryGravaClienteEstadoCivil: TStringField;
    qryGravaClienteNomeEmpresaTrabalho: TStringField;
    qryGravaClienteCepTrabalho: TStringField;
    qryGravaClienteLogradouroTrabalho: TStringField;
    qryGravaClienteNumeroTrabalho: TIntegerField;
    qryGravaClienteComplementoTrabalho: TStringField;
    qryGravaClienteBairroTrabalho: TStringField;
    qryGravaClienteCidadeTrabalho: TStringField;
    qryGravaClienteEstadoTrabalho: TStringField;
    qryGravaClienteCodigoPaisTrabalho: TIntegerField;
    qryGravaClienteTelefoneTrabalho: TStringField;
    qryGravaClienteFaxTrabalho: TStringField;
    qryGravaClienteCodigoCargoTrabalho: TIntegerField;
    qryGravaClienteTempoTrabalho: TIntegerField;
    qryGravaClienteSalarioTrabalho: TFloatField;
    qryGravaClienteZipCode: TIntegerField;
    qryGravaClienteInstituicaoGovernamental: TWideStringField;
    qryGravaClienteCodigoLoteBenner: TIntegerField;
    qryGravaClienteTaxaAdministrativaMulta: TFloatField;
    qryGravaClienteValorTaxaAdministrativaMulta: TBCDField;
    qryGravaClienteTipoTaxaAdministrativaMulta: TStringField;
    qryGravaClienteFuncionarioGrupo: TStringField;
    qryGravaClienteCorretor: TStringField;
    qryGravaClienteDataEmissaoIdentidade: TDateTimeField;
    qryGravaClienteFumante: TStringField;
    qryGravaClienteInscricaoMunicipal: TStringField;
    qryGravaClienteEmailSecundario: TStringField;
    qryGravaClienteFotografia: TBlobField;
    qryGravaClienteTaxaAdministrativaAvaria: TFloatField;
    qryGravaClienteValorTaxaAdministrativaAvaria: TBCDField;
    qryGravaClienteTipoTaxaAdministrativaAvaria: TStringField;
    qryGravaReservaCodigoReserva: TIntegerField;
    qryGravaReservaCodigoEmpresa: TIntegerField;
    qryGravaReservaCodigoCliente: TIntegerField;
    qryGravaReservaTipoCliente: TWideStringField;
    qryGravaReservaClienteCadastrado: TWideStringField;
    qryGravaReservaNomeCliente: TWideStringField;
    qryGravaReservaTelefoneContato1: TStringField;
    qryGravaReservaEmail: TWideStringField;
    qryGravaReservaCPF: TWideStringField;
    qryGravaReservaIdentidade: TWideStringField;
    qryGravaReservaPassaporte: TStringField;
    qryGravaReservaDataInicio: TDateTimeField;
    qryGravaReservaHoraInicio: TWideStringField;
    qryGravaReservaDataHoraInicio: TDateTimeField;
    qryGravaReservaDataTermino: TDateTimeField;
    qryGravaReservaHoraTermino: TWideStringField;
    qryGravaReservaDataHoraTermino: TDateTimeField;
    qryGravaReservaCodigoModelo: TIntegerField;
    qryGravaReservaCodigoMVA: TIntegerField;
    qryGravaReservaLocalEntregaVeiculo: TWideStringField;
    qryGravaReservaLocalRetornoVeiculo: TWideStringField;
    qryGravaReservaCodigoTarifaVeiculo: TIntegerField;
    qryGravaReservaValorPeriodoVeiculo: TBCDField;
    qryGravaReservaValorPeriodoSegAd: TBCDField;
    qryGravaReservaKmLivre: TWideStringField;
    qryGravaReservaValorKmRodado: TBCDField;
    qryGravaReservaFranquiaKmRodado: TIntegerField;
    qryGravaReservaComMotorista: TWideStringField;
    qryGravaReservaViagem: TWideStringField;
    qryGravaReservaCodigoTarifaMotorista: TIntegerField;
    qryGravaReservaValorDiariaMotorista: TBCDField;
    qryGravaReservaValorHoraExtra: TBCDField;
    qryGravaReservaValorPorRefeicao: TBCDField;
    qryGravaReservaValorPernoite: TBCDField;
    qryGravaReservaCobertura24h: TWideStringField;
    qryGravaReservaValorFranquia: TBCDField;
    qryGravaReservaObservacoes: TWideMemoField;
    qryGravaReservaCodigoFormaPagamento: TIntegerField;
    qryGravaReservaDataReserva: TDateTimeField;
    qryGravaReservaHoraReserva: TWideStringField;
    qryGravaReservaUsuarioReserva: TIntegerField;
    qryGravaReservaCodigoUnidade: TIntegerField;
    qryGravaReservaCodigoGrupoContratos: TIntegerField;
    qryGravaReservaQtdeCondutoresAdicionais: TIntegerField;
    qryGravaReservaValorCondutoresAdicionais: TBCDField;
    qryGravaReservaValorTotalCondutoresAdicionais: TBCDField;
    qryGravaReservaLocalEntrega: TWideStringField;
    qryGravaReservaLocalDevolucao: TWideStringField;
    qryGravaReservaDistanciaDevolucao: TIntegerField;
    qryGravaReservaValorKmDevolucao: TBCDField;
    qryGravaReservaValorDevolucao: TBCDField;
    qryGravaReservaCoberturaEspecial: TWideStringField;
    qryGravaReservaPrazoFatura: TSmallintField;
    qryGravaReservaValorCash: TBCDField;
    qryGravaReservaPercDescontoFatura: TFloatField;
    qryGravaReservaPercDescontoKM: TFloatField;
    qryGravaReservaPercDescontoTempo: TFloatField;
    qryGravaReservaTaxaServico: TFloatField;
    qryGravaReservaHorasExtrasCobradas: TSmallintField;
    qryGravaReservaDiariasCobradas: TSmallintField;
    qryGravaReservaPeriodosCobrados: TSmallintField;
    qryGravaReservaDiariasCobradasCobertura: TSmallintField;
    qryGravaReservaValorCombustivel: TBCDField;
    qryGravaReservaValorLocacao: TBCDField;
    qryGravaReservaCodigoConcessionaria: TIntegerField;
    qryGravaReservaOutrosCobertura: TWideStringField;
    qryGravaReservaValorMotorista: TBCDField;
    qryGravaReservaValorKmRodados: TBCDField;
    qryGravaReservaValorTempo: TBCDField;
    qryGravaReservaCodigoGrupoVeiculos: TIntegerField;
    qryGravaReservaCancelada: TWideStringField;
    qryGravaReservaOrigem: TWideStringField;
    qryGravaReservaValorFranquiaTerceiros: TBCDField;
    qryGravaReservaValorFranquiaOcupantes: TBCDField;
    qryGravaReservaCodigoProtecao: TIntegerField;
    qryGravaReservaReservaWeb: TStringField;
    qryGravaReservaDataHoraLiberacao: TDateTimeField;
    qryGravaReservaSolicitacao: TStringField;
    qryGravaReservaInseridoEm: TDateTimeField;
    qryGravaReservaInseridoPor: TIntegerField;
    qryHistoricoReservasReservaWeb: TStringField;
    qryGravaReservaCoberturaTotal: TWideStringField;
    qryGravaReservaCoberturaTerceiros: TWideStringField;
    qryGravaReservaCoberturaOcupantes: TWideStringField;
    qryGravaReservaEstimativaKmRodados: TIntegerField;
    IdHTTPCL: TIdHTTP;
    qryDescricaoTarifaProtecaoPeriodoTarifa: TSmallintField;
    qryHistoricoReservasTaxaServico: TFloatField;
    qryVeiculosTarifa: TQueryPlus;
    qryDescricaoTarifaProtecaoValorPeriodoSegAd: TBCDField;
    qryParametrosEmpresaCodigoProtecaoDefaultReservaWeb: TIntegerField;
    qryHistoricoReservasValorPeriodoSegAd: TBCDField;
    qryParametrosEmpresaMaximoHorasCortesia: TIntegerField;
    qryUnidadesMaximoHorasCortesia: TIntegerField;
    qryParametrosEmpresaAceitaReservaConflitante: TWideStringField;
  private
    { Private declarations }
    //função para conectar ao banco de dados
    function ConectaBanco(Empresa:String = ''): Boolean;
    {Função para gerar token}
    function GerarToken: String;
    {Função para criar o token}
    function MD5(Texto:String): String;
    {Função para validar a vida util do token}
    function TokenValido(Token:String): Boolean;
    {Função para montar o retorno padrao de arrays}
    function RetornoPadraoArray(Erros: TJSONArray; Data: TJSONArray; Msg:String = ''): TStringStream;
    {Função para montar o retorno padrao de objetos}
    function RetornoPadraoObjeto(Erros: TJSONArray; Data: TJSONObject; Msg:String = ''): TStringStream;
    //function para validar Limite Aprovacao
    function ValidaLimiteAprovacao(DataTermino, DataInicio: TDateTime; CodigoUnidadeRetirada, CodigoEmpresa: Integer): Boolean;
    //function para validar horas atencedencia abertura
    function ValidaHorasAntecedenciaAbertura(DataInicio: TDateTime; HoraInicio: String; CodigoEmpresa, CodigoUnidadeRetirada: Integer): Boolean;
    //function para validar horario de funcionamento
    function ValidaHorarioFuncionamento(Data: TDateTime; Hora: String; CodigoEmpresa, CodigoUnidade: Integer): Boolean;
    //function para validar feriados
    function ValidaFeriado(DataInicio, DataTermino: TDateTime; CodigoEmpresa, CodigoUnidade: Integer): Boolean;
    //procedure para inserir a taxa de entrega e devolucao
    procedure InserirTaxaEntregaDevolucao(CodigoReserva: Integer; CodigoMunicipioRetirada, CodigoMunicipioDevolucao: Integer);
    //Função para enviar o email
    function ServidorEmail(CodigoReserva: Integer;Empresa:String = ''):Boolean;
     //Função para enviar o email
    function EnviarEmail(CodigoReserva: Integer;Empresa:String = ''):Boolean;
    // Função para enviar email de cancelamento da reserva
    function EnviarEmailCancelamento(CodigoReserva:Integer;Empresa:String = '';Email:String = '';NomeCliente:String = ''):Boolean;
    // Função para enviar email de cancelamento da reserva
    function ServidorEmailCancelamento(CodigoReserva:Integer;Empresa:String = '';Email:String = '';NomeCliente:String = ''):Boolean;
     //função para limpar memoria
    function LiberarMemoria: Boolean;
    // função para obter o codigo de Identificação do cliente
    function ObterCodigoIdentificacao(Cnpj: String):String;
  public
    { Public declarations }
    {Metodos usando o verbo GET}
    //Função para retornar a cidade e unidade de retirada do veículo
    function Cidades: TStringStream;
    //function para retornar Grupo, Caracteristicas, Modelos, Tarifas e Proteções dos veiculos
    function GrupoVeiculos(): TStringStream;
    //function para retornar os municipios do Brasil
    function Municipios(): TStringStream;
    //function para verificar se o cliente está cadastrado
    function Clientes(Tipo: String; CPFPassaporte: String =''): TStringStream;
    // função para recuperar 10 últimas reservas de um cliente (historico)
    function Reservas(Tipo: String ='';CPFPassaporte: String =''): TStringStream;
    // função para listar todas as empresas unidades
    function Unidades(): TStringStream;

    {Metodos usando o verbo POST}
    //Função para validarLogin
    function UpdateLogin: TStringStream;
    //função para gravar clientes
    function updateClientes: TStringStream;
    //função para gravar uma reserva
    function updateReservas: TStringStream;

    {Metodos usando o verbo PUT}
    //Função para alterar os dados de um cliente
    function acceptClientes(CodigoCliente:Integer = 0): TStringStream;
    //Função para alterar os dados de uma reserva
    function acceptReservas(CodigoReserva: Integer): TStringStream;

    {Metodos usando o verbo DELETE}

  end;

{$METHODINFO OFF}

implementation

{$R *.dfm}

uses System.StrUtils;

function TLocavia.acceptClientes(CodigoCliente:Integer): TStringStream;
var
  Erros,
  Retorno: TJSONArray;
  Resultado,
  Erro,
  Requisicao: TJSONObject;
  DadosRequisicao: TWebModule;
  RetornoRequisicao: String;
  CodigoMunicipio,
  Numero: Integer;
  RazaoSocial,
  NomeFantasia,
  Email,
  Telefone,
  Celular,
  Logradouro,
  Bairro,
  Complemento,
  Cep,
  Estado,
  Cidade,  Cpf,
  CodigoBD,
  Msg: String;

begin
  try
       Erros := TJSONArray.Create;
       Retorno := TJSONArray.Create;
       Resultado := TJSONObject.Create;
       DadosRequisicao := GetDataSnapWebModule;
       Msg := '';
       CodigoBD := DadosRequisicao.Request.GetFieldByName('empresa');
       if Length(CodigoBD) = 14 then
       begin
            CodigoBD := ObterCodigoIdentificacao(CodigoBD);
            if (Length(CodigoBD) =  0) or (CodigoBD = 'erro') then
                 Msg := 'Falha ao conectar ao banco de dados.';
       end;
       if ConectaBanco(CodigoBD) then
       begin
            RetornoRequisicao := DadosRequisicao.Request.Content;
            Requisicao := TJSONObject.Create;
            Requisicao := TJSONObject.ParseJSONValue(TEncoding.Default.GetBytes(RetornoRequisicao),0) AS TJSONObject;
            {Recebe os parametros da requisicao}
            if Assigned(Requisicao.GetValue('CodigoMunicipio')) then
                 CodigoMunicipio := StrToIntDef(Requisicao.GetValue('CodigoMunicipio').Value,0);
            if Assigned(Requisicao.GetValue('NomeCliente')) then
                 RazaoSocial := Requisicao.GetValue('NomeCliente').Value;
            if Assigned(Requisicao.GetValue('NomeFantasia')) then
                 NomeFantasia := Requisicao.GetValue('NomeFantasia').Value;
            if Assigned(Requisicao.GetValue('Email')) then
                 Email := Requisicao.GetValue('Email').Value;
            if Assigned(Requisicao.GetValue('Telefone')) then
                 Telefone := Requisicao.GetValue('Telefone').Value;
            if Assigned(Requisicao.GetValue('Celular')) then
                 Celular := Requisicao.GetValue('Celular').Value;
            if Assigned(Requisicao.GetValue('Logradouro')) then
                 Logradouro := Requisicao.GetValue('Logradouro').Value;
            if Assigned(Requisicao.GetValue('Bairro')) then
                 Bairro := Requisicao.GetValue('Bairro').Value;
            if Assigned(Requisicao.GetValue('Complemento')) then
                 Complemento := Requisicao.GetValue('Complemento').Value;
            if Assigned(Requisicao.GetValue('Cep')) then
                 Cep := Requisicao.GetValue('Cep').Value;
            if Assigned(Requisicao.GetValue('Estado')) then
                 Estado := Requisicao.GetValue('Estado').Value;
            if Assigned(Requisicao.GetValue('Cidade')) then
                 Cidade := Requisicao.GetValue('Cidade').Value;
            if Assigned(Requisicao.GetValue('CPF')) then
                 Cpf := Requisicao.GetValue('CPF').Value;
            if Assigned(Requisicao.GetValue('Numero')) then
                 Numero := StrToIntDef(Requisicao.GetValue('Numero').Value, 0);
            if CodigoCliente <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Código do cliente é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if RazaoSocial = '' then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Nome do cliente é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if Email = '' then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Email é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoMunicipio <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Código Municipio é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if (CodigoCliente > 0) and (RazaoSocial <> '') and (Email <> '') then
            begin
                 if qryCliente.Active then
                      qryCliente.Close;
                 qryCliente.Parameters.ParamByName('CodigoCliente').DataType := ftInteger;
                 qryCliente.Parameters.ParamByName('CodigoCliente').Value := CodigoCliente;
                 qryCliente.Open;
                 if not qryCliente.IsEmpty then
                 begin
                      qryCliente.Edit;
                      qryClienteNomeFantasia.Value := RazaoSocial;
                      qryClienteRazaoSocial.Value := RazaoSocial;
                      qryClienteEmail.Value := Email;
                      qryClienteTelefone.Value := Telefone;
                      qryClienteCelular.Value := Celular;
                      qryClienteLogradouro.Value := Logradouro;
                      qryClienteBairro.Value := Bairro;
                      qryClienteComplemento.Value := Complemento;
                      qryClienteCep.Value := Cep;
                      qryClienteEstado.Value := Estado;
                      qryClienteCidade.Value := Cidade;
                      qryClienteNumero.Value := Numero;
                      qryClienteCPF.Value := CPF;
                      qryClienteTipo.Value := 'F';
                      qryClienteCodigoMunicipio.Value := CodigoMunicipio;
                      qryCliente.Post;
                      Resultado.AddPair('CodigoCliente', ConverteJSON(qryClienteCodigoCliente));
                 end
                 else
                      Msg := 'Código do Cliente informado não foi localizado.';
            end;
       end
       else
            Msg := 'Falha ao conectar ao banco de dados.';
       Result := RetornoPadraoObjeto(Erros, Resultado, Msg);
  finally
       if qryCliente.Active then
            qryCliente.Close;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
       LiberarMemoria;
  end;
end;

function TLocavia.acceptReservas(CodigoReserva: Integer): TStringStream;
var
  Objeto,
  Requisicao: TJSONObject;
  Erros: TJSONArray;
  DadosRequisicao: TWebModule;
  RetornoRequisicao,
  Empresa,
  EmailCliente,
  NomeCliente,
  Msg : String;
begin
  try
       Erros := TJSONArray.Create;
       Objeto:= TJSONObject.Create;
       DadosRequisicao := GetDataSnapWebModule;
       RetornoRequisicao := DadosRequisicao.Request.Content;
       Requisicao := TJSONObject.Create;
       Requisicao := TJSONObject.ParseJSONValue(TEncoding.Default.GetBytes(RetornoRequisicao),0) AS TJSONObject;
       {Recebe os parametros da requisicao}
       if Assigned(Requisicao.GetValue('email')) then
            EmailCliente := Requisicao.GetValue('email').Value;
       if Assigned(Requisicao.GetValue('nomecompleto')) then
            NomeCliente := Requisicao.GetValue('nomecompleto').Value;
       Empresa := DadosRequisicao.Request.GetFieldByName('empresa');
       if Length(Empresa) = 14 then
       begin
            Empresa := ObterCodigoIdentificacao(Empresa);
            if (Length(Empresa) =  0) or (Empresa = 'erro') then
                 Msg := 'Falha ao conectar ao banco de dados.';
       end;
       if not(ConectaBanco(Empresa)) then
       begin
            Msg := 'Falha ao conectar ao banco de dados.';
            Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
       end
       else
       begin
            if qryReservaCancelar.Active then
                 qryReservaCancelar.Close;
            qryReservaCancelar.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
            qryReservaCancelar.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
            qryReservaCancelar.Open;
            if not qryReservaCancelar.IsEmpty then
            begin
                 qryReservaCancelar.Edit;
                 qryReservaCancelarCancelada.Value := 'S';
                 qryReservaCancelarCodigoMotivoCancelamento.Value := 9;
                 qryReservaCancelarCodigoUsuarioCancelamento.Value := 999;
                 qryReservaCancelarDataHoraCancelamento.Value := now;
                 qryReservaCancelar.Post;
                 Msg := '';//Reserva cancelada com sucesso.';
                 if not ServidorEmailCancelamento(CodigoReserva,Empresa,EmailCliente, NomeCliente)then
                 begin
                      Msg := 'Cancelamento da reserva efetuada, mas não foi possível enviar e-mail de cancelamento.';
                      Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
                 end
                 else
                      Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
                 qryReservaCancelar.Close;
            end
            else
            begin
                 Msg := 'Não foi possível localizar a reserva informada.';
                 Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
            end;
       end;
  finally
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
       LiberarMemoria;
  end;
end;

function TLocavia.Cidades: TStringStream;
var
  Objeto,
  Empresas,
  FeriadosDias,
  Erro: TJSONObject;
  Cidades,
  Unidades,
  Feriados,
  Erros: TJSONArray;
  I, J, L,
  CodigoCidade,
  CodigoEmpresa,
  CodigoUnidade: Integer;
  DadosRequisicao: TWebModule;
  Like, CodigoBD,
  Msg: String;
  Resposta : TStringStream;
begin
  try
       Cidades := TJSONArray.Create;
       Erros := TJSONArray.Create;
       DadosRequisicao := GetDataSnapWebModule;
       Like := DadosRequisicao.Request.QueryFields.Values['like'];
       CodigoBD := DadosRequisicao.Request.GetFieldByName('empresa');
       if Length(CodigoBD) = 14 then
       begin
            CodigoBD := ObterCodigoIdentificacao(CodigoBD);
            if (Length(CodigoBD) =  0) or (CodigoBD = 'erro') then
                 Msg := 'Falha ao conectar ao banco de dados.';
       end;
       if ConectaBanco(CodigoBD) then
       begin
            if qryCidades.Active then
                 qryCidades.Close;
            if Like <> '""'then
                 qryCidades.SQL[19] := 'AND (Municipios.Descricao LIKE ''%' + Like + '%'')'
            else
                 qryCidades.SQL[19] := '';
            qryCidades.Open;
            while not qryCidades.Eof do
            begin
                 Objeto := TJSONObject.Create;
                 for I := 0 to qryCidades.FieldCount -1 do
                 begin
                     Objeto.AddPair(qryCidades.Fields[I].FieldName, ConverteJSON(qryCidades.Fields[I]));
                     if qryCidades.Fields[I].FieldName = 'CodigoMunicipio' then
                          CodigoCidade := StrToIntdef(qryCidades.Fields[I].Value,0);
                 end;
                 if CodigoCidade <> 0 then
                 begin
                      if qryUnidades.Active then
                           qryUnidades.Close;
                      qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                      qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoCidade;
                      qryUnidades.Open;
                      Unidades := TJSONArray.Create;
                      while not qryUnidades.Eof do
                      begin
                           Empresas := TJSONObject.Create;
                           for J := 0 to qryUnidades.FieldCount -1 do
                           begin
                                Empresas.AddPair(qryUnidades.Fields[J].FieldName, ConverteJSON(qryUnidades.Fields[J]));
                                if qryUnidades.Fields[J].FieldName = 'CodigoEmpresa' then
                                     CodigoEmpresa := StrToIntdef(qryUnidades.Fields[J].Value,0);
                                if qryUnidades.Fields[J].FieldName = 'CodigoUnidade' then
                                     CodigoUnidade := StrToIntdef(qryUnidades.Fields[J].Value,0);
                           end;
                           Feriados := TJSONArray.Create;
                           if qryValidaFeriados.Active then
                                qryValidaFeriados.Close;
                           qryValidaFeriados.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                           qryValidaFeriados.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                           qryValidaFeriados.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                           qryValidaFeriados.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                           qryValidaFeriados.Open;
                           while not qryValidaFeriados.Eof do
                           begin
                                FeriadosDias := TJSONObject.Create;
                                for L := 0 to qryValidaFeriados.FieldCount -1 do
                                     FeriadosDias.AddPair(qryValidaFeriados.Fields[L].FieldName, ConverteJSON(qryValidaFeriados.Fields[L]));
                                Feriados.AddElement(FeriadosDias);
                                qryValidaFeriados.Next;
                           end;
                           Empresas.AddPair('Feriados',Feriados);
                           Unidades.AddElement(Empresas);
                           qryUnidades.Next;
                      end;
                      Objeto.AddPair('Unidades',Unidades);
                 end;
                 Cidades.AddElement(Objeto);
                 qryCidades.Next;
            end;
       end
       else
       begin
            Msg := 'Falha ao conectar ao banco de dados.';

       end;
       Result := RetornoPadraoArray(Erros, Cidades, Msg);
  finally
       qryCidades.Close;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
       LiberarMemoria;
  end;
end;

function TLocavia.ConectaBanco(Empresa:String): Boolean;
var
  ArqIni: TIniFile;
  TipoConexaoBD,
  TipoAutenticacaoBD,
  ControlePas,
  DataSource,
  UserID,
  Catalog,
  Controle,
  Provider,
  DiretorioArquivo: String;
begin
  {Lê arquivos de Inicialização}
  Result := true;
  DiretorioArquivo := gsAppPath + gsAppName + '.ini';
  ArqIni := TIniFile.Create(DiretorioArquivo);
  TipoConexaoBD := ArqIni.ReadString('Opções','TipoConexao','');
  TipoAutenticacaoBD := ArqIni.ReadString('Opções','TipoAutenticacao','');
  ControlePas := Descriptografa(ArqIni.ReadString('Opções','Password',''));
  DataSource := ArqIni.ReadString('Opções','DataSource','');
  UserID := Descriptografa(ArqIni.ReadString('Opções','UserID',''));
  Catalog := ArqIni.ReadString('Catalogos',Empresa,'');
  Controle := ArqIni.ReadString('Controles',Empresa,'');
  Provider := ArqIni.ReadString('Opções','Provider','');
  ArqIni.Free;
  //Conecta no Banco de dados
  if adcBancoDados.Connected then
       adcBancoDados.Close;
  if Length(Catalog) > 0 then
  begin
       try
            if TipoAutenticacaoBD = 'SQL Server' then
                 adcBancoDados.ConnectionString := 'Provider=' + Provider + ';Password=' + ControlePas + ';Persist Security Info=True;User ID=' + UserID + ';Initial Catalog=' + Catalog +';Data Source=' + DataSource
            else
                  adcBancoDados.ConnectionString := 'Provider=' + Provider + ';Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=' + Catalog + ';Data Source='+ DataSource;
            adcBancoDados.Open;
       except
            Result := false;
       end;
       if adcControle.Connected then
            adcControle.Close;
        try
            if TipoAutenticacaoBD = 'SQL Server' then
                 adcControle.ConnectionString := 'Provider=' + Provider + ';Password=' + ControlePas + ';Persist Security Info=True;User ID=' + UserID + ';Initial Catalog=' + Controle + ';Data Source=' + DataSource
            else
                  adcControle.ConnectionString := 'Provider=' + Provider + ';Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=' + Controle + ';Data Source='+ DataSource;
            adcControle.Open;
       except
            Result := false;
       end;
  end
  else
       Result := False;
end;

function TLocavia.EnviarEmail(CodigoReserva: Integer; Empresa:String):Boolean;
var
  Objeto: TJSONObject;
  ListaObjeto: TJSONArray;
  IdSMTP : TIdSMTP;
  lMensagem : TIdMessage;
  Attachment: TIdAttachmentFile;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  ValorDiarias,
  ValorDiariasDesc,
  ValorHoraExtra,
  ValorKm,
  ValorCobertura,
  ValorTerceiros,
  ValorTaxaServico,
  ValorDesconto,
  TotalAdicional,
  ValorAdicional,
  ValorTarifa,
  ValorTarifaDesc,
  ValorTaxaEntregaDevolucao: Currency;
  HorasExtras,
  PercentualTaxaServico : Double;
  Periodo, FranquiaKm: Integer;
  DiariaAMaisHoraExtra :Boolean;
  Protecao, ServicoAdicional,
  TaxaServico, Observacoes,
  Situacao: String;
begin
  try
       Objeto:= TJSONObject.Create;
       if adcBancoDados.Connected = false then
            ConectaBanco(Empresa);
       if qryConsultaReserva.Active then
            qryConsultaReserva.Close;
       qryConsultaReserva.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
       qryConsultaReserva.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
       qryConsultaReserva.Open;
       if not qryConsultaReserva.IsEmpty then
       begin
            try
                 //Verifica a Situacao da reserva
                 if qryConsultaReservaReservaWeb.Value = 'N' then
                      Situacao := 'Em análise'
                 else
                      Situacao := 'Confirmada';
                 if qryParametrosEmail.Active then
                      qryParametrosEmail.Close;
                 qryParametrosEmail.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosEmail.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
                 qryParametrosEmail.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryParametrosEmail.Parameters.ParamByName('CodigoUnidade').Value := qryConsultaReservaCodigoUnidade.Value;
                 qryParametrosEmail.Open;
                 if qryParametrosEmpresa.Active then
                      qryParametrosEmpresa.Close;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
                 qryParametrosEmpresa.Open;
                 IdSMTP := TIdSMTP.Create(Application);
                 try
                      lMensagem := TIdMessage.Create(Application);
                      IdSMTP.Username := qryParametrosEmailSMTPUsuario.Value;//email do usuario
                      IdSMTP.Password := qryParametrosEmailSMTPSenha.Value;//senha do usuario
                      IdSMTP.Host := qryParametrosEmailSMTPServidor.Value;//host do usuario
                      IdSMTP.Port := qryParametrosEmailSMTPPorta.Value;//porta email
                      //Conexao Segura
                      if Length(qryParametrosEmailTipoConexaoCriptografada.Value) > 0 then
                      begin
                           case qryParametrosEmailTipoConexaoCriptografada.Value[1] of
                                'S', 'T':
                                begin
                                     with IdSMTP do
                                     begin
                                          try
                                               IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(Application);
                                               IdSMTP.IOHandler := IdSSL;
                                               UseTLS := utUseImplicitTLS;
                                          except on E: Exception do
                                               begin
                                                    IOHandler := TIdIOHandler.MakeDefaultIOHandler(Application);
                                                    UseTLS := utNoTLSSupport;
                                               end;
                                          end;
                                          if Assigned(IdSSL) then
                                          begin
                                               IdSSL.SSLOptions.Method := sslvSSLv3;
                                               IdSSL.SSLOptions.Mode := sslmClient;
                                          end;
                                          AuthType := satDefault;
                                     end;
                                end;
                           end;
                      end;
                      if Length(qryParametrosEmailRequerAutenticacao.Value)> 0 then
                           case qryParametrosEmailRequerAutenticacao.Value[1] of
                               'N':
                                     idSMTP.AuthType := satNone;
                               'S':
                                     idSMTP.AuthType := satDefault;
                          end;
                      IdSMTP.Connect;
                      //Monta o email
                      try
                           with lMensagem do
                           begin
                                if qryUnidadeRetirada.Active then
                                     qryUnidadeRetirada.Close;
                                qryUnidadeRetirada.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                                qryUnidadeRetirada.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
                                qryUnidadeRetirada.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                                qryUnidadeRetirada.Parameters.ParamByName('CodigoUnidade').Value := qryConsultaReservaCodigoUnidade.Value;
                                qryUnidadeRetirada.Open;
                                Subject := 'Reserva Web - ' + qryUnidadeRetiradaDescricaoUnidade.Value;
                                From.Address := qryParametrosEmailEmail.Value;//email de envio
                                //Envia o email para o cliente
                                Recipients.Add.Address := qryConsultaReservaEmail.Value;
                                //Enviar o email para o franqueado
                                if qryUnidadeRetiradaEmail.Value <> '' then
                                     Recipients.Add.Address := qryUnidadeRetiradaEmail.Value;
                                NoDecode := true;
                                NoEncode := false;
                                AttachmentEncoding := 'MIME';
                                ConvertPreamble := true;
                                ExceptionOnBlockedAttachments:= false;
                                Encoding := meMIME;
                                Priority := mpNormal;
                                UseNowForDate := true;
                                ContentType := 'multipart/mixed';
                                IsEncoded := True;
                                //Monta o corpo do email
                                with TidText.Create(MessageParts) do
                                begin
                                     ValorDiarias := 0;
                                     ValorHoraExtra := 0;
                                     ValorKm := 0;
                                     ValorCobertura := 0;
                                     ValorTerceiros := 0;
                                     ValorTaxaServico := 0;
                                     ValorDesconto := 0;
                                     TotalAdicional := 0;
                                     ValorAdicional := 0;
                                     ValorTarifa := 0;
                                     ValorTaxaEntregaDevolucao := 0;
                                     HorasExtras := 0;
                                     PercentualTaxaServico := 0;
                                     Periodo := 0;
                                     FranquiaKm := 0;
                                     if qryUnidadeRetirada.Active then
                                          qryUnidadeRetirada.Close;
                                     qryUnidadeRetirada.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                                     qryUnidadeRetirada.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
                                     qryUnidadeRetirada.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                                     qryUnidadeRetirada.Parameters.ParamByName('CodigoUnidade').Value := qryConsultaReservaCodigoUnidade.Value;
                                     qryUnidadeRetirada.Open;
                                     if qryTarifa.Active then
                                          qryTarifa.Close;
                                     qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                                     qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := qryConsultaReservaCodigoTarifaVeiculo.Value;
                                     qryTarifa.Open;
                                     if qryProtecao.Active then
                                          qryProtecao.Close;
                                     qryProtecao.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                                     qryProtecao.Parameters.ParamByName('CodigoProtecao').Value := qryConsultaReservaCodigoProtecao.Value;
                                     qryProtecao.Open;
                                     if qryListarReservaServicoAdicional.Active then
                                          qryListarReservaServicoAdicional.Close;
                                     qryListarReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
                                     qryListarReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').Value := qryConsultaReservaCodigoReserva.Value;
                                     qryListarReservaServicoAdicional.Open;
                                     if qryInformacoesGrupoVeiculo.Active then
                                          qryInformacoesGrupoVeiculo.Close;
                                     qryInformacoesGrupoVeiculo.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                                     qryInformacoesGrupoVeiculo.Parameters.ParamByName('CodigoGrupo').Value := qryConsultaReservaCodigoGrupoVeiculos.Value;
                                     qryInformacoesGrupoVeiculo.Open;
                                     Body.Add('<html>');
                                     Body.Add('<head>');
                                     Body.Add('<meta http-equiv="Content-Language" content="pt-br">');
                                     Body.Add('<meta http-equiv="Content-Type" content="text/html charset=windows-1252">');
                                     Body.Add('<title>RESERVA DE VEÍCULO</title>');
                                     Body.Add('</head>');
                                     Body.Add('<body leftmargin="10">');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr><td><b>');        // http://www.yesrentacar.com.br/logo.jpg
                                     Body.Add('<img border="0" src="' + qryParametrosEmailCaminhoLogoWeb.Value + '" width="140" height="100"></b></td></tr>');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<p align="center"><b>RESERVA DE VEÍCULO</b></td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<p>&nbsp;</p>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<blockquote>');
                                     Body.Add('<b>Sua Reserva de Número</b> : '+ FormatFloat('000000',qryConsultaReservaCodigoReserva.Value) + ' Situação: ' + Situacao + '<br>');
                                     Body.Add('<b>Cliente :</b> ' + qryConsultaReservaNomeCliente.Value + '<br>');
                                     Body.Add('<b>Email   :</b> ' + qryConsultaReservaEmail.Value + '<br>');
                                     Body.Add('<b>Telefone 1:</b> (' + Copy(qryConsultaReservaTelefoneContato1.Value,1,2) + ')' + Copy(qryConsultaReservaTelefoneContato1.Value,3,10));
                                     Body.Add('<b>Telefone 2:</b> (' + Copy(qryConsultaReservaTelefoneContato2.Value,1,2) + ')' + Copy(qryConsultaReservaTelefoneContato2.Value,3,10));
                                     Body.Add('</blockquote>');
                                     Body.Add('</td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<p align="center"><b>RETIRADA / DEVOLUÇÃO</b></td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<blockquote>');
                                     Body.Add('<b>Retira: </b>' + DateToStr(qryConsultaReservaDataInicio.Value) + ' as ' + Copy(qryConsultaReservaHoraInicio.Value,1,2)+ ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2) + '<b><br>');
                                     Body.Add('Cidade: </b>' + qryConsultaReservaLocalEntrega.Value + '<b><br>');
                                     Body.Add('Unidade: </b>' + qryUnidadeRetiradaDescricaoUnidade.Value + '<br>');
                                     Body.Add('<b>Endereço : </b></b>'+  qryUnidadeRetiradaLogradouro.Value + ', ' +
                                                                         qryUnidadeRetiradaNumero.Value + '  ' +
                                                                         qryUnidadeRetiradaComplemento.Value +
                                                                         ' Bairro ' + qryUnidadeRetiradaBairro.Value + '<br>');
                                     Body.Add('<b>Telefone: </b></b> (' + Copy(qryUnidadeRetiradaTelefone1.Value,1,2) + ')' +
                                                                         Copy(qryUnidadeRetiradaTelefone1.Value,3,4) + '-' +
                                                                         Copy(qryUnidadeRetiradaTelefone1.Value,7,4) + '</blockquote>');
                                     Body.Add('</td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<blockquote>');
                                     Body.Add('<b>Devolução: </b> ' + DateToStr(qryConsultaReservaDataTermino.Value) + ' as ' + Copy(qryConsultaReservaHoraTermino.Value,1,2) + ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2) + '<b><br>');

                                     if qryUnidadeDevolucao.Active then
                                          qryUnidadeDevolucao.Close;
                                     qryUnidadeDevolucao.Parameters.ParamByName('Cidade').DataType := ftString;
                                     qryUnidadeDevolucao.Parameters.ParamByName('Cidade').Value :=  qryConsultaReservaLocalRetornoVeiculo.Value;
                                     qryUnidadeDevolucao.Open;

                                     Body.Add('Cidade: </b>' + qryConsultaReservaLocalDevolucao.Value + '<b><br>');
                                     Body.Add('Unidade: </b>' + qryUnidadeDevolucaoDescricaoUnidade.Value + '<br><b>');
                                     Body.Add('Endereço : </b>' + qryUnidadeDevolucaoLogradouro.Value + ', ' +
                                                                  qryUnidadeDevolucaoNumero.Value + '  ' +
                                                                  qryUnidadeDevolucaoComplemento.Value +
                                                                  ' Bairro ' + qryUnidadeDevolucaoBairro.Value + '<br>');

                                     Body.Add('<b>Telefone: </b>(' + Copy(qryUnidadeDevolucaoTelefone1.Value,1,2) + ')' +
                                                                     Copy(qryUnidadeDevolucaoTelefone1.Value,3,4) + '-' +
                                                                     Copy(qryUnidadeDevolucaoTelefone1.Value,7,4) + '</blockquote>');
                                     Body.Add('</td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<p align="center"><b>VEÍCULO / TARIFAS</b></td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<blockquote>');
                                     Body.Add('<b>Grupo do Veículo :&nbsp; </b>' + qryInformacoesGrupoVeiculoDescricao.Value + '<b><br>');
                                     Body.Add('Tarifa:&nbsp; </b>' +  qryTarifaDescricaoTarifa.Value + '<b><br>');
                                     Body.Add('Proteção :&nbsp;');
                                     Body.Add('</b> ' + qryProtecaoNomeProtecao.Value + '<b><br>');
                                     Body.Add('Terceiro :&nbsp;');
                                     if qryConsultaReservaCoberturaTerceiros.Value = 'N' then
                                           Body.Add('</b> Não </blockquote>')
                                     else
                                           Body.Add('</b> Sim </blockquote>');
                                     Body.Add('</td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<p align="center"><b>ORÇAMENTO</b></td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<blockquote>');
                                     //Diarias
                                     Periodo := 0;
                                     DiariaAMaisHoraExtra := false;
                                     if (Trunc(qryConsultaReservaDataTermino.Value - qryConsultaReservaDataInicio.Value) = 0)
                                         and (StrToTime(Copy(qryConsultaReservaHoraInicio.Value,1,2) + ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2)) = StrToTime(Copy(qryConsultaReservaHoraTermino.Value,1,2) + ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2))) then
                                               Periodo := 1
                                     else
                                          if Round((StrToTime(Copy(qryConsultaReservaHoraTermino.Value,1,2) + ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2)) -  StrToTime(Copy(qryConsultaReservaHoraInicio.Value,1,2) + ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2)))* 24 +  0.499999) >= qryParametrosEmpresaMaximoHorasExtras.Value then
                                               begin
                                                    Periodo := Trunc(qryConsultaReservaDataTermino.Value - qryConsultaReservaDataInicio.Value) + 1;
                                                    DiariaAMaisHoraExtra := true;
                                               end
                                               else
                                                    Periodo := Trunc(qryConsultaReservaDataTermino.Value - qryConsultaReservaDataInicio.Value);

                                     ValorDiarias := Periodo * (qryConsultaReservaValorPeriodoVeiculo.Value / qryTarifaPeriodoTarifa.Value);
                                     ValorTarifa := qryConsultaReservaValorPeriodoVeiculo.Value;
                                     Body.Add('<b>Valor Diária:</b> ' + FormatFloat('R$ ###,###,##0.00',qryConsultaReservaValorPeriodoVeiculo.Value / qryTarifaPeriodoTarifa.Value ) + ' X '   +
                                                                 IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,###,##0.00',ValorDiarias) + '<br>');
                                     //Tarifa com desconto
                                     if (qryTarifaTarifaNacional.Value = 'N') OR (qryConsultaReservaPercDescontoTempo.ISNULL) OR (qryConsultaReservaPercDescontoTempo.Value = 0)then
                                          ValorDesconto := 0
                                     else
                                          ValorDesconto := ((qryConsultaReservaValorPeriodoVeiculo.Value * qryConsultaReservaPercDescontoTempo.Value) /100);

                                     if ValorDesconto > 0 then
                                     begin

                                          if (qryTarifaTarifaNacional.Value = 'N') OR (qryConsultaReservaPercDescontoTempo.ISNULL) OR (qryConsultaReservaPercDescontoTempo.Value <= 0)then
                                               ValorTarifa := qryConsultaReservaValorPeriodoVeiculo.Value
                                          else
                                               ValorTarifa := qryConsultaReservaValorPeriodoVeiculo.Value - ((qryConsultaReservaValorPeriodoVeiculo.Value * qryConsultaReservaPercDescontoTempo.Value) /100);

                                          ValorDiarias := Periodo * (ValorTarifa / qryTarifaPeriodoTarifa.Value);
                                          Body.Add('<b>Valor com Desconto:</b> ' + FormatFloat('R$ ###,###,##0.00',ValorTarifa / qryTarifaPeriodoTarifa.Value ) + ' X '   +
                                                                      IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,###,##0.00',ValorDiarias)+ '<br>');
                                     end;
                                      //Horas Extras
                                     if (qryConsultaReservaDataTermino.Value > qryConsultaReservaDataInicio.Value) and
                                        (StrToTime(Copy(qryConsultaReservaHoraInicio.Value,1,2)+ ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2)) < StrToTime(Copy(qryConsultaReservaHoraTermino.Value,1,2) + ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2))) then
                                          HorasExtras := (Round((StrToTime(Copy(qryConsultaReservaHoraTermino.Value,1,2)+ ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2)) -  StrToTime(Copy(qryConsultaReservaHoraInicio.Value,1,2) + ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2)))* 24 +  0.499999));
                                     if HorasExtras <= qryParametrosEmpresaMaximoHorasCortesia.Value then
                                          HorasExtras := 0;
                                     if (HorasExtras > 1) and (HorasExtras < qryParametrosEmpresaMaximoHorasExtras.Value) then
                                     begin
                                          ValorHoraExtra := ((ValorTarifa / qryTarifaPeriodoTarifa.Value)/qryParametrosEmpresaMaximoHorasExtras.Value)* HorasExtras;
                                          if not DiariaAMaisHoraExtra then
                                          begin
                                               Body.Add('<b>Horas Extras:</b> ' +  FormatFloat('R$###,##0.00',0) + ' X 0 = ' +
                                                                           FormatFloat('R$###,##0.00',0)+ '<br>');
                                          end
                                          else
                                          begin
                                               Body.Add('<b>Horas Extras:</b> ' +  FormatFloat('R$###,##0.00',((ValorTarifa / qryTarifaPeriodoTarifa.Value)/qryParametrosEmpresaMaximoHorasExtras.Value)) + ' X ' +
                                                                           FloatToStr(Round(HorasExtras)) + ' = ' +
                                                                           FormatFloat('R$###,##0.00',ValorHoraExtra)+ '<br>');
                                          end;
                                     end;
                                     if qryTarifaPeriodoTarifa.Value > 0 then
                                          FranquiaKm := Periodo * Trunc(qryTarifaFranquiaKmRodado.Value / qryTarifaPeriodoTarifa.Value)
                                     else
                                          FranquiaKm := Periodo * trunc(qryTarifaFranquiaKmRodado.Value / 1);
                                      //Cobertura
                                     if qryParametrosEmpresaDefinirValorProtecaoPor.Value = 'G' then
                                     begin
                                          if (qryTarifaValorPeriodoSegAd.Value > 0) and (HorasExtras > 0)and (HorasExtras > qryParametrosEmpresaMaximoHorasExtras.Value) then
                                          begin
                                               ValorCobertura := (qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) * (Periodo);
                                               Body.Add('<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) + ' X ' + IntToStr(Periodo) + ' = '  + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end
                                          else
                                          if (qryTarifaValorPeriodoSegAd.Value > 0) and (HorasExtras > 1) and not DiariaAMaisHoraExtra then
                                          begin
                                               ValorCobertura := (qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) * (Periodo+1);
                                               Body.Add('<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) + ' X ' + IntToStr(Periodo + 1) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end
                                          else
                                          if (qryTarifaValorPeriodoSegAd.Value > 0) then
                                          begin
                                               ValorCobertura := (qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) * Periodo;
                                               Body.Add('<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) + ' X ' + IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end;
                                     end
                                     else
                                     begin
                                          if (qryProtecaoValorProtecao.Value > 0) and (HorasExtras > 0)and (HorasExtras > qryParametrosEmpresaMaximoHorasExtras.Value) then
                                          begin
                                               ValorCobertura := (qryProtecaoValorProtecao.Value) * (Periodo);
                                               Body.Add('<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryProtecaoValorProtecao.Value) + ' X ' + IntToStr(Periodo) + ' = '  + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end
                                          else
                                          if (qryProtecaoValorProtecao.Value > 0) and (HorasExtras > 1) and not DiariaAMaisHoraExtra then
                                          begin
                                               ValorCobertura := (qryProtecaoValorProtecao.Value) * (Periodo +1);
                                               Body.Add('<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryProtecaoValorProtecao.Value) + ' X ' + IntToStr(Periodo +1) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end
                                          else
                                          if (qryProtecaoValorProtecao.Value > 0) then
                                          begin
                                               ValorCobertura := (qryProtecaoValorProtecao.Value) * Periodo;
                                               Body.Add('<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryProtecaoValorProtecao.Value) + ' X ' + IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end;
                                     end;
                                     Body.Add('</blockquote>');
                                     Body.Add('</td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     if qryListarReservaServicoAdicional.RecordCount > 0 then
                                     begin
                                          Body.Add('<table border="1" width="100%">');
                                          Body.Add('<tr>');
                                          Body.Add('<td>');
                                          Body.Add('<p align="center"><b>SERVIÇOS ADICIONAIS</b></td>');
                                          Body.Add('</tr>');
                                          Body.Add('</table>');
                                          Body.Add('<table border="1" width="100%"> ');
                                          Body.Add('<tr><td><blockquote>');

                                          while not qryListarReservaServicoAdicional.Eof do
                                          begin
                                                if qryListarReservaServicoAdicionalCalculoPorDiarias.Value = 'S' then
                                                begin
                                                     if HorasExtras <= 0 then
                                                     begin
                                                          Body.Add('<b>' + qryListarReservaServicoAdicionalDescricao.Value + '</b><br>');
                                                          ValorAdicional := qryListarReservaServicoAdicionalValor.Value * Periodo;
                                                          Body.Add(' - ' + FormatFloat('###,###,##0.00', qryListarReservaServicoAdicionalValor.Value) + ' X ' +
                                                                                      IntToStr( Periodo)+ ' = ' + FormatFloat('R$ ###,###,##0.00',ValorAdicional)+ '<br>');
                                                          TotalAdicional := TotalAdicional + ValorAdicional;
                                                     end
                                                     else
                                                     if HorasExtras > qryParametrosEmpresaMaximoHorasExtras.Value then
                                                     begin
                                                          ValorAdicional := qryListarReservaServicoAdicionalValor.Value * Periodo;
                                                          ServicoAdicional:= ServicoAdicional + '<b>' + qryListarReservaServicoAdicionalDescricao.Value + '</b><br>' +
                                                          ' - ' + FormatFloat('###,###,##0.00', qryListarReservaServicoAdicionalValor.Value) + ' X ' +
                                                                                      IntToStr( Periodo)+ ' = ' + FormatFloat('R$ ###,###,##0.00',ValorAdicional)+ '<br>';
                                                          TotalAdicional := TotalAdicional + ValorAdicional;
                                                     end;
                                                     begin
                                                          Body.Add('<b>' + qryListarReservaServicoAdicionalDescricao.Value + '</b><br>');
                                                          ValorAdicional := qryListarReservaServicoAdicionalValor.Value * (Periodo +1);
                                                          Body.Add(' - ' + FormatFloat('###,###,##0.00', qryListarReservaServicoAdicionalValor.Value) + ' X ' +
                                                                                      IntToStr( Periodo+1)+ ' = ' + FormatFloat('R$ ###,###,##0.00',ValorAdicional)+ '<br>');
                                                          TotalAdicional := TotalAdicional + ValorAdicional;
                                                     end;
                                                end
                                                else
                                                begin
                                                     Body.Add('<b>' + qryListarReservaServicoAdicionalDescricao.Value + '</b><br>');
                                                     Body.Add(' - ' + FormatFloat('###,###,##0.00', qryListarReservaServicoAdicionalValor.Value) + '<br>');
                                                     TotalAdicional := TotalAdicional + qryListarReservaServicoAdicionalValor.Value;
                                                end;
                                                qryListarReservaServicoAdicional.Next;
                                          end;
                                          Body.Add('Valor Total Adicionais ' + FormatFloat('R$ ###,###,##0.00',TotalAdicional));
                                          Body.Add('</blockquote></td></tr>');
                                          Body.Add('</table>');
                                     end;
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<p align="center"><b>TOTAL GERAL</b></td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%"> ');
                                     Body.Add('<tr><td><blockquote>');
                                     //Taxa Administrativa
                                     if qryConsultaReservaTaxaServico.Value > 0 then
                                     begin
                                          Body.Add('<b>Taxa de Serviço:</b> ' + FormatFloat('##0.00 %',qryConsultaReservaTaxaServico.Value) + '<br>');
                                          ValorTaxaServico := ((ValorDiarias + ValorHoraExtra + ValorKm + ValorCobertura +  ValorTerceiros + ValorTaxaEntregaDevolucao + TotalAdicional)/ 100) * qryConsultaReservaTaxaServico.Value;
                                     end;
                                     Body.Add('<b>Total Estimado da Locação:</b> ' + FormatFloat('R$ ###,###,##0.00',ValorDiarias + ValorHoraExtra + ValorKm + TotalAdicional + ValorCobertura + ValorTerceiros + ValorTaxaServico + ValorTaxaEntregaDevolucao));
                                     Body.Add('</blockquote></td></tr>');
                                     Body.Add('</table>');
                                     if Length(qryConsultaReservaObservacoes.AsString)> 0 then
                                     begin
                                          Body.Add('<table border="1" width="100%"> ');
                                          Body.Add('<tr><td><blockquote>');
                                          Body.Add('<b>Observações sobre a reserva</b><br>');
                                          Body.Add(qryConsultaReservaObservacoes.AsString);
                                          Body.Add('</blockquote></td></tr>');
                                          Body.Add('</table>');
                                     end;
                                     Body.Add('<table border="1" width="100%"> ');
//                                     Body.Add('<tr><td><blockquote>');
//                                     Body.Add('<b>CONDIÇÕES</b> (Ver http://yesrentacar.com.br/condicoes-de-aluguel e a Rede de Agências e Tarifas,');
//                                     Body.Add(' impressa e disponível nas Agências Yes de Aluguel de Carros):<br>');
//                                     Body.Add('1 - Para a retirada do veículo o locatário deve ter mais de 21 anos de idade e ser habilitado há mais de dois anos, possuir cartão de crédito');
//                                     Body.Add(' e cadastro previamente aprovado.<br>');
//                                     Body.Add('2 - No Total Estimado para a Locação não estão calculadas despesas com reabastecimento de combustível e/ou eventuais acréscimos,');
//                                     Body.Add(' como taxa de retorno, multas de trânsito e outras previstas no contrato de locação.<br>');
//                                     Body.Add('3 - DO CARRO RESERVADO – A reserva é feita por Grupo de veículo, sem garantia de modelo, salvo para carros especiais ou de luxo,');
//                                     Body.Add(' prévia e expressamente acordado com a Locadora.<br>');
//                                     Body.Add('4 - Na Falta do carro reservado a locação será atendida com veículo similar, do mesmo grupo ou superior,');
//                                     Body.Add(' da Franqueada Yes Rent a Car ou de parceiros, mantidas as condições da reserva.<br>');
//                                     Body.Add('5 - Descontos e promoções não são cumulativos e não incidem sobre as tarifas semanais, quinzenais ou mensais.<br>');
//                                     Body.Add('6 - Pagamento/faturamento: aceitamos cartões de crédito e faturamos para empresas cadastradas. Sujeito a aprovação de crédito.<br>');
//                                     Body.Add('7 – As tarifas semanais, quinzenais e mensais são válidas mediante pagamento antecipado.<br>');
//                                     Body.Add('8 - Garantia: as reservas são mantidas pelo período de até uma hora após a prevista e dentro do horário de funcionamento da');
//                                     Body.Add(' Agência de retirada do carro.<br>');
//                                     Body.Add('9 – No show (ausência no comparecimento): a reserva não honrada e não cancelada com antecedência mínima de 12 (doze) horas,');
//                                     Body.Add(' dentro do horário de funcionamento da agência de retirada do veículo, poderá sofrer cobrança de uma diária do carro reservado, a título de no show.<br>');
//                                     Body.Add('10 – Devolução do carro em outra agência YES: é necessária autorização prévia e expressa da Locadora e pagamento de taxa de retorno,');
//                                     Body.Add(' de R$ 1,20 por km rodado entre a origem e o destino, acrescida de eventual pedágio, ou valores pré-acordados.<br>');
//                                     Body.Add('11 - Alteração, cancelamento ou consulta da reserva: informe o número desta e seu nome para nossa');
//                                     Body.Add(' Central Nacional de Reservas: 0800 709 25 35, no horário das 8 h às 19h45, de segunda a sexta e, das 8 h às 18 h, aos sábados.<br>');
//                                     Body.Add('</blockquote></td></tr>');
                                     Body.Add('</table>');
                                     Body.Add('</blockquote></td></tr>');
                                     Body.Add('</table>');
                                     Body.Add('</body>');
                                     Body.Add('</html>');
                                     ContentTransfer := 'quoted-printable';
                                     ContentType := 'text/html';
                                     ParentPart := -1;
                                end;
                           end;
                           try
                                IdSMTP.Send(lMensagem);
                                Result := true;
                           except
                               Result := false;
                           end;
                      finally
                           IdSMTP.Disconnect;
                      end;
                 finally
                      lMensagem.Free;
                 end;
            finally
                 IdSMTP.Free;
            end;
       end;
  except
       on E: Exception do
       Result := false;
  end;
end;

function TLocavia.EnviarEmailCancelamento(CodigoReserva: Integer; Empresa,
  Email, NomeCliente: String): Boolean;
var
  IdSMTP : TIdSMTP;
  lMensagem : TIdMessage;
  Attachment: TIdAttachmentFile;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  try
       if qryParametrosEmail.Active then
            qryParametrosEmail.Close;
       qryParametrosEmail.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
       qryParametrosEmail.Parameters.ParamByName('CodigoEmpresa').Value := 1;//StrToInt(Empresa);
       qryParametrosEmail.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
       qryParametrosEmail.Parameters.ParamByName('CodigoUnidade').Value := 1;
       qryParametrosEmail.Open;
       IdSMTP := TIdSMTP.Create(Application);
       try
           lMensagem := TIdMessage.Create(Application);
           idSMTP.Username := qryParametrosEmailSMTPUsuario.Value;// emaildo usuario
           idSMTP.Password := qryParametrosEmailSMTPSenha.text;// senha do usuario
           idSMTP.Host := qryParametrosEmailSMTPServidor.Value;// host do usuaro ex.: provedo.mail.com.br
           idSMTP.Port :=  qryParametrosEmailSMTPPorta.Value;// porta email -> geralmente 25
           if Length(qryParametrosEmailTipoConexaoCriptografada.Value) > 0 then
                case qryParametrosEmailTipoConexaoCriptografada.Value[1] of
                     'S', 'T':
                     begin
                           with idSMTP do
                           begin
                                try
                                   IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(Application);
                                   idSMTP.IOHandler := IdSSL;
                                   UseTLS := utUseImplicitTLS;
                                   except on E: Exception do
                                   begin
                                        IOHandler := TIdIOHandler.MakeDefaultIOHandler(Application);
                                        UseTLS := utNoTLSSupport;
                                   end;
                                   end;
                                   if Assigned(IdSSL) then
                                   begin
                                        IdSSL.SSLOptions.Method := sslvSSLv3;
                                        IdSSL.SSLOptions.Mode := sslmClient;
                                   end;
                                   AuthType := satDefault;
                           end;
                     end;
                end;
           idSMTP.Connect;
           try
                with lMensagem do
                begin
                     Subject := 'Cancelamento de Reserva ';// assunto
                     From.Address := qryParametrosEmailEmail.Value;// email de origem
                     // Email do Cliente
                     Recipients.EmailAddresses := Email;// email de destino
                     ContentType := 'multipart/mixed';
                     IsEncoded := True;
                     // testo do email
                     Body.Text := 'Cancelamento de Reserva - Código; ' + IntToStr(CodigoReserva);
                     with TIdText.Create( MessageParts ) do
                     begin
                          Body.Add('<html>');
                          Body.Add('<head>');
                          Body.Add('<meta http-equiv="Content-Language" content="pt-br">');
                          Body.Add('<meta http-equiv="Content-Type" content="text/html charset=windows-1252">');
                          Body.Add('<title>CANCELAMENTO DE RESERVA DE VEÍCULO</title>');
                          Body.Add('</head>');
                          Body.Add('<body leftmargin="10">');
                          Body.Add('<table border="1" width="100%">');
                          Body.Add('<tr><td><b>');             // http://www.yesrentacar.com.br/logo.jpg
                          Body.Add('<img border="0" src=" ' + qryParametrosEmailCaminhoLogoWeb.Value + '" width="140" height="100"></b></td></tr>');
                          Body.Add('<tr>');
                          Body.Add('<td>');
                          Body.Add('<p align="center"><b>CANCELAMENTO DE RESERVA DE VEÍCULO</b></td>');
                          Body.Add('</tr>');
                          Body.Add('</table>');
                          Body.Add('<p>&nbsp;</p>');
                          Body.Add('<table border="1" width="100%">');
                          Body.Add('<tr>');
                          Body.Add('<td>');
                          Body.Add('<blockquote>');
                          Body.Add('Prezado cliente ' + NomeCliente + '<br>');
                          Body.Add(''+ '<br>');
                          Body.Add('Reserva de código; ' + IntToStr(CodigoReserva) + ' cancelada com sucesso.'+ '<br>');
                          Body.Add('Esperamos atende-lo em uma próxima oportunidade.' + '<br>');
                          Body.Add(''+ '<br>');
                          Body.Add('Atenciosamente,' + '<br>');
                          Body.Add(''+ '<br>');
                          Body.Add(qryParametrosEmailDescricaoUnidade.Value + '<br>');
                          Body.Add(''+ '<br>');
                          Body.Add('<p>&nbsp;</p>');
                          Body.Add('<img border="0" src="'+ qryParametrosEmailCaminhoAssinatura.Value +'" width="470" height="100"> ');
                          Body.Add('</blockquote></td></tr>');
                          Body.Add('</table>');
                          Body.Add('</blockquote></td></tr>');
                          Body.Add('</table>');
                          Body.Add('</body>');
                          Body.Add('</html>');
                          ContentTransfer := 'quoted-printable';
                          ContentType := 'text/html';
                          ParentPart := -1;
                     end;
                end;
                idSMTP.Send(lMensagem);
           finally
                idSMTP.Disconnect;
           end;
       finally
            lMensagem.Free;
       end;
  finally
       IdSMTP.Free;
  end;
end;

function TLocavia.GerarToken: String;
var
  Texto: String;
  Arquivo: TStringList;
begin
  try
       Texto := '';
       Texto := MD5(DateTimeToStr(Now));
       Result := Texto;
       Arquivo := TStringList.Create;
       if FileExists(gsAppPath + gsAppName + '.txt')then
            Arquivo.LoadFromFile(gsAppPath + gsAppName + '.txt');
       Arquivo.Add(Texto + '|' + DateTimeToStr(Now));
       Arquivo.SaveToFile(gsAppPath + gsAppName + '.txt');
  finally
       Arquivo.Free;
  end;
end;

function TLocavia.GrupoVeiculos(): TStringStream;
var
  Objeto,
  Objeto2,
  Objeto3,
  objeto4: TJSONObject;
  Requisicao: TJSONObject;
  GrupoVeiculos,
  Erros,
  Caracteristicas,
  ModelosVeiculos,
  ServicosAdicionais,
  Protecoes,
  DescricaoTarifa: TJSONArray;
  DadosRequisicao: TWebModule;
  I: Integer;
  Letra,
  HoraInicio,
  HoraTermino: String;
  CodigoEmpresa,
  CodigoUnidade,
  Periodo: Integer;
  DataInicio,
  DataTermino: TDateTime;
  Campo,
  IdentificadorEmpresa,
  Msg: String;
begin
  try
       Erros := TJSONArray.Create;
       GrupoVeiculos := TJSONArray.Create;
       DadosRequisicao := GetDataSnapWebModule;
       try
           CodigoEmpresa := StrToIntdef(DadosRequisicao.Request.QueryFields.Values['codigoempresa'],0);
           CodigoUnidade := StrToIntdef(DadosRequisicao.Request.QueryFields.Values['codigounidade'],0);
           Periodo := StrToIntdef(DadosRequisicao.Request.QueryFields.Values['periodo'],0);
           DataInicio := StrToDateTimedef(DadosRequisicao.Request.QueryFields.Values['datainicio'],0);
           HoraInicio := RemoveMascSt(DadosRequisicao.Request.QueryFields.Values['horainicio'],cjHora);
           DataTermino := StrToDateTimedef(DadosRequisicao.Request.QueryFields.Values['datatermino'],0);
           HoraTermino := RemoveMascSt(DadosRequisicao.Request.QueryFields.Values['horatermino'],cjHora);
           IdentificadorEmpresa := DadosRequisicao.Request.GetFieldByName('empresa');
           if Length(IdentificadorEmpresa) = 14 then
           begin
                IdentificadorEmpresa := ObterCodigoIdentificacao(IdentificadorEmpresa);
                if (Length(IdentificadorEmpresa) =  0) or (IdentificadorEmpresa = 'erro') then
                begin
                      Objeto := TJSONObject.Create;
                      Objeto.AddPair('Erro', TJSONString.Create('CNPJ da Empresa é obrigatório.'));
                      Erros.AddElement(Objeto);
                end;
           end;
       except
           //
       end;
       if CodigoEmpresa <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Código da Empresa é obrigatório.'));
            Erros.AddElement(Objeto);
       end;
       if CodigoUnidade <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Código da Unidade é obrigatório.'));
            Erros.AddElement(Objeto);
       end;
       if Periodo <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Período é obrigatório.'));
            Erros.AddElement(Objeto);
       end;
       if DataInicio <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Data de Início é obrigatório.'));
            Erros.AddElement(Objeto);
       end;
       if DataTermino <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Data de Termino é obrigatório.'));
            Erros.AddElement(Objeto);
       end;
       if ConectaBanco(DadosRequisicao.Request.GetFieldByName('empresa')) then
       begin
            if Erros.Size > 0 then
                 Result := RetornoPadraoArray(Erros, GrupoVeiculos)
            else
            begin
                 if qryParametrosEmpresa.Active then
                      qryParametrosEmpresa.Close;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryParametrosEmpresa.Open;

                 if qryParametrosUnidade.Active then
                     qryParametrosUnidade.Close;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                 qryParametrosUnidade.Open;

                 if qryGrupoVeiculos.Active then
                      qryGrupoVeiculos.Close;
                 qryGrupoVeiculos.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryGrupoVeiculos.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryGrupoVeiculos.Parameters.ParamByName('TodasLetras').DataType := ftBoolean;
                 qryGrupoVeiculos.Parameters.ParamByName('Letra').DataType := ftString;
                 if Letra <> '' then
                 begin
                      qryGrupoVeiculos.Parameters.ParamByName('TodasLetras').Value := false;
                      qryGrupoVeiculos.Parameters.ParamByName('Letra').Value := Letra;
                 end
                 else
                      qryGrupoVeiculos.Parameters.ParamByName('TodasLetras').Value := true;
                 qryGrupoVeiculos.Parameters.ParamByName('TodosGrupos').DataType := ftBoolean;
                 qryGrupoVeiculos.Parameters.ParamByName('TodosGrupos').Value := true;
                 qryGrupoVeiculos.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryGrupoVeiculos.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                 qryGrupoVeiculos.Parameters.ParamByName('Periodo').DataType := ftSmallint;
                 qryGrupoVeiculos.Parameters.ParamByName('PromoInicio').DataType := ftInteger;
                 qryGrupoVeiculos.Parameters.ParamByName('PromoTermino').DataType := ftInteger;
                 qryGrupoVeiculos.Parameters.ParamByName('TodosGruposDisponiveis').DataType := ftInteger;
                 if qryParametrosEmpresaAceitaReservaConflitante.Value = 'S' then
                      qryGrupoVeiculos.Parameters.ParamByName('TodosGruposDisponiveis').Value := 1
                 else
                      qryGrupoVeiculos.Parameters.ParamByName('TodosGruposDisponiveis').Value := 0;
                 if IdentificadorEmpresa = '511' then
                 begin
                      qryGrupoVeiculos.Parameters.ParamByName('Periodo').Value := 1;
                      if qryPromocao.Active then
                           qryPromocao.Close;
                      qryPromocao.Parameters.ParamByName('Promo').DataType := ftInteger;
                      qryPromocao.Parameters.ParamByName('Promo').Value := (DataTermino - DataInicio);
                      qryPromocao.Open;
                      if qryPromocao.IsEmpty then
                      begin
                           qryGrupoVeiculos.Parameters.ParamByName('PromoInicio').Value := 0;
                           qryGrupoVeiculos.Parameters.ParamByName('PromoTermino').Value := 999;
                      end
                      else
                      begin
                           qryGrupoVeiculos.Parameters.ParamByName('PromoInicio').Value := qryPromocaoPromoInicio.Value;
                           qryGrupoVeiculos.Parameters.ParamByName('PromoTermino').Value := qryPromocaoPromoTermino.Value;
                      end;
                 end
                 else
                 begin
                      if qryVeiculosTarifa.Active then
                           qryVeiculosTarifa.Close;
                      qryVeiculosTarifa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                      qryVeiculosTarifa.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                      qryVeiculosTarifa.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                      qryVeiculosTarifa.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                      qryVeiculosTarifa.Parameters.ParamByName('Periodo').DataType := ftSmallint;
                      qryVeiculosTarifa.Parameters.ParamByName('Periodo').Value := Periodo;
                      qryVeiculosTarifa.Parameters.ParamByName('TodasTarifas').DataType := ftBoolean;
                      if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
                           qryVeiculosTarifa.Parameters.ParamByName('TodasTarifas').Value := True
                      else
                           qryVeiculosTarifa.Parameters.ParamByName('TodasTarifas').Value := False;
                      qryVeiculosTarifa.Open;
                      if not qryVeiculosTarifa.IsEmpty then
                      begin
                           qryGrupoVeiculos.Parameters.ParamByName('Periodo').Value := Periodo;
                      end
                      else
                      if Periodo >= 7 then
                           qryGrupoVeiculos.Parameters.ParamByName('Periodo').Value := 7
                      else
                           qryGrupoVeiculos.Parameters.ParamByName('Periodo').Value := 1;
                      qryGrupoVeiculos.Parameters.ParamByName('PromoInicio').Value := 0;
                      qryGrupoVeiculos.Parameters.ParamByName('PromoTermino').Value := 999;
                 end;
                 qryGrupoVeiculos.Parameters.ParamByName('TodasTarifas').DataType := ftBoolean;
                 if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
                      qryGrupoVeiculos.Parameters.ParamByName('TodasTarifas').Value := true
                 else
                      qryGrupoVeiculos.Parameters.ParamByName('TodasTarifas').Value := false;

                  // Testar Periodo tarifas
                 qryGrupoVeiculos.Parameters.ParamByName('DataInicio').DataType := ftDateTime;
                 qryGrupoVeiculos.Parameters.ParamByName('DataInicio').Value := DataInicio;
                 qryGrupoVeiculos.Parameters.ParamByName('DataTermino').DataType := ftDateTime;
                 qryGrupoVeiculos.Parameters.ParamByName('DataTermino').Value := DataTermino;
                 qryGrupoVeiculos.Parameters.ParamByName('DataHoraInicio').DataType := ftDateTime;
                 qryGrupoVeiculos.Parameters.ParamByName('DataHoraInicio').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryGrupoVeiculos.Parameters.ParamByName('DataHoraTermino').DataType := ftDateTime;
                 qryGrupoVeiculos.Parameters.ParamByName('DataHoraTermino').Value := StrToDateTime(DateTimeToStr(DataTermino) + ' ' + Copy(HoraTermino,1,2) + ':00.000');
                 qryGrupoVeiculos.Open;
                 while not qryGrupoVeiculos.Eof do
                 begin
                      Objeto := TJSONObject.Create;
                      for I := 0 to qryGrupoVeiculos.FieldCount -1 do
                           Objeto.AddPair(qryGrupoVeiculos.Fields[I].FieldName, ConverteJSON(qryGrupoVeiculos.Fields[I]));
                      if qryParametrosUnidadeTaxaServicoReservaWeb.IsNull then
                           Objeto.AddPair('TaxaAdministrativa',TJSONNumber.Create(0))
                      else
                           Objeto.AddPair('TaxaAdministrativa', ConverteJSON(qryParametrosUnidadeTaxaServicoReservaWeb));
                      if qryGrupoVeiculosCaracteristicas.Active then
                           qryGrupoVeiculosCaracteristicas.Close;
                      qryGrupoVeiculosCaracteristicas.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                      qryGrupoVeiculosCaracteristicas.Parameters.ParamByName('CodigoGrupo').Value := qryGrupoVeiculosCodigoGrupo.Value;
                      qryGrupoVeiculosCaracteristicas.Open;
                      Caracteristicas := TJSONArray.Create;
                      while not qryGrupoVeiculosCaracteristicas.Eof do
                      begin
                           for I := 0 to qryGrupoVeiculosCaracteristicas.FieldCount -1 do
                                Caracteristicas.Add(qryGrupoVeiculosCaracteristicas.Fields[I].ASString);
                           qryGrupoVeiculosCaracteristicas.Next;
                      end;
                      Objeto.AddPair('Caracteristicas', Caracteristicas);
                           //Verifica se existe Veiculos disponiveis
                      if qryValidaVeiculosDisponiveis.Active then
                           qryValidaVeiculosDisponiveis.Close;
                      qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                      qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoGrupo').Value := qryGrupoVeiculosCodigoGrupo.Value;
                      qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                      qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                      qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                      qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                      qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicio').DataType := ftDateTime;
                      qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicio').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                      qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTermino').DataType := ftDateTime;
                      qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTermino').Value := StrToDateTime(DateTimeToStr(DataTermino) + ' ' + Copy(HoraTermino,1,2) + ':00.000');
                      qryValidaVeiculosDisponiveis.Open;
                      if (IdentificadorEmpresa = '511') or (IdentificadorEmpresa = '629') then
                           Objeto.AddPair('VeiculosDisponiveis', TJSONTrue.Create)
                      else
                      begin
                           if qryValidaVeiculosDisponiveis.IsEmpty then
                                Objeto.AddPair('VeiculosDisponiveis', TJSONFalse.Create)
                           else
                                Objeto.AddPair('VeiculosDisponiveis', TJSONTrue.Create);
                      end;
                      Objeto.AddPair('DefinirValorProtecaoPor',qryParametrosEmpresaDefinirValorProtecaoPor.Value);
                      // tarifa do Grupo Veiculo
                      //abra a query de descricao da tarifa
                      if qryDescricaoTarifaProtecao.Active then
                           qryDescricaoTarifaProtecao.Close;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo').Value := qryGrupoVeiculosCodigoGrupo.Value;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo').DataType := ftInteger;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('PromoInicio').DataType := ftInteger;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('PromoTermino').DataType := ftInteger;
                      if (IdentificadorEmpresa = '511') then
                      begin
                           qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo').Value := 1;
                           if qryPromocao.Active then
                                qryPromocao.Close;
                           qryPromocao.Parameters.ParamByName('Promo').DataType := ftInteger;
                           qryPromocao.Parameters.ParamByName('Promo').Value := (DataTermino - DataInicio);
                           qryPromocao.Open;
                           if qryPromocao.IsEmpty then
                           begin
                                qryDescricaoTarifaProtecao.Parameters.ParamByName('PromoInicio').Value := 0;
                                qryDescricaoTarifaProtecao.Parameters.ParamByName('PromoTermino').Value := 999;
                           end
                           else
                           begin
                                qryDescricaoTarifaProtecao.Parameters.ParamByName('PromoInicio').Value := qryPromocaoPromoInicio.Value;
                                qryDescricaoTarifaProtecao.Parameters.ParamByName('PromoTermino').Value := qryPromocaoPromoTermino.Value;
                           end;
                           qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo').Value := 1;
                      end
                      else
                      begin
                           if qryVeiculosTarifa.Active then
                                qryVeiculosTarifa.Close;
                           qryVeiculosTarifa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                           qryVeiculosTarifa.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                           qryVeiculosTarifa.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                           qryVeiculosTarifa.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                           qryVeiculosTarifa.Parameters.ParamByName('Periodo').DataType := ftSmallint;
                           qryVeiculosTarifa.Parameters.ParamByName('Periodo').Value := Periodo;
                           qryVeiculosTarifa.Parameters.ParamByName('TodasTarifas').DataType := ftBoolean;
                           if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
                                qryVeiculosTarifa.Parameters.ParamByName('TodasTarifas').Value := True
                           else
                                qryVeiculosTarifa.Parameters.ParamByName('TodasTarifas').Value := False;
                           qryVeiculosTarifa.Open;
                           if not qryVeiculosTarifa.IsEmpty then
                           begin
                                qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo').Value := Periodo;
                           end
                           else
                           if Periodo >= 7 then
                                qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo').Value := 7
                           else
                                qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo').Value := 1;
                           qryDescricaoTarifaProtecao.Parameters.ParamByName('PromoInicio').Value := 0;
                           qryDescricaoTarifaProtecao.Parameters.ParamByName('PromoTermino').Value := 999;

                      end;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas').DataType := ftBoolean;
                      if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
                           qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas').Value := true
                      else
                           qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas').Value := false;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('DataInicio').DataType := ftDateTime;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('DataInicio').Value := DataInicio;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('DataTermino').DataType := ftDateTime;
                      qryDescricaoTarifaProtecao.Parameters.ParamByName('DataTermino').Value := DataTermino;
                      qryDescricaoTarifaProtecao.Open;
                      DescricaoTarifa := TJSONArray.Create;
                      while not qryDescricaoTarifaProtecao.Eof do
                      begin
                           Objeto3 := TJSONObject.Create;
                           for I := 0 to qryDescricaoTarifaProtecao.FieldCount -1 do
                           begin
                                if qryDescricaoTarifaProtecao.Fields[I].DisplayLabel = 'KmLivre' then
                                begin
                                     if qryDescricaoTarifaProtecao.Fields[I].AsString = 'S' then
                                          Objeto3.AddPair(qryDescricaoTarifaProtecao.Fields[I].DisplayLabel, TJSONTrue.Create)
                                     else
                                          Objeto3.AddPair(qryDescricaoTarifaProtecao.Fields[I].DisplayLabel, TJSONFalse.Create)
                                end
                                else
                                     Objeto3.AddPair(qryDescricaoTarifaProtecao.Fields[I].DisplayLabel,ConverteJSON(qryDescricaoTarifaProtecao.Fields[I]));
                           end;
                           DescricaoTarifa.AddElement(Objeto3);
                           qryDescricaoTarifaProtecao.Next;
                      end;
                     Objeto.AddPair('Tarifas', DescricaoTarifa);
                     // Proteções
                     Protecoes := TJSONArray.Create;
                     if qryListaProtecao.Active then
                          qryListaProtecao.Close;
                     if qryParametrosEmpresaDefinirValorProtecaoPor.Value = 'G' then
                     begin
                          qryListaProtecao.SQL[4] := ' AND Protecao.CodigoProtecao = :CodigoProtecao';
                          qryListaProtecao.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                          qryListaProtecao.Parameters.ParamByName('CodigoProtecao').Value := qryParametrosEmpresaCodigoProtecaoDefaultReservaWeb.Value;
                     end
                     else
                          qryListaProtecao.SQL[4] := ' -- Filtro de protecao reserva';
                     qryListaProtecao.Open;
                     Protecoes := TJSONArray.Create;
                     while not qryListaProtecao.Eof do
                     begin
                          Objeto2 := TJSONObject.Create;
                          for I := 0 to qryListaProtecao.FieldCount -1 do
                              if qryListaProtecao.Fields[I].DisplayLabel = 'Condicoes' then
                              begin
                                   if not qryListaProtecao.Fields[I].IsNull then
                                   begin
                                        Campo := qryListaProtecao.Fields[I].Text;
                                        Campo := StringReplace(Campo, #$D#$A, '', [rfReplaceAll]);
                                        Campo := StringReplace(Campo,'"', '', [rfReplaceAll]);
                                        Campo := StringReplace(Campo,'/', '-', [rfReplaceAll]);
                                        Objeto2.AddPair(qryListaProtecao.Fields[I].DisplayLabel, TJSONString.Create(Campo))
                                   end
                                   else
                                        Objeto2.AddPair(qryListaProtecao.Fields[I].DisplayLabel, TJSONString.Create(''));
                              end
                              else
                              if qryListaProtecao.Fields[I].DisplayLabel = 'NomeProtecao' then
                              begin
                                   Campo := qryListaProtecao.Fields[I].Text;
                                   Campo := StringReplace(Campo,'/', '-', [rfReplaceAll]);
                                   Objeto2.AddPair(qryListaProtecao.Fields[I].DisplayLabel, TJSONString.Create(Campo))
                              end
                              else
                              if (qryListaProtecao.Fields[I].DisplayLabel = 'ValorProtecao') and (qryListaProtecao.Fields[I].IsNull) then
                                    Objeto2.AddPair(qryListaProtecao.Fields[I].DisplayLabel,TJSONNumber.Create(0))
                              else

                                Objeto2.AddPair(qryListaProtecao.Fields[I].DisplayLabel,ConverteJSON(qryListaProtecao.Fields[I]));
                          Protecoes.AddElement(Objeto2);
                          qryListaProtecao.Next;
                     end;
                     Objeto.AddPair('Protecoes', Protecoes);
                     //Modelos dos Veiculos do Grupo
                     ModelosVeiculos := TJSONArray.Create;
                     if qryVeiculosModelos.Active then
                          qryVeiculosModelos.Close;
                     qryVeiculosModelos.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                     qryVeiculosModelos.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                     qryVeiculosModelos.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                     qryVeiculosModelos.Parameters.ParamByName('CodigoGrupo').Value := qryGrupoVeiculosCodigoGrupo.Value;
                     qryVeiculosModelos.Open;
                     while not qryVeiculosModelos.Eof  do
                     begin
                          for I := 0 to qryVeiculosModelos.FieldCount -1 do
                               ModelosVeiculos.Add(qryVeiculosModelos.Fields[I].AsString);
                          qryVeiculosModelos.Next;
                     end;
                     Objeto.AddPair('Veiculos', ModelosVeiculos);
                     ServicosAdicionais := TJSONArray.Create;
                     if qryListaServicoAdicionais.Active then
                          qryListaServicoAdicionais.Close;
                     qryListaServicoAdicionais.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                     qryListaServicoAdicionais.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                     qryListaServicoAdicionais.Open;
                     while not qryListaServicoAdicionais.Eof do
                     begin
                          Objeto4 := TJSONObject.Create;
                          for I := 0 to qryListaServicoAdicionais.FieldCount -1 do
                          begin
                               Objeto4.AddPair(qryListaServicoAdicionais.Fields[I].FieldName, ConverteJSON(qryListaServicoAdicionais.Fields[I]));
                               if (qryListaServicoAdicionais.Fields[I].FieldName = 'CalculoPorDiarias')then
                                    if (qryListaServicoAdicionais.Fields[I].AsString = 'S')then
                                         Objeto4.AddPair('IsCalculoDiaria',TJSONTrue.Create)
                                    else
                                         Objeto4.AddPair('IsCalculoDiaria',TJSONFalse.Create)
                          end;
                          ServicosAdicionais.AddElement(Objeto4);
                          qryListaServicoAdicionais.Next;
                     end;
                     Objeto.AddPair('ServicosAdicionais', ServicosAdicionais);
                     GrupoVeiculos.AddElement(Objeto);
                     qryGrupoVeiculos.Next;
                 end;
                 Result := RetornoPadraoArray(Erros, GrupoVeiculos);
            end;
       end
       else
       begin
            Msg := 'Falha ao conectar ao banco de dados.';
            Result := RetornoPadraoArray(Erros, GrupoVeiculos,Msg);
       end;
  finally
       if qryGrupoVeiculos.Active then
            qryGrupoVeiculos.Close;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
       LiberarMemoria;
  end;
end;

procedure TLocavia.InserirTaxaEntregaDevolucao(CodigoReserva,
  CodigoMunicipioRetirada, CodigoMunicipioDevolucao: Integer);
begin
  try
       if qryUnidades.Active then
            qryUnidades.Close;
       qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
       qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioRetirada;
       qryUnidades.Open;
       //Taxa de Entrega
       if (qryUnidadesSobConsulta.Value = 'N') and (qryUnidadesValorTaxaEntrega.Value > 0) and (qryUnidadesCodigoTipoDiversoTaxaEntrega.Value > 0) then
       begin
            if qryGravaReservaServicoAdicional.Active then
                 qryGravaReservaServicoAdicional.Close;
            qryGravaReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
            qryGravaReservaServicoAdicional.Parameters.ParamByName('CodigoServicoAdicional').Value := qryUnidadesCodigoTipoDiversoTaxaEntrega.Value;
            qryGravaReservaServicoAdicional.Parameters.ParamByName('Valor').Value := qryUnidadesValorTaxaEntrega.Value;
            qryGravaReservaServicoAdicional.ExecSQL;
       end;
       if qryUnidades.Active then
            qryUnidades.Close;
       qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
       qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioDevolucao;
       qryUnidades.Open;
       //Taxa de Devolucao
       if (qryUnidadesSobConsulta.Value = 'N') and (qryUnidadesValorTaxaDevolucao.Value > 0) and (qryUnidadesCodigoTipoDiversoTaxaDevolucao.Value > 0) then
       begin
            if qryGravaReservaServicoAdicional.Active then
                 qryGravaReservaServicoAdicional.Close;
            qryGravaReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
            qryGravaReservaServicoAdicional.Parameters.ParamByName('CodigoServicoAdicional').Value := qryUnidadesCodigoTipoDiversoTaxaDevolucao.Value;
            qryGravaReservaServicoAdicional.Parameters.ParamByName('Valor').Value := qryUnidadesValorTaxaDevolucao.Value;
            qryGravaReservaServicoAdicional.ExecSQL;
       end;
  finally
       if qryUnidades.Active then
            qryUnidades.Close;
  end;
end;

function TLocavia.LiberarMemoria: Boolean;
var
  MainHandle: THandle;
begin
  try
    Result := true;
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF);
    CloseHandle(MainHandle);
  except
    Result := false;
  end;
end;

function TLocavia.MD5(Texto: String): String;
var
  md5:TIdHashMessageDigest5;
begin
  md5 := TIdHashMessageDigest5.Create;
  Result := md5.HashStringAsHex(Texto);
end;

function TLocavia.Reservas(Tipo, CPFPassaporte: String): TStringStream;
var
  Objeto,
  CidadeRetirada,
  CidadeDevolucao,
  UnidadeRetirada,
  UnidadeDevolucao,
  Tarifa,
  GrupoVeiculo,
  Protecao,
  ServicoAdicional,
  Cliente,
  Municipio,
  Erro: TJSONObject;
  Caracteristicas,
  Protecoes,
  ServicosAdicionais,
  Erros,
  Retorno: TJSONArray;
  DadosRequisicao: TWebModule;
  I, J: Integer;
  Campo, CodigoBD,
  Msg : String;
begin
  try
       Erros := TJSONArray.Create;
       Retorno := TJSONArray.Create;
       Objeto := TJSONObject.Create;
       Msg := '';
       DadosRequisicao := GetDataSnapWebModule;
       CodigoBD := DadosRequisicao.Request.GetFieldByName('empresa');
       if Length(CodigoBD) = 14 then
       begin
            CodigoBD := ObterCodigoIdentificacao(CodigoBD);
            if (Length(CodigoBD) =  0) or (CodigoBD = 'erro') then
                 Msg := 'Falha ao conectar ao banco de dados.';
       end;
       if ConectaBanco(CodigoBD) then
       begin
            if Tipo = '' then
                 Msg := 'A identificação do tipo Cpf ou Passaporte é obrigatório.'
            else
            if CPFPassaporte = '' then
                 Msg := 'CPF ou Passaporte é obrigatório.'
            else
            if (LowerCase(Tipo) = 'cpf') and not CPFValido(CPFPassaporte) then
                 Msg := 'CPF não é valido.'
            else
            begin
                 if  (LowerCase(Tipo) = 'cpf') then
                 begin
                      if qryHistoricoReservas.Active then
                           qryHistoricoReservas.Close;
                      qryHistoricoReservas.SQL[9] := ' WHERE (Reservas.CPF = ' + #39 + CPFPassaporte + #39 +')';
                      qryHistoricoReservas.Open;
                 end
                 else
                 if  (LowerCase(Tipo) = 'passaporte') then
                 begin
                      if qryHistoricoReservas.Active then
                           qryHistoricoReservas.Close;
                      qryHistoricoReservas.SQL[9] := 'WHERE (Reservas.Passaporte = ' + #39 + CPFPassaporte + #39 +')';
                      qryHistoricoReservas.Open;

                 end
                 else
                 if  (LowerCase(Tipo) = 'codigo') then
                 begin
                      if qryHistoricoReservas.Active then
                           qryHistoricoReservas.Close;
                      qryHistoricoReservas.SQL[9] := 'WHERE (Reservas.CodigoCliente = ' + CPFPassaporte + ')';
                      qryHistoricoReservas.Open;
                 end;
                 while not qryHistoricoReservas.Eof do
                 begin
                       Objeto := TJSONObject.Create;
                       CidadeRetirada := TJSONObject.Create;
                       UnidadeRetirada := TJSONObject.Create;
                       if qryIDUnidade.Active then
                            qryIDUnidade.Close;
                       qryIDUnidade.Parameters.ParamByName('DescricaoUnidade').DataType := ftWideString;
                       qryIDUnidade.Parameters.ParamByName('DescricaoUnidade').Value := qryHistoricoReservasLocalEntregaVeiculo.Value;
                       qryIDUnidade.Open;
                       while not qryIDUnidade.Eof do
                       begin
                            for I := 0 to qryIDUnidade.FieldCount -1 do
                            begin
                                 if (qryIDUnidade.Fields[I].FieldName = 'CodigoMunicipio') or
                                    (qryIDUnidade.Fields[I].FieldName = 'CodigoEmpresa')or
                                    (qryIDUnidade.Fields[I].FieldName = 'Cidade') or
                                    (qryIDUnidade.Fields[I].FieldName = 'Estado') then
                                      CidadeRetirada.AddPair(qryIDUnidade.Fields[I].FieldName, ConverteJSON(qryIDUnidade.Fields[I]))
                                 else
                                 begin
                                      if (qryIDUnidade.Fields[I].FieldName = 'TaxaServicoReservaWeb') then
                                           if qryIDUnidade.Fields[I].IsNull then
                                                UnidadeRetirada.AddPair(qryIDUnidade.Fields[I].FieldName, TJSONNumber.Create(0))
                                           else
                                                UnidadeRetirada.AddPair(qryIDUnidade.Fields[I].FieldName, ConverteJSON(qryIDUnidade.Fields[I]))
                                      else
                                           UnidadeRetirada.AddPair(qryIDUnidade.Fields[I].FieldName, ConverteJSON(qryIDUnidade.Fields[I]));
                                 end;
                            end;
                            qryIDUnidade.Next;
                       end;
                       CidadeDevolucao := TJSONObject.Create;
                       UnidadeDevolucao := TJSONObject.Create;
                       if qryIDUnidade.Active then
                            qryIDUnidade.Close;
                       qryIDUnidade.Parameters.ParamByName('DescricaoUnidade').DataType := ftWideString;
                       qryIDUnidade.Parameters.ParamByName('DescricaoUnidade').Value := qryHistoricoReservasLocalRetornoVeiculo.Value;
                       qryIDUnidade.Open;
                       while not qryIDUnidade.Eof do
                       begin
                            for I := 0 to qryIDUnidade.FieldCount -1 do
                            begin
                                 if (qryIDUnidade.Fields[I].FieldName = 'CodigoMunicipio') or
                                    (qryIDUnidade.Fields[I].FieldName = 'CodigoEmpresa')or
                                    (qryIDUnidade.Fields[I].FieldName = 'Cidade') or
                                    (qryIDUnidade.Fields[I].FieldName = 'Estado') then
                                      CidadeDevolucao.AddPair(qryIDUnidade.Fields[I].FieldName, ConverteJSON(qryIDUnidade.Fields[I]))
                                 else
                                 begin
                                      if (qryIDUnidade.Fields[I].FieldName = 'TaxaServicoReservaWeb') then
                                           if qryIDUnidade.Fields[I].IsNull then
                                                UnidadeDevolucao.AddPair(qryIDUnidade.Fields[I].FieldName, TJSONNumber.Create(0))
                                           else
                                                UnidadeDevolucao.AddPair(qryIDUnidade.Fields[I].FieldName, ConverteJSON(qryIDUnidade.Fields[I]))
                                      else
                                           UnidadeDevolucao.AddPair(qryIDUnidade.Fields[I].FieldName, ConverteJSON(qryIDUnidade.Fields[I]));
                                 end;
                            end;
                            qryIDUnidade.Next;
                       end;
                       for I := 0 to qryHistoricoReservas.FieldCount -1 do
                       begin
                             if (qryHistoricoReservas.Fields[I].FieldName = 'CodigoReserva') or
                                (qryHistoricoReservas.Fields[I].FieldName = 'CodigoProtecao') or
                                (qryHistoricoReservas.Fields[I].FieldName = 'TaxaServico') then
                                  Objeto.AddPair(qryHistoricoReservas.Fields[I].FieldName, ConverteJSON(qryHistoricoReservas.Fields[I]));
                             if (qryHistoricoReservas.Fields[I].FieldName = 'Cancelada') then
                                  if qryHistoricoReservas.Fields[I].AsString = 'N' then
                                       Objeto.AddPair('Cancelada', TJSONFalse.Create)
                                  else
                                       Objeto.AddPair('Cancelada', TJSONTrue.Create);
                             if (qryHistoricoReservas.Fields[I].FieldName = 'ReservaWeb') then
                                  if qryHistoricoReservas.Fields[I].AsString = 'N' then
                                       Objeto.AddPair('IsReserva', TJSONFalse.Create)
                                  else
                                       Objeto.AddPair('IsReserva', TJSONTrue.Create);
                       end;
                       Objeto.AddPair('CidadeRetirada',CidadeRetirada);
                       for I := 0 to qryHistoricoReservas.FieldCount -1 do
                            if (qryHistoricoReservas.Fields[I].FieldName = 'DataInicio') or
                               (qryHistoricoReservas.Fields[I].FieldName = 'HoraInicio') then
                                 Objeto.AddPair(qryHistoricoReservas.Fields[I].FieldName, ConverteJSON(qryHistoricoReservas.Fields[I]));
                       Objeto.AddPair('UnidadeRetirada',UnidadeRetirada);
                       Objeto.AddPair('CidadeDevolucao',CidadeDevolucao);
                       for I := 0 to qryHistoricoReservas.FieldCount -1 do
                             if (qryHistoricoReservas.Fields[I].FieldName = 'DataTermino') or
                                (qryHistoricoReservas.Fields[I].FieldName = 'HoraTermino') then
                                  Objeto.AddPair(qryHistoricoReservas.Fields[I].FieldName, ConverteJSON(qryHistoricoReservas.Fields[I]));
                       Objeto.AddPair('UnidadeDevolucao',UnidadeDevolucao);

                       Tarifa := TJSONObject.Create;
                       for I := 0 to qryHistoricoReservas.FieldCount -1 do
                             if (qryHistoricoReservas.Fields[I].FieldName = 'CodigoTarifaVeiculo') or
                               (qryHistoricoReservas.Fields[I].FieldName = 'DescricaoTarifa') or
                               (qryHistoricoReservas.Fields[I].FieldName = 'ValorPeriodoVeiculo') or
                               (qryHistoricoReservas.Fields[I].FieldName = 'ValorDesconto') or
                               (qryHistoricoReservas.Fields[I].FieldName = 'ValorComDescontoDiario') or
                               (qryHistoricoReservas.Fields[I].FieldName = 'ValorKmRodado') or
                               (qryHistoricoReservas.Fields[I].FieldName = 'PeriodoTarifa') or
                               (qryHistoricoReservas.Fields[I].FieldName = 'ValorPeriodoSegAd') then
                                 Tarifa.AddPair(qryHistoricoReservas.Fields[I].FieldName, ConverteJSON(qryHistoricoReservas.Fields[I]));
                      Objeto.AddPair('Tarifa',Tarifa);

                      GrupoVeiculo := TJSONObject.Create;
                      if qryGrupoVeiculos.Active then
                           qryGrupoVeiculos.Close;
                      qryGrupoVeiculos.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                      qryGrupoVeiculos.Parameters.ParamByName('CodigoEmpresa').Value := qryHistoricoReservasCodigoEmpresa.Value;
                      qryGrupoVeiculos.Parameters.ParamByName('TodasLetras').DataType := ftBoolean;
                      qryGrupoVeiculos.Parameters.ParamByName('Letra').DataType := ftString;
                      qryGrupoVeiculos.Parameters.ParamByName('TodasLetras').Value := true;
                      qryGrupoVeiculos.Parameters.ParamByName('TodosGrupos').DataType := ftBoolean;
                      qryGrupoVeiculos.Parameters.ParamByName('TodosGrupos').Value := false;
                      qryGrupoVeiculos.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                      qryGrupoVeiculos.Parameters.ParamByName('CodigoGrupo').Value := qryHistoricoReservasCodigoGrupoVeiculos.Value;
                      qryGrupoVeiculos.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                      qryGrupoVeiculos.Parameters.ParamByName('CodigoUnidade').Value := qryHistoricoReservasCodigoUnidade.Value;
                      qryGrupoVeiculos.Parameters.ParamByName('Periodo').DataType := ftSmallint;
                      qryGrupoVeiculos.Parameters.ParamByName('PromoInicio').DataType := ftInteger;
                      qryGrupoVeiculos.Parameters.ParamByName('PromoTermino').DataType := ftInteger;
                      qryGrupoVeiculos.Parameters.ParamByName('PromoInicio').Value := 0;
                      qryGrupoVeiculos.Parameters.ParamByName('PromoTermino').Value := 999;
                      if qryHistoricoReservasPeriodoTarifa.Value >= 7 then
                           qryGrupoVeiculos.Parameters.ParamByName('Periodo').Value := 7
                      else
                           qryGrupoVeiculos.Parameters.ParamByName('Periodo').Value := 1;

                      if qryParametrosEmpresa.Active then
                           qryParametrosEmpresa.Close;
                      qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                      qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').Value := qryHistoricoReservasCodigoEmpresa.Value;
                      qryParametrosEmpresa.Open;

                      if qryParametrosUnidade.Active then
                          qryParametrosUnidade.Close;
                      qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                      qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := qryHistoricoReservasCodigoEmpresa.Value;
                      qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                      qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := qryHistoricoReservasCodigoUnidade.Value;
                      qryParametrosUnidade.Open;
                      qryGrupoVeiculos.Parameters.ParamByName('TodasTarifas').DataType := ftBoolean;
                      if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
                           qryGrupoVeiculos.Parameters.ParamByName('TodasTarifas').Value := true
                      else
                           qryGrupoVeiculos.Parameters.ParamByName('TodasTarifas').Value := false;
                       // Testar Periodo tarifas
                      qryGrupoVeiculos.Parameters.ParamByName('DataInicio').DataType := ftDateTime;
                      qryGrupoVeiculos.Parameters.ParamByName('DataInicio').Value := qryHistoricoReservasDataInicio.Value;
                      qryGrupoVeiculos.Parameters.ParamByName('DataTermino').DataType := ftDateTime;
                      qryGrupoVeiculos.Parameters.ParamByName('DataTermino').Value := qryHistoricoReservasDataTermino.Value;
                      qryGrupoVeiculos.Parameters.ParamByName('DataHoraInicio').DataType := ftDateTime;
                      qryGrupoVeiculos.Parameters.ParamByName('DataHoraInicio').Value := qryHistoricoReservasDataInicio.Value;
                      qryGrupoVeiculos.Parameters.ParamByName('DataHoraTermino').DataType := ftDateTime;
                      qryGrupoVeiculos.Parameters.ParamByName('DataHoraTermino').Value := qryHistoricoReservasDataTermino.Value;
                      qryGrupoVeiculos.Open;
                      while not qryGrupoVeiculos.Eof do
                      begin
                           for I := 0 to qryGrupoVeiculos.FieldCount -1 do
                                GrupoVeiculo.AddPair(qryGrupoVeiculos.Fields[I].FieldName, ConverteJSON(qryGrupoVeiculos.Fields[I]));

                           if qryGrupoVeiculosCaracteristicas.Active then
                                qryGrupoVeiculosCaracteristicas.Close;
                           qryGrupoVeiculosCaracteristicas.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                           qryGrupoVeiculosCaracteristicas.Parameters.ParamByName('CodigoGrupo').Value := qryGrupoVeiculosCodigoGrupo.Value;
                           qryGrupoVeiculosCaracteristicas.Open;
                           Caracteristicas := TJSONArray.Create;
                           while not qryGrupoVeiculosCaracteristicas.Eof do
                           begin
                                for I := 0 to qryGrupoVeiculosCaracteristicas.FieldCount -1 do
                                     Caracteristicas.Add(qryGrupoVeiculosCaracteristicas.Fields[I].ASString);
                                qryGrupoVeiculosCaracteristicas.Next;
                           end;
                           Objeto.AddPair('Caracteristicas', Caracteristicas);
                          qryGrupoVeiculos.Next;
                      end;
                      GrupoVeiculo.AddPair('DefinirValorProtecaoPor',qryParametrosEmpresaDefinirValorProtecaoPor.Value);
                      Objeto.AddPair('GrupoVeiculo',GrupoVeiculo);
                      //Proteções
                      Protecoes := TJSONArray.Create;
                       if qryProtecao.Active then
                            qryProtecao.Close;
                      qryProtecao.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                      qryProtecao.Parameters.ParamByName('CodigoProtecao').Value := qryHistoricoReservasCodigoProtecao.Value;
                      qryProtecao.Open;
                      while not qryProtecao.Eof do
                      begin
                           Protecao := TJSONObject.Create;
                           for I := 0 to qryProtecao.FieldCount -1 do
                           begin
                                if (qryProtecao.Fields[I].DisplayLabel = 'CodigoProtecao') or
                                   (qryProtecao.Fields[I].DisplayLabel = 'NomeProtecao') or
                                   (qryProtecao.Fields[I].DisplayLabel = 'ValorProtecao')then
                                     Protecao.AddPair(qryProtecao.Fields[I].DisplayLabel,ConverteJSON(qryProtecao.Fields[I]));
                                if qryProtecao.Fields[I].DisplayLabel = 'Condicoes' then
                                begin
                                     if not qryProtecao.Fields[I].IsNull then
                                     begin
                                          Campo := qryProtecao.Fields[I].Text;
                                          Campo := StringReplace(Campo, #$D#$A, '', [rfReplaceAll]);
                                          Campo := StringReplace(Campo,'"', '', [rfReplaceAll]);
                                          Campo := StringReplace(Campo,'/', '-', [rfReplaceAll]);
                                          Campo := StringReplace(Campo,'\r', '', [rfReplaceAll]);
                                          Campo := StringReplace(Campo,'\n', '', [rfReplaceAll]);
                                          Protecao.AddPair(qryProtecao.Fields[I].DisplayLabel, TJSONString.Create(Campo))
                                     end
                                     else
                                          Protecao.AddPair(qryProtecao.Fields[I].DisplayLabel, TJSONString.Create(''));
                                end;
                           end;
                           Protecoes.AddElement(Protecao);
                           qryProtecao.Next;
                      end;
                      Objeto.AddPair('Protecoes', Protecoes);
                      ServicosAdicionais := TJSONArray.Create;
                      if qryListarReservaServicoAdicional.Active then
                           qryListarReservaServicoAdicional.Close;
                      qryListarReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
                      qryListarReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').Value := qryHistoricoReservasCodigoReserva.Value;
                      qryListarReservaServicoAdicional.Open;
                      while not qryListarReservaServicoAdicional.Eof do
                      begin
                           ServicoAdicional := TJSONObject.Create;
                           for I := 0 to qryListarReservaServicoAdicional.FieldCount -1 do
                           begin
                                ServicoAdicional.AddPair(qryListarReservaServicoAdicional.Fields[I].DisplayLabel,ConverteJSON(qryListarReservaServicoAdicional.Fields[I]));
                                if qryListarReservaServicoAdicional.Fields[I].DisplayLabel = 'CalculoPorDiarias' then
                                     if qryListarReservaServicoAdicionalCalculoPorDiarias.Value = 'S' then
                                          ServicoAdicional.AddPair('IsCalculoDiaria',TJSONTrue.Create)
                                     else
                                          ServicoAdicional.AddPair('IsCalculoDiaria',TJSONFalse.Create);
                          end;
                          ServicosAdicionais.AddElement(ServicoAdicional);
                          qryListarReservaServicoAdicional.Next;
                      end;
                      Objeto.AddPair('ServicosAdicionais', ServicosAdicionais);
                      if qryCliente.Active then
                           qryCliente.Close;
                      qryCliente.Parameters.ParamByName('CodigoCliente').DataType := ftInteger;
                      qryCliente.Parameters.ParamByName('CodigoCliente').Value := qryHistoricoReservasCodigoCliente.Value;
                      qryCliente.Open;
                      while not qryCliente.Eof do
                      begin
                           Cliente := TJSONObject.Create;
                           Municipio := TJSONObject.Create;
                           for I := 0 to qryCliente.FieldCount -1 do
                           begin
                                 if (qryCliente.Fields[I].DisplayLabel = 'CodigoCliente') or
                                    (qryCliente.Fields[I].DisplayLabel = 'CPF') or
                                    (qryCliente.Fields[I].DisplayLabel = 'Passaporte') or
                                    (qryCliente.Fields[I].DisplayLabel = 'Identidade') or
                                    (qryCliente.Fields[I].DisplayLabel = 'RazaoSocial') or
                                    (qryCliente.Fields[I].DisplayLabel = 'Email') or
                                    (qryCliente.Fields[I].DisplayLabel = 'Telefone') or
                                    (qryCliente.Fields[I].DisplayLabel = 'Cep') or
                                    (qryCliente.Fields[I].DisplayLabel = 'Logradouro') or
                                    (qryCliente.Fields[I].DisplayLabel = 'Numero') or
                                    (qryCliente.Fields[I].DisplayLabel = 'Complemento') or
                                    (qryCliente.Fields[I].DisplayLabel = 'Bairro')then
                                      Cliente.AddPair(qryCliente.Fields[I].DisplayLabel,ConverteJSON(qryCliente.Fields[I]));
                                 if (qryCliente.Fields[I].DisplayLabel = 'Cidade') or
                                    (qryCliente.Fields[I].DisplayLabel = 'Estado') or
                                    (qryCliente.Fields[I].DisplayLabel = 'CodigoMunicipio')then
                                      Municipio.AddPair(qryCliente.Fields[I].DisplayLabel,ConverteJSON(qryCliente.Fields[I]));
                           end;
                           Cliente.AddPair('Municipio',Municipio);
                           qryCliente.Next;
                      end;
                      Objeto.AddPair('Cliente',Cliente);
                      qryHistoricoReservas.Next;
                      Retorno.AddElement(Objeto);
                 end;
            end;
       end
       else
            Msg := 'Falha ao conectar ao banco de dados.';
       Result := RetornoPadraoArray(Erros, Retorno, Msg);
  finally
       qryHistoricoReservas.Close;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
       LiberarMemoria;
  end;
end;

function TLocavia.RetornoPadraoArray(Erros, Data: TJSONArray; Msg:String): TStringStream;
var
  Retorno: TJSONObject;
  RetornaErro: Boolean;
begin
  try
       Retorno := TJSONObject.Create;
       RetornaErro := Erros.Size > 0;
       if RetornaErro then
       begin
            GetInvocationMetadata.ResponseCode := 400;
            Retorno.AddPair('Sucesso', TJSONFalse.Create);
       end
       else
       if Length(Msg) > 0 then
       begin
            GetInvocationMetadata.ResponseCode := 400;
            Retorno.AddPair('Sucesso', TJSONFalse.Create);
       end
       else
       begin
            GetInvocationMetadata.ResponseCode := 200;
            Retorno.AddPair('Sucesso', TJSONTrue.Create);
       end;
       Retorno.AddPair('Erros', Erros);
       Retorno.AddPair('Data', Data);
       Retorno.AddPair('Mensagem', Msg);
       Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Retorno.ToString));
  finally
  end;
end;

function TLocavia.RetornoPadraoObjeto(Erros: TJSONArray;
  Data: TJSONObject; Msg:String): TStringStream;
var
  Retorno: TJSONObject;
  RetornaErro: Boolean;
begin
  try
       Retorno := TJSONObject.Create;
       RetornaErro := Erros.Size > 0;
       if RetornaErro then
       begin
            GetInvocationMetadata.ResponseCode := 400;
            Retorno.AddPair('Sucesso', TJSONFalse.Create);
       end
       else
       if Length(Msg) > 0 then
       begin
            GetInvocationMetadata.ResponseCode := 400;
            Retorno.AddPair('Sucesso', TJSONFalse.Create);
       end
       else
       begin
            GetInvocationMetadata.ResponseCode := 200;
            Retorno.AddPair('Sucesso', TJSONTrue.Create);
       end;
       Retorno.AddPair('Erros', Erros);
       Retorno.AddPair('Data', Data);
       Retorno.AddPair('Mensagem', Msg);
       Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Retorno.ToString));
  finally
  end;
end;

function TLocavia.ServidorEmail(CodigoReserva: Integer;
  Empresa: String): Boolean;
var
  Objeto: TJSONObject;
  ListaObjeto: TJSONArray;
  DadosRequisicao: TWebModule;
  lBody :TStream;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  ValorDiarias,
  ValorDiariasDesc,
  ValorHoraExtra,
  ValorKm,
  ValorCobertura,
  ValorTerceiros,
  ValorTaxaServico,
  ValorDesconto,
  TotalAdicional,
  ValorAdicional,
  ValorTarifa,
  ValorTarifaDesc,
  ValorTaxaEntregaDevolucao: Currency;
  HorasExtras,
  PercentualTaxaServico : Double;
  Periodo, FranquiaKm: Integer;
  DiariaAMaisHoraExtra :Boolean;
  Protecao, ServicoAdicional,
  TaxaServico, Observacoes,
  Situacao, HorasExtrasEmail,
  HTMLTexto: String;
begin
  try
       Objeto:= TJSONObject.Create;
       DadosRequisicao := GetDataSnapWebModule;
       if adcBancoDados.Connected = false then
            ConectaBanco(Empresa);
       if qryConsultaReserva.Active then
            qryConsultaReserva.Close;
       qryConsultaReserva.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
       qryConsultaReserva.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
       qryConsultaReserva.Open;
       if not qryConsultaReserva.IsEmpty then
       begin
                 //Verifica a Situacao da reserva
                 if qryConsultaReservaReservaWeb.Value = 'N' then
                      Situacao := 'Em análise'
                 else
                      Situacao := 'Confirmada';
                 if qryParametrosEmail.Active then
                      qryParametrosEmail.Close;
                 qryParametrosEmail.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosEmail.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
                 qryParametrosEmail.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryParametrosEmail.Parameters.ParamByName('CodigoUnidade').Value := qryConsultaReservaCodigoUnidade.Value;
                 qryParametrosEmail.Open;
                 if qryParametrosEmpresa.Active then
                      qryParametrosEmpresa.Close;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
                 qryParametrosEmpresa.Open;
                 try
                     ValorDiarias := 0;
                     ValorHoraExtra := 0;
                     ValorKm := 0;
                     ValorCobertura := 0;
                     ValorTerceiros := 0;
                     ValorTaxaServico := 0;
                     ValorDesconto := 0;
                     TotalAdicional := 0;
                     ValorAdicional := 0;
                     ValorTarifa := 0;
                     ValorTaxaEntregaDevolucao := 0;
                     HorasExtras := 0;
                     PercentualTaxaServico := 0;
                     Periodo := 0;
                     FranquiaKm := 0;
                     if qryUnidadeRetirada.Active then
                           qryUnidadeRetirada.Close;
                      qryUnidadeRetirada.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                      qryUnidadeRetirada.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
                      qryUnidadeRetirada.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                      qryUnidadeRetirada.Parameters.ParamByName('CodigoUnidade').Value := qryConsultaReservaCodigoUnidade.Value;
                      qryUnidadeRetirada.Open;
                      if qryUnidadeDevolucao.Active then
                          qryUnidadeDevolucao.Close;
                     qryUnidadeDevolucao.Parameters.ParamByName('Cidade').DataType := ftString;
                     qryUnidadeDevolucao.Parameters.ParamByName('Cidade').Value :=  qryConsultaReservaLocalRetornoVeiculo.Value;
                     qryUnidadeDevolucao.Open;
                     if qryTarifa.Active then
                          qryTarifa.Close;
                     qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                     qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := qryConsultaReservaCodigoTarifaVeiculo.Value;
                     qryTarifa.Open;
                     if qryProtecao.Active then
                          qryProtecao.Close;
                     qryProtecao.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                     qryProtecao.Parameters.ParamByName('CodigoProtecao').Value := qryConsultaReservaCodigoProtecao.Value;
                     qryProtecao.Open;
                     if qryListarReservaServicoAdicional.Active then
                          qryListarReservaServicoAdicional.Close;
                     qryListarReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
                     qryListarReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').Value := qryConsultaReservaCodigoReserva.Value;
                     qryListarReservaServicoAdicional.Open;
                     if qryInformacoesGrupoVeiculo.Active then
                          qryInformacoesGrupoVeiculo.Close;
                     qryInformacoesGrupoVeiculo.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                     qryInformacoesGrupoVeiculo.Parameters.ParamByName('CodigoGrupo').Value := qryConsultaReservaCodigoGrupoVeiculos.Value;
                     qryInformacoesGrupoVeiculo.Open;
                     Periodo := 0;
                     DiariaAMaisHoraExtra := false;
                     if (Trunc(qryConsultaReservaDataTermino.Value - qryConsultaReservaDataInicio.Value) = 0)
                         and (StrToTime(Copy(qryConsultaReservaHoraInicio.Value,1,2) + ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2)) = StrToTime(Copy(qryConsultaReservaHoraTermino.Value,1,2) + ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2))) then
                               Periodo := 1
                     else
                          if Round((StrToTime(Copy(qryConsultaReservaHoraTermino.Value,1,2) + ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2)) -  StrToTime(Copy(qryConsultaReservaHoraInicio.Value,1,2) + ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2)))* 24 +  0.499999) >= qryParametrosEmpresaMaximoHorasExtras.Value then
                               begin
                                    Periodo := Trunc(qryConsultaReservaDataTermino.Value - qryConsultaReservaDataInicio.Value) + 1;
                                    DiariaAMaisHoraExtra := true;
                               end
                               else
                                    Periodo := Trunc(qryConsultaReservaDataTermino.Value - qryConsultaReservaDataInicio.Value);

                     ValorDiarias := Periodo * (qryConsultaReservaValorPeriodoVeiculo.Value / qryTarifaPeriodoTarifa.Value);
                     ValorTarifa := qryConsultaReservaValorPeriodoVeiculo.Value;

                      //Tarifa com desconto
                     if (qryTarifaTarifaNacional.Value = 'N') OR (qryConsultaReservaPercDescontoTempo.ISNULL) OR (qryConsultaReservaPercDescontoTempo.Value = 0)then
                          ValorDesconto := 0
                     else
                          ValorDesconto := ((qryConsultaReservaValorPeriodoVeiculo.Value * qryConsultaReservaPercDescontoTempo.Value) /100);

                     if ValorDesconto > 0 then
                     begin

                          if (qryTarifaTarifaNacional.Value = 'N') OR (qryConsultaReservaPercDescontoTempo.ISNULL) OR (qryConsultaReservaPercDescontoTempo.Value <= 0)then
                               ValorTarifaDesc := qryConsultaReservaValorPeriodoVeiculo.Value
                          else
                               ValorTarifaDesc := qryConsultaReservaValorPeriodoVeiculo.Value - ((qryConsultaReservaValorPeriodoVeiculo.Value * qryConsultaReservaPercDescontoTempo.Value) /100 );

                          ValorDiariasDesc := Periodo * (ValorTarifa / qryTarifaPeriodoTarifa.Value);
                     end;
                      //Horas Extras
                     if (qryConsultaReservaDataTermino.Value > qryConsultaReservaDataInicio.Value) and
                        (StrToTime(Copy(qryConsultaReservaHoraInicio.Value,1,2)+ ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2)) < StrToTime(Copy(qryConsultaReservaHoraTermino.Value,1,2) + ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2))) then
                          HorasExtras := (Round((StrToTime(Copy(qryConsultaReservaHoraTermino.Value,1,2)+ ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2)) -  StrToTime(Copy(qryConsultaReservaHoraInicio.Value,1,2) + ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2)))* 24 +  0.499999));
                     if HorasExtras <= qryParametrosEmpresaMaximoHorasCortesia.Value then
                          HorasExtras := 0;
                     if (HorasExtras > 1) and (HorasExtras < qryParametrosEmpresaMaximoHorasExtras.Value)  then
                     begin
                         ValorHoraExtra := ((ValorTarifa / qryTarifaPeriodoTarifa.Value)/qryParametrosEmpresaMaximoHorasExtras.Value)* HorasExtras;
                     end;
                     if qryTarifaPeriodoTarifa.Value > 0 then
                         FranquiaKm := Periodo * Trunc(qryTarifaFranquiaKmRodado.Value / qryTarifaPeriodoTarifa.Value)
                    else
                         FranquiaKm := Periodo * trunc(qryTarifaFranquiaKmRodado.Value / 1);
                     //Cobertura
                    if qryParametrosEmpresa.Active then
                         qryParametrosEmpresa.Close;
                    qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                    qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
                    qryParametrosEmpresa.Open;
                    if (HorasExtras > 1) and (HorasExtras < qryParametrosEmpresaMaximoHorasExtras.Value)  then
                    begin
                         HorasExtrasEmail := '<b>Horas Extras:</b> ' +  FormatFloat('R$###,##0.00',((ValorTarifa / qryTarifaPeriodoTarifa.Value)/qryParametrosEmpresaMaximoHorasExtras.Value)) + ' X ' +
                                                                        FloatToStr(Round(HorasExtras)) + ' = ' +
                                                                        FormatFloat('R$###,##0.00',ValorHoraExtra)+ '<br>';
                    end
                    else
                    begin
                         HorasExtrasEmail := '<b>Horas Extras:</b> ' +  FormatFloat('R$###,##0.00',0) + ' X 0 = ' +
                                                                        FormatFloat('R$###,##0.00',0)+ '<br>';
                    end;
                    if qryParametrosEmpresaDefinirValorProtecaoPor.Value = 'G' then
                    begin
                         if (qryTarifaValorPeriodoSegAd.Value > 0) and (HorasExtras > 0)and (HorasExtras > qryParametrosEmpresaMaximoHorasExtras.Value) then
                         begin
                              ValorCobertura := (qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) * (Periodo);
                              Protecao :=  '<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) + ' X ' + IntToStr(Periodo) + ' = '  + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>'
                         end
                         else
                         if (qryTarifaValorPeriodoSegAd.Value > 0) and (HorasExtras > 1) and not DiariaAMaisHoraExtra then
                         begin
                              ValorCobertura := (qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) * (Periodo+1);
                              Protecao := '<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) + ' X ' + IntToStr(Periodo + 1) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>';
                         end
                         else
                         if (qryTarifaValorPeriodoSegAd.Value > 0) then
                         begin
                              ValorCobertura := (qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) * Periodo;
                              Protecao := '<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) + ' X ' + IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>';
                         end;
                    end
                    else
                    begin
                         if (qryProtecaoValorProtecao.Value > 0) and (HorasExtras > 0)and (HorasExtras > qryParametrosEmpresaMaximoHorasExtras.Value) then
                         begin
                              ValorCobertura := (qryProtecaoValorProtecao.Value) * (Periodo);
                              Protecao := '<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryProtecaoValorProtecao.Value) + ' X ' + IntToStr(Periodo) + ' = '  + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>';
                         end
                         else
                         if (qryProtecaoValorProtecao.Value > 0) and (HorasExtras > 1) and not DiariaAMaisHoraExtra then
                         begin
                              ValorCobertura := (qryProtecaoValorProtecao.Value) * (Periodo +1);
                              Protecao :='<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryProtecaoValorProtecao.Value) + ' X ' + IntToStr(Periodo +1) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>';
                         end
                         else
                         if (qryProtecaoValorProtecao.Value > 0) then
                         begin
                              ValorCobertura := (qryProtecaoValorProtecao.Value) * Periodo;
                              Protecao :='<b>Proteção:</b> '  + FormatFloat('R$###,##0.00',qryProtecaoValorProtecao.Value) + ' X ' + IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>';
                         end;
                    end;
                    if qryListarReservaServicoAdicional.Active then
                         qryListarReservaServicoAdicional.Close;
                    qryListarReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
                    qryListarReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').Value := qryConsultaReservaCodigoReserva.Value;
                    qryListarReservaServicoAdicional.Open;
                    if qryListarReservaServicoAdicional.RecordCount > 0 then
                    begin
                         ServicoAdicional:= '<table border="1" width="100%">' +
                                            '<tr>' +
                                            '<td>' +
                                            '<p align="center"><b>SERVIÇOS ADICIONAIS</b></td>' +
                                            '</tr>' +
                                            '</table>' +
                                            '<table border="1" width="100%"> ' +
                                            '<tr><td><blockquote>';
                               while not qryListarReservaServicoAdicional.Eof do
                               begin
                                     if qryListarReservaServicoAdicionalCalculoPorDiarias.Value = 'S' then
                                     begin
                                          if HorasExtras <= 0 then
                                          begin
                                               ValorAdicional := qryListarReservaServicoAdicionalValor.Value * Periodo;
                                               ServicoAdicional:= ServicoAdicional + '<b>' + qryListarReservaServicoAdicionalDescricao.Value + '</b><br>' +
                                               ' - ' + FormatFloat('###,###,##0.00', qryListarReservaServicoAdicionalValor.Value) + ' X ' +
                                                                           IntToStr( Periodo)+ ' = ' + FormatFloat('R$ ###,###,##0.00',ValorAdicional)+ '<br>';
                                               TotalAdicional := TotalAdicional + ValorAdicional;
                                          end
                                          else
                                          if HorasExtras > qryParametrosEmpresaMaximoHorasExtras.Value then
                                          begin
                                               ValorAdicional := qryListarReservaServicoAdicionalValor.Value * Periodo;
                                               ServicoAdicional:= ServicoAdicional + '<b>' + qryListarReservaServicoAdicionalDescricao.Value + '</b><br>' +
                                               ' - ' + FormatFloat('###,###,##0.00', qryListarReservaServicoAdicionalValor.Value) + ' X ' +
                                                                           IntToStr( Periodo)+ ' = ' + FormatFloat('R$ ###,###,##0.00',ValorAdicional)+ '<br>';
                                               TotalAdicional := TotalAdicional + ValorAdicional;
                                          end
                                          else
                                          begin
                                               ValorAdicional := qryListarReservaServicoAdicionalValor.Value * (Periodo +1);
                                               ServicoAdicional:= ServicoAdicional +'<b>' + qryListarReservaServicoAdicionalDescricao.Value + '</b><br>' +
                                               ' - ' + FormatFloat('###,###,##0.00', qryListarReservaServicoAdicionalValor.Value) + ' X ' +
                                                                           IntToStr( Periodo+1)+ ' = ' + FormatFloat('R$ ###,###,##0.00',ValorAdicional)+ '<br>';
                                               TotalAdicional := TotalAdicional + ValorAdicional;
                                          end;
                                     end
                                     else
                                     begin
                                         ServicoAdicional:= ServicoAdicional +'<b>' + qryListarReservaServicoAdicionalDescricao.Value + '</b><br>' +
                                         ' - ' + FormatFloat('###,###,##0.00', qryListarReservaServicoAdicionalValor.Value) + '<br>';
                                          TotalAdicional := TotalAdicional + qryListarReservaServicoAdicionalValor.Value;
                                     end;
                                     qryListarReservaServicoAdicional.Next;
                               end;
                              ServicoAdicional:= ServicoAdicional + 'Valor Total Adicionais ' + FormatFloat('R$ ###,###,##0.00',TotalAdicional) +
                                                                    '</blockquote></td></tr>' +
                                                                    '</table>';
                          end;
                           if qryConsultaReservaTaxaServico.Value > 0 then
                          begin
                               TaxaServico := '<b>Taxa de Serviço:</b> ' + FormatFloat('##0.00 %',qryConsultaReservaTaxaServico.Value) + '<br>';
                               ValorTaxaServico := ((ValorDiarias + ValorHoraExtra + ValorKm + ValorCobertura +  ValorTerceiros + ValorTaxaEntregaDevolucao + TotalAdicional)/ 100) * qryConsultaReservaTaxaServico.Value;
                          end;
                          if Length(qryConsultaReservaObservacoes.AsString)> 0 then
                          begin
                              Observacoes := '<table border="1" width="100%"> ' +
                                             '<tr><td><blockquote>' +
                                             '<b>Observações sobre a reserva</b><br>' +
                                             qryConsultaReservaObservacoes.AsString +
                                             '</blockquote></td></tr>' +
                                             '</table>';
                          end;

                         IdHTTPCL.Request.ContentType := 'application/json';
                         //IdHTTPCL.IOHandler := IdSSLIOHandlerSocketOpenSSL;
                         IdHTTPCL.Request.CustomHeaders.AddValue('smtp_host',qryParametrosEmailSMTPServidor.Value);
                         IdHTTPCL.Request.CustomHeaders.AddValue('smtp_port',IntToStr(qryParametrosEmailSMTPPorta.Value));
                          if qryParametrosEmailRequerAutenticacao.Value = 'S' then
                               IdHTTPCL.Request.CustomHeaders.AddValue('smtp_require_tls','true')
                          else
                               IdHTTPCL.Request.CustomHeaders.AddValue('smtp_require_tls','false');
                          IdHTTPCL.Request.CustomHeaders.AddValue('smtp_reject_unauthorized','false');
                          IdHTTPCL.Request.CustomHeaders.AddValue('smtp_auth_user',qryParametrosEmailSMTPUsuario.Value);
                          IdHTTPCL.Request.CustomHeaders.AddValue('smtp_auth_pass',qryParametrosEmailSMTPSenha.Value);
                          IdHTTPCL.Request.CustomHeaders.AddValue('Authorization','Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW4iLCJpYXQiOjE1Mjg0ODczOTF9.TinPCWQDUiwLEkS-u9INvJmG-AlPvZMlWIMX2PvQpFQ');
                          IdHTTPCL.Request.CustomHeaders.AddValue('Content-Type','application/json');

                          Objeto.AddPair('from',qryParametrosEmailEmail.Value);
                          ListaObjeto:= TJSONArray.Create;
                          ListaObjeto.Add(qryConsultaReservaEmail.Value);
                          if qryUnidadeRetiradaEmail.Value <> '' then
                               ListaObjeto.Add(qryUnidadeRetiradaEmail.Value);
                          Objeto.AddPair('to',ListaObjeto);
                          Objeto.AddPair('subject','Reserva Web - ' + qryUnidadeRetiradaDescricaoUnidade.Value);
                          Objeto.AddPair('text','-');

                          HTMLTexto := '<html>' +
                                '<head>' +
                                '<meta http-equiv="Content-Language" content="pt-br">' +
                                '<meta http-equiv="Content-Type" content="text/html charset=windows-1252">' +
                                '<title>RESERVA DE VEÍCULO</title>' +
                                '</head>' +
                                '<body leftmargin="10">' +
                                '<table border="1" width="100%">' +
                                '<tr><td><b>' +          // http://www.yesrentacar.com.br/logo.jpg
                                '<img border="0" src="' + qryParametrosEmailCaminhoLogoWeb.Value + '" width="140" height="100"></b></td></tr>' +
                                '<tr>' +
                                '<td>' +
                                '<p align="center"><b>RESERVA DE VEÍCULO</b></td>' +
                                '</tr>' +
                                '</table>' +
                                '<p>&nbsp;</p>' +
                                '<table border="1" width="100%">' +
                                '<tr>' +
                                '<td>' +
                                '<blockquote>' +
                                '<b>Sua Reserva de Número</b> : '+ FormatFloat('000000',qryConsultaReservaCodigoReserva.Value) + ' Situação: ' + Situacao + '<br>' +
                                '<b>Cliente :</b> ' + qryConsultaReservaNomeCliente.Value + '<br>' +
                                '<b>Email   :</b> ' + qryConsultaReservaEmail.Value + '<br>' +
                                '<b>Telefone 1:</b> (' + Copy(qryConsultaReservaTelefoneContato1.Value,1,2) + ')' + Copy(qryConsultaReservaTelefoneContato1.Value,3,10) +
                                '<b>Telefone 2:</b> (' + Copy(qryConsultaReservaTelefoneContato2.Value,1,2) + ')' + Copy(qryConsultaReservaTelefoneContato2.Value,3,10) +
                                '</blockquote>' +
                                '</td>' +
                                '</tr>' +
                                '</table>' +
                                '<table border="1" width="100%">' +
                                '<tr>' +
                                '<td>' +
                                '<p align="center"><b>RETIRADA / DEVOLUÇÃO</b></td>' +
                                '</tr>' +
                                '</table>' +
                                '<table border="1" width="100%">' +
                                '<tr>' +
                                '<td>' +
                                '<blockquote>' +
                                '<b>Retira: </b>' + DateToStr(qryConsultaReservaDataInicio.Value) + ' as ' + Copy(qryConsultaReservaHoraInicio.Value,1,2)+ ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2) + '<b><br>' +
                                'Cidade: </b>' + qryConsultaReservaLocalEntrega.Value + '<b><br>' +
                                'Unidade: </b>' + qryUnidadeRetiradaDescricaoUnidade.Value + '<br>' +
                                '<b>Endereço : </b></b>'+  qryUnidadeRetiradaLogradouro.Value + ', ' +
                                                                     qryUnidadeRetiradaNumero.Value + '  ' +
                                                                     qryUnidadeRetiradaComplemento.Value +
                                                                     ' Bairro ' + qryUnidadeRetiradaBairro.Value + '<br>' +
                                '<b>Telefone: </b></b> (' + Copy(qryUnidadeRetiradaTelefone1.Value,1,2) + ')' +
                                                                     Copy(qryUnidadeRetiradaTelefone1.Value,3,4) + '-' +
                                                                     Copy(qryUnidadeRetiradaTelefone1.Value,7,4) + '</blockquote>' +
                                '</td>' +
                                '</tr>' +
                                '</table>' +
                                '<table border="1" width="100%">' +
                                '<tr>' +
                                '<td>' +
                                '<blockquote>' +
                                '<b>Devolução: </b> ' + DateToStr(qryConsultaReservaDataTermino.Value) + ' as ' + Copy(qryConsultaReservaHoraTermino.Value,1,2) + ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2) + '<b><br>' +



                                'Cidade: </b>' + qryConsultaReservaLocalDevolucao.Value + '<b><br>' +
                                'Unidade: </b>' + qryUnidadeDevolucaoDescricaoUnidade.Value + '<br><b>' +
                                'Endereço : </b>' + qryUnidadeDevolucaoLogradouro.Value + ', ' +
                                                              qryUnidadeDevolucaoNumero.Value + '  ' +
                                                              qryUnidadeDevolucaoComplemento.Value +
                                                              ' Bairro ' + qryUnidadeDevolucaoBairro.Value + '<br>' +

                                '<b>Telefone: </b>(' + Copy(qryUnidadeDevolucaoTelefone1.Value,1,2) + ')' +
                                                                 Copy(qryUnidadeDevolucaoTelefone1.Value,3,4) + '-' +
                                                                 Copy(qryUnidadeDevolucaoTelefone1.Value,7,4) + '</blockquote>' +
                                '</td>' +
                                '</tr>' +
                                '</table>' +
                                '<table border="1" width="100%">' +
                                '<tr>' +
                                '<td>' +
                                '<p align="center"><b>VEÍCULO / TARIFAS</b></td>' +
                                '</tr>' +
                                '</table>' +
                                '<table border="1" width="100%">' +
                                '<tr>' +
                                '<td>' +
                                '<blockquote>' +
                                '<b>Grupo do Veículo :&nbsp; </b>' + qryInformacoesGrupoVeiculoDescricao.Value + '<b><br>' +
                                'Tarifa:&nbsp; </b>' +  qryTarifaDescricaoTarifa.Value + '<b><br>' +
                                'Proteção :&nbsp;' +
                                '</b> ' + qryProtecaoNomeProtecao.Value + '<b><br>' +
                                'Terceiro :&nbsp;' +
//                                     if qryConsultaReservaCoberturaTerceiros.Value = 'N' then
//                                          '</b> Não </blockquote>')
//                                     else
                                      '</b> Sim </blockquote>' +
                                '</td>' +
                                '</tr>' +
                                '</table>' +
                                '<table border="1" width="100%">' +
                                '<tr>' +
                                '<td>' +
                                '<p align="center"><b>ORÇAMENTO</b></td>' +
                                '</tr>' +
                                '</table>' +
                                '<table border="1" width="100%">' +
                                '<tr>' +
                                '<td>' +
                                '<blockquote>' +
                                 //Diarias

                                '<b>Valor Diária:</b> ' + FormatFloat('R$ ###,###,##0.00',qryConsultaReservaValorPeriodoVeiculo.Value / qryTarifaPeriodoTarifa.Value ) + ' X '   +
                                                          IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,###,##0.00',ValorDiarias) + '<br>' +


                                '<b>Valor com Desconto:</b> ' + FormatFloat('R$ ###,###,##0.00',ValorTarifaDesc / qryTarifaPeriodoTarifa.Value ) + ' X '   +
                                                                IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,###,##0.00',ValorDiariasDesc)+ '<br>' +
                                HorasExtrasEmail +
                                Protecao +

                                '</blockquote>' +
                                '</td>' +
                                '</tr>' +
                                '</table>' +
                                ServicoAdicional +

                                '<table border="1" width="100%">' +
                                '<tr>' +
                                '<td>' +
                                '<p align="center"><b>TOTAL GERAL</b></td>' +
                                '</tr>' +
                                '</table>' +
                                '<table border="1" width="100%"> ' +
                                '<tr><td><blockquote>' +
                                 //Taxa Administrativa
                                TaxaServico +
                                '<b>Total Estimado da Locação:</b> ' + FormatFloat('R$ ###,###,##0.00',ValorDiarias + ValorHoraExtra + ValorKm + TotalAdicional + ValorCobertura + ValorTerceiros + ValorTaxaServico + ValorTaxaEntregaDevolucao) +
                                '</blockquote></td></tr>' +
                                '</table>' +
                                 Observacoes +
                                '<table border="1" width="100%"> ' +
                                '</table>' +
                                '</blockquote></td></tr>' +
                                '</table>' +
                                '</body>' +
                                '</html>';
                          Objeto.AddPair('html',HTMLTexto);
                          lBody := TStringStream.Create(TEncoding.UTF8.GetBytes(Objeto.ToString));
                          try
                               IdHTTPCL.Post('http://18.231.78.117:3000/api/v1/emails',lBody);
                               if IdHTTPCL.ResponseCode = 200 then
                                    Result := true
                               else
                                    Result := false;
                          except
                               Result := false;
                          end;
                   except
                      Result := false;
                 end;
       end;
  except
       on E: Exception do
       Result := false;
  end;
end;

function TLocavia.ServidorEmailCancelamento(CodigoReserva: Integer; Empresa,
  Email, NomeCliente: String): Boolean;
var
  Objeto: TJSONObject;
  ListaObjeto: TJSONArray;
  lBody :TStream;
begin
  try
       if adcBancoDados.Connected = false then
            ConectaBanco(Empresa);
       if qryConsultaReserva.Active then
            qryConsultaReserva.Close;
       qryConsultaReserva.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
       qryConsultaReserva.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
       qryConsultaReserva.Open;
       if qryParametrosEmail.Active then
            qryParametrosEmail.Close;
       qryParametrosEmail.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
       qryParametrosEmail.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
       qryParametrosEmail.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
       qryParametrosEmail.Parameters.ParamByName('CodigoUnidade').Value := qryConsultaReservaCodigoUnidade.Value;
       qryParametrosEmail.Open;
       if qryUnidadeRetirada.Active then
            qryUnidadeRetirada.Close;
       qryUnidadeRetirada.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
       qryUnidadeRetirada.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
       qryUnidadeRetirada.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
       qryUnidadeRetirada.Parameters.ParamByName('CodigoUnidade').Value := qryConsultaReservaCodigoUnidade.Value;
       qryUnidadeRetirada.Open;
       try
           IdHTTPCL.Request.ContentType := 'application/json';
           //IdHTTPCL.IOHandler := IdSSLIOHandlerSocketOpenSSL;
           IdHTTPCL.Request.CustomHeaders.AddValue('smtp_host',qryParametrosEmailSMTPServidor.Value);
           IdHTTPCL.Request.CustomHeaders.AddValue('smtp_port',IntToStr(qryParametrosEmailSMTPPorta.Value));
            if qryParametrosEmailRequerAutenticacao.Value = 'S' then
                 IdHTTPCL.Request.CustomHeaders.AddValue('smtp_require_tls','true')
            else
                 IdHTTPCL.Request.CustomHeaders.AddValue('smtp_require_tls','false');
            IdHTTPCL.Request.CustomHeaders.AddValue('smtp_reject_unauthorized','false');
            IdHTTPCL.Request.CustomHeaders.AddValue('smtp_auth_user',qryParametrosEmailSMTPUsuario.Value);
            IdHTTPCL.Request.CustomHeaders.AddValue('smtp_auth_pass',qryParametrosEmailSMTPSenha.Value);
            IdHTTPCL.Request.CustomHeaders.AddValue('Authorization','Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW4iLCJpYXQiOjE1Mjg0ODczOTF9.TinPCWQDUiwLEkS-u9INvJmG-AlPvZMlWIMX2PvQpFQ');
            IdHTTPCL.Request.CustomHeaders.AddValue('Content-Type','application/json');
            Objeto := TJSONObject.Create;
            Objeto.AddPair('from',qryParametrosEmailEmail.Value);
            ListaObjeto:= TJSONArray.Create;
            ListaObjeto.Add(qryConsultaReservaEmail.Value);
            if qryUnidadeRetiradaEmail.Value <> '' then
                 ListaObjeto.Add(qryUnidadeRetiradaEmail.Value);
            Objeto.AddPair('to',ListaObjeto);
            Objeto.AddPair('subject','Reserva Web - ' + qryUnidadeRetiradaDescricaoUnidade.Value);
            Objeto.AddPair('text','-');
            Objeto.AddPair('html','<html>' +
                                  '<head>' +
                                  '<meta http-equiv="Content-Language" content="pt-br">' +
                                  '<meta http-equiv="Content-Type" content="text/html charset=windows-1252">' +
                                  '<title>CANCELAMENTO DE RESERVA DE VEÍCULO</title>' +
                                  '</head>' +
                                  '<body leftmargin="10">' +
                                  '<table border="1" width="100%">' +
                                  '<tr><td><b>' +               // http://www.yesrentacar.com.br/logo.jpg
                                  '<img border="0" src=" ' + qryParametrosEmailCaminhoLogoWeb.Value + '" width="140" height="100"></b></td></tr>' +
                                  '<tr>' +
                                  '<td>' +
                                  '<p align="center"><b>CANCELAMENTO DE RESERVA DE VEÍCULO</b></td>' +
                                  '</tr>' +
                                  '</table>' +
                                  '<p>&nbsp;</p>' +
                                  '<table border="1" width="100%">' +
                                  '<tr>' +
                                  '<td>' +
                                  '<blockquote>' +
                                  'Prezado cliente ' + NomeCliente + '<br>' +
                                  ''+ '<br>' +
                                  'Reserva de código; ' + IntToStr(CodigoReserva) + ' cancelada com sucesso.'+ '<br>' +
                                  'Esperamos atende-lo em uma próxima oportunidade.' + '<br>' +
                                  ''+ '<br>' +
                                  'Atenciosamente,' + '<br>' +
                                  ''+ '<br>' +
                                  qryParametrosEmailDescricaoUnidade.Value + '<br>' +
                                  ''+ '<br>' +
                                  '<p>&nbsp;</p>' +
                                  '<img border="0" src="'+ qryParametrosEmailCaminhoAssinatura.Value +'" width="470" height="100"> ' +
                                  '</blockquote></td></tr>' +
                                  '</table>' +
                                  '</blockquote></td></tr>' +
                                  '</table>' +
                                  '</body>' +
                                  '</html>');
            lBody := TStringStream.Create(TEncoding.UTF8.GetBytes(Objeto.ToString));
            try
                 IdHTTPCL.Post('http://18.231.78.117:3000/api/v1/emails',lBody);
                 if IdHTTPCL.ResponseCode = 200 then
                      Result := true
                 else
                      Result := false;
            except
                 Result := false;
            end;
       except
            Result := false;
       end;
  except
       Result := false;
  end;
end;

function TLocavia.Municipios(): TStringStream;
var
  Objeto,
  Erro: TJSONObject;
  Municipios,
  Erros: TJSONArray;
  I: Integer;
  DadosRequisicao: TWebModule;
  Like, CodigoBD,
  Msg: String;
begin
  try
       Erros := TJSONArray.Create;
       Msg := '';
       DadosRequisicao := GetDataSnapWebModule;
       Like := LowerCase(RemoveMascSt(DadosRequisicao.Request.QueryFields.Values['like'],cjCaracteresEspecial));
//       if Length(Like) = 0 then
//            Msg := 'Like e obrigatório.'
//       else
       CodigoBD := DadosRequisicao.Request.GetFieldByName('empresa');
       if Length(CodigoBD) = 14 then
       begin
            CodigoBD := ObterCodigoIdentificacao(CodigoBD);
            if (Length(CodigoBD) =  0) or (CodigoBD = 'erro') then
                 Msg := 'Falha ao conectar ao banco de dados.';
       end;
       if ConectaBanco(CodigoBD) then
       begin
            Municipios := TJSONArray.Create;
            Like := ConverteAcento(Like);
            if qryLocalizaMunicipios.Active then
                 qryLocalizaMunicipios.Close;
            qryLocalizaMunicipios.Parameters.ParamByName('Descricao').DataType := ftString;
            if Length(Like)> 0 then
                 qryLocalizaMunicipios.Parameters.ParamByName('Descricao').Value := Like + '%'
            else
                 qryLocalizaMunicipios.Parameters.ParamByName('Descricao').Value := '%' + Like + '%';
            qryLocalizaMunicipios.Open;
            while not qryLocalizaMunicipios.Eof do
            begin
                 Objeto := TJSONObject.Create;
                 for I := 0 to qryLocalizaMunicipios.FieldCount -1 do
                      Objeto.AddPair(qryLocalizaMunicipios.Fields[I].FieldName, ConverteJSON(qryLocalizaMunicipios.Fields[I]));
                 Municipios.AddElement(Objeto);
                 qryLocalizaMunicipios.Next;
            end;
       end
       else
            Msg := 'Falha ao conectar ao banco de dados.';
       Result := RetornoPadraoArray(Erros, Municipios, Msg);
  finally
       qryLocalizaMunicipios.Close;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
       LiberarMemoria;
  end;
end;

function TLocavia.ObterCodigoIdentificacao(Cnpj: String): String;
var
  Resposta : TStringStream;
  Objeto,
  RetornoJSON : TJSONObject;
  MontaURL: string;
  I: Integer;
begin
  IdHTTPCL.Request.ContentType := 'application/json';
  IdHTTPCL.Request.Method := 'GET';
  Resposta := TStringStream.Create;
  MontaURL := 'http://54.207.112.49:8057/tlocavia/identificacao?cnpj=' + Cnpj;
  //MontaURL := 'http://localhost:8057/tlocavia/identificacao?cnpj=' + Cnpj;
  IdHTTPCL.Get(MontaURL, Resposta);
  RetornoJSON := TJSONObject.Create;
  RetornoJSON := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Resposta.DataString),0) as TJSONObject;
  if RetornoJSON.Size > 0 then
  begin
       I := 0;
       While I <= RetornoJSON.Size - 1 do
       begin
            if (RetornoJSON.Get(I).JsonString.Value = 'Data') and (RetornoJSON.Get(I).JsonValue IS TJSONObject)then
            begin
                  Objeto := TJSONObject.Create;
                  Objeto := (RetornoJSON.Get(I).JsonValue AS TJSONObject);
                  Result := Objeto.GetValue('CodigoIdentificador').Value;
            end;
            Inc(I);
        end;
  end
  else
       Result := 'erro';
end;

function TLocavia.TokenValido(Token: String): Boolean;
var
  I: integer;
  Achou: Boolean;
  Arquivo: TStringList;
begin
  try
       Result := false;
       Arquivo := TStringList.Create;
       if FileExists(gsAppPath + gsAppName + '.txt')then
       begin
            Arquivo.LoadFromFile(gsAppPath + gsAppName + '.txt');
            I:= 0;
            Achou := false;
            While not Achou and (I <= Arquivo.Count - 1) do
            begin
                 if Copy(Arquivo[I],1,Pos('|',Arquivo[I])-1) = Token then
                 begin
                      if TimeToStr(Now - StrToDateTime(Copy(Arquivo[I],Pos('|',Arquivo[I]) + 1,Length(Arquivo[I])))) >= '00:20:00' then
                      begin
                           Arquivo.Delete(I);
                           Achou := true;
                           Arquivo.SaveToFile(gsAppPath + gsAppName + '.txt');
                      end
                      else
                           Result := true;
                 end
                 else
                 begin
                      if TimeToStr(Now - StrToDateTime(Copy(Arquivo[I],Pos('|',Arquivo[I]) + 1,Length(Arquivo[I])))) >= '00:20:00' then
                      begin
                           Arquivo.Delete(I);
                           Achou := true;
                           Arquivo.SaveToFile(gsAppPath + gsAppName + '.txt');
                      end;
                 end;
                 Inc(I);
            end;
       end;
  finally
      Arquivo.Free;
  end;
end;

function TLocavia.Unidades: TStringStream;
var
  Objeto,
  Erro: TJSONObject;
  Unidades,
  Erros: TJSONArray;
  DadosRequisicao: TWebModule;
  I: Integer;
  Msg, CodigoBD: String;
begin
  try
       Erros := TJSONArray.Create;
       Unidades := TJSONArray.Create;
       Msg := '';
       DadosRequisicao := GetDataSnapWebModule;
       CodigoBD := DadosRequisicao.Request.GetFieldByName('empresa');
       if Length(CodigoBD) = 14 then
       begin
            CodigoBD := ObterCodigoIdentificacao(CodigoBD);
            if (Length(CodigoBD) =  0) or (CodigoBD = 'erro') then
                 Msg := 'Falha ao conectar ao banco de dados.';
       end;
       if ConectaBanco(CodigoBD) then
       begin
            if qryListaUnidades.Active then
                 qryListaUnidades.Close;
            qryListaUnidades.Open;
            while not qryListaUnidades.Eof do
            begin
                 Objeto := TJSONObject.Create;
                 for I := 0 to qryListaUnidades.FieldCount -1 do
                      Objeto.AddPair(qryListaUnidades.Fields[I].FieldName, ConverteJSON(qryListaUnidades.Fields[I]));
                 Unidades.AddElement(Objeto);
                 qryListaUnidades.Next;
            end;
       end
       else
            Msg := 'Falha ao conectar ao banco de dados.';
       Result := RetornoPadraoArray(Erros,Unidades, Msg);
  finally
        if qryListaUnidades.Active then
            qryListaUnidades.Close;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
       LiberarMemoria;
  end;
end;

function TLocavia.updateClientes: TStringStream;
var
  NomeCliente,
  CPF,
  Email,
  Telefone,
  Passaporte,
  Celular,
  Sexo,
  Identidade,
  Logradouro,
  Bairro,
  Complemento,
  Cep,
  Estado,
  Cidade,
  RetornoRequisicao: String;
  CodigoEmpresa,
  CodigoUnidade,
  CodigoMunicipio,
  Numero: Integer;
  DadosRequisicao: TWebModule;
  Objeto,
  Erro,
  Requisicao: TJSONObject;
  Cliente,
  Erros,
  Retorno: TJSONArray;
  I, CodigoCliente: Integer;
  ExisteCliente: Boolean;
  CodigoBD,
  Msg: String;
begin
  try
       Erros := TJSONArray.Create;
       Retorno := TJSONArray.Create;
       Objeto := TJSONObject.Create;
       DadosRequisicao := GetDataSnapWebModule;
       Msg := '';
       DadosRequisicao := GetDataSnapWebModule;
       CodigoBD := DadosRequisicao.Request.GetFieldByName('empresa');
       if Length(CodigoBD) = 14 then
       begin
            CodigoBD := ObterCodigoIdentificacao(CodigoBD);
            if (Length(CodigoBD) =  0) or (CodigoBD = 'erro') then
                 Msg := 'Falha ao conectar ao banco de dados.';
       end;
       if ConectaBanco(CodigoBD) then
       begin
            CodigoCliente := 0;
            ExisteCliente := false;
            {Captura os dados da requisicao}
            RetornoRequisicao := DadosRequisicao.Request.Content;
            Requisicao := TJSONObject.Create;
            Requisicao := TJSONObject.ParseJSONValue(TEncoding.Default.GetBytes(RetornoRequisicao),0) AS TJSONObject;
            {Realiza a atribuicao dos dados da requisicao para as variaveis}
            if Assigned(Requisicao.GetValue('CodigoEmpresa')) then
                 CodigoEmpresa := StrToIntDef(Requisicao.GetValue('CodigoEmpresa').Value, 0);
            if Assigned(Requisicao.GetValue('CodigoUnidade')) then
                 CodigoUnidade := StrToIntDef(Requisicao.GetValue('CodigoUnidade').Value,0);
            if Assigned(Requisicao.GetValue('NomeCliente')) then
                 NomeCliente := Requisicao.GetValue('NomeCliente').Value;
            if Assigned(Requisicao.GetValue('Email')) then
                 Email := Requisicao.GetValue('Email').Value;
            if Assigned(Requisicao.GetValue('CPF')) then
                 CPF := Requisicao.GetValue('CPF').Value;
            if Assigned(Requisicao.GetValue('Telefone')) then
                 Telefone := Requisicao.GetValue('Telefone').Value;
            if Assigned(Requisicao.GetValue('Celular')) then
                 Celular := Requisicao.GetValue('Celular').Value;
            if Assigned(Requisicao.GetValue('Passaporte')) then
                 Passaporte := Requisicao.GetValue('Passaporte').Value;
            if Assigned(Requisicao.GetValue('Identidade')) then
                 Identidade := Requisicao.GetValue('Identidade').Value;
            if Assigned(Requisicao.GetValue('Sexo')) then
                 Sexo := Requisicao.GetValue('Sexo').Value;
            if Assigned(Requisicao.GetValue('Logradouro')) then
                 Logradouro := Requisicao.GetValue('Logradouro').Value;
            if Assigned(Requisicao.GetValue('Bairro')) then
                 Bairro := Requisicao.GetValue('Bairro').Value;
            if Assigned(Requisicao.GetValue('Complemento')) then
                 Complemento := Requisicao.GetValue('Complemento').Value;
            if Assigned(Requisicao.GetValue('Cep')) then
                 Cep := Requisicao.GetValue('Cep').Value;
            if Assigned(Requisicao.GetValue('Estado')) then
                 Estado := Requisicao.GetValue('Estado').Value;
            if Assigned(Requisicao.GetValue('Cidade')) then
                 Cidade := Requisicao.GetValue('Cidade').Value;
            if Assigned(Requisicao.GetValue('Numero')) then
                 Numero := StrToIntDef(Requisicao.GetValue('Numero').Value, 0);
            if Assigned(Requisicao.GetValue('CodigoMunicipio')) then
                 CodigoMunicipio := StrToIntDef(Requisicao.GetValue('CodigoMunicipio').Value, 0);
            //Verifica os campo obrigatórios
            if NomeCliente = '' then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Nome do Cliente é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if Email = '' then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Email do Cliente é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if Telefone = '' then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Telefone do Cliente é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoEmpresa <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Codigo Empresa do Cliente é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoMunicipio <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Codigo Municipio do Cliente é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if (Passaporte = '') and (CPF = '') then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Passaporte ou CPF do Cliente deve ser preenchido.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoUnidade <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Codigo Unidade do Cliente é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            //Verifica se teve algum erro
            if Erros.Size > 0 then
                 Result := RetornoPadraoArray(Erros, Retorno)
            else
            begin
                 //Verifica se o cliente ja está cadastrado
                 if CPF = '' then
                 begin
                      if qryClienteCadastrado.Active then
                           qryClienteCadastrado.Close;
                      qryClienteCadastrado.SQL[9] := 'AND (Clientes.Passaporte = ' + #39 + Passaporte + #39 +')';
                      qryClienteCadastrado.Open;
                      if not qryClienteCadastrado.IsEmpty then
                      begin
                           ExisteCliente := true;
                           CodigoCliente := qryClienteCadastradoCodigoCliente.Value;
                      end;
                 end
                 else
                 begin
                      if qryClienteCadastrado.Active then
                           qryClienteCadastrado.Close;
                      qryClienteCadastrado.SQL[9] := 'AND (Clientes.CPF = ' + #39 + CPF + #39 +')';
                      qryClienteCadastrado.Open;
                      if not qryClienteCadastrado.IsEmpty then
                      begin
                           ExisteCliente := true;
                           CodigoCliente := qryClienteCadastradoCodigoCliente.Value;
                      end;
                 end;
                 try
                      if not ExisteCliente then
                      begin
                          try
                               if qryGravaCliente.Active then
                                     qryGravaCliente.Close;
                                qryGravaCliente.Open;
                                qryGravaCliente.Append;
                                qryGravaClienteNomeFantasia.Value := Copy(NomeCliente,1,80);
                                qryGravaClienteRazaoSocial.Value := Copy(NomeCliente,1,80);
                                qryGravaClienteCPF.Value := CPF;
                                qryGravaClienteEmail.Value := Email;
                                qryGravaClienteTelefone.Value := Copy(Telefone,1,11);
                                qryGravaClienteCodigoEmpresa.Value := CodigoEmpresa;
                                qryGravaClienteCodigoUnidade.Value := CodigoUnidade;
                                qryGravaClientePassaporte.Value := Passaporte;
                                qryGravaClienteCelular.Value := Celular;
                                qryGravaClienteSexo.Value := Sexo;
                                qryGravaClienteIdentidade.Value := Identidade;
                                qryGravaClienteLogradouro.Value := Logradouro;
                                qryGravaClienteBairro.Value := Bairro;
                                qryGravaClienteNumero.Value := Numero;
                                qryGravaClienteComplemento.Value := Complemento;
                                qryGravaClienteCep.Value := Cep;
                                qryGravaClienteEstado.Value := Estado;
                                qryGravaClienteCidade.Value := Cidade;
                                qryGravaClienteCodigoMunicipio.Value := CodigoMunicipio;
                                qryGravaClienteTipo.Value := 'F';
                                qryGravaClienteSituacao.Value :=  'C';
                                qryGravaClienteRetencaoPIS.Value := 'N';
                                qryGravaClienteRetencaoCofins.Value := 'N';
                                qryGravaClienteRetencaoContribuicaoSocial.Value := 'N';
                                qryGravaClienteRetencaoIR.Value := 'N';
                                qryGravaClienteRetencaoINSS.Value := 'N';
                                qryGravaClienteRetencaoISS.Value := 'N';
                                qryGravaClienteTipoFaturaDocumento.Value := 'N';
                                qryGravaClienteTipoFaturaLocacao.Value := 'V';
                                qryGravaClienteTipoFaturaDespesas.Value :=  'J';
                                qryGravaClienteTipoRetencaoImpostos.Value := 'S';
                                qryGravaClienteTipoRetencaoISS.Value := 'S';
                                qryGravaClienteClassificacao.Value := 'T';
                                qryGravaClienteBloqueadoPor.Value :=  0;
                                qryGravaClienteTipoConta.Value := 'C';
                                qryGravaClienteFuncionarioGrupo.Value := 'N';
                                qryGravaClienteCorretor.Value := 'N';
                                qryGravaClienteFumante.Value := 'N';
                                qryGravaClienteDescreverImpostosFatura.Value := 'N';
                                qryGravaClienteTipoFaturaCombustivel.Value := 'N';
                                if qryProximoCodigoCliente.Active then
                                     qryProximoCodigoCliente.Close;
                                qryProximoCodigoCliente.Open;
                                qryGravaClienteCodigoCliente.Value := qryProximoCodigoClienteProximoCodigo.Value;
                                qryGravaCliente.Post;
                                qryProximoCodigoCliente.Edit;
                                qryProximoCodigoClienteProximoCodigo.Value := qryProximoCodigoClienteProximoCodigo.Value + 1;
                                qryProximoCodigoCliente.Post;
                                if CPF <> '' then
                                begin
                                     if qryClienteCadastrado.Active then
                                          qryClienteCadastrado.Close;
                                     qryClienteCadastrado.SQL[9] := 'AND (Clientes.CPF = ' + #39 + CPF + #39 +')';
                                     qryClienteCadastrado.Open;
                                     if not qryClienteCadastrado.IsEmpty then
                                          CodigoCliente := qryClienteCadastradoCodigoCliente.Value;
                                end
                                else
                                begin
                                     if qryClienteCadastrado.Active then
                                          qryClienteCadastrado.Close;
                                     qryClienteCadastrado.SQL[9] := 'AND (Clientes.Passaporte = ' + #39 + Passaporte + #39 +')';
                                     qryClienteCadastrado.Open;
                                     if not qryClienteCadastrado.IsEmpty then
                                          CodigoCliente := qryClienteCadastradoCodigoCliente.Value;
                                end;
                                //Atualiza o proximo codigo
                                if qryProximoCodigoCliente.Active then
                                     qryProximoCodigoCliente.Close;
                                qryProximoCodigoCliente.ExecSQL;
                           except
                                Msg := 'Erro no banco de dados.';
                                Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
                           end;
                      end
                      else //caso exista o cliente o sistema apenas atualiza as informações
                      begin
                           if qryClienteCadastrado.Active then
                           begin
                                qryClienteCadastrado.Edit;
                                qryClienteCadastradoNomeFantasia.Value := NomeCliente;
                                qryClienteCadastradoRazaoSocial.Value := NomeCliente;
                                qryClienteCadastradoCPF.Value := CPF;
                                qryClienteCadastradoEmail.Value := Email;
                                qryClienteCadastradoTelefone.Value := Telefone;
                                qryClienteCadastradoCodigoEmpresa.Value := CodigoEmpresa;
                                qryClienteCadastradoCodigoUnidade.Value := CodigoUnidade;
                                qryClienteCadastradoPassaporte.Value := Passaporte;
                                qryClienteCadastradoCelular.Value := Celular;
                                qryClienteCadastradoSexo.Value := Sexo;
                                qryClienteCadastradoIdentidade.Value := Identidade;
                                qryClienteCadastradoLogradouro.Value := Logradouro;
                                qryClienteCadastradoBairro.Value := Bairro;
                                qryClienteCadastradoNumero.Value := Numero;
                                qryClienteCadastradoComplemento.Value := Complemento;
                                qryClienteCadastradoCep.Value := Cep;
                                qryClienteCadastradoEstado.Value := Estado;
                                qryClienteCadastradoCidade.Value := Cidade;
                                qryClienteCadastradoCodigoMunicipio.Value := CodigoMunicipio;
                                qryClienteCadastrado.Post;
                           end;
                      end;
                      //Retornar as informacoes do cliente gravado
                      if qryCliente.Active then
                           qryCliente.Close;
                      qryCliente.Parameters.ParamByName('CodigoCliente').DataType := ftInteger;
                      qryCliente.Parameters.ParamByName('CodigoCliente').Value := CodigoCliente;
                      qryCliente.Open;
                      while not qryCliente.Eof do
                      begin
                           for I := 0 to qryCliente.FieldCount -1 do
                                if (qryCliente.Fields[I].FieldName = 'CodigoCliente') or
                                   (qryCliente.Fields[I].FieldName = 'NomeFantasia') or
                                   (qryCliente.Fields[I].FieldName = 'Email') or
                                   (qryCliente.Fields[I].FieldName = 'Telefone') or
                                   (qryCliente.Fields[I].FieldName = 'Passaporte') then
                                     Objeto.AddPair(qryCliente.Fields[I].FieldName, ConverteJSON(qryCliente.Fields[I]));
                           qryCliente.Next;
                      end;
                 except
                      Msg := 'Erro no servidor.';
                      Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
                 end;
            end;
       end
       else
            Msg := 'Falha ao conectar ao banco de dados.';
       Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
  finally
       if qryCliente.Active then
            qryCliente.Close;
       if qryProximoCodigoCliente.Active then
            qryProximoCodigoCliente.Close;
       if qryClienteCadastrado.Active then
            qryClienteCadastrado.Close;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
       LiberarMemoria;
  end;
end;

function TLocavia.updateReservas: TStringStream;
var
  CodigoEmpresa,
  CodigoUnidade,
  CodigoCliente,
  CodigoGrupo,
  CodigoProtecao,
  CodigoTarifa,
  CodigoMunicipioRetirada,
  CodigoMunicipioDevolucao: Integer;
  DataInicio,
  DataTermino: TDateTime;
  HoraInicio,
  HoraTermino,
  RetornoRequisicao: String;
  ValorLocacaoJovem: Currency;
  Origem: String;
  Objeto,
  Erro,
  Requisicao,
  ItemProtecao,
  ServicoAdicional: TJSONObject;
  Reserva,
  Erros,
  Retorno,
  RequisicaoItensProtecao,
  RequisicaoServicoAdicional: TJSONArray;
  I,
  CodigoReserva: Integer;
  ReservaOK: Boolean;
  PercentualMaximoTaxaServico: Double;
  DadosRequisicao: TWebModule;
  Empresa,
  Msg: String;
begin
  try
       Erros := TJSONArray.Create;
       Retorno := TJSONArray.Create;
       Objeto := TJSONObject.Create;
       Msg := '';
       DadosRequisicao := GetDataSnapWebModule;
       Empresa := DadosRequisicao.Request.GetFieldByName('empresa');
       if Length(Empresa) = 14 then
       begin
            Empresa := ObterCodigoIdentificacao(Empresa);
            if (Length(Empresa) =  0) or (Empresa = 'erro') then
                 Msg := 'Falha ao conectar ao banco de dados.';
       end;
       if ConectaBanco(Empresa) then
       begin
            ReservaOK := true;
            CodigoReserva := 0;
            RetornoRequisicao := '';
            {caputura os dados da requisicao}
            RetornoRequisicao := DadosRequisicao.Request.Content;
            Requisicao := TJSONObject.Create;
            Requisicao := TJSONObject.ParseJSONValue(TEncoding.Default.GetBytes(RetornoRequisicao),0) AS TJSONObject;
            RequisicaoItensProtecao := TJSONArray.Create;
            RequisicaoServicoAdicional := TJSONArray.Create;
            {Atribui os valores dos parametros as variaveis de validacao}
            if Assigned(Requisicao.GetValue('CodigoEmpresa')) then
                 CodigoEmpresa := StrToIntDef(Requisicao.GetValue('CodigoEmpresa').Value,0);
            if Assigned(Requisicao.GetValue('CodigoUnidade')) then
                 CodigoUnidade := StrToIntDef(Requisicao.GetValue('CodigoUnidade').Value,0);
            if Assigned(Requisicao.GetValue('CodigoCliente')) then
                 CodigoCliente := StrToIntDef(Requisicao.GetValue('CodigoCliente').Value,0);
            if Assigned(Requisicao.GetValue('CodigoGrupo')) then
                 CodigoGrupo := StrToIntDef(Requisicao.GetValue('CodigoGrupo').Value,0);
            if Assigned(Requisicao.GetValue('CodigoProtecao')) then
                 CodigoProtecao := StrToIntDef(Requisicao.GetValue('CodigoProtecao').Value,0);
            if Assigned(Requisicao.GetValue('CodigoTarifa')) then
                 CodigoTarifa := StrToIntDef(Requisicao.GetValue('CodigoTarifa').Value,0);
            if Assigned(Requisicao.GetValue('DataInicio')) then
                 DataInicio := StrToDateTimeDef(Requisicao.GetValue('DataInicio').Value, 0);
            if Assigned(Requisicao.GetValue('DataTermino')) then
                 DataTermino := StrToDateTimeDef(Requisicao.GetValue('DataTermino').Value,0);
            if Assigned(Requisicao.GetValue('HoraInicio')) then
                 HoraInicio := Requisicao.GetValue('HoraInicio').Value;
            if Assigned(Requisicao.GetValue('HoraTermino')) then
                 HoraTermino := Requisicao.GetValue('HoraTermino').Value;
            if Assigned(Requisicao.GetValue('CodigoMunicipioRetirada')) then
                 CodigoMunicipioRetirada := StrToIntDef(Requisicao.GetValue('CodigoMunicipioRetirada').Value,0);
            if Assigned(Requisicao.GetValue('CodigoMunicipioDevolucao')) then
                 CodigoMunicipioDevolucao := StrToIntDef(Requisicao.GetValue('CodigoMunicipioDevolucao').Value,0);
            if Assigned(Requisicao.GetValue('Origem')) then
                 Origem := Requisicao.GetValue('Origem').Value;
            if Assigned(Requisicao.GetValue('ItensProtecao')) then
                 RequisicaoItensProtecao := Requisicao.GetValue('ItensProtecao') AS TJSONArray;
            if Assigned(Requisicao.GetValue('Adicionais')) then
                 RequisicaoServicoAdicional := Requisicao.GetValue('Adicionais') AS TJSONArray;
            if Assigned(Requisicao.GetValue('ValorTaxaJovem')) then
                 ValorLocacaoJovem := StrToCurrDef(Requisicao.GetValue('ValorTaxaJovem').Value,0);
            {Valida os parametros passados}
            if CodigoEmpresa <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Empresa é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoUnidade <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Unidade é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoCliente <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Cliente é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoGrupo <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Grupo é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoProtecao <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Proteção é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoTarifa <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Tarifa é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if DataInicio = 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Data Início é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if DataTermino = 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Data Término é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if HoraInicio = '' then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Hora Início é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if HoraTermino = '' then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Hora Término é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoMunicipioRetirada <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Município Retirada é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if CodigoMunicipioDevolucao <= 0 then
            begin
                 Erro := TJSONObject.Create;
                 Erro.AddPair('Erro', TJSONString.Create('Município Devolução é obrigatório.'));
                 Erros.AddElement(Erro);
            end;
            if Erros.Size > 0 then
                 Result := RetornoPadraoArray(Erros, Retorno)
            else
            begin
                 //Preenche os parametros para gravar a reserva
                 if qryGravaReserva.Active then
                      qryGravaReserva.Close;
                 qryGravaReserva.Open;
                 qryGravaReserva.Append;
                 // on new record
                 qryGravaReservaComMotorista.Value := 'N';
                 qryGravaReservaViagem.Value := 'N';
                 qryGravaReservaCoberturaTotal.Value := 'N';
                 qryGravaReservaCoberturaTerceiros.Value := 'N';
                 qryGravaReservaCoberturaOcupantes.Value := 'N';
                 qryGravaReservaCoberturaEspecial.Value := 'N';
                 qryGravaReservaCobertura24h.Value := 'N';
                 qryGravaReservaPercDescontoFatura.Value := 0;
                 qryGravaReservaPrazoFatura.Value := 15;
                 qryGravaReservaEstimativaKmRodados.Value := 0;
                 qryGravaReservaCodigoGrupoContratos.Value := 0;
                 qryGravaReservaQtdeCondutoresAdicionais.Value := 0;
                 qryGravaReservaValorCondutoresAdicionais.Value := 0;
                 qryGravaReservaDataReserva.Value := Now;
                 qryGravaReservaHoraReserva.Value := Copy(TimeToStr(Time),1,2) + Copy(TimeToStr(Time),4,2);
                 qryGravaReservaCodigoEmpresa.Value := CodigoEmpresa;
                 qryGravaReservaCodigoUnidade.Value := CodigoUnidade;
                 qryGravaReservaCodigoCliente.Value := CodigoCliente;
                 if qryCliente.Active then
                      qryCliente.Close;
                 qryCliente.Parameters.ParamByName('CodigoCliente').DataType := ftInteger;
                 qryCliente.Parameters.ParamByName('CodigoCliente').Value := CodigoCliente;
                 qryCliente.Open;
                 qryGravaReservaTipoCliente.Value := qryClienteTipo.Value;
                 qryGravaReservaClienteCadastrado.Value := 'S';
                 qryGravaReservaNomeCliente.Value := qryClienteNomeFantasia.Value;
                 qryGravaReservaTelefoneContato1.Value := qryClienteTelefone.Value;
                 qryGravaReservaEmail.Value := qryClienteEmail.Value;
                 qryGravaReservaCPF.Value := qryClienteCPF.Value;
                 qryGravaReservaIdentidade.Value := qryClienteIdentidade.Value;
                 qryGravaReservaPassaporte.Value := qryClientePassaporte.Value;
                 qryGravaReservaDataInicio.Value := DataInicio;
                 qryGravaReservaHoraInicio.Value := StringReplace(HoraInicio,':','', [rfReplaceAll, rfIgnoreCase]);
                 qryGravaReservaDataHoraInicio.Value := DataInicio + StrToTime(HoraInicio + ':00');
                 qryGravaReservaDataTermino.Value := DataTermino;
                 qryGravaReservaHoraTermino.Value := StringReplace(HoraTermino,':','',[rfReplaceAll, rfIgnoreCase]);
                 qryGravaReservaDataHoraTermino.Value := DataTermino + StrToDateTime(HoraTermino + ':00');
                 qryGravaReservaCancelada.Value := 'N';
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioRetirada;
                 qryUnidades.Open;
                 if qryParametrosUnidade.Active then
                      qryParametrosUnidade.Close;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := qryUnidadesCodigoEmpresa.Value;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := qryUnidadesCodigoUnidade.Value;
                 qryParametrosUnidade.Open;
                 qryGravaReservaCodigoModelo.Value := 0;
                 qryGravaReservaLocalEntregaVeiculo.Value := qryParametrosUnidadeDescricaoUnidade.Value;
                 qryGravaReservaLocalEntrega.Value := qryUnidadesMunicipioUnidade.Value;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioDevolucao;
                 qryUnidades.Open;
                 if qryParametrosUnidade.Active then
                      qryParametrosUnidade.Close;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := qryUnidadesCodigoEmpresa.Value;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := qryUnidadesCodigoUnidade.Value;
                 qryParametrosUnidade.Open;

                 if qryParametrosEmpresa.Active then
                      qryParametrosEmpresa.Close;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryParametrosEmpresa.Open;
//                           if qryTarifa.Active then
//                                qryTarifa.Close;
//                           qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
//                           qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
//                           qryTarifa.Open;
//                           qryGravaReserva.Parameters.ParamByName('CodigoProtecao').Value := CodigoProtecao;
//                           if qryProtecao.Active then
//                                qryProtecao.Close;
//                           qryProtecao.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
//                           qryProtecao.Parameters.ParamByName('CodigoProtecao').Value := CodigoProtecao;
//                           qryProtecao.Open;
//                           qryGravaReserva.Parameters.ParamByName('LocalRetornoVeiculo').Value := qryParametrosUnidadeDescricaoUnidade.Value;
//                           qryGravaReserva.Parameters.ParamByName('LocalDevolucao').Value := qryUnidadesMunicipioUnidade.Value;
//                           qryGravaReserva.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
//                           qryGravaReserva.Parameters.ParamByName('ValorPeriodoVeiculo').Value := StringReplace(qryTarifaValorPeriodoVeiculo.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);




                 if qryProtecoes.Active then
                      qryProtecoes.Close;
                 qryProtecoes.Open;
                 if qryTarifa.Active then
                      qryTarifa.Close;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoProtecao;
                 qryTarifa.Open;
                 qryGravaReservaCodigoProtecao.Value := CodigoProtecao;
                 if qryTarifa.Active then
                      qryTarifa.Close;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
                 qryTarifa.Open;
                 if qryProtecao.Active then
                      qryProtecao.Close;
                 qryProtecao.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                 qryProtecao.Parameters.ParamByName('CodigoProtecao').Value := CodigoProtecao;
                 qryProtecao.Open;
                 qryGravaReservaLocalRetornoVeiculo.Value := qryParametrosUnidadeDescricaoUnidade.Value;
                 qryGravaReservaLocalDevolucao.Value := qryUnidadesMunicipioUnidade.Value;
                 qryGravaReservaCodigoTarifaVeiculo.Value := CodigoTarifa;
                 if qryTarifa.Active then
                      qryTarifa.Close;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
                 qryTarifa.Open;

                 if qryParametrosEmpresaDefinirValorProtecaoPor.Value = 'G' then
                      qryGravaReservaValorPeriodoSegAd.Value := qryTarifaValorPeriodoSegAd.Value
                 else
                      qryGravaReservaValorPeriodoSegAd.Value := qryProtecaoValorProtecao.Value;
                 qryGravaReservaValorPeriodoVeiculo.Value := qryTarifaValorPeriodoVeiculo.Value;

                 if qryParametrosEmpresa.Active then
                      qryParametrosEmpresa.Close;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryParametrosEmpresa.Open;
                 {Calcula o valor de protecoes}

                 qryGravaReservaKmLivre.Value := qryTarifaKmLivre.Value;
                 qryGravaReservaValorKmRodado.Value := qryTarifaValorKmRodado.Value;
                 qryGravaReservaFranquiaKmRodado.Value := qryTarifaFranquiaKmRodado.Value;
                 qryGravaReservaValorKmRodados.Value := qryTarifaValorKmRodado.Value;
                 qryGravaReservaValorFranquia.Value := 0;
                 qryGravaReservaValorFranquiaTerceiros.Value := 0;
                 qryGravaReservaValorFranquiaOcupantes.Value := 0;
                 qryGravaReservaCodigoGrupoVeiculos.Value := CodigoGrupo;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioRetirada;
                 qryUnidades.Open;
                 if qryParametrosUnidade.Active then
                      qryParametrosUnidade.Close;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := qryUnidadesCodigoEmpresa.Value;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := qryUnidadesCodigoUnidade.Value;
                 qryParametrosUnidade.Open;
                 //Verifica se existe Veiculos disponiveis
                 if qryValidaVeiculosDisponiveis.Active then
                      qryValidaVeiculosDisponiveis.Close;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoGrupo').Value := CodigoGrupo;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicio').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicio').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTermino').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTermino').Value := StrToDateTime(DateTimeToStr(DataTermino) + ' ' + Copy(HoraTermino,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Open;
                 if (Empresa ='511') or (Empresa = '629') then
                      qryGravaReservaCodigoMVA.Value := 0
                 else
                      qryGravaReservaCodigoMVA.Value := qryValidaVeiculosDisponiveisCodigoMVA.Value;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioRetirada;
                 qryUnidades.Open;
                 PercentualMaximoTaxaServico := qryUnidadesTaxaServicoReservaWeb.Value;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioDevolucao;
                 qryUnidades.Open;
                 if PercentualMaximoTaxaServico < qryUnidadesTaxaServicoReservaWeb.Value then
                      PercentualMaximoTaxaServico := qryUnidadesTaxaServicoReservaWeb.Value;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioRetirada;
                 qryUnidades.Open;
//                 if ValorLocacaoJovem > 0 then
//                 begin
//                      qryGravaReserva.Parameters.ParamByName('LocacaoJovem').Value := 'S';
//                      qryGravaReserva.Parameters.ParamByName('ValorLocacaoJovem').Value := StringReplace(CurrToStr(ValorLocacaoJovem),',','.',[rfReplaceAll, rfIgnoreCase]);;;
//                 end
//                 else
//                 begin
//                      qryGravaReserva.Parameters.ParamByName('LocacaoJovem').Value := 'N';
//                      qryGravaReserva.Parameters.ParamByName('ValorLocacaoJovem').Value := '0';
//                 end;
                 PercentualMaximoTaxaServico := qryUnidadesTaxaServicoReservaWeb.Value;
                 if qryUnidadesTaxaServicoReservaWeb.Value = 0 then
                      qryGravaReservaTaxaServico.Value := 0
                 else
                      qryGravaReservaTaxaServico.Value := PercentualMaximoTaxaServico;
                 qryGravaReservaPercDescontoTempo.Value := qryParametrosUnidadePercentualDescontoTarifaReservaWeb.Value;
                 //realiza as verificações necessárias.
                 if ((Empresa <> '511')or (Empresa <> '629')) and (qryParametrosUnidadeCodigoMunicipio.Value <> CodigoMunicipioRetirada) then
                 begin
                      ReservaOK := false;
                      Msg := 'Veículo não se encontra na unidade de retirada.';
                 end
                 else
                      if ((Empresa <> '511')or (Empresa <> '629')) and qryValidaVeiculosDisponiveis.IsEmpty then
                      begin
                           ReservaOK := false;
                           Msg := 'Não foi localizado nenhum veículo do grupo selecionado para está data hora de início da locação.';
                      end
                      else
                           if not ValidaHorarioFuncionamento(DataInicio, HoraInicio, CodigoEmpresa, CodigoUnidade) then
                           begin
                                ReservaOK := false;
                                Msg := 'Data hora início fora do horário de funcionamento.';
                           end
                           else
                                if not ValidaHorarioFuncionamento(DataTermino, HoraTermino, CodigoEmpresa, CodigoUnidade) then
                                begin
                                     ReservaOK := false;
                                     Msg := 'Data hora termino fora do horário de funcionamento.';
                                end
                                else
                                     if not ValidaHorasAntecedenciaAbertura(DataInicio, HoraInicio, CodigoEmpresa, CodigoUnidade) then
                                     begin
                                          ReservaOK := false;
                                          Msg := 'Horas de antecedência abertura invalida.';
                                     end
                                     else
                                          if not ValidaLimiteAprovacao(DataTermino, DataInicio, CodigoUnidade, CodigoEmpresa) then
                                          begin
                                               ReservaOK := false;
                                               Msg := 'Limite de aprovacao invalido.';
                                          end
                                          else
                                               if not ValidaFeriado(DataInicio, DataTermino, CodigoEmpresa, CodigoUnidade) then
                                               begin
                                                    ReservaOK := false;
                                                    Msg := 'Data início ou termino no feriado'
                                               end
                                               else
                                                    ReservaOK := true;
                 if ReservaOK then
                 begin
                      if (Empresa = '511') or (Empresa = '629')then
                      begin
                           qryGravaReservaReservaWeb.Value := 'N';
                           qryGravaReservaDataHoraLiberacao.Value := 0;
                      end
                      else
                      begin
                           qryGravaReservaReservaWeb.Value := 'S';
                           qryGravaReservaDataHoraLiberacao.Value := Now;
                      end;
                      qryGravaReservaSolicitacao.Value := 'N';
                      qryGravaReservaInseridoEm.Value := Now;
                      qryGravaReservaInseridoPor.Value := 99;
                      qryGravaReservaOrigem.Value := Origem;
                      //Atualiza o proximo codigo da reserva
                      if qryProximoCodigoReserva.Active then
                            qryProximoCodigoReserva.Close;
                      qryProximoCodigoReserva.Open;
                      qryGravaReservaCodigoReserva.Value := qryProximoCodigoReservaProximoCodigo.Value;
                      qryProximoCodigoReserva.Edit;
                      qryProximoCodigoReservaProximoCodigo.Value := qryProximoCodigoReservaProximoCodigo.Value + 1;
                      qryProximoCodigoReserva.Post;
                      try
                           qryGravaReserva.Post;
                           //Captura o codigo da reserva inserida
                           if qryReserva.Active then
                                qryReserva.Close;
                           qryReserva.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                           qryReserva.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                           qryReserva.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                           qryReserva.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                           qryReserva.Parameters.ParamByName('CodigoCliente').DataType := ftInteger;
                           qryReserva.Parameters.ParamByName('CodigoCliente').Value := CodigoCliente;
                           qryReserva.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                           qryReserva.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
                           qryReserva.Parameters.ParamByName('CodigoGrupoVeiculos').DataType := ftInteger;
                           qryReserva.Parameters.ParamByName('CodigoGrupoVeiculos').Value := CodigoGrupo;
                           qryReserva.Parameters.ParamByName('DataInicio').DataType := ftDateTime;
                           qryReserva.Parameters.ParamByName('DataInicio').Value := DataInicio;
                           qryReserva.Parameters.ParamByName('DataTermino').DataType := ftDateTime;
                           qryReserva.Parameters.ParamByName('DataTermino').Value := DataTermino;
                           qryReserva.Open;
                           if not qryReserva.IsEmpty then
                           begin
                                CodigoReserva := qryReservaCodigoReserva.Value;
                                //Grava a taxa de entrega e devolucao caso exista
                                InserirTaxaEntregaDevolucao(CodigoReserva, CodigoMunicipioRetirada, CodigoMunicipioDevolucao);
//                                          {Grava os itens da protecao}
//                                          for I := 0 to RequisicaoItensProtecao.Size -1 do
//                                          begin
//                                               ItemProtecao := RequisicaoItensProtecao.Get(I) AS TJSONObject;
//                                               if Assigned(ItemProtecao.GetValue('CodigoItemProtecao')) then
//                                               begin
//                                                    if qryGravarReservaItemProtecao.Active then
//                                                         qryGravarReservaItemProtecao.Close;
//                                                    qryGravarReservaItemProtecao.Parameters.ParamByName('CodigoItem').DataType := ftInteger;
//                                                    qryGravarReservaItemProtecao.Parameters.ParamByName('CodigoItem').Value := I + 1;
//                                                    qryGravarReservaItemProtecao.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
//                                                    qryGravarReservaItemProtecao.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
//                                                    qryGravarReservaItemProtecao.Parameters.ParamByName('CodigoItemProtecao').DataType := ftInteger;
//                                                    qryGravarReservaItemProtecao.Parameters.ParamByName('CodigoItemProtecao').Value := StrToIntDef(ItemProtecao.GetValue('CodigoItemProtecao').Value,0);
//                                                    qryGravarReservaItemProtecao.ExecSQL;
//                                               end;
//                                          end;
                                {Grava os servicos adicionais}
                                ServicoAdicional := TJSONObject.Create;
                                for I := 0 to RequisicaoServicoAdicional.Size -1 do
                                begin
//                                     ServicoAdicional := RequisicaoServicoAdicional.Get(I) AS TJSONObject;
//                                     if Assigned(ServicoAdicional.GetValue('CodigoServicoAdicional')) then
//                                     begin
                                          {Descobre o valor servico adicional informado}
                                          if qryServicoAdicionais.Active then
                                               qryServicoAdicionais.Close;
                                          qryServicoAdicionais.Parameters.ParamByName('CodigoServicoAdicional').DataType := ftInteger;
                                          qryServicoAdicionais.Parameters.ParamByName('CodigoServicoAdicional').Value := StrToIntDef(RequisicaoServicoAdicional.Get(I).Value, 0);
                                          qryServicoAdicionais.Open;
                                          if not qryServicoAdicionais.IsEmpty then
                                          begin
                                               {Se encontrou o servico adicional grava o mesmo na tabela de reservas servicos adicionais}
                                               if qryGravaReservaServicoAdicional.Active then
                                                    qryGravaReservaServicoAdicional.Close;
                                               qryGravaReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
                                               qryGravaReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
                                               qryGravaReservaServicoAdicional.Parameters.ParamByName('CodigoServicoAdicional').DataType := ftInteger;
                                               qryGravaReservaServicoAdicional.Parameters.ParamByName('CodigoServicoAdicional').Value := qryServicoAdicionaisCodigoServicoAdicional.Value;
                                               qryGravaReservaServicoAdicional.Parameters.ParamByName('Valor').DataType := ftString;
                                               qryGravaReservaServicoAdicional.Parameters.ParamByName('Valor').Value := StringReplace(qryServicoAdicionaisValor.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                                               qryGravaReservaServicoAdicional.ExecSQL;
                                          end;
//                                     end;
                                end;
                                {Envia o email da reserva}
                                try
                                     //EnviarEmail(CodigoReserva, Empresa);
                                     if not ServidorEmail(CodigoReserva, Empresa) then
                                     begin
                                          Msg := 'Reserva efetuada, mas não foi possível enviar e-mail da reserva.';
                                          Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
                                     end;
                                except
                                     // Salvar no banco
                                end;
                           end;
                      except
                      end;
                 end
                 else
                 begin
                      CodigoReserva := 0;
                      if qryGravaReserva.State in [dsInsert,dsEdit] then
                           qryGravaReserva.Cancel;
                 end;
                 if ReservaOK then
                 begin
                      Objeto.AddPair('CodigoReserva', TJSONNumber.Create(CodigoReserva));
                      if qryGravaReservaReservaWeb.Value = 'S' then
                           Objeto.AddPair('IsReserva', TJSONTrue.Create)
                      else
                           Objeto.AddPair('IsReserva', TJSONFalse.Create);
                      Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
                 end
                 else
                 begin
                      //Objeto.AddPair('CodigoReserva', TJSONNumber.Create(CodigoReserva));
                      if Length(Msg)= 0 then
                           Msg := 'Não foi possível efetuar a reserva entre em contato com a central de reservas.';
                      Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
                 end;
            end;
       end;
       //Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
  finally
       if qryProximoCodigoReserva.Active then
            qryProximoCodigoReserva.Close;
       if qryCliente.Active then
            qryCliente.Close;
       if qryParametrosUnidade.Active then
            qryParametrosUnidade.Close;
       if qryProtecao.Active then
            qryProtecao.Close;
       if qryParametrosEmpresa.Active then
            qryParametrosEmpresa.Close;
       if qryValidaVeiculosDisponiveis.Active then
            qryValidaVeiculosDisponiveis.Close;
       if qryUnidades.Active then
            qryUnidades.Close;
       if qryServicoAdicionais.Active then
            qryServicoAdicionais.Close;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
       LiberarMemoria;
  end;
end;

function TLocavia.ValidaFeriado(DataInicio, DataTermino: TDateTime;
  CodigoEmpresa, CodigoUnidade: Integer): Boolean;
begin
  try
       if qryFeriados.Active then
            qryFeriados.Close;
       qryFeriados.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
       qryFeriados.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
       qryFeriados.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
       qryFeriados.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
       qryFeriados.Parameters.ParamByName('DataInicio').DataType := ftDateTime;
       qryFeriados.Parameters.ParamByName('DataInicio').Value := DataInicio;
       qryFeriados.Parameters.ParamByName('DataTermino').DataType := ftDateTime;
       qryFeriados.Parameters.ParamByName('DataTermino').Value := DataTermino;
       qryFeriados.Open;
       if qryFeriados.IsEmpty then
            Result := true
       else
            Result := false;
  finally
       if qryFeriados.Active then
            qryFeriados.Close;
  end;
end;

function TLocavia.ValidaHorarioFuncionamento(Data: TDateTime; Hora: String;
  CodigoEmpresa, CodigoUnidade: Integer): Boolean;
var
  DiaDaSemana: Integer;
  Mensagem,
  HoraInicioSegSex,
  HoraTerminoSegSex,
  HoraInicioSab,
  HoraTerminoSab,
  HoraInicioDom,
  HoraTerminoDom: String;
  Achou: Boolean;
begin
  try
       if qryParametrosUnidade.Active then
            qryParametrosUnidade.Close;
       qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
       qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
       qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
       qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
       qryParametrosUnidade.Open;
       if not qryParametrosUnidade.IsEmpty then
       begin
            HoraInicioSegSex := Copy(qryParametrosUnidadeHoraInicioFuncionamentoSegSex.Value,1,2) + ':' + Copy(qryParametrosUnidadeHoraInicioFuncionamentoSegSex.Value,3,2);
            HoraTerminoSegSex := Copy(qryParametrosUnidadeHoraTerminoFuncionamentoSegSex.Value,1,2) + ':' + Copy(qryParametrosUnidadeHoraTerminoFuncionamentoSegSex.Value,3,2);
            HoraInicioSab := Copy(qryParametrosUnidadeHoraInicioFuncionamentoSabado.Value,1,2) + ':' + Copy(qryParametrosUnidadeHoraInicioFuncionamentoSabado.Value,3,2);
            HoraTerminoSab := Copy(qryParametrosUnidadeHoraTerminoFuncionamentoSabado.Value,1,2) + ':' + Copy(qryParametrosUnidadeHoraTerminoFuncionamentoSabado.Value,3,2);
            HoraInicioDom := Copy(qryParametrosUnidadeHoraInicioFuncionamentoDomingo.Value,1,2) + ':' + Copy(qryParametrosUnidadeHoraInicioFuncionamentoDomingo.Value,3,2);
            HoraTerminoDom := Copy(qryParametrosUnidadeHoraTerminoFuncionamentoDomingo.Value,1,2) + ':' + Copy(qryParametrosUnidadeHoraTerminoFuncionamentoDomingo.Value,3,2);
            DiaDaSemana := DayOfWeek(Data);
            Achou := false;
            case DiaDaSemana of
                 1://Domingo
                 begin
                      if (HoraInicioDom <> ':') and (HoraTerminoDom <> ':') then
                           if (StrToTime(HoraInicioDom) > StrToTime(Hora+':00')) or ((StrToTime(HoraTerminoDom) < StrToTime(Hora+':00')) or
                              (StrToTime(HoraInicioDom) > StrToTime(Hora+':00'))) then
                                Achou := true;
                 end;
                 2,3,4,5,6://Segunda a Sexta
                 begin
                      if (HoraInicioSegSex <> ':') and (HoraTerminoSegSex <> ':') then
                           if (StrToTime(HoraInicioSegSex) > StrToTime(Hora+':00')) or ((StrToTime(HoraTerminoSegSex) < StrToTime(Hora+':00')) or
                              (StrToTime(HoraInicioSegSex) > StrToTime(Hora+':00'))) then
                                Achou := true;
                 end;
                 7://Sabado
                 begin
                      if (HoraInicioSab <> ':') and (HoraTerminoSab <> ':') then
                           if (StrToTime(HoraInicioSab) > StrToTime(Hora+':00')) or ((StrToTime(HoraTerminoSab) < StrToTime(Hora+':00')) or
                              (StrToTime(HoraInicioSab) > StrToTime(Hora+':00'))) then
                                Achou := true;
                 end;
            end;
            if Achou then
                 Result := false
            else
                 Result := true;
       end
       else
            Result := true;
  finally
       if qryParametrosUnidade.Active then
            qryParametrosUnidade.Close;
  end;
end;

function TLocavia.ValidaHorasAntecedenciaAbertura(DataInicio: TDateTime;
  HoraInicio: String; CodigoEmpresa, CodigoUnidadeRetirada: Integer): Boolean;
var
  Horario: TDateTime;
  DataHoraInicio: String;
begin
  try
       if qryParametrosUnidade.Active then
            qryParametrosUnidade.Close;
       qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
       qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
       qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
       qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidadeRetirada;
       qryParametrosUnidade.Open;
       if qryParametrosUnidadeHorasAntecedenciaAberturaReservaWeb.Value > 0 then
       begin
            Horario := Time;
            if qryParametrosEmpresa.Active then
                 qryParametrosEmpresa.Close;
            qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
            qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
            qryParametrosEmpresa.Open;
            if qryParametrosUnidadeHorasAjusteFusoHorario.Value < 0 then
                 Horario := Horario - StrToTime(FormatFloat('00',qryParametrosUnidadeHorasAjusteFusoHorario.Value * -1)+':00:00')
            else
                  Horario := Horario + StrToTime(FormatFloat('00',qryParametrosUnidadeHorasAjusteFusoHorario.Value)+':00:00');
            DataHoraInicio := DateTimeToStr(DataInicio + StrToTime(HoraInicio+':00'));
            if StrToDateTime(DataHoraInicio) < (IncHour(Now, qryParametrosUnidadeHorasAntecedenciaAberturaReservaWeb.Value)) then
                 Result := false
            else
                 Result := true;
       end
       else
            Result := true;
  finally
       if qryParametrosUnidade.Active then
            qryParametrosUnidade.Close;
       if qryParametrosEmpresa.Active then
            qryParametrosEmpresa.Close;
  end;
end;

function TLocavia.ValidaLimiteAprovacao(DataTermino, DataInicio: TDateTime;
  CodigoUnidadeRetirada, CodigoEmpresa: Integer): Boolean;
begin
  try
       if qryParametrosUnidade.Active then
            qryParametrosUnidade.Close;
       qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
       qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
       qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
       qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidadeRetirada;
       qryParametrosUnidade.Open;
       if qryParametrosUnidadeLimiteDiasAprovacaoWeb.Value > 0 then
       begin
            if qryParametrosUnidadeLimiteDiasAprovacaoWeb.Value < (DataTermino - DataInicio) then
                 Result := false
            else
                 Result := true;
       end
       else
            Result := true;
  finally
       if qryParametrosUnidade.Active then
            qryParametrosUnidade.Close;
  end;
end;

function TLocavia.UpdateLogin: TStringStream;
var
  Erros : TJSONArray;
  Objeto,
  Resultado: TJSONObject;
  DadosRequisicao: TWebModule;
  Requisicao: TJSONObject;
  Resposta: String;
  Login,
  Senha: String;
begin
  try
       Erros := TJSONArray.Create;
       Objeto := TJSONObject.Create;
       Resultado := TJSONObject.Create;
       Login := '';
       Senha := '';
       if ConectaBanco then
       begin
            DadosRequisicao := GetDataSnapWebModule;
            Resposta := DadosRequisicao.Request.Content;
            Requisicao:= TJSONObject.ParseJSONValue(TEncoding.Default.GetBytes(Resposta),0) as TJSONObject;
            if Requisicao.Size > 0 then
            begin
                 {captura os dados de login e senha}
                 Login := Requisicao.GetValue('login').Value;
                 Senha := Requisicao.GetValue('senha').Value;
            end;
            if (Login = '') then
            begin
                 Objeto := TJSONObject.Create;
                 Objeto.AddPair('Erro', TJSONString.Create('O parametro login é obrigatório.'));
                 Erros.AddElement(Objeto);
            end;
            if (Senha = '') then
            begin
                 Objeto := TJSONObject.Create;
                 Objeto.AddPair('Erro', TJSONString.Create('O parametro senha é obrigatório.'));
                 Erros.AddElement(Objeto);
            end;
            if (Login <> '') and (Senha <> '') then
            begin
                 if Login <> 'reservasinfo' then
                 begin
                      Objeto := TJSONObject.Create;
                      Objeto.AddPair('Erro', TJSONString.Create('O parametro login inválidos.'));
                      Erros.AddElement(Objeto);
                 end
                 else
                 if Senha <> 'dmainfo2017' then
                 begin
                      Objeto := TJSONObject.Create;
                      Objeto.AddPair('Erro', TJSONString.Create('O parametro senha inválidos.'));
                      Erros.AddElement(Objeto);
                 end
                 else
                 begin
                      Resultado.AddPair('token', TJSONString.Create(GerarToken));
                      Result := RetornoPadraoObjeto(Erros, Resultado);
                 end;
            end;
       end
       else
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Falha ao conectar ao banco de dados.'));
            Erros.AddElement(Objeto);
       end;
  finally
       adcControle.Connected := false;
       adcBancoDados.Connected := false;
  end;
end;

function TLocavia.Clientes(Tipo,CPFPassaporte: String): TStringStream;
var
  Objeto,
  Objeto2: TJSONObject;
  Erros,
  Retorno: TJSONArray;
  DadosRequisicao: TWebModule;
  I: Integer;
  CodigoBD,
  Msg: String;
begin
  try
       Erros := TJSONArray.Create;
       Retorno := TJSONArray.Create;
       Objeto := TJSONObject.Create;
       Objeto2 := TJSONObject.Create;
       DadosRequisicao := GetDataSnapWebModule;
       Msg := '';
       CodigoBD := DadosRequisicao.Request.GetFieldByName('empresa');
       if Length(CodigoBD) = 14 then
       begin
            CodigoBD := ObterCodigoIdentificacao(CodigoBD);
            if (Length(CodigoBD) =  0) or (CodigoBD = 'erro') then
                 Msg := 'Falha ao conectar ao banco de dados.';
       end;
       if ConectaBanco(CodigoBD) then
       begin
            if CPFPassaporte = '' then
                 Msg := 'CPF ou Passaporte é obrigatório.'
            else
            if (LowerCase(Tipo) = 'cpf') and not CPFValido(CPFPassaporte) then
                 Msg := 'CPF não é valido.'
            else
            begin
                 if qryClienteCadastrado.Active then
                      qryClienteCadastrado.Close;
                 qryClienteCadastrado.SQL[9] := 'AND (Clientes.CPF = ' + #39 + CPFPassaporte + #39 +')';
                 qryClienteCadastrado.Open;
                 if qryClienteCadastrado.IsEmpty then
                 begin
                      if qryClienteCadastrado.Active then
                           qryClienteCadastrado.Close;
                      qryClienteCadastrado.SQL[9] := 'AND (Clientes.Passaporte = ' + #39 + CPFPassaporte + #39 +')';
                      qryClienteCadastrado.Open;
                 end;
                 while not qryClienteCadastrado.Eof do
                 begin
                      for I := 0 to qryClienteCadastrado.FieldCount -1 do
                      begin
                           if (qryClienteCadastrado.Fields[I].FieldName = 'Cidade') or (qryClienteCadastrado.Fields[I].FieldName = 'Estado') or
                              (qryClienteCadastrado.Fields[I].FieldName = 'CodigoMunicipio') then
                                Objeto2.AddPair(qryClienteCadastrado.Fields[I].FieldName, ConverteJSON(qryClienteCadastrado.Fields[I]))
                           else
                                Objeto.AddPair(qryClienteCadastrado.Fields[I].FieldName, ConverteJSON(qryClienteCadastrado.Fields[I]));
                      end;
                      Objeto.AddPair('Municipio',Objeto2);
                      qryClienteCadastrado.Next;
                 end;
            end;
       end
       else
            Msg := 'Falha ao conectar ao banco de dados.';
       if Objeto.Size > 0 then
            Retorno.AddElement(Objeto);
       Result := RetornoPadraoObjeto(Erros, Objeto, Msg);
  finally
       qryClienteCadastrado.Close;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
       LiberarMemoria;
  end;
end;

end.
