unit UServerMetodos;

interface

uses System.SysUtils, System.Classes, DBXJSON, DateUtils,
  Datasnap.DSServer, Datasnap.DSAuth, IWSystem, IniFiles, Data.DB,
  Data.Win.ADODB, QueryPlus, Variants, IdMessage, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, Vcl.Forms,
  IdAttachmentFile, IdSSLOpenSSL, IdIOHandler, IdIOHandlerSocket, IdText;

type
{$METHODINFO ON}
  TServerMetodos = class(TDataModule)
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
    qryCidadesDescricaoUnidade: TWideStringField;
    qryCidadesCodigoEmpresa: TIntegerField;
    qryCidadesCodigoUnidade: TIntegerField;
    qryCidadesCNPJ: TWideStringField;
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
    qryUnidadesPercTaxaAdministrativa: TFloatField;
    qryUnidadesMunicipioUnidade: TWideStringField;
    qryGrupoVeiculos: TQueryPlus;
    qryGrupoVeiculosLetraDescricao: TWideStringField;
    qryGrupoVeiculosDescricao: TWideStringField;
    qryGrupoVeiculosCodigoGrupo: TIntegerField;
    qryGrupoVeiculosLetra: TWideStringField;
    qryListaServicoAdicionais: TQueryPlus;
    qryListaServicoAdicionaisCodigoServicoAdicional: TIntegerField;
    qryListaServicoAdicionaisDescricao: TStringField;
    qryListaServicoAdicionaisValor: TBCDField;
    qryListaServicoAdicionaisCalculoPorDiarias: TStringField;
    qryListaServicoAdicionaisPermanente: TStringField;
    qryMenorTarifaPorGrupo: TQueryPlus;
    qryMenorTarifaPorGrupoValorMinimo: TFloatField;
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
    qryGravaReservaServicoAdicional: TQueryPlus;
    qryDescricaoTarifa: TQueryPlus;
    qryDescricaoTarifaDescricaoTarifa: TWideStringField;
    qryDescricaoTarifaCodigoTarifaVeiculo: TIntegerField;
    qryListaTarifaVeiculo: TQueryPlus;
    qryListaTarifaVeiculoCodigoTarifaVeiculo: TIntegerField;
    qryListaTarifaVeiculoDescricaoTarifa: TWideStringField;
    qryListaTarifaVeiculoPeriodoTarifa: TSmallintField;
    qryListaTarifaVeiculoDescricaoPeriodoTarifa: TWideStringField;
    qryListaTarifaVeiculoValorPeriodoVeiculo: TBCDField;
    qryListaTarifaVeiculoValorPeriodoSegAd: TBCDField;
    qryListaTarifaVeiculoKmLivre: TWideStringField;
    qryListaTarifaVeiculoValorKmRodado: TBCDField;
    qryListaTarifaVeiculoFranquiaKmRodado: TIntegerField;
    qryListaTarifaVeiculoMensal: TWideStringField;
    qryListaTarifaVeiculoTarifaNacional: TStringField;
    qryListaTarifaVeiculoValorDesconto: TFloatField;
    qryListaTarifaVeiculoValorTarifa: TFloatField;
    qryListaTarifaVeiculoReservaWebPadrao: TStringField;
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
    qryServicoAdicionais: TQueryPlus;
    qryServicoAdicionaisCodigoServicoAdicional: TIntegerField;
    qryServicoAdicionaisDescricao: TStringField;
    qryServicoAdicionaisValor: TBCDField;
    qryServicoAdicionaisCalculoPorDiarias: TStringField;
    qryServicoAdicionaisPermanente: TStringField;
    qryReservaServicoAdicional: TQueryPlus;
    qryReservaServicoAdicionalCodigoReserva: TIntegerField;
    qryReservaServicoAdicionalCodigoServicoAdicional: TIntegerField;
    qryReservaServicoAdicionalValor: TBCDField;
    qryReservaServicoAdicionalObservacao: TWideMemoField;
    qryMunicipios: TQueryPlus;
    qryMunicipiosCodigoMunicipio: TIntegerField;
    qryMunicipiosDescricao: TWideStringField;
    qryMunicipiosEstado: TWideStringField;
    qryMunicipiosCodigoRegiao: TIntegerField;
    qryMunicipiosInseridoPor: TIntegerField;
    qryMunicipiosInseridoEm: TDateTimeField;
    qryMunicipiosModificadoPor: TIntegerField;
    qryMunicipiosModificadoEm: TDateTimeField;
    qryMunicipiosCodigoIBGE: TIntegerField;
    qryMunicipiosCodigoMunicipioDetran: TIntegerField;
    qryMunicipiosCodigoMunicipioBenner: TIntegerField;
    qryGravaCliente: TQueryPlus;
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
    qryDescricaoTarifaProtecao: TQueryPlus;
    qryDescricaoTarifaProtecaoDescricaoTarifa: TWideStringField;
    qryDescricaoTarifaProtecaoValorPeriodoVeiculo: TBCDField;
    qryDescricaoTarifaProtecaoValorDesconto: TFloatField;
    qryDescricaoTarifaProtecaoValorComDescontoDiario: TFloatField;
    qryDescricaoTarifaProtecaoValorKmRodado: TBCDField;
    qryDescricaoTarifaProtecaoID: TIntegerField;
    qryDescricaoTarifaProtecaoDescricaoPeriodoTarifa: TWideStringField;
    qryDescricaoTarifaProtecaoValorPeriodoSegAd: TBCDField;
    IdSMTP: TIdSMTP;
    idmEnviarEmail: TIdMessage;
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
    qryListarReservaServicoAdicional: TQueryPlus;
    qryListarReservaServicoAdicionalDescricao: TStringField;
    qryListarReservaServicoAdicionalValor: TBCDField;
    qryListarReservaServicoAdicionalCalculoPorDiarias: TStringField;
    qryInformacoesGrupoVeiculo: TQueryPlus;
    qryInformacoesGrupoVeiculoDescricao: TWideStringField;
    qryInformacoesGrupoVeiculoCodigoGrupo: TIntegerField;
    qryInformacoesGrupoVeiculoLetra: TWideStringField;
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
    qryListaServicoAdicionalReserva: TQueryPlus;
    qryListaServicoAdicionalReservaDescricao: TStringField;
    qryListaServicoAdicionalReservaValor: TBCDField;
    qryListaServicoAdicionalReservaCodigoReserva: TIntegerField;
    qryListaServicoAdicionalReservaCodigoServicoAdicional: TIntegerField;
    qryListaServicoAdicionalReservaCalculoPorDiarias: TStringField;
    qryGravaReserva: TQueryPlus;
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
    qryValidaVeiculosDisponiveis: TQueryPlus;
    qryValidaVeiculosDisponiveisCodigoMVA: TIntegerField;
    qryValidaVeiculosDisponiveisPlaca: TWideStringField;
    qryProximoCodigoReserva: TQueryPlus;
    qryProximoCodigoReservaNomeTabela: TWideStringField;
    qryProximoCodigoReservaProximoCodigo: TIntegerField;
    qryReserva: TQueryPlus;
    qryReservaCodigoReserva: TIntegerField;
    qryAlterarReserva: TQueryPlus;
  private
    { Private declarations }
    PCodigoEmpresa,
    PCodigoUnidade,
    PCodigoGrupo: Integer;
    PPeriodo: SmallInt;
    PDescricaoTarifa: string;
    //procedure para conectar ao banco de dados
    function ConectaBanco:Boolean;
    //function para validar Limite Aprovacao
    function ValidaLimiteAprovacao(DataTermino, DataInicio: TDateTime; CodigoUnidadeRetirada, CodigoEmpresa: Integer): Boolean;
    //function para validar horas atencedencia abertura
    function ValidaHorasAntecedenciaAbertura(DataInicio: TDateTime; HoraInicio: String; CodigoEmpresa, CodigoUnidadeRetirada: Integer): Boolean;
    //function para validar horario de funcionamento
    function ValidaHorarioFuncionamento(Data: TDateTime; Hora: String; CodigoEmpresa, CodigoUnidade: Integer): Boolean;
    //procedure para inserir a taxa de entrega e devolucao
    procedure InserirTaxaEntregaDevolucao(CodigoReserva: Integer; CodigoMunicipioRetirada, CodigoMunicipioDevolucao: Integer);
  public
    { Public declarations }
    //Fun��o para retornar a cidade de retirada do ve�culo
    function Cidades: TStringStream;
    //Fun��o para retornar as informa��es das Unidades
    function Empresas(CodigoCidade: Integer): TStringStream;
     //function para retornar o grupo de veiculos
    function GrupoVeiculos(CodigoEmpresa: Integer=0; Letra: String=''): TStringStream;
    //function para retornar os servicos adicionais
    function ServicosAdicionais(CodigoEmpresa: Integer): TStringStream;
    //Fun��o para retornar o valor minimo do grupo
    function ValorMinimoGrupo(CodigoEmpresa, CodigoUnidade, CodigoGrupo, Periodo: Integer; DataInicio, DataTermino: TDateTime): TStringStream;
    //function para retornar as tarifas
    function DescricaoTarifa(CodigoEmpresa, CodigoUnidade, CodigoGrupo, Periodo: Integer; DataInicio, DataTermino: TDateTime): TStringStream;
    //function para retornar os dados de uma tarifa
    function Tarifas(CodigoTarifaVeiculo: Integer): TStringStream;
    //function para retornar as protecoes
    function Protecoes: TStringStream;
    //function para verificar se o cliente est� cadastrado
    function VerificaClienteCadastrado(CPFPassaporte: String): TStringStream;
    //function para gravar servico adicional da reserva
    function GravarServicoAdicionalReserva(CodigoReserva: Integer = 0; CodigoServicoAdicional: Integer= 0): TStringStream;
    //function para gravar Cliente
    function GravarCliente(NomeCliente: String = ''; CPF: String = ''; Email: String = ''; Telefone: String = ''; CodigoEmpresa: Integer = 0; CodigoUnidade: Integer = 0; Passaporte: String = '';
                          Celular: String = ''; Sexo: String = ''; Identidade: String = ''; Logradouro: String = ''; Bairro: String = ''; Numero: Integer = 0; Complemento: String = ''; Cep: String = '';
                          Estado: String = ''; Cidade: String = ''): TStringStream;
    //function para gravar de uma reserva
    function Reserva(CodigoEmpresa: Integer = 0; CodigoUnidade: Integer = 0; CodigoCliente: Integer = 0; CodigoGrupo: Integer = 0; CodigoProtecao: Integer = 0; CodigoTarifa: Integer = 0;
                     DataInicio: TDateTime = 0; DataTermino: TDateTime = 0; HoraInicio: String = ''; HoraTermino: String = ''; CodigoMunicipioRetirada: Integer = 0;
                     CodigoMunicipioDevolucao: Integer = 0; CodigoRegistro: Integer = 0; Tipo: String =''): TStringStream;
    // function para retornar a tarifa juntamente com a prote��o
    function TarifaProtecao(CodigoEmpresa, CodigoUnidade, CodigoGrupo, Periodo: Integer; DataInicio, DataTermino: TDateTime): TStringStream;
    //procedure para enviar email
    function EnviarEmail(CodigoReserva: Integer): TStringStream;
    //function para retornar os servicos adicionais de uma reserva
    function ServicosAdicionaisReserva(CodigoReserva: Integer): TStringStream;
    //Funcoes usando post
    function updateCidades: TStringStream;
    function updateEmpresas(CodigoCidade: Integer): TStringStream;
    function updateGrupoVeiculos(CodigoEmpresa: Integer=0; Letra: String=''): TStringStream;
    function updateServicosAdicionais(CodigoEmpresa: Integer): TStringStream;
    function updateDescricaoTarifa(CodigoEmpresa, CodigoUnidade, CodigoGrupo, Periodo: Integer; DataInicio, DataTermino: TDateTime): TStringStream;
    function updateTarifas(CodigoTarifaVeiculo: Integer): TStringStream;
    function updateProtecoes: TStringStream;
    function updateVerificaClienteCadastrado(CPFPassaporte: String): TStringStream;
    function updateGravarServicoAdicionalReserva(CodigoReserva: Integer = 0; CodigoServicoAdicional: Integer= 0): TStringStream;
    function updateGravarCliente(NomeCliente: String = ''; CPF: String = ''; Email: String = ''; Telefone: String = ''; CodigoEmpresa: Integer = 0; CodigoUnidade: Integer = 0; Passaporte: String = '';
                          Celular: String = ''; Sexo: String = ''; Identidade: String = ''; Logradouro: String = ''; Bairro: String = ''; Numero: Integer = 0; Complemento: String = ''; Cep: String = '';
                          Estado: String = ''; Cidade: String = ''): TStringStream;
    function updateReserva(CodigoEmpresa: Integer = 0; CodigoUnidade: Integer = 0; CodigoCliente: Integer = 0; CodigoGrupo: Integer = 0; CodigoProtecao: Integer = 0; CodigoTarifa: Integer = 0;
                     DataInicio: TDateTime = 0; DataTermino: TDateTime = 0; HoraInicio: String = ''; HoraTermino: String = ''; CodigoMunicipioRetirada: Integer = 0;
                     CodigoMunicipioDevolucao: Integer = 0; CodigoRegistro: Integer = 0; Tipo: String =''): TStringStream;
    function updateTarifaProtecao(CodigoEmpresa, CodigoUnidade, CodigoGrupo, Periodo: Integer; DataInicio, DataTermino: TDateTime): TStringStream;
    function updateEnviarEmail(CodigoReserva: Integer): TStringStream;
    function updateServicosAdicionaisReserva(CodigoReserva: Integer): TStringStream;
    function updateValorMinimoGrupo(CodigoEmpresa, CodigoUnidade, CodigoGrupo, Periodo: Integer; DataInicio, DataTermino: TDateTime): TStringStream;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils, URotinasSistema;

function TServerMetodos.Cidades: TStringStream;
var
  Objeto: TJSONObject;
  Cidades: TJSONArray;
  I: Integer;
  GerouObjeto: Boolean;
begin
  try
       GerouObjeto := false;
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            Cidades := TJSONArray.Create;
            GerouObjeto:= true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            Cidades.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Cidades.ToString));
       end
       else
       begin
            if qryCidades.Active then
                 qryCidades.Close;
            qryCidades.Open;
            Cidades := TJSONArray.Create;
            while not qryCidades.Eof do
            begin
                 Objeto := TJSONObject.Create;
                 GerouObjeto := true;
                 for I := 0 to qryCidades.FieldCount -1 do
                      Objeto.AddPair(qryCidades.Fields[I].FieldName, TJSONString.Create(qryCidades.Fields[I].AsString));
                 Cidades.AddElement(Objeto);
                 qryCidades.Next;
            end;
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Cidades.ToString));
       end;
  finally
       qryCidades.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.ConectaBanco: Boolean;
var
  ArqIni: TIniFile;
  TipoConexaoBD,
  TipoAutenticacaoBD,
  ControlePas,
  DataSource,
  UserID,
  Catalog,
  Provider,
  DiretorioArquivo: String;
begin
  try
       {L� arquivos de Inicializa��o}
       Result := true;
       DiretorioArquivo := gsAppPath + gsAppName + '.ini';
       ArqIni := TIniFile.Create(DiretorioArquivo);
       TipoConexaoBD := ArqIni.ReadString('Op��es','TipoConexao','');
       TipoAutenticacaoBD := ArqIni.ReadString('Op��es','TipoAutenticacao','');
       ControlePas := Descriptografa(ArqIni.ReadString('Op��es','Password',''));
       DataSource := ArqIni.ReadString('Op��es','DataSource','');
       UserID := Descriptografa(ArqIni.ReadString('Op��es','UserID',''));
       Catalog := ArqIni.ReadString('Op��es','Catalog','');
       Provider := ArqIni.ReadString('Op��es','Provider','');
       ArqIni.Free;
       //Conecta no Banco de dados
       if adcBancoDados.Connected then
            adcBancoDados.Close;
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
                  adcControle.ConnectionString := 'Provider=' + Provider + ';Password=' + ControlePas + ';Persist Security Info=True;User ID=' + UserID + ';Initial Catalog=' + Catalog +'_Controle;Data Source=' + DataSource
             else
                   adcControle.ConnectionString := 'Provider=' + Provider + ';Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=' + Catalog + '_Controle;Data Source='+ DataSource;
             adcControle.Open;
       except
            Result := false;
       end;
  except
      Result := false;
  end;
end;

function TServerMetodos.DescricaoTarifa(CodigoEmpresa, CodigoUnidade,
  CodigoGrupo, Periodo: Integer; DataInicio,
  DataTermino: TDateTime): TStringStream;
var
  Objeto: TJSONObject;
  DescricaoTarifa: TJSONArray;
  I: Integer;
  GerouObjeto: Boolean;
begin
  try
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            DescricaoTarifa := TJSONArray.Create;
            GerouObjeto:= true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            DescricaoTarifa.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(DescricaoTarifa.ToString));
       end
       else
       begin
            try
                 //Pega os parametros da unidade selecionada
                 if qryParametrosUnidade.Active then
                      qryParametrosUnidade.Close;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                 qryParametrosUnidade.Open;
                 //abra a query de descricao da tarifa
                 if qryDescricaoTarifa.Active then
                      qryDescricaoTarifa.Close;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa1').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa2').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa4').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa5').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa6').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa1').Value := CodigoEmpresa;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa2').Value := CodigoEmpresa;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa4').Value := CodigoEmpresa;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa5').Value := CodigoEmpresa;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa6').Value := CodigoEmpresa;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade1').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade2').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade4').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade5').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade6').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade1').Value := CodigoUnidade;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade2').Value := CodigoUnidade;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade4').Value := CodigoUnidade;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade5').Value := CodigoUnidade;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade6').Value := CodigoUnidade;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo1').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo2').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo4').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo5').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo6').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo').Value := CodigoGrupo;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo1').Value := CodigoGrupo;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo2').Value := CodigoGrupo;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo4').Value := CodigoGrupo;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo5').Value := CodigoGrupo;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo6').Value := CodigoGrupo;
                 qryDescricaoTarifa.Parameters.ParamByName('Periodo').DataType := ftSmallint;
                 qryDescricaoTarifa.Parameters.ParamByName('Periodo1').DataType := ftSmallint;
                 qryDescricaoTarifa.Parameters.ParamByName('Periodo2').DataType := ftSmallint;
                 qryDescricaoTarifa.Parameters.ParamByName('Periodo4').DataType := ftSmallint;
                 qryDescricaoTarifa.Parameters.ParamByName('Periodo5').DataType := ftSmallint;
                 qryDescricaoTarifa.Parameters.ParamByName('Periodo6').DataType := ftSmallint;
                 if Periodo >= 7 then
                 begin
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo').Value := 7;
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo1').Value := 7;
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo2').Value := 7;
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo4').Value := 7;
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo5').Value := 7;
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo6').Value := 7;
                 end
                 else
                 begin
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo').Value := 1;
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo1').Value := 1;
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo2').Value := 1;
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo4').Value := 1;
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo5').Value := 1;
                      qryDescricaoTarifa.Parameters.ParamByName('Periodo6').Value := 1;
                 end;
                 qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas').DataType := ftBoolean;
                 qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas1').DataType := ftBoolean;
                 qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas2').DataType := ftBoolean;
                 qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas4').DataType := ftBoolean;
                 qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas5').DataType := ftBoolean;
                 qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas6').DataType := ftBoolean;
                 if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
                   begin
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas').Value := true;
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas1').Value := true;
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas2').Value := true;
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas4').Value := true;
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas5').Value := true;
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas6').Value := true;
                   end
                 else
                   begin
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas').Value := false;
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas1').Value := false;
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas2').Value := false;
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas6').Value := false;
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas4').Value := false;
                        qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas5').Value := false;
                   end;
                  // Testar Periodo tarifas
                 qryDescricaoTarifa.Parameters.ParamByName('DataInicioLocacaoE').DataType := ftString;
                 qryDescricaoTarifa.Parameters.ParamByName('DataTerminiLocacaoE').DataType := ftString;
                 qryDescricaoTarifa.Parameters.ParamByName('DataInicioLocacaoI').DataType := ftString;
                 qryDescricaoTarifa.Parameters.ParamByName('DataInicioLocacaoE').Value := DataInicio;
                 qryDescricaoTarifa.Parameters.ParamByName('DataTerminiLocacaoE').Value := DataTermino;
                 qryDescricaoTarifa.Parameters.ParamByName('DataInicioLocacaoI').Value := DataInicio;
                 qryDescricaoTarifa.Parameters.ParamByName('DataInicioLocacaoE5').DataType := ftString;
                 qryDescricaoTarifa.Parameters.ParamByName('DataTerminiLocacaoE5').DataType := ftString;
                 qryDescricaoTarifa.Parameters.ParamByName('DataInicioLocacaoI6').DataType := ftString;
                 qryDescricaoTarifa.Parameters.ParamByName('DataInicioLocacaoE5').Value := DataInicio;
                 qryDescricaoTarifa.Parameters.ParamByName('DataTerminiLocacaoE5').Value := DataTermino;
                 qryDescricaoTarifa.Parameters.ParamByName('DataInicioLocacaoI6').Value := DataTermino;

                 // Tarifa Basica
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa3').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoEmpresa3').Value := CodigoEmpresa;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade3').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoUnidade3').Value := CodigoUnidade;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo3').DataType := ftInteger;
                 qryDescricaoTarifa.Parameters.ParamByName('CodigoGrupo3').Value := CodigoGrupo;

                 qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas3').DataType := ftBoolean;
                 if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
                      qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas3').Value := true
                 else
                      qryDescricaoTarifa.Parameters.ParamByName('TodasTarifas3').Value := false;
                 qryDescricaoTarifa.Open;
                 DescricaoTarifa := TJSONArray.Create;
                 while not qryDescricaoTarifa.Eof do
                 begin
                      Objeto := TJSONObject.Create;
                      GerouObjeto:= true;
                      for I := 0 to qryDescricaoTarifa.FieldCount -1 do
                           Objeto.AddPair(qryDescricaoTarifa.Fields[I].FieldName, TJSONString.Create(qryDescricaoTarifa.Fields[I].AsString));
                      DescricaoTarifa.AddElement(Objeto);
                      qryDescricaoTarifa.Next;
                 end;
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(DescricaoTarifa.ToString));
            except
                 Objeto := TJSONObject.Create;
                 GerouObjeto:= true;
                 DescricaoTarifa := TJSONArray.Create;
                 Objeto.AddPair('Erro','Erro inesperado m�todo Descri��o Tarifas');
                 DescricaoTarifa.AddElement(Objeto);
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(DescricaoTarifa.ToString));
            end;
       end;

  finally
       qryParametrosUnidade.Close;
       qryDescricaoTarifa.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.Empresas(CodigoCidade: Integer): TStringStream;
var
  Objeto: TJSONObject;
  Unidades: TJSONArray;
  I: Integer;
  GerouObjeto: Boolean;
begin
  try
       GerouObjeto:= false;
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            Unidades := TJSONArray.Create;
            GerouObjeto := true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            Unidades.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Unidades.ToString));
       end
       else
       begin
            try
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoCidade;
                 qryUnidades.Open;
                 Unidades := TJSONArray.Create;
                 while not qryUnidades.Eof do
                 begin
                      Objeto := TJSONObject.Create;
                      GerouObjeto := true;
                      for I := 0 to qryUnidades.FieldCount -1 do
                           Objeto.AddPair(qryUnidades.Fields[I].FieldName, TJSONString.Create(qryUnidades.Fields[I].AsString));
                      Unidades.AddElement(Objeto);
                      qryUnidades.Next;
                 end;
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Unidades.ToString));
            except
                 Objeto := TJSONObject.Create;
                 Unidades := TJSONArray.Create;
                 GerouObjeto := true;
                 Objeto.AddPair('Erro','Erro inesperado m�todo Empresas');
                 Unidades.AddElement(Objeto);
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Unidades.ToString));
            end;
       end;
  finally
       qryUnidades.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.EnviarEmail(CodigoReserva: Integer): TStringStream;
var
  IdSMTP : TIdSMTP;
  lMensagem : TIdMessage;
  Attachment: TIdAttachmentFile;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  ValorDiarias,
  ValorHoraExtra,
  ValorKm,
  ValorCobertura,
  ValorTerceiros,
  ValorTaxaServico,
  ValorDesconto,
  TotalAdicional,
  ValorAdicional,
  ValorTarifa,
  ValorTaxaEntregaDevolucao: Currency;
  HorasExtras,
  PercentualTaxaServico : Double;
  Periodo, FranquiaKm: Integer;
  DiariaAMaisHoraExtra :Boolean;
  Situacao: String;
  Objeto: TJSONObject;
  GerouObjeto: Boolean;
begin
  try
       ConectaBanco;
       GerouObjeto := false;
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
                      Situacao := 'Em an�lise'
                 else
                      Situacao := 'Confirmada';
                 if qryParametrosEmail.Active then
                      qryParametrosEmail.Close;
                 qryParametrosEmail.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosEmail.Parameters.ParamByName('CodigoEmpresa').Value := qryConsultaReservaCodigoEmpresa.Value;
                 qryParametrosEmail.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                 qryParametrosEmail.Parameters.ParamByName('CodigoUnidade').Value := qryConsultaReservaCodigoUnidade.Value;
                 qryParametrosEmail.Open;
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
                                Subject := 'Reserva Web';
                                From.Address := qryParametrosEmailEmail.Value;//email de envio
                                //Envia o email para o cliente
                                Recipients.Add.Address := qryConsultaReservaEmail.Value;
                                //Enviar o email para o franqueado
                                if qryUnidadeRetiradaEmail.Value <> '' then
                                     Recipients.Add.Address := qryUnidadeRetiradaEmail.Value;
                                ContentType := 'multipart/mixed';
                                IsEncoded := true;
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
                                     Body.Add('<title>RESERVA DE VE�CULO</title>');
                                     Body.Add('</head>');
                                     Body.Add('<body leftmargin="10">');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr><td><b>');        // http://www.yesrentacar.com.br/logo.jpg
                                     Body.Add('<img border="0" src="' + qryParametrosEmailCaminhoLogoWeb.Value + '" width="140" height="100"></b></td></tr>');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<p align="center"><b>RESERVA DE VE�CULO</b></td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<p>&nbsp;</p>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<blockquote>');
                                     Body.Add('<b>Sua Reserva de N�mero</b> : '+ FormatFloat('000000',qryConsultaReservaCodigoReserva.Value) + ' Situa��o: ' + Situacao + '<br>');
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
                                     Body.Add('<p align="center"><b>RETIRADA / DEVOLU��O</b></td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<blockquote>');
                                     Body.Add('<b>Retira: </b>' + DateToStr(qryConsultaReservaDataInicio.Value) + ' as ' + Copy(qryConsultaReservaHoraInicio.Value,1,2)+ ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2) + '<b><br>');
                                     Body.Add('Cidade: </b>' + qryConsultaReservaLocalEntrega.Value + '<b><br>');
                                     Body.Add('Unidade: </b>' + qryUnidadeRetiradaDescricaoUnidade.Value + '<br>');
                                     Body.Add('<b>Endere�o : </b></b>'+  qryUnidadeRetiradaLogradouro.Value + ', ' +
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
                                     Body.Add('<b>Devolu��o: </b> ' + DateToStr(qryConsultaReservaDataTermino.Value) + ' as ' + Copy(qryConsultaReservaHoraTermino.Value,1,2) + ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2) + '<b><br>');

                                     if qryUnidadeDevolucao.Active then
                                          qryUnidadeDevolucao.Close;
                                     qryUnidadeDevolucao.Parameters.ParamByName('Cidade').DataType := ftString;
                                     qryUnidadeDevolucao.Parameters.ParamByName('Cidade').Value :=  qryConsultaReservaLocalRetornoVeiculo.Value;
                                     qryUnidadeDevolucao.Open;

                                     Body.Add('Cidade: </b>' + qryConsultaReservaLocalDevolucao.Value + '<b><br>');
                                     Body.Add('Unidade: </b>' + qryUnidadeDevolucaoDescricaoUnidade.Value + '<br><b>');
                                     Body.Add('Endere�o : </b>' + qryUnidadeDevolucaoLogradouro.Value + ', ' +
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
                                     Body.Add('<p align="center"><b>VE�CULO / TARIFAS</b></td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<blockquote>');
                                     Body.Add('<b>Grupo do Ve�culo :&nbsp; </b>' + qryInformacoesGrupoVeiculoDescricao.Value + '<b><br>');
                                     Body.Add('Tarifa:&nbsp; </b>' +  qryTarifaDescricaoTarifa.Value + '<b><br>');
                                     Body.Add('Prote��o :&nbsp;');
                                     Body.Add('</b> ' + qryProtecaoNomeProtecao.Value + '<b><br>');
                                     Body.Add('Terceiro :&nbsp;');
                                     if qryConsultaReservaCoberturaTerceiros.Value = 'N' then
                                           Body.Add('</b> N�o </blockquote>')
                                     else
                                           Body.Add('</b> Sim </blockquote>');
                                     Body.Add('</td>');
                                     Body.Add('</tr>');
                                     Body.Add('</table>');
                                     Body.Add('<table border="1" width="100%">');
                                     Body.Add('<tr>');
                                     Body.Add('<td>');
                                     Body.Add('<p align="center"><b>OR�AMENTO</b></td>');
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
                                          if Round((StrToTime(Copy(qryConsultaReservaHoraTermino.Value,1,2) + ':' + Copy(qryConsultaReservaHoraTermino.Value,3,2)) -  StrToTime(Copy(qryConsultaReservaHoraInicio.Value,1,2) + ':' + Copy(qryConsultaReservaHoraInicio.Value,3,2)))* 24 +  0.499999) >= 5 then
                                               begin
                                                    Periodo := Trunc(qryConsultaReservaDataTermino.Value - qryConsultaReservaDataInicio.Value) + 1;
                                                    DiariaAMaisHoraExtra := true;
                                               end
                                               else
                                                    Periodo := Trunc(qryConsultaReservaDataTermino.Value - qryConsultaReservaDataInicio.Value);

                                     ValorDiarias := Periodo * (qryConsultaReservaValorPeriodoVeiculo.Value / qryTarifaPeriodoTarifa.Value);
                                     ValorTarifa := qryConsultaReservaValorPeriodoVeiculo.Value;
                                     Body.Add('<b>Valor Di�ria:</b> ' + FormatFloat('R$ ###,###,##0.00',qryConsultaReservaValorPeriodoVeiculo.Value / qryTarifaPeriodoTarifa.Value ) + ' X '   +
                                                                 IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,###,##0.00',ValorDiarias) + '<br>');
                                     Body.Add('<b>Valor do Periodo:</b> ' +  FormatFloat('R$ ###,###,##0.00',(qryConsultaReservaValorPeriodoVeiculo.Value / qryTarifaPeriodoTarifa.Value))  + '<br>');
                                     Body.Add('<b>Periodo:</b> ' +  IntToStr(Periodo) + '<br>');
                                     Body.Add('<b>Valor Total das Di�rias:</b> ' +  FormatFloat('R$ ###,###,##0.00',Periodo * (qryConsultaReservaValorPeriodoVeiculo.Value / qryTarifaPeriodoTarifa.Value))  + '<br>');

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
                                     if (HorasExtras > 1) and (HorasExtras < 5)  then
                                     begin
                                          ValorHoraExtra := ((ValorTarifa / qryTarifaPeriodoTarifa.Value)/5)* HorasExtras;
                                          Body.Add('<b>Horas Extras:</b> ' +  FormatFloat('R$###,##0.00',((ValorTarifa / qryTarifaPeriodoTarifa.Value)/5)) + ' X ' +
                                                                      FloatToStr(Round(HorasExtras)) + ' = ' +
                                                                      FormatFloat('R$###,##0.00',ValorHoraExtra)+ '<br>');
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
                                     if qryParametrosEmpresaDefinirValorProtecaoPor.Value = 'G' then
                                     begin
                                          if (qryTarifaValorPeriodoSegAd.Value > 0) and (HorasExtras > 0)and (HorasExtras > 5) then
                                          begin
                                               ValorCobertura := (qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) * (Periodo);
                                               Body.Add('<b>Prote��o:</b> '  + FormatFloat('R$###,##0.00',qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) + ' X ' + IntToStr(Periodo) + ' = '  + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end
                                          else
                                          if (qryTarifaValorPeriodoSegAd.Value > 0) and (HorasExtras > 1) and not DiariaAMaisHoraExtra then
                                          begin
                                               ValorCobertura := (qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) * (Periodo+1);
                                               Body.Add('<b>Prote��o:</b> '  + FormatFloat('R$###,##0.00',qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) + ' X ' + IntToStr(Periodo + 1) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end
                                          else
                                          if (qryTarifaValorPeriodoSegAd.Value > 0) then
                                          begin
                                               ValorCobertura := (qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) * Periodo;
                                               Body.Add('<b>Prote��o:</b> '  + FormatFloat('R$###,##0.00',qryTarifaValorPeriodoSegAd.Value / qryTarifaPeriodoTarifa.Value) + ' X ' + IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end;
                                     end
                                     else
                                     begin
                                          if (qryProtecaoValorProtecao.Value > 0) and (HorasExtras > 0)and (HorasExtras > 5) then
                                          begin
                                               ValorCobertura := (qryProtecaoValorProtecao.Value) * (Periodo);
                                               Body.Add('<b>Prote��o:</b> '  + FormatFloat('R$###,##0.00',qryProtecaoValorProtecao.Value) + ' X ' + IntToStr(Periodo) + ' = '  + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end
                                          else
                                          if (qryProtecaoValorProtecao.Value > 0) and (HorasExtras > 1) and not DiariaAMaisHoraExtra then
                                          begin
                                               ValorCobertura := (qryProtecaoValorProtecao.Value) * (Periodo +1);
                                               Body.Add('<b>Prote��o:</b> '  + FormatFloat('R$###,##0.00',qryProtecaoValorProtecao.Value) + ' X ' + IntToStr(Periodo +1) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
                                          end
                                          else
                                          if (qryProtecaoValorProtecao.Value > 0) then
                                          begin
                                               ValorCobertura := (qryProtecaoValorProtecao.Value) * Periodo;
                                               Body.Add('<b>Prote��o:</b> '  + FormatFloat('R$###,##0.00',qryProtecaoValorProtecao.Value) + ' X ' + IntToStr(Periodo) + ' = ' + FormatFloat('R$ ###,##0.00',ValorCobertura) + '<br>');
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
                                          Body.Add('<p align="center"><b>SERVI�OS ADICIONAIS</b></td>');
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
                                          Body.Add('<b>Taxa de Servi�o:</b> ' + FormatFloat('##0.00 %',qryConsultaReservaTaxaServico.Value) + '<br>');
                                          ValorTaxaServico := ((ValorDiarias + ValorHoraExtra + ValorKm + ValorCobertura +  ValorTerceiros + ValorTaxaEntregaDevolucao + TotalAdicional)/ 100) * qryConsultaReservaTaxaServico.Value;
                                     end;
                                     Body.Add('<b>Total Estimado da Loca��o:</b> ' + FormatFloat('R$ ###,###,##0.00',ValorDiarias + ValorHoraExtra + ValorKm + TotalAdicional + ValorCobertura + ValorTerceiros + ValorTaxaServico + ValorTaxaEntregaDevolucao));
                                     Body.Add('</blockquote></td></tr>');
                                     Body.Add('</table>');
                                     if Length(qryConsultaReservaObservacoes.AsString)> 0 then
                                     begin
                                          Body.Add('<table border="1" width="100%"> ');
                                          Body.Add('<tr><td><blockquote>');
                                          Body.Add('<b>Observa��es sobre a reserva</b><br>');
                                          Body.Add(qryConsultaReservaObservacoes.AsString);
                                          Body.Add('</blockquote></td></tr>');
                                          Body.Add('</table>');
                                     end;
                                     Body.Add('<table border="1" width="100%"> ');
                                     Body.Add('<tr><td><blockquote>');
                                     Body.Add('<b>CONDI��ES</b><br>');
                                     Body.Add('1 - Para a retirada do ve�culo o locat�rio deve ter mais de 21 anos de idade e ser habilitado h� mais de dois anos, possuir cart�o de cr�dito');
                                     Body.Add(' e cadastro previamente aprovado.<br>');
                                     Body.Add('2 - No Total Estimado para a Loca��o n�o est�o calculadas despesas com reabastecimento de combust�vel e/ou eventuais acr�scimos,');
                                     Body.Add(' como taxa, multas de tr�nsito e outras previstas no contrato de loca��o.<br>');
                                     Body.Add('3 - DO CARRO RESERVADO � A reserva � feita por Grupo de ve�culo, sem garantia de modelo, salvo para carros especiais ou de luxo,');
                                     Body.Add(' pr�via e expressamente acordado com a Locadora.<br>');
                                     Body.Add('4 - Na Falta do carro reservado a loca��o ser� atendida com ve�culo similar, do mesmo grupo ou superior,');
                                     Body.Add(' mantidas as condi��es da reserva.<br>');
                                     Body.Add('5 - Descontos e promo��es n�o s�o cumulativos e n�o incidem sobre as tarifas semanais, quinzenais ou mensais.<br>');
                                     Body.Add('6 - Pagamento/faturamento: aceitamos cart�es de cr�dito e faturamos para empresas cadastradas. Sujeito a aprova��o de cr�dito.<br>');
                                     Body.Add('7 � As tarifas semanais, quinzenais e mensais s�o v�lidas mediante pagamento antecipado.<br>');
                                     Body.Add('8 - Garantia: as reservas s�o mantidas pelo per�odo de at� uma hora ap�s a prevista e dentro do hor�rio de funcionamento da');
                                     Body.Add(' Ag�ncia de retirada do carro.<br>');
                                     Body.Add('9 � No show (aus�ncia no comparecimento): a reserva n�o honrada e n�o cancelada com anteced�ncia m�nima de 12 (doze) horas,');
                                     Body.Add(' dentro do hor�rio de funcionamento da ag�ncia de retirada do ve�culo, poder� sofrer cobran�a de uma di�ria do carro reservado, a t�tulo de no show.<br>');
                                     Body.Add('10 � Devolu��o do carro em outra localidade � necess�ria autoriza��o pr�via e expressa da Locadora e pagamento de taxa de retorno,');
                                     Body.Add(' acrescida de eventual ped�gio, ou valores pr�-acordados.<br>');
                                     Body.Add('11 - Altera��o, cancelamento ou consulta da reserva: informe o n�mero desta e seu nome para nossa');
                                     Body.Add(' Central Nacional de Reservas.<br>');
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
                           IdSMTP.Send(lMensagem);
                      finally
                           IdSMTP.Disconnect;
                      end;
                 finally
                      lMensagem.Free;
                 end;
            finally
                 IdSMTP.Free;
                 Objeto := TJSONObject.Create;
                 Objeto.AddPair('Status', TJSONString.Create('OK'));
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Objeto.ToString));
                 GerouObjeto := true;
            end;
       end;
  except
       on E: Exception do
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Status', TJSONString.Create('Erro'));
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Objeto.ToString));
            GerouObjeto := true;
       end;
  end;
  if GerouObjeto then
       Objeto.Free;
  adcBancoDados.Connected := false;
  adcControle.Connected := false;
end;

function TServerMetodos.GravarCliente(NomeCliente, CPF, Email, Telefone: String;
  CodigoEmpresa, CodigoUnidade: Integer; Passaporte, Celular, Sexo, Identidade,
  Logradouro, Bairro: String; Numero: Integer; Complemento, Cep, Estado,
  Cidade: String): TStringStream;
var
  Objeto: TJSONObject;
  Cliente,
  Erro: TJSONArray;
  I, CodigoCliente: Integer;
  ExisteCliente: Boolean;
  GerouObjeto: Boolean;
begin
  try
       Erro := TJSONArray.Create;
       GerouObjeto := false;
       CodigoCliente := 0;
       ExisteCliente := false;
       //Verifica os campo obrigat�rios
       if NomeCliente = '' then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Nome do Cliente � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if Email = '' then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Email do Cliente � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if Telefone = '' then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Telefone do Cliente � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if CodigoEmpresa <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Codigo Empresa do Cliente � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if (Passaporte = '') and (CPF = '') then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Passaporte ou CPF do Cliente deve ser preenchido.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if CodigoUnidade <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Codigo Unidade do Cliente � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            GerouObjeto := true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            Erro.AddElement(Objeto);
       end;
       //Verifica se teve algum erro
       if Erro.Size > 0 then
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Erro.ToString))
       else
       begin
            //Verifica se o cliente ja est� cadastrado
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
                 if qryClienteCadastrado.IsEmpty then
                 begin
//                      if Passaporte <> '' then
//                      begin
//                           if qryClienteCadastrado.Active then
//                                qryClienteCadastrado.Close;
//                           qryClienteCadastrado.SQL[9] := 'AND (Clientes.Passaporte = ' + #39 + Passaporte + #39 +')';
//                           qryClienteCadastrado.Open;
//                           if not qryClienteCadastrado.IsEmpty then
//                           begin
//                                ExisteCliente := true;
//                                CodigoCliente := qryClienteCadastradoCodigoCliente.Value;
//                           end;
//                      end;
                 end
                 else
                 begin
                      ExisteCliente := true;
                      CodigoCliente := qryClienteCadastradoCodigoCliente.Value;
                 end;
            end;
            //Abre a query de municipios para realizar a busca do munic�pio
            if qryMunicipios.Active then
                 qryMunicipios.Close;
            qryMunicipios.Open;
            if not ExisteCliente then
            begin
                 if qryGravaCliente.Active then
                      qryGravaCliente.Close;
                 qryGravaCliente.Parameters.ParamByName('NomeFantasia').Value := NomeCliente;
                 qryGravaCliente.Parameters.ParamByName('RazaoSocial').Value := NomeCliente;
                 qryGravaCliente.Parameters.ParamByName('CPF').Value := CPF;
                 qryGravaCliente.Parameters.ParamByName('Email').Value := Email;
                 qryGravaCliente.Parameters.ParamByName('Telefone').Value := Telefone;
                 qryGravaCliente.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryGravaCliente.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                 qryGravaCliente.Parameters.ParamByName('Passaporte').Value := Passaporte;
                 qryGravaCliente.Parameters.ParamByName('Celular').Value := Celular;
                 qryGravaCliente.Parameters.ParamByName('Sexo').Value := Sexo;
                 qryGravaCliente.Parameters.ParamByName('Identidade').Value := Identidade;
                 qryGravaCliente.Parameters.ParamByName('Logradouro').Value := Logradouro;
                 qryGravaCliente.Parameters.ParamByName('Bairro').Value := Bairro;
                 qryGravaCliente.Parameters.ParamByName('Numero').Value := Numero;
                 qryGravaCliente.Parameters.ParamByName('Complemento').Value := Complemento;
                 qryGravaCliente.Parameters.ParamByName('Cep').Value := Cep;
                 qryGravaCliente.Parameters.ParamByName('Estado').Value := Estado;
                 qryGravaCliente.Parameters.ParamByName('Cidade').Value := Cidade;
                 qryMunicipios.Locate('Estado; Descricao', VarArrayOF([Estado, ConverteAcento(Cidade)]), []);
                 qryGravaCliente.Parameters.ParamByName('CodigoMunicipio').Value := qryMunicipiosCodigoMunicipio.Value;
                 try
                      qryGravaCliente.ExecSQL;
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
                 end;
            end
            else //caso exista o cliente o sistema apenas atualiza as informa��es
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
                      qryMunicipios.Locate('Estado; Descricao', VarArrayOF([Estado, ConverteAcento(Cidade)]), []);
                      qryClienteCadastradoCodigoMunicipio.Value := qryMunicipiosCodigoMunicipio.Value;
                      qryClienteCadastrado.Post;
                 end;
            end;
            //Retornar as informacoes do cliente gravado
            Cliente := TJSONArray.Create;
            if qryCliente.Active then
                 qryCliente.Close;
            qryCliente.Parameters.ParamByName('CodigoCliente').DataType := ftInteger;
            qryCliente.Parameters.ParamByName('CodigoCliente').Value := CodigoCliente;
            qryCliente.Open;
            while not qryCliente.Eof do
            begin
                 Objeto := TJSONObject.Create;
                 for I := 0 to qryCliente.FieldCount -1 do
                      if (qryCliente.Fields[I].FieldName = 'CodigoCliente') or
                         (qryCliente.Fields[I].FieldName = 'NomeFantasia') or
                         (qryCliente.Fields[I].FieldName = 'Email') or
                         (qryCliente.Fields[I].FieldName = 'Telefone') or
                         (qryCliente.Fields[I].FieldName = 'Passaporte') then
                           Objeto.AddPair(qryCliente.Fields[I].FieldName, TJSONString.Create(qryCliente.Fields[I].AsString));
                 Cliente.AddElement(Objeto);
                 GerouObjeto := true;
                 qryCliente.Next;
            end;
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Cliente.ToString));
       end;
  finally
       if qryCliente.Active then
            qryCliente.Close;
       if qryProximoCodigoCliente.Active then
            qryProximoCodigoCliente.Close;
       if qryClienteCadastrado.Active then
            qryClienteCadastrado.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.GravarServicoAdicionalReserva(CodigoReserva,
  CodigoServicoAdicional: Integer): TStringStream;
var
  Objeto: TJSONObject;
  ServicoAdicional,
  Erro: TJSONArray;
  I: Integer;
  GerouObjeto: Boolean;
begin
  try
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            ServicoAdicional := TJSONArray.Create;
            GerouObjeto := true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            ServicoAdicional.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(ServicoAdicional.ToString));
       end
       else
       begin
            try
                 Erro := TJSONArray.Create;
                 GerouObjeto := false;
                 if CodigoReserva <= 0 then
                 begin
                      Objeto := TJSONObject.Create;
                      Objeto.AddPair('Erro', TJSONString.Create('CodigoReserva � obrigat�rio.'));
                      Erro.AddElement(Objeto);
                      GerouObjeto := true;
                 end;
                 if CodigoServicoAdicional <= 0 then
                 begin
                      Objeto := TJSONObject.Create;
                      Objeto.AddPair('Erro', TJSONString.Create('CodigoServicoAdicional � obrigat�rio.'));
                      Erro.AddElement(Objeto);
                      GerouObjeto := true;
                 end;
                 if Erro.Size > 0 then
                      Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Erro.ToString))
                 else
                 begin
                      ConectaBanco;
                      //Captura o servico adicional para verificar seus valores
                      if qryServicoAdicionais.Active then
                           qryServicoAdicionais.Close;
                      qryServicoAdicionais.Parameters.ParamByName('CodigoServicoAdicional').DataType := ftInteger;
                      qryServicoAdicionais.Parameters.ParamByName('CodigoServicoAdicional').Value := CodigoServicoAdicional;
                      qryServicoAdicionais.Open;
                      //passa os parametros para query para gravar os servicos da reserva
                      if qryGravaReservaServicoAdicional.Active then
                           qryGravaReservaServicoAdicional.Close;
                      qryGravaReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
                      qryGravaReservaServicoAdicional.Parameters.ParamByName('CodigoServicoAdicional').Value := CodigoServicoAdicional;
                      qryGravaReservaServicoAdicional.Parameters.ParamByName('Valor').Value := qryServicoAdicionaisValor.Value;
                      qryGravaReservaServicoAdicional.ExecSQL;
                      //retorna o registro gravado
                      if qryReservaServicoAdicional.Active then
                           qryReservaServicoAdicional.Close;
                      qryReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
                      qryReservaServicoAdicional.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
                      qryReservaServicoAdicional.Parameters.ParamByName('CodigoServicoAdicional').DataType := ftInteger;
                      qryReservaServicoAdicional.Parameters.ParamByName('CodigoServicoAdicional').Value := CodigoServicoAdicional;
                      qryReservaServicoAdicional.Open;
                      ServicoAdicional := TJSONArray.Create;
                      while not qryReservaServicoAdicional.Eof do
                      begin
                           Objeto := TJSONObject.Create;
                           for I := 0 to qryReservaServicoAdicional.FieldCount -1 do
                                Objeto.AddPair(qryReservaServicoAdicional.Fields[I].FieldName, TJSONString.Create(qryReservaServicoAdicional.Fields[I].AsString));
                           ServicoAdicional.AddElement(Objeto);
                           GerouObjeto := true;
                           qryReservaServicoAdicional.Next;
                      end;
                      Result := TStringStream.Create(TEncoding.UTF8.GetBytes(ServicoAdicional.ToString));
                 end;
            except
                 Objeto := TJSONObject.Create;
                 ServicoAdicional := TJSONArray.Create;
                 GerouObjeto := true;
                 Objeto.AddPair('Erro','Erro Gravar Servi�o Adicional Reserva');
                 ServicoAdicional.AddElement(Objeto);
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(ServicoAdicional.ToString));
            end;
       end;
  finally
       if qryServicoAdicionais.Active then
            qryServicoAdicionais.Close;
       if qryGravaReservaServicoAdicional.Active then
            qryGravaReservaServicoAdicional.Close;
       if qryReservaServicoAdicional.Active then
            qryReservaServicoAdicional.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.GrupoVeiculos(CodigoEmpresa: Integer;
  Letra: String): TStringStream;
var
  Objeto: TJSONObject;
  GrupoVeiculos: TJSONArray;
  I: Integer;
  GerouObjeto: Boolean;
begin
  try
       GerouObjeto := false;
       if CodigoEmpresa <= 0 then
       begin
            Objeto := TJSONObject.Create;
            GrupoVeiculos := TJSONArray.Create;
            GerouObjeto := true;
            Objeto.AddPair('Erro','C�digo da Empresa � obrigat�rio.');
            GrupoVeiculos.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(GrupoVeiculos.ToString))
       end
       else
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            GrupoVeiculos := TJSONArray.Create;
            GerouObjeto := true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            GrupoVeiculos.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(GrupoVeiculos.ToString));
       end
       else
       begin
            try
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
                 qryGrupoVeiculos.Open;
                 GrupoVeiculos := TJSONArray.Create;
                 while not qryGrupoVeiculos.Eof do
                 begin
                      Objeto := TJSONObject.Create;
                      for I := 0 to qryGrupoVeiculos.FieldCount -1 do
                           Objeto.AddPair(qryGrupoVeiculos.Fields[I].FieldName, TJSONString.Create(qryGrupoVeiculos.Fields[I].AsString));
                      GrupoVeiculos.AddElement(Objeto);
                      qryGrupoVeiculos.Next;
                 end;
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(GrupoVeiculos.ToString));
            except
                 Objeto := TJSONObject.Create;
                 GrupoVeiculos := TJSONArray.Create;
                 GerouObjeto := true;
                 Objeto.AddPair('Erro','Erro inseperado m�todo Grupo Ve�culos');
                 GrupoVeiculos.AddElement(Objeto);
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(GrupoVeiculos.ToString));
            end;
       end;
  finally
       if qryGrupoVeiculos.Active then
            qryGrupoVeiculos.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

procedure TServerMetodos.InserirTaxaEntregaDevolucao(CodigoReserva,
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

function TServerMetodos.Protecoes: TStringStream;
var
  Objeto: TJSONObject;
  Protecoes: TJSONArray;
  I: Integer;
  GerouObjeto: Boolean;
begin
  try
       GerouObjeto:= false;
       if not ConectaBanco then
       begin
            GerouObjeto:= true;
            Objeto := TJSONObject.Create;
            Protecoes := TJSONArray.Create;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            Protecoes.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Protecoes.ToString));
       end
       else
       begin
            try
                 if qryListaProtecao.Active then
                      qryListaProtecao.Close;
                 qryListaProtecao.Open;
                 Protecoes := TJSONArray.Create;
                 while not qryListaProtecao.Eof do
                 begin
                      Objeto := TJSONObject.Create;
                      GerouObjeto:= true;
                      for I := 0 to qryListaProtecao.FieldCount -1 do
                           Objeto.AddPair(qryListaProtecao.Fields[I].FieldName, TJSONString.Create(qryListaProtecao.Fields[I].AsString));
                      Protecoes.AddElement(Objeto);
                      qryListaProtecao.Next;
                 end;
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Protecoes.ToString));
            except
                 Objeto := TJSONObject.Create;
                 Protecoes := TJSONArray.Create;
                 GerouObjeto:= true;
                 Objeto.AddPair('Erro','Erro m�todo Protecoes');
                 Protecoes.AddElement(Objeto);
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Protecoes.ToString));
            end;
       end;
  finally
       qryListaProtecao.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.Reserva(CodigoEmpresa, CodigoUnidade, CodigoCliente,
  CodigoGrupo, CodigoProtecao, CodigoTarifa: Integer; DataInicio,
  DataTermino: TDateTime; HoraInicio, HoraTermino: String;
  CodigoMunicipioRetirada, CodigoMunicipioDevolucao, CodigoRegistro: Integer;
  Tipo: String): TStringStream;
var
  Objeto: TJSONObject;
  Reserva,
  Erro: TJSONArray;
  I,
  CodigoReserva: Integer;
  ReservaOK: Boolean;
  PercentualMaximoTaxaServico: Double;
  GerouObjeto: Boolean;
begin
  try
       Erro := TJSONArray.Create;
       GerouObjeto := false;
       ReservaOK := true;
       CodigoReserva := 0;
       if CodigoEmpresa <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Empresa � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if CodigoUnidade <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Unidade � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if CodigoCliente <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Cliente � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if CodigoGrupo <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Grupo � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if CodigoProtecao <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Prote��o � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if CodigoTarifa <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Tarifa � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if DataInicio = 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Data In�cio � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if DataTermino = 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Data T�rmino � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if HoraInicio = '' then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Hora In�cio � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if HoraTermino = '' then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Hora T�rmino � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if CodigoMunicipioRetirada <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Munic�pio Retirada � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if CodigoMunicipioDevolucao <= 0 then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('Munic�pio Devolu��o � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if (CodigoRegistro > 0) and (Tipo = '') then
       begin
            Objeto := TJSONObject.Create;
            Objeto.AddPair('Erro', TJSONString.Create('O Tipo de opera��o � obrigat�rio.'));
            Erro.AddElement(Objeto);
            GerouObjeto := true;
       end;
       if Erro.Size > 0 then
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Erro.ToString))
       else
       begin
            ConectaBanco;
            if CodigoRegistro <= 0 then //Insere um novo registro
            begin
                 //Preenche os parametros para gravar a reserva
                 if qryGravaReserva.Active then
                      qryGravaReserva.Close;
                 qryGravaReserva.Parameters.ParamByName('DataReserva').Value := Now;
                 qryGravaReserva.Parameters.ParamByName('HoraReserva').Value := Copy(TimeToStr(Time),1,2) + Copy(TimeToStr(Time),4,2);
                 qryGravaReserva.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryGravaReserva.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                 qryGravaReserva.Parameters.ParamByName('CodigoCliente').Value := CodigoCliente;
                 if qryCliente.Active then
                      qryCliente.Close;
                 qryCliente.Parameters.ParamByName('CodigoCliente').DataType := ftInteger;
                 qryCliente.Parameters.ParamByName('CodigoCliente').Value := CodigoCliente;
                 qryCliente.Open;
                 qryGravaReserva.Parameters.ParamByName('TipoCliente').Value := qryClienteTipo.Value;
                 qryGravaReserva.Parameters.ParamByName('ClienteCadastrado').Value := 'S';
                 qryGravaReserva.Parameters.ParamByName('NomeCliente').Value := qryClienteNomeFantasia.Value;
                 qryGravaReserva.Parameters.ParamByName('TelefoneContato1').Value := qryClienteTelefone.Value;
                 qryGravaReserva.Parameters.ParamByName('Email').Value := qryClienteEmail.Value;
                 qryGravaReserva.Parameters.ParamByName('CPF').Value := qryClienteCPF.Value;
                 qryGravaReserva.Parameters.ParamByName('Identidade').Value := qryClienteIdentidade.Value;
                 qryGravaReserva.Parameters.ParamByName('Passaporte').Value := qryClientePassaporte.Value;
                 qryGravaReserva.Parameters.ParamByName('DataInicio').Value := DataInicio;
                 qryGravaReserva.Parameters.ParamByName('HoraInicio').Value := StringReplace(HoraInicio,':','', [rfReplaceAll, rfIgnoreCase]);
                 qryGravaReserva.Parameters.ParamByName('DataHoraInicio').Value := DataInicio + StrToTime(Copy(HoraInicio,1,2) + ':00');
                 qryGravaReserva.Parameters.ParamByName('DataTermino').Value := DataTermino;
                 qryGravaReserva.Parameters.ParamByName('HoraTermino').Value := StringReplace(HoraTermino,':','',[rfReplaceAll, rfIgnoreCase]);
                 qryGravaReserva.Parameters.ParamByName('DataHoraTermino').Value := DataTermino + StrToTime(Copy(HoraTermino,1,2) + ':00');
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
                 qryGravaReserva.Parameters.ParamByName('CodigoModelo').Value := 0;
                 qryGravaReserva.Parameters.ParamByName('LocalEntregaVeiculo').Value := qryParametrosUnidadeDescricaoUnidade.Value;
                 qryGravaReserva.Parameters.ParamByName('LocalEntrega').Value := qryUnidadesMunicipioUnidade.Value;
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
                 if qryProtecoes.Active then
                      qryProtecoes.Close;
                 qryProtecoes.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                 qryProtecoes.Parameters.ParamByName('CodigoProtecao').Value := CodigoProtecao;
                 qryProtecoes.Open;
                 if qryTarifa.Active then
                      qryTarifa.Close;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoProtecao;
                 qryTarifa.Open;
                 //if qryProtecoes.Locate('NomeProtecao', qryTarifaDescricaoPeriodoTarifa.Value, []) then
                 //     qryGravaReserva.Parameters.ParamByName('CodigoProtecao').Value := qryProtecoesCodigoProtecao.Value;
                 qryGravaReserva.Parameters.ParamByName('CodigoProtecao').Value := CodigoProtecao;
                 if qryTarifa.Active then
                      qryTarifa.Close;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
                 qryTarifa.Open;

                 if qryProtecao.Active then
                      qryProtecao.Close;
                 qryProtecao.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                 qryProtecao.Parameters.ParamByName('CodigoProtecao').Value := qryProtecoesCodigoProtecao.Value;
                 qryProtecao.Open;
                 qryGravaReserva.Parameters.ParamByName('LocalRetornoVeiculo').Value := qryParametrosUnidadeDescricaoUnidade.Value;
                 qryGravaReserva.Parameters.ParamByName('LocalDevolucao').Value := qryUnidadesMunicipioUnidade.Value;
                 qryGravaReserva.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
                 if qryTarifa.Active then
                      qryTarifa.Close;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
                 qryTarifa.Open;
                 qryGravaReserva.Parameters.ParamByName('ValorPeriodoVeiculo').Value := StringReplace(qryTarifaValorPeriodoVeiculo.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 if qryParametrosEmpresa.Active then
                      qryParametrosEmpresa.Close;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryParametrosEmpresa.Open;
                 if qryParametrosEmpresaDefinirValorProtecaoPor.Value = 'G' then
                      qryGravaReserva.Parameters.ParamByName('ValorPeriodoSegAd').Value := StringReplace(qryTarifaValorPeriodoSegAd.AsString,',','.',[rfReplaceAll, rfIgnoreCase])
                 else
                      qryGravaReserva.Parameters.ParamByName('ValorPeriodoSegAd').Value := StringReplace(qryProtecaoValorProtecao.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryGravaReserva.Parameters.ParamByName('KmLivre').Value := qryTarifaKmLivre.Value;
                 qryGravaReserva.Parameters.ParamByName('ValorKmRodado').Value := StringReplace(qryTarifaValorKmRodado.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryGravaReserva.Parameters.ParamByName('FranquiaKmRodado').Value := qryTarifaFranquiaKmRodado.Value;
                 qryGravaReserva.Parameters.ParamByName('ValorKmRodados').Value := StringReplace(qryTarifaValorKmRodado.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 //Pega o valor da protecao terceiro
                 if qryProtecao.Active then
                      qryProtecao.Close;
                 qryProtecao.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                 qryProtecao.Parameters.ParamByName('CodigoProtecao').Value := CodigoProtecao;
                 qryProtecao.Open;
                 qryGravaReserva.Parameters.ParamByName('TipoCoberturaCasco').Value := qryProtecaoTipoFranquia.Value;
                 qryGravaReserva.Parameters.ParamByName('CoberturaTotal').Value := qryProtecaoCoberturaCasco.Value;
                 qryGravaReserva.Parameters.ParamByName('CoberturaTerceiros').Value := qryProtecaoCoberturaTerceiros.Value;
                 qryGravaReserva.Parameters.ParamByName('ValorFranquia').Value := StringReplace(qryProtecaoValorCasco.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryGravaReserva.Parameters.ParamByName('CoberturaOcupantes').Value := qryProtecaoCoberturaOcupantes.Value;
                 qryGravaReserva.Parameters.ParamByName('ValorFranquiaTerceiros').Value := StringReplace(qryProtecaoValorTerceiros.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryGravaReserva.Parameters.ParamByName('ValorFranquiaOcupantes').Value := StringReplace(qryProtecaoValorOcupantes.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryGravaReserva.Parameters.ParamByName('CodigoGrupoVeiculos').Value := CodigoGrupo;
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
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoGrupoVeiculo').DataType := ftInteger;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoGrupoVeiculo').Value := CodigoGrupo;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('LocalOndeSeEncontra').DataType := ftString;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('LocalOndeSeEncontra').Value := qryParametrosUnidadeDescricaoUnidade.Value;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoReserva1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoReserva1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva2').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva2').Value := StrToDateTime(DateTimeToStr(DataTermino) + ' ' + Copy(HoraTermino,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva3').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva3').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoContrato1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoContrato1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato2').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato2').Value := StrToDateTime(DateTimeToStr(DataTermino) + ' ' + Copy(HoraTermino,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato3').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato3').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoContratosGrupos1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoContratosGrupos1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos2').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos2').Value := StrToDateTime(DateTimeToStr(DataTermino) + ' ' + Copy(HoraTermino,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos3').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos3').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Open;
                 qryGravaReserva.Parameters.ParamByName('CodigoMVA').Value := qryValidaVeiculosDisponiveisCodigoMVA.Value;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioRetirada;
                 qryUnidades.Open;
                 PercentualMaximoTaxaServico := qryUnidadesPercTaxaAdministrativa.Value;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioDevolucao;
                 qryUnidades.Open;
                 if PercentualMaximoTaxaServico < qryUnidadesPercTaxaAdministrativa.Value then
                      PercentualMaximoTaxaServico := qryUnidadesPercTaxaAdministrativa.Value;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioRetirada;
                 qryUnidades.Open;
                 if qryUnidadesPercTaxaAdministrativa.Value = 0 then
                      qryGravaReserva.Parameters.ParamByName('TaxaServico').Value := '0'
                 else
                      qryGravaReserva.Parameters.ParamByName('TaxaServico').Value := StringReplace(FloatToStr(PercentualMaximoTaxaServico),',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryGravaReserva.Parameters.ParamByName('PercDescontoTempo').Value := StringReplace(qryParametrosUnidadePercentualDescontoTarifaReservaWeb.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 //realiza as verifica��es necess�rias.
                 if qryParametrosUnidadeCodigoMunicipio.Value <> CodigoMunicipioRetirada then
                      ReservaOK := false
                 else
                      if qryValidaVeiculosDisponiveis.IsEmpty then
                           ReservaOK := false
                      else
                           if not ValidaHorarioFuncionamento(DataInicio, HoraInicio, CodigoEmpresa, CodigoUnidade) then
                                ReservaOK := false
                           else
                                if not ValidaHorarioFuncionamento(DataTermino, HoraTermino, CodigoEmpresa, CodigoUnidade) then
                                     ReservaOK := false
                                else
                                     if not ValidaHorasAntecedenciaAbertura(DataInicio, HoraInicio, CodigoEmpresa, CodigoUnidade) then
                                          ReservaOK := false
                                     else
                                          if not ValidaLimiteAprovacao(DataTermino, DataInicio, CodigoUnidade, CodigoEmpresa) then
                                               ReservaOK := false
                                          else
                                               ReservaOK := true;
                 if ReservaOK then
                 begin
                      qryGravaReserva.Parameters.ParamByName('ReservaWeb').Value := 'S';
                      qryGravaReserva.Parameters.ParamByName('DataHoraLiberacao').Value := Now;
                      qryGravaReserva.Parameters.ParamByName('Solicitacao').Value := 'N';
                 end
                 else
                 begin
                      qryGravaReserva.Parameters.ParamByName('ReservaWeb').Value := 'N';
                      qryGravaReserva.Parameters.ParamByName('DataHoraLiberacao').Value := Now;
                      qryGravaReserva.Parameters.ParamByName('Solicitacao').Value := 'S';
                 end;
                 qryGravaReserva.Parameters.ParamByName('InseridoEm').Value := Now;
                 qryGravaReserva.Parameters.ParamByName('InseridoPor').Value := 99;
                 try
                      qryGravaReserva.ExecSQL;
                      //Atualiza o proximo codigo da reserva
                      if qryProximoCodigoReserva.Active then
                           qryProximoCodigoReserva.Close;
                      qryProximoCodigoReserva.ExecSQL;
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
                           CodigoReserva := qryReservaCodigoReserva.Value;
                      //Grava a taxa de entrega e devolucao caso exista
                      InserirTaxaEntregaDevolucao(CodigoReserva, CodigoMunicipioRetirada, CodigoMunicipioDevolucao);
                 except
                 end;
                 Objeto := TJSONObject.Create;
                 if ReservaOK then
                 begin
                      Objeto.AddPair('CodigoReserva', TJSONString.Create(IntToStr(CodigoReserva)));
                 end
                 else
                 begin
                      Objeto.AddPair('CodigoSolicitacao', TJSONString.Create(IntToStr(CodigoReserva)));
                 end;
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Objeto.ToString));
                 GerouObjeto := true;
            end
            else //Altera��o do registro
            begin
                 if qryAlterarReserva.Active then
                      qryAlterarReserva.Close;
                 qryAlterarReserva.Parameters.ParamByName('CodigoReserva').Value := CodigoRegistro;
                 qryAlterarReserva.Parameters.ParamByName('DataInicio').Value := DataInicio;
                 qryAlterarReserva.Parameters.ParamByName('HoraInicio').Value := StringReplace(HoraInicio,':','', [rfReplaceAll, rfIgnoreCase]);
                 qryAlterarReserva.Parameters.ParamByName('DataHoraInicio').Value := DataInicio + StrToTime(Copy(HoraInicio,1,2) + ':00');
                 qryAlterarReserva.Parameters.ParamByName('DataTermino').Value := DataTermino;
                 qryAlterarReserva.Parameters.ParamByName('HoraTermino').Value := StringReplace(HoraTermino,':','',[rfReplaceAll, rfIgnoreCase]);
                 qryAlterarReserva.Parameters.ParamByName('DataHoraTermino').Value := DataTermino + StrToTime(Copy(HoraTermino,1,2) + ':00');
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
                 qryAlterarReserva.Parameters.ParamByName('LocalEntregaVeiculo').Value := qryParametrosUnidadeDescricaoUnidade.Value;
                 qryAlterarReserva.Parameters.ParamByName('LocalEntrega').Value := qryUnidadesMunicipioUnidade.Value;
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
                 qryAlterarReserva.Parameters.ParamByName('LocalRetornoVeiculo').Value := qryParametrosUnidadeDescricaoUnidade.Value;
                 qryAlterarReserva.Parameters.ParamByName('LocalDevolucao').Value := qryUnidadesMunicipioUnidade.Value;
                 qryAlterarReserva.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
                 if qryTarifa.Active then
                      qryTarifa.Close;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
                 qryTarifa.Open;
                 if qryProtecoes.Active then
                      qryProtecoes.Close;
                 qryProtecoes.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                 qryProtecoes.Parameters.ParamByName('CodigoProtecao').Value := CodigoProtecao;
                 qryProtecoes.Open;
                 if qryTarifa.Active then
                      qryTarifa.Close;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoProtecao;
                 qryTarifa.Open;
                 //if qryProtecoes.Locate('NomeProtecao', qryTarifaDescricaoPeriodoTarifa.Value, []) then
                      qryAlterarReserva.Parameters.ParamByName('CodigoProtecao').Value := qryProtecoesCodigoProtecao.Value;
                 if qryTarifa.Active then
                      qryTarifa.Close;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                 qryTarifa.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifa;
                 qryTarifa.Open;
                 if qryProtecao.Active then
                      qryProtecao.Close;
                 qryProtecao.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                 qryProtecao.Parameters.ParamByName('CodigoProtecao').Value := qryProtecoesCodigoProtecao.Value;
                 qryProtecao.Open;
                 qryAlterarReserva.Parameters.ParamByName('ValorPeriodoVeiculo').Value := StringReplace(qryTarifaValorPeriodoVeiculo.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 if qryParametrosEmpresa.Active then
                      qryParametrosEmpresa.Close;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryParametrosEmpresa.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryParametrosEmpresa.Open;
                 if qryParametrosEmpresaDefinirValorProtecaoPor.Value = 'G' then
                      qryAlterarReserva.Parameters.ParamByName('ValorPeriodoSegAd').Value := StringReplace(qryTarifaValorPeriodoSegAd.AsString,',','.',[rfReplaceAll, rfIgnoreCase])
                 else
                      if qryProtecaoValorProtecao.IsNull then
                           qryGravaReserva.Parameters.ParamByName('ValorPeriodoSegAd').Value := StringReplace('0',',','.',[rfReplaceAll, rfIgnoreCase])
                      else
                           qryAlterarReserva.Parameters.ParamByName('ValorPeriodoSegAd').Value := StringReplace(qryProtecaoValorProtecao.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryAlterarReserva.Parameters.ParamByName('KmLivre').Value := qryTarifaKmLivre.Value;
                 qryAlterarReserva.Parameters.ParamByName('ValorKmRodado').Value := StringReplace(qryTarifaValorKmRodado.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryAlterarReserva.Parameters.ParamByName('FranquiaKmRodado').Value := qryTarifaFranquiaKmRodado.Value;
                 qryAlterarReserva.Parameters.ParamByName('ValorKmRodados').Value := StringReplace(qryTarifaValorKmRodado.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 //Pega o valor da protecao terceiro
                 if qryProtecao.Active then
                      qryProtecao.Close;
                 qryProtecao.Parameters.ParamByName('CodigoProtecao').DataType := ftInteger;
                 qryProtecao.Parameters.ParamByName('CodigoProtecao').Value := CodigoProtecao;
                 qryProtecao.Open;
                 qryAlterarReserva.Parameters.ParamByName('TipoCoberturaCasco').Value := qryProtecaoTipoFranquia.Value;
                 qryAlterarReserva.Parameters.ParamByName('CoberturaTotal').Value := qryProtecaoCoberturaCasco.Value;
                 qryAlterarReserva.Parameters.ParamByName('CoberturaTerceiros').Value := qryProtecaoCoberturaTerceiros.Value;
                 if qryProtecaoValorCasco.IsNull then
                      qryAlterarReserva.Parameters.ParamByName('ValorFranquia').Value := StringReplace('0',',','.',[rfReplaceAll, rfIgnoreCase])
                 else
                      qryAlterarReserva.Parameters.ParamByName('ValorFranquia').Value := StringReplace(qryProtecaoValorCasco.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryAlterarReserva.Parameters.ParamByName('CoberturaOcupantes').Value := qryProtecaoCoberturaOcupantes.Value;
                 if qryProtecaoValorTerceiros.IsNull then
                      qryAlterarReserva.Parameters.ParamByName('ValorFranquiaTerceiros').Value := StringReplace('0',',','.',[rfReplaceAll, rfIgnoreCase])
                 else
                      qryAlterarReserva.Parameters.ParamByName('ValorFranquiaTerceiros').Value := StringReplace(qryProtecaoValorTerceiros.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 if qryProtecaoValorOcupantes.IsNull then
                      qryAlterarReserva.Parameters.ParamByName('ValorFranquiaOcupantes').Value := StringReplace('0',',','.',[rfReplaceAll, rfIgnoreCase])
                 else
                      qryAlterarReserva.Parameters.ParamByName('ValorFranquiaOcupantes').Value := StringReplace(qryProtecaoValorOcupantes.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryAlterarReserva.Parameters.ParamByName('CodigoGrupoVeiculos').Value := CodigoGrupo;
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
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoGrupoVeiculo').DataType := ftInteger;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('CodigoGrupoVeiculo').Value := CodigoGrupo;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('LocalOndeSeEncontra').DataType := ftString;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('LocalOndeSeEncontra').Value := qryParametrosUnidadeDescricaoUnidade.Value;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoReserva1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoReserva1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva2').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva2').Value := StrToDateTime(DateTimeToStr(DataTermino) + ' ' + Copy(HoraTermino,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva3').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioReserva3').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoContrato1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoContrato1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato2').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato2').Value := StrToDateTime(DateTimeToStr(DataTermino) + ' ' + Copy(HoraTermino,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato3').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContrato3').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoContratosGrupos1').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraTerminoContratosGrupos1').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos2').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos2').Value := StrToDateTime(DateTimeToStr(DataTermino) + ' ' + Copy(HoraTermino,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos3').DataType := ftDateTime;
                 qryValidaVeiculosDisponiveis.Parameters.ParamByName('DataHoraInicioContratosGrupos3').Value := StrToDateTime(DateTimeToStr(DataInicio) + ' ' + Copy(HoraInicio,1,2) + ':00.000');
                 qryValidaVeiculosDisponiveis.Open;
                 qryAlterarReserva.Parameters.ParamByName('CodigoMVA').Value := qryValidaVeiculosDisponiveisCodigoMVA.Value;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioRetirada;
                 qryUnidades.Open;
                 PercentualMaximoTaxaServico := qryUnidadesPercTaxaAdministrativa.Value;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioDevolucao;
                 qryUnidades.Open;
                 if PercentualMaximoTaxaServico < qryUnidadesPercTaxaAdministrativa.Value then
                      PercentualMaximoTaxaServico := qryUnidadesPercTaxaAdministrativa.Value;
                 if qryUnidades.Active then
                      qryUnidades.Close;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').DataType := ftInteger;
                 qryUnidades.Parameters.ParamByName('CodigoMunicipio').Value := CodigoMunicipioRetirada;
                 qryUnidades.Open;
                 if qryUnidadesPercTaxaAdministrativa.Value = 0 then
                      qryGravaReserva.Parameters.ParamByName('TaxaServico').Value := '0'
                 else
                      qryGravaReserva.Parameters.ParamByName('TaxaServico').Value := StringReplace(FloatToStr(PercentualMaximoTaxaServico),',','.',[rfReplaceAll, rfIgnoreCase]);
                 qryAlterarReserva.Parameters.ParamByName('PercDescontoTempo').Value := StringReplace(qryParametrosUnidadePercentualDescontoTarifaReservaWeb.AsString,',','.',[rfReplaceAll, rfIgnoreCase]);
                 //caso o tipo for de cancelamento
                 if Tipo = 'C' then
                 begin
                      qryAlterarReserva.Parameters.ParamByName('Cancelada').Value := 'S';
                      qryAlterarReserva.Parameters.ParamByName('CodigoUsuarioCancelamento').Value := 99;
                 end
                 else
                 begin
                      qryAlterarReserva.Parameters.ParamByName('Cancelada').Value := 'N';
                      qryAlterarReserva.Parameters.ParamByName('CodigoUsuarioCancelamento').Value := 0;
                 end;
                 //realiza as verifica��es necess�rias.
                 if qryValidaVeiculosDisponiveis.IsEmpty then
                      ReservaOK := false
                 else
                      if not ValidaHorarioFuncionamento(DataInicio, HoraInicio, CodigoEmpresa, CodigoUnidade) then
                           ReservaOK := false
                      else
                           if not ValidaHorarioFuncionamento(DataTermino, HoraTermino, CodigoEmpresa, CodigoUnidade) then
                                ReservaOK := false
                           else
                                if not ValidaHorasAntecedenciaAbertura(DataInicio, HoraInicio, CodigoEmpresa, CodigoUnidade) then
                                     ReservaOK := false
                                else
                                     if not ValidaLimiteAprovacao(DataTermino, DataInicio, CodigoUnidade, CodigoEmpresa) then
                                          ReservaOK := false
                                     else
                                          ReservaOK := true;
                 if ReservaOK then
                 begin
                      qryAlterarReserva.Parameters.ParamByName('ReservaWeb').Value := 'S';
                      qryAlterarReserva.Parameters.ParamByName('DataHoraLiberacao').Value := Now;
                      qryAlterarReserva.Parameters.ParamByName('Solicitacao').Value := 'N';
                 end
                 else
                 begin
                      qryAlterarReserva.Parameters.ParamByName('ReservaWeb').Value := 'N';
                      qryAlterarReserva.Parameters.ParamByName('DataHoraLiberacao').Value := Now;
                      qryAlterarReserva.Parameters.ParamByName('Solicitacao').Value := 'S';
                 end;
                 qryAlterarReserva.ExecSQL;
                 Objeto := TJSONObject.Create;
                 //Grava a taxa de entrega e devolucao caso exista
                 InserirTaxaEntregaDevolucao(CodigoRegistro, CodigoMunicipioRetirada, CodigoMunicipioDevolucao);
                 if ReservaOK then
                      Objeto.AddPair('CodigoReserva', TJSONString.Create(IntToStr(CodigoRegistro)))
                 else
                      Objeto.AddPair('CodigoSolicitacao', TJSONString.Create(IntToStr(CodigoRegistro)));
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Objeto.ToString));
                 GerouObjeto := true;
            end;
       end;
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
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.ServicosAdicionais(
  CodigoEmpresa: Integer): TStringStream;
var
  Objeto: TJSONObject;
  ServicosAdicionais: TJSONArray;
  I: Integer;
  GerouObjeto: Boolean;
begin
  try
       GerouObjeto:= false;
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            ServicosAdicionais := TJSONArray.Create;
            GerouObjeto:= true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            ServicosAdicionais.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(ServicosAdicionais.ToString));
       end
       else
       begin
            try
                 if qryListaServicoAdicionais.Active then
                      qryListaServicoAdicionais.Close;
                 qryListaServicoAdicionais.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                 qryListaServicoAdicionais.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                 qryListaServicoAdicionais.Open;
                 ServicosAdicionais := TJSONArray.Create;
                 while not qryListaServicoAdicionais.Eof do
                 begin
                      Objeto := TJSONObject.Create;
                      for I := 0 to qryListaServicoAdicionais.FieldCount -1 do
                           Objeto.AddPair(qryListaServicoAdicionais.Fields[I].FieldName, TJSONString.Create(qryListaServicoAdicionais.Fields[I].AsString));
                      ServicosAdicionais.AddElement(Objeto);
                      qryListaServicoAdicionais.Next;
                 end;
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(ServicosAdicionais.ToString));
            except
                  Objeto := TJSONObject.Create;
                  ServicosAdicionais := TJSONArray.Create;
                  GerouObjeto:= false;
                  Objeto.AddPair('Erro','Erro inesperado m�todo Servi�os Adicionais');
                  ServicosAdicionais.AddElement(Objeto);
                  Result := TStringStream.Create(TEncoding.UTF8.GetBytes(ServicosAdicionais.ToString));
            end;
       end;
  finally
       qryListaServicoAdicionais.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.ServicosAdicionaisReserva(
  CodigoReserva: Integer): TStringStream;
var
  Objeto: TJSONObject;
  Erro,
  Adicionais: TJSONArray;
  GerouObjeto: Boolean;
  I: Integer;
begin
  try
       GerouObjeto := false;
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            Adicionais := TJSONArray.Create;
            GerouObjeto:= true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            Adicionais.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Adicionais.ToString));
       end
       else
       begin
            try
                 if qryListaServicoAdicionalReserva.Active then
                      qryListaServicoAdicionalReserva.Close;
                 qryListaServicoAdicionalReserva.Parameters.ParamByName('CodigoReserva').DataType := ftInteger;
                 qryListaServicoAdicionalReserva.Parameters.ParamByName('CodigoReserva').Value := CodigoReserva;
                 qryListaServicoAdicionalReserva.Open;
                 Adicionais := TJSONArray.Create;
                 while not qryListaServicoAdicionalReserva.Eof do
                 begin
                      Objeto := TJSONObject.Create;
                      GerouObjeto := true;
                      for I := 0 to qryListaServicoAdicionalReserva.FieldCount -1 do
                           Objeto.AddPair(qryListaServicoAdicionalReserva.Fields[I].FieldName, TJSONString.Create(qryListaServicoAdicionalReserva.Fields[I].AsString));
                      Adicionais.AddElement(Objeto);
                      qryListaServicoAdicionalReserva.Next;
                 end;
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Adicionais.ToString));
            except
                 Objeto := TJSONObject.Create;
                 Adicionais := TJSONArray.Create;
                 GerouObjeto:= true;
                 Objeto.AddPair('Erro','Erro m�todo Servi�os Adicionais Reserva');
                 Adicionais.AddElement(Objeto);
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Adicionais.ToString));
            end;
       end;
  finally
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.TarifaProtecao(CodigoEmpresa, CodigoUnidade,
  CodigoGrupo, Periodo: Integer; DataInicio,
  DataTermino: TDateTime): TStringStream;
var
  Objeto,Objeto2: TJSONObject;
  DescricaoTarifa,Protecao: TJSONArray;
  I,J: Integer;
  GerouObjeto,
  GerouObjeto2: Boolean;
begin
  try
       GerouObjeto := false;
       GerouObjeto2 := false;
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            DescricaoTarifa := TJSONArray.Create;
            GerouObjeto:= true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            DescricaoTarifa.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(DescricaoTarifa.ToString));
       end
       else
       begin
            //Pega os parametros da unidade selecionada
            if qryParametrosUnidade.Active then
                 qryParametrosUnidade.Close;
            qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
            qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
            qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
            qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
            qryParametrosUnidade.Open;
            //abra a query de descricao da tarifa
            if qryDescricaoTarifaProtecao.Active then
                 qryDescricaoTarifaProtecao.Close;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa1').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa2').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa4').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa5').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa6').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa1').Value := CodigoEmpresa;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa2').Value := CodigoEmpresa;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa4').Value := CodigoEmpresa;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa5').Value := CodigoEmpresa;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa6').Value := CodigoEmpresa;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade1').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade2').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade4').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade5').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade6').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade1').Value := CodigoUnidade;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade2').Value := CodigoUnidade;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade4').Value := CodigoUnidade;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade5').Value := CodigoUnidade;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade6').Value := CodigoUnidade;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo1').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo2').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo4').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo5').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo6').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo').Value := CodigoGrupo;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo1').Value := CodigoGrupo;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo2').Value := CodigoGrupo;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo4').Value := CodigoGrupo;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo5').Value := CodigoGrupo;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo6').Value := CodigoGrupo;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo').DataType := ftSmallint;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo1').DataType := ftSmallint;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo2').DataType := ftSmallint;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo4').DataType := ftSmallint;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo5').DataType := ftSmallint;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo6').DataType := ftSmallint;
            if Periodo >= 7 then
            begin
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo').Value := 7;
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo1').Value := 7;
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo2').Value := 7;
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo4').Value := 7;
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo5').Value := 7;
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo6').Value := 7;
            end
            else
            begin
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo').Value := 1;
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo1').Value := 1;
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo2').Value := 1;
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo4').Value := 1;
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo5').Value := 1;
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('Periodo6').Value := 1;
            end;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas').DataType := ftBoolean;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas1').DataType := ftBoolean;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas2').DataType := ftBoolean;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas4').DataType := ftBoolean;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas5').DataType := ftBoolean;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas6').DataType := ftBoolean;
            if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
              begin
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas').Value := true;
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas1').Value := true;
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas2').Value := true;
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas4').Value := true;
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas5').Value := true;
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas6').Value := true;
              end
            else
              begin
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas').Value := false;
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas1').Value := false;
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas2').Value := false;
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas6').Value := false;
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas4').Value := false;
                   qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas5').Value := false;
              end;
             // Testar Periodo tarifas
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataInicioLocacaoE').DataType := ftString;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataTerminiLocacaoE').DataType := ftString;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataInicioLocacaoI').DataType := ftString;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataInicioLocacaoE').Value := DataInicio;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataTerminiLocacaoE').Value := DataTermino;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataInicioLocacaoI').Value := DataInicio;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataInicioLocacaoE5').DataType := ftString;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataTerminiLocacaoE5').DataType := ftString;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataInicioLocacaoI6').DataType := ftString;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataInicioLocacaoE5').Value := DataInicio;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataTerminiLocacaoE5').Value := DataTermino;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('DataInicioLocacaoI6').Value := DataTermino;

            // Tarifa Basica
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa3').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoEmpresa3').Value := CodigoEmpresa;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade3').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoUnidade3').Value := CodigoUnidade;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo3').DataType := ftInteger;
            qryDescricaoTarifaProtecao.Parameters.ParamByName('CodigoGrupo3').Value := CodigoGrupo;

            qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas3').DataType := ftBoolean;
            if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas3').Value := true
            else
                 qryDescricaoTarifaProtecao.Parameters.ParamByName('TodasTarifas3').Value := false;
            qryDescricaoTarifaProtecao.Open;
            // atualiza parametros privados para campo calculado
            PCodigoEmpresa := CodigoEmpresa;
            PCodigoUnidade := CodigoUnidade;
            PCodigoGrupo := CodigoGrupo;
            PPeriodo := Periodo;
            DescricaoTarifa := TJSONArray.Create;
            while not qryDescricaoTarifaProtecao.Eof do
            begin
                 // atualiza parametros privados para campo calculado descricao da tarifa;
                 PDescricaoTarifa := qryDescricaoTarifaProtecaoDescricaoTarifa.Value;
                 Objeto := TJSONObject.Create;
                 GerouObjeto := true;
                 for I := 0 to qryDescricaoTarifaProtecao.FieldCount -1 do
                      Objeto.AddPair(qryDescricaoTarifaProtecao.Fields[I].DisplayLabel,TJSONString.Create(qryDescricaoTarifaProtecao.Fields[I].AsString));
                 DescricaoTarifa.AddElement(Objeto);
                 qryDescricaoTarifaProtecao.Next;
            end;
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(DescricaoTarifa.ToString));
       end;
  finally
       qryParametrosUnidade.Close;
       qryDescricaoTarifaProtecao.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.Tarifas(CodigoTarifaVeiculo: Integer): TStringStream;
var
  Objeto: TJSONObject;
  Tarifas: TJSONArray;
  I: Integer;
  GerouObjeto: Boolean;
begin
  try
       GerouObjeto:= false;
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            Tarifas := TJSONArray.Create;
            GerouObjeto:= true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            Tarifas.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Tarifas.ToString));
       end
       else
       begin
            try
                 if qryListaTarifaVeiculo.Active then
                      qryListaTarifaVeiculo.Close;
                 qryListaTarifaVeiculo.Parameters.ParamByName('CodigoTarifaVeiculo').DataType := ftInteger;
                 qryListaTarifaVeiculo.Parameters.ParamByName('CodigoTarifaVeiculo').Value := CodigoTarifaVeiculo;
                 qryListaTarifaVeiculo.Open;
                 Tarifas := TJSONArray.Create;
                 while not qryListaTarifaVeiculo.Eof do
                 begin
                      Objeto := TJSONObject.Create;
                      GerouObjeto:= true;
                      for I := 0 to qryListaTarifaVeiculo.FieldCount -1 do
                           Objeto.AddPair(qryListaTarifaVeiculo.Fields[I].FieldName, TJSONString.Create(qryListaTarifaVeiculo.Fields[I].AsString));
                      Tarifas.AddElement(Objeto);
                      qryListaTarifaVeiculo.Next;
                 end;
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Tarifas.ToString));
            except
                 Objeto := TJSONObject.Create;
                 Tarifas := TJSONArray.Create;
                 GerouObjeto:= true;
                 Objeto.AddPair('Erro','Erro insperado m�todo Tarifas');
                 Tarifas.AddElement(Objeto);
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Tarifas.ToString));
            end;
       end;
  finally
       qryListaTarifaVeiculo.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.updateCidades: TStringStream;
begin
  Result := Cidades;
end;

function TServerMetodos.updateDescricaoTarifa(CodigoEmpresa, CodigoUnidade,
  CodigoGrupo, Periodo: Integer; DataInicio,
  DataTermino: TDateTime): TStringStream;
begin
  Result := DescricaoTarifa(CodigoEmpresa,CodigoUnidade, CodigoGrupo,Periodo,DataInicio,DataTermino);
end;

function TServerMetodos.updateEmpresas(CodigoCidade: Integer): TStringStream;
begin
  Result := Empresas(CodigoCidade);
end;

function TServerMetodos.updateEnviarEmail(
  CodigoReserva: Integer): TStringStream;
begin
  Result := EnviarEmail(CodigoReserva);
end;

function TServerMetodos.updateGravarCliente(NomeCliente, CPF, Email,
  Telefone: String; CodigoEmpresa, CodigoUnidade: Integer; Passaporte, Celular,
  Sexo, Identidade, Logradouro, Bairro: String; Numero: Integer; Complemento,
  Cep, Estado, Cidade: String): TStringStream;
begin
  Result := GravarCliente(NomeCliente, CPF, Email, Telefone, CodigoEmpresa, CodigoUnidade,
                          Passaporte, Celular, Sexo, Identidade, Logradouro, Bairro, Numero,
                          Complemento, Cep, Estado, Cidade);
end;

function TServerMetodos.updateGravarServicoAdicionalReserva(CodigoReserva,
  CodigoServicoAdicional: Integer): TStringStream;
begin
  Result := GravarServicoAdicionalReserva(CodigoReserva, CodigoServicoAdicional);
end;

function TServerMetodos.updateGrupoVeiculos(CodigoEmpresa: Integer;
  Letra: String): TStringStream;
begin
  Result := GrupoVeiculos(CodigoEmpresa, Letra);
end;

function TServerMetodos.updateProtecoes: TStringStream;
begin
  Result := Protecoes;
end;

function TServerMetodos.updateReserva(CodigoEmpresa, CodigoUnidade,
  CodigoCliente, CodigoGrupo, CodigoProtecao, CodigoTarifa: Integer; DataInicio,
  DataTermino: TDateTime; HoraInicio, HoraTermino: String;
  CodigoMunicipioRetirada, CodigoMunicipioDevolucao, CodigoRegistro: Integer;
  Tipo: String): TStringStream;
begin
  Result := Reserva(CodigoEmpresa, CodigoUnidade, CodigoCliente, CodigoGrupo, CodigoProtecao,
                    CodigoTarifa, DataInicio, DataTermino, HoraInicio, HoraTermino, CodigoMunicipioRetirada,
                    CodigoMunicipioDevolucao, CodigoRegistro, Tipo);
end;

function TServerMetodos.updateServicosAdicionais(
  CodigoEmpresa: Integer): TStringStream;
begin
  Result := ServicosAdicionais(CodigoEmpresa);
end;

function TServerMetodos.updateServicosAdicionaisReserva(
  CodigoReserva: Integer): TStringStream;
begin
  Result := ServicosAdicionaisReserva(CodigoReserva);
end;

function TServerMetodos.updateTarifaProtecao(CodigoEmpresa, CodigoUnidade,
  CodigoGrupo, Periodo: Integer; DataInicio,
  DataTermino: TDateTime): TStringStream;
begin
  Result := TarifaProtecao(CodigoEmpresa, CodigoUnidade,CodigoGrupo,Periodo, DataInicio, DataTermino);
end;

function TServerMetodos.updateTarifas(
  CodigoTarifaVeiculo: Integer): TStringStream;
begin
  Result := Tarifas(CodigoTarifaVeiculo);
end;

function TServerMetodos.updateValorMinimoGrupo(CodigoEmpresa, CodigoUnidade,
  CodigoGrupo, Periodo: Integer; DataInicio,
  DataTermino: TDateTime): TStringStream;
begin
  Result := ValorMinimoGrupo(CodigoEmpresa, CodigoUnidade, CodigoGrupo, Periodo, DataInicio, DataTermino);
end;

function TServerMetodos.updateVerificaClienteCadastrado(
  CPFPassaporte: String): TStringStream;
begin
  Result := VerificaClienteCadastrado(CPFPassaporte);
end;

function TServerMetodos.ValidaHorarioFuncionamento(Data: TDateTime;
  Hora: String; CodigoEmpresa, CodigoUnidade: Integer): Boolean;
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

function TServerMetodos.ValidaHorasAntecedenciaAbertura(DataInicio: TDateTime;
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

function TServerMetodos.ValidaLimiteAprovacao(DataTermino,
  DataInicio: TDateTime; CodigoUnidadeRetirada,
  CodigoEmpresa: Integer): Boolean;
begin
  try
       if qryParametrosUnidade.Active then
            qryParametrosUnidade.Close;
       qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
       qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
       qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
       qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidadeRetirada;
       qryParametrosUnidade.Open;
       if qryParametrosUnidadeLimiteDiasAprovacaoWeb.Value < (DataTermino - DataInicio) then
            Result := false
       else
            Result := true;
  finally
       if qryParametrosUnidade.Active then
            qryParametrosUnidade.Close;
  end;
end;

function TServerMetodos.ValorMinimoGrupo(CodigoEmpresa, CodigoUnidade,
  CodigoGrupo, Periodo: Integer; DataInicio,
  DataTermino: TDateTime): TStringStream;
var
  Objeto: TJSONObject;
  Valor: TJSONArray;
  I: Integer;
  GerouObjeto: Boolean;
begin
  try
       GerouObjeto := false;
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            Valor := TJSONArray.Create;
            GerouObjeto := true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            Valor.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Valor.ToString));
       end
       else
       begin
            try
                  if qryParametrosUnidade.Active then
                       qryParametrosUnidade.Close;
                  qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                  qryParametrosUnidade.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                  qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                  qryParametrosUnidade.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                  qryParametrosUnidade.Open;
                  if qryMenorTarifaPorGrupo.Active then
                       qryMenorTarifaPorGrupo.Close;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa1').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa2').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa4').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa5').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa6').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa').Value := CodigoEmpresa;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa1').Value := CodigoEmpresa;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa2').Value := CodigoEmpresa;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa4').Value := CodigoEmpresa;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa5').Value := CodigoEmpresa;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa6').Value := CodigoEmpresa;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade1').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade2').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade4').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade5').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade6').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade').Value := CodigoUnidade;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade1').Value := CodigoUnidade;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade2').Value := CodigoUnidade;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade4').Value := CodigoUnidade;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade5').Value := CodigoUnidade;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade6').Value := CodigoUnidade;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo1').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo2').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo4').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo5').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo6').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo').Value := CodigoGrupo;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo1').Value := CodigoGrupo;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo2').Value := CodigoGrupo;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo4').Value := CodigoGrupo;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo5').Value := CodigoGrupo;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo6').Value := CodigoGrupo;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo').DataType := ftSmallint;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo1').DataType := ftSmallint;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo2').DataType := ftSmallint;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo4').DataType := ftSmallint;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo5').DataType := ftSmallint;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo6').DataType := ftSmallint;
                  if Periodo >= 7 then
                  begin
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo').Value := 7;
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo1').Value := 7;
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo2').Value := 7;
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo4').Value := 7;
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo5').Value := 7;
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo6').Value := 7;
                  end
                  else
                  begin
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo').Value := 1;
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo1').Value := 1;
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo2').Value := 1;
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo4').Value := 1;
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo5').Value := 1;
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('Periodo6').Value := 1;
                  end;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas').DataType := ftBoolean;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas1').DataType := ftBoolean;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas2').DataType := ftBoolean;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas4').DataType := ftBoolean;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas5').DataType := ftBoolean;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas6').DataType := ftBoolean;
                  if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
                    begin
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas').Value := true;
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas1').Value := true;
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas2').Value := true;
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas4').Value := true;
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas5').Value := true;
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas6').Value := true;
                    end
                  else
                    begin
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas').Value := false;
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas1').Value := false;
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas2').Value := false;
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas6').Value := false;
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas4').Value := false;
                         qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas5').Value := false;
                    end;
                   // Testar Periodo tarifas
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataInicioLocacaoE').DataType := ftString;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataTerminiLocacaoE').DataType := ftString;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataInicioLocacaoI').DataType := ftString;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataInicioLocacaoE').Value := DataInicio;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataTerminiLocacaoE').Value := DataTermino;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataInicioLocacaoI').Value := DataInicio;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataInicioLocacaoE5').DataType := ftString;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataTerminiLocacaoE5').DataType := ftString;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataInicioLocacaoI6').DataType := ftString;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataInicioLocacaoE5').Value := DataInicio;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataTerminiLocacaoE5').Value := DataTermino;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('DataInicioLocacaoI6').Value := DataTermino;

                  // Tarifa Basica
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa3').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoEmpresa3').Value := CodigoEmpresa;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade3').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoUnidade3').Value := CodigoUnidade;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo3').DataType := ftInteger;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('CodigoGrupo3').Value := CodigoGrupo;
                  qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas3').DataType := ftBoolean;
                  if qryParametrosUnidadeMostrarTarifasKmLivre.Value = 'S' then
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas3').Value := true
                  else
                       qryMenorTarifaPorGrupo.Parameters.ParamByName('TodasTarifas3').Value := false;
                  qryMenorTarifaPorGrupo.Open;
                  Valor := TJSONArray.Create;
                  while not qryMenorTarifaPorGrupo.Eof do
                  begin
                       Objeto := TJSONObject.Create;
                       GerouObjeto := true;
                       for I := 0 to qryMenorTarifaPorGrupo.FieldCount -1 do
                             Objeto.AddPair(qryMenorTarifaPorGrupo.Fields[I].FieldName, TJSONString.Create(qryMenorTarifaPorGrupo.Fields[I].AsString));
                       Valor.AddElement(Objeto);
                       qryMenorTarifaPorGrupo.Next;
                  end;
                  Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Valor.ToString));
            except
                 Objeto := TJSONObject.Create;
                 Valor := TJSONArray.Create;
                 GerouObjeto := true;
                 Objeto.AddPair('Erro','Erro insperado m�todo Valor M�nimo Grupo');
                 Valor.AddElement(Objeto);
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Valor.ToString));
            end;
       end;
  finally
       qryMenorTarifaPorGrupo.Close;
       qryParametrosUnidade.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

function TServerMetodos.VerificaClienteCadastrado(
  CPFPassaporte: String): TStringStream;
var
  Objeto: TJSONObject;
  Cliente: TJSONArray;
  I: Integer;
  GerouObjeto: Boolean;
begin
  try
       if not ConectaBanco then
       begin
            Objeto := TJSONObject.Create;
            Cliente := TJSONArray.Create;
            GerouObjeto := true;
            Objeto.AddPair('Erro','Erro ao conectar ao banco de dados');
            Cliente.AddElement(Objeto);
            Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Cliente.ToString));
       end
       else
       begin
            try
                 GerouObjeto := false;
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
                 if qryClienteCadastrado.IsEmpty then
                 begin
                      Cliente := TJSONArray.Create;
                      Objeto := TJSONObject.Create;
                      GerouObjeto := true;
                      Objeto.AddPair('Cliente','Cliente n�o cadastrado');
                      Cliente.AddElement(Objeto);
                      Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Cliente.ToString));
                 end
                 else
                 begin
                      Cliente := TJSONArray.Create;
                      while not qryClienteCadastrado.Eof do
                      begin
                           Objeto := TJSONObject.Create;
                           GerouObjeto := true;
                           for I := 0 to qryClienteCadastrado.FieldCount -1 do
                                Objeto.AddPair(qryClienteCadastrado.Fields[I].FieldName, TJSONString.Create(qryClienteCadastrado.Fields[I].AsString));
                           Cliente.AddElement(Objeto);
                           qryClienteCadastrado.Next;
                      end;
                      Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Cliente.ToString));
                 end;
            except
                 Objeto := TJSONObject.Create;
                 Cliente := TJSONArray.Create;
                 GerouObjeto := true;
                 Objeto.AddPair('Erro','Erro m�todo Verifica Cliente Cadastrado');
                 Cliente.AddElement(Objeto);
                 Result := TStringStream.Create(TEncoding.UTF8.GetBytes(Cliente.ToString));
            end;
       end;
  finally
       qryClienteCadastrado.Close;
       if GerouObjeto then
            Objeto.Free;
       adcBancoDados.Connected := false;
       adcControle.Connected := false;
  end;
end;

end.
