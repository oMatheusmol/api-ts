export default interface IReserva {
  CodigoReserva: number;
  CodigoEmpresa: number;
  CodigoUnidade: number;
  CodigoCliente: number;
  CodigoGrupoVeiculos: number;
  CodigoGrupo: number;
  CodigoProtecao: number;
  CodigoTarifaVeiculo: number;
  CodigoTarifa: number;
  LocalEntregaCodigoMunicipio: number;
  LocalDevolucaoCodigoMunicipio: number;
  DataHoraInicio?: string;
  DataHoraTermino?: string;
  DataInicio: string;
  DataTermino: string;
  HoraInicio: string;
  HoraTermino: string;
  CodigoLocalRetirada: number;
  CPF: string; 
  CNPJ: string;
  CodigoMunicipioRetirada: number;
  CodigoMunicipioDevolucao: number;
  Origem: string;
  RequisicaoItensProtecao: Array<number>;
  RequisicaoServicoAdicional: Array<number>;
  Adicionais: Array<number>;
  ServicosAdicionais: Array<any>;
  ValorLocacaoJovem: string;
  ObservacaoReserva: string;
}
