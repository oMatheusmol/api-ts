unit URotinasSistema;

interface

uses
  Forms, Classes, Buttons, Windows, vcl.Graphics, ADODB, WinInet, GetNum, Dbgetnum,
  Getstr, Dbgetstr, IdHTTP, SHDocVw, ActiveX, QueryPlus, TLHelp32, SysUtils,
  Soap.EncdDecd, MidasLib, DB, DBCtrls, DBXJSON;

type
  TOpenForm=(ofNormal,ofAppend,ofEdit,ofView);
  TPosition=(poLeft,poRight,poAnywhere);
  TEstado = (esInclusao,esAlteracao,esBrowse);
  TConjuntoMascara = set of char;

const
  VK_I = $49;
  VK_A = $41;
  VK_G = $47;
  VK_E = $45;
  VK_C = $43;
  VK_T = $54;
  VK_L = $4C;
  VK_F = $46;
  cjNumeroReal: TConjuntoMascara = [' ','.'];
  cjNumeroInteiro: TConjuntoMascara = [' '];
  cjHora: TConjuntoMascara = [':'];
  cjMoedaReal: TConjuntoMascara = ['R','$',' ','.'];
  cjMoedaDolar: TConjuntoMascara = ['U','S','$',' ','.'];
  cjMoedaLibra: TConjuntoMascara = ['£',' ','.'];
  cjTelefone: TConjuntoMascara = ['(',')','-'];
  cjPercentual: TConjuntoMascara = ['%'];
  cjCNPJCPF: TConjuntoMascara = ['.','/','-'];
  cjAlfabeto: TConjuntoMascara = ['q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','k','l','ç','z','x','c','v','b','n','m',
                                  'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Ç','Z','X','C','V','B','N','M'];
  cjCaracteresEspecial: TConjuntoMascara = ['@','£','¢','¡'];

  clVerde = $00C6FFD5;
  clVermelho = $008292FF;
  clAmarelo = $00B7FCFF;

{Valida data no formato ddmmaa ou no formato ddmmaaaa}
function DataValida(Dado: string): boolean;

{Valida sigla de estados brasileiros}
function EstadoValido(Dado: string): boolean;

{Valida dígito verificador de CNPJ}
function CNPJValido(Dado: string): boolean;

{Valida dígito verificador de CPF}
function CPFValido(Dado: string): boolean;

{Valida hora no formato hh(24)}
function HoraValida(Dado: string): boolean;

{Valida hora/minuto no formato hhmm(24)}
function HoraMinutoValidos(Dado: string): boolean;

{Valida hora/minuto/segundo no formato hhmmss(24)}
function HoraMinutoSegundoValidos(Dado: string): boolean;

{Valida se o ano da data ddmmaa ou ddmmaaaa é o mesmo do ano corrente}
function AnoCorrenteValido(Dado: string): boolean;

{Valida se o mês da data ddmmaa ou ddmmaaaa é o mesmo do mês corrente}
function MesCorrenteValido(Dado: string): boolean;

{Valida se o mês/ano da data ddmmaa ou ddmmaaaa é o mesmo do mês/ano corrente}
function MesAnoCorrenteValidos(Dado: string): boolean;

{Valida se o mês/ano da data no formato mmaa ou mmaaaa são válidos}
function MesAnoValidos(Dado: string): boolean;

{ Cascateia a janela filha em relação as outras janelas em aplicações MDI }
procedure AtualizaPosicaoJanela(Form : TForm);

{ Deleta um diretório }
procedure ExcluiDiretorio(const Directory: string);

{ Descobre o diretório pai }
function DiretorioPai(NomeDir : string) : string;

{ Descobre o diretório Windows }
function DiretorioWindows : string;

{ Descobre a versão do Windows }
function VersaoWindows: string;

{ Descobre o nome do usuário Windows }
function UsuarioCorrente: string;

{ Completa uma string com brancos }
function Masc(St: string; Tam: integer) : string;

{ Completa uma string com Zero a Esquerda }
function MascNum(St: string; Tam: integer) : string;

{ Remove máscara de números }
function RemoveMascNum(St: string; ConjuntoMascara: TConjuntoMascara): extended;

{ Remove máscara de strings }
function RemoveMascSt(St: string; ConjuntoMascara: TConjuntoMascara): string;

{ Coloca as primeiras letras das palavras de uma string em maiúsculas }
function PrimeiraMaiuscula(Campo: string): string;

{ Coloca a primeira letra de uma frase em maiúscula }
function PrimeiraMaiusculaFrase(Campo: string): string;

{ Escreve um número por extenso }
function NumeroExtenso(NumValor: extended) : string;

{ Escreve um valor por extenso }
function Extenso(NumValor: extended) : string;

{ Imprime direto na porta Paralela Computador }
function Imprimir(NomeArquivo, Fonte: string; Tamanho: integer; Estilo: TFontStyles; LinhasPorPagina: double): boolean;

{ Devolve as iniciais de um nomne }
function Iniciais(Nome: string): string;

{Converte um TXT para uma string}
function TXTParaString(Arquivo: string): string;

{ Descobre o número de integers de um arquivo }
function Tamanhointegers(Tamanho: extended): string;

{ Descobre o tamanho em integers ou Kintegers ou Mintegers ou Gintegers de um arquivo }
function TamanhoArquivo(NomeArquivo: string): string;

{ Descobre o número de integers de um arquivo e o retorna em número inteiro }
function TamanhoArquivoInt(NomeArquivo: string): extended;

{ Substitui as ocorrências de uma substring dentro de uma string por outra substring }
function Substitui(St,De,Para: string; NumVezes: word): string;

{ Garante que uma string contem caracteres válidos para nomes de arquivo }
function NormalizaNomeArquivo(St: string): string;

{ Envia um arquivo para a lixeira }
function EnviarLixeira(Arquivo: String): Boolean;

{ Descobre o espaço livre em integers de uma unidade }
function EspacoLivre(Diretorio: string): Int64;

{ Descobre o espaço total em integers de uma unidade }
function EspacoTotal(Diretorio: string): Int64;

{ Converte os acentos de uma string para caracteres sem acento }
function ConverteAcento(Campo: string): string;

{ Gera uma senha padrão para aplicações }
function GeraSenha: string;

{ Gera uma chave temporária para entradas de dados Master/Detail }
function ChaveTemporaria: integer;

{ Abre um arquivo de acordo com o programa associado no Windows }
function AbreArquivo(NomeArquivo: string): boolean;

{ Cria atalho (.lnk) para um arquivo }
function CriaAtalho(Objeto, IniciarEm, Descricao, ArquivoIcone: string;
                    IndiceIcone, ModoJanela: integer; NomeAtalho: WideString): boolean;

{ Executa uma conexão de rede }
function ConexaoRede(NomeLocal, NomeRemoto, NomeUsuario, Senha: string;
                     dwType, dwScope, dwDisplayType, dwUsage: LongWord): string;

{ Verifica se um arquivo esta em uso (aberto)}
function ArquivoEmUso(NomeArquivo: string): boolean;

{ Aguarda um número de mili-segundos }
procedure Espera(Delta: integer);

{ Copia o arquivo origem para destino }
function CopiaArquivo(Origem, Destino: string): boolean;

{ Corta casas decimais de números reais }
function CortaCasas(Valor: extended; Casas: integer): extended;

{ Alinha String a Direita }
function Alinha(St: string; Tam: integer) : string;

{ Coloca Máscara no CPF }
function CPFComMascara(CPF: string): string;

{ Coloca Máscara no CNPJ }
function CNPJComMascara(CNPJ: string): string;

{ Coloca Máscara no CEP }
function CEPComMascara(CEP: string): string;

{ Coloca Máscara no Telefone }
function TelefoneComMascara(Telefone: string): string;

{ Criptografa Senha }
function Criptografa(Senha: string): string;

{ Descriptografa Senha }
function Descriptografa(Senha: string): string;

{ Coloca Máscara na Placa }
function PlacaComMascara(Placa: string): string;

{ Informa data atual considerando fuso horário e horário de verão }
function DateAjustado: TDateTime;

{ Informa data e hora atual considerando fuso horário e horário de verão }
function NowAjustado: TDateTime;

{ Informa hora atual considerando fuso horário e horário de verão }
function TimeAjustado: TDateTime;

{ mensagem mtWarning }
function Advertencia(Msg: String): Boolean;

{ mensagem mtWarning }
procedure Cancela(Msg: String);

{ mensagem mtInformation }
function Informacao(Msg: String): Boolean;

{ mensagem mtConfirmation }
function Confirme(Msg: String): Boolean;

function ConverteData(DataIni: String):String;

{ Retorna um result set }
function ResultadoSql(pSql: string): variant;

{ Função que executa o comando SQL
  Ideal para INSERT e UPDATE
  Retorna verdadeiro se o comando for concluído com sucesso }
procedure ExecuteDML(comandoSql: string);

{Função para deletar arquivos temporários internet}
function ClearTempInternetFiles : Boolean;

{Função para trocar a impressora padrão do windows}
function TrocaImpressoraPadrao(pNomeNovaImpressora: string):boolean;

{Função para ajustar o telefone com os novos digitos. Ex: Digito "9" de São Paulo}
function AjustaMascaraTelefone(Valor: string):string;

{Função para corrigir o telefone com os novos digitos entrada de dados}
procedure AjustaTelefone(Componente: TObject);

{Função para pesquisar cep no site dos correios}
function PesquisarCep(Cep: string): TStringList;

{Função para Criptografia Nova}
function CriptografaNova(Campo: String): String;

{Função para Descriptografia Nova}
function DescriptografaNova(Campo: String): String;

{Função para validar email - 25/06/2014 Felipe Barbalho}
function ValidarEmail(aStr: string): Boolean;

{Função para validar email - 26/06/2014 Felipe Barbalho}
function ValidarTelefone(aStr: string): Boolean;

{Função para lê o html e exibir o mesmo em um web browser}
procedure LerHtml(WebBrowser: TWebBrowser; html: TStringList);

{Função para matar um processo}
function MatarProcesso(NomeArquivo: String): Integer;

{Função retorna o mes por extenso}
function MesExtenso2(NumMes:byte):String;

{Função para trazer a data por extenso}
function DataPorExtenso(Data:TDate):String;

{Função para formatar a Hora}
function FormataHora(Tempo:Extended):String;

//Serializa field para arquivo JSON
function ConverteJSON(field: TField): TJSONValue;

//limpa a memoria dos processos
function LiberarMemoria: Boolean;
// função para listar data hora do arquivo
function FileTimeToDTime(FTime: TFileTime): TDateTime;

function DataCriacaoArquivo(Arquivo:String):TDateTime;

implementation

uses
  ShellAPI, WinTypes, WinProcs, Controls, StdCtrls, Tabs,
  ExtCtrls, Grids, Dialogs, Menus, FileCtrl,
  ShlObj, ComObj, Printers, Winspool;

function DataValida(Dado: string): boolean;
var
  SalvaFormato,
  DataExterna,
  Separador: string;
  DataInterna: TDateTime;
begin
  DataInterna := 0;
  Result := true;
  Separador := System.SysUtils.FormatSettings.DateSeparator;
  while Pos(Separador, Dado) > 0 do
       Delete(Dado, Pos(Separador, Dado), 1);
  if Length(Dado) = 6 then
       Dado := Copy(Dado,1,2) + Separador +
               Copy(Dado,3,2) + Separador + '19' +
               Copy(Dado,5,2)
  else
       if Length(Dado) = 8 then
            Dado := Copy(Dado,1,2) + Separador +
                    Copy(Dado,3,2) + Separador +
                    Copy(Dado,5,4)
       else
            Result := false;
  if Result then
  begin
       SalvaFormato := System.SysUtils.FormatSettings.ShortDateFormat;
       try
           System.SysUtils.FormatSettings.ShortDateFormat := 'd' + Separador + 'm' + Separador + 'y';
           DataInterna := StrToDate(Dado);
       except
           on EConvertError do
           begin
                Result := false;
                System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
           end;
       end;
       if Result then
       begin
            try
                System.SysUtils.FormatSettings.ShortDateFormat := 'dd' + Separador + 'mm' + Separador + 'yyyy';
                DataExterna := DateToStr(DataInterna);
            except
                on EConvertError do
                begin
                     Result := false;
                     System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
                end;
            end;
            if Result and (DataExterna <> Dado) then
                 Result := false;
       end;
       System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
  end;
end; {DataValida}

function EstadoValido(Dado: string): boolean;
const
  Estados = 'SPMGRJRSSCPRESDFMTMSGOTOBASEALPBPEMARNCEPIPAAMAPFNACRRRO';
var
  Posicao: integer;
begin
  Result := true;
  if Dado <> '' then
  begin
       Posicao := Pos(UpperCase(Dado),Estados);
       if (Posicao = 0) or ((Posicao mod 2) = 0) or (Length(Dado) <> 2) then
            Result := false
  end;
end; {EstadoValido}

function CNPJValido(Dado : string) : boolean;
var
  D1: array[1..12] of integer;
  I,
  DF1,
  DF2,
  DF3,
  DF4,
  DF5,
  DF6,
  Resto1,
  Resto2,
  PrimeiroDigito,
  SegundoDigito: integer;
begin
  Result := true;
  if Length(Dado) = 14 then
  begin
       for I := 1 to 12 do
            if Dado[I] in ['0'..'9'] then
                 D1[I] := StrToInt(Dado[I])
            else
                 Result := false;
       if Result then
       begin
            DF1 := 5*D1[1] + 4*D1[2] + 3*D1[3] + 2*D1[4] + 9*D1[5] + 8*D1[6] +
                   7*D1[7] + 6*D1[8] + 5*D1[9] + 4*D1[10] + 3*D1[11] + 2*D1[12];
            DF2 := DF1 div 11;
            DF3 := DF2 * 11;
            Resto1 := DF1 - DF3;
            if (Resto1 = 0) or (Resto1 = 1) then
                 PrimeiroDigito := 0
            else
                 PrimeiroDigito := 11 - Resto1;
            DF4 := 6*D1[1] + 5*D1[2] + 4*D1[3] + 3*D1[4] + 2*D1[5] + 9*D1[6] +
                   8*D1[7] + 7*D1[8] + 6*D1[9] + 5*D1[10] + 4*D1[11] + 3*D1[12] +
                   2*PrimeiroDigito;
            DF5 := DF4 div 11;
            DF6 := DF5 * 11;
            Resto2 := DF4 - DF6;
            if (Resto2 = 0) or (Resto2 = 1) then
                 SegundoDigito := 0
            else
                 SegundoDigito := 11 - Resto2;
            if (PrimeiroDigito <> StrToInt(Dado[13])) or
               (SegundoDigito <> StrToInt(Dado[14])) then
                 Result := false;
       end;
  end
  else
       if Length(Dado) <> 0 then
            Result := false;
end; {CNPJValido}

function CPFValido(Dado: string): boolean;
var
  D1: array[1..9] of integer;
  I,
  DF1,
  DF2,
  DF3,
  DF4,
  DF5,
  DF6,
  Resto1,
  Resto2,
  PrimeiroDigito,
  SegundoDigito: integer;
  Igual: boolean;
begin
  Result := true;
  Igual := true;
  if Length(Dado) = 11 then
  begin
       for I := 1 to 9 do
            if Dado[I] in ['0'..'9'] then
                 D1[I] := StrToInt(Dado[I])
            else
                 Result := false;
       for I := 1 to 10 do
            if (Dado[I] <> Dado[I+1]) and Igual then
                   Igual := false;
       if Igual then
           Result := false;
       if Result then
       begin
            DF1 := 10*D1[1] + 9*D1[2] + 8*D1[3] + 7*D1[4] + 6*D1[5] + 5*D1[6] +
                   4*D1[7] + 3*D1[8] + 2*D1[9];
            DF2 := DF1 div 11;
            DF3 := DF2 * 11;
            Resto1 := DF1 - DF3;
            if (Resto1 = 0) or (Resto1 = 1) then
                 PrimeiroDigito := 0
            else
                 PrimeiroDigito := 11 - Resto1;
            DF4 := 11*D1[1] + 10*D1[2] + 9*D1[3] + 8*D1[4] + 7*D1[5] + 6*D1[6] +
                   5*D1[7] + 4*D1[8] + 3*D1[9] + 2*PrimeiroDigito;
            DF5 := DF4 div 11;
            DF6 := DF5 * 11;
            Resto2 := DF4 - DF6;
            if (Resto2 = 0) or (Resto2 = 1) then
                 SegundoDigito := 0
            else
                 SegundoDigito := 11 - Resto2;
            if (PrimeiroDigito <> StrToInt(Dado[10])) or
               (SegundoDigito <> StrToInt(Dado[11])) then
                 Result := false;
       end;
  end
  else
       if Length(Dado) <> 0 then
            Result := false;
end; {CPFValido}

function HoraValida(Dado: string): boolean;
var
  Hora: integer;
begin
  Result := true;
  Hora := 0;
  try
       Hora := StrToIntDef(Dado,99);
  except
       on EConvertError do
            Result := false;
  end;
  if Result and
     (Hora > 23) then
       Result := false;
end; {HoraValida}

function HoraMinutoValidos(Dado: string): boolean;
var
  Hora,
  Minuto: integer;
begin
  Result := true;
  Hora := 0;
  Minuto := 0;
  try
       Hora := StrToIntDef(Copy(Dado,1,2),99);
       Minuto := StrToIntDef(Copy(Dado,3,2),99);
  except
       on EConvertError do
            Result := false;
  end;
  if Result and
     ((Hora > 23) or
      (Minuto > 59)) then
       Result := false;
end; {HoraMinutoValidos}

function HoraMinutoSegundoValidos(Dado: string): boolean;
var
  Hora,
  Minuto,
  Segundo: integer;
begin
  Result := true;
  Hora := 0;
  Minuto := 0;
  Segundo := 0;
  try
       Hora := StrToIntDef(Copy(Dado,1,2),99);
       Minuto := StrToIntDef(Copy(Dado,3,2),99);
       Segundo := StrToIntDef(Copy(Dado,5,2),99);
  except
       on EConvertError do
            Result := false;
  end;
  if Result and
     ((Hora > 23) or
      (Minuto > 59) or
      (Segundo > 59)) then
       Result := false;
end; {HoraMinutoSegundoValidos}

function AnoCorrenteValido(Dado: string): boolean;
var
  SalvaFormato,
  DataExterna,
  Hoje: string;
  DataInterna: TDateTime;
begin
  Result := true;
  DataInterna := 0;
  if Length(Dado) = 6 then
       Dado := Copy(Dado,1,2) + '/' +
               Copy(Dado,3,2) + '/19' +
               Copy(Dado,5,2)
  else
       if Length(Dado) = 8 then
            Dado := Copy(Dado,1,2) + '/' +
                    Copy(Dado,3,2) + '/' +
                    Copy(Dado,5,4)
       else
            Result := false;
  if Result then
  begin
       SalvaFormato := System.SysUtils.FormatSettings.ShortDateFormat;
       try
           System.SysUtils.FormatSettings.ShortDateFormat := 'd/m/y';
           DataInterna := StrToDate(Dado);
       except
           on EConvertError do
           begin
                Result := false;
                System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
           end;
       end;
       if Result then
       begin
            try
                System.SysUtils.FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
                DataExterna := DateToStr(DataInterna);
            except
                on EConvertError do
                begin
                     Result := false;
                     System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
                end;
            end;
            if Result then
            begin
                 System.SysUtils.FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
                 Hoje := DateToStr(Date);
                 if (DataExterna <> Dado) or
                    (Copy(Hoje,5,4) <> Copy(Dado,5,4)) then
                      Result := false;
            end;
       end;
       System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
  end;
end; {AnoCorrenteValido}

function MesCorrenteValido(Dado: string): boolean;
var
  SalvaFormato,
  DataExterna,
  Hoje: string;
  DataInterna: TDateTime;
begin
  Result := true;
  DataInterna := 0;
  if Length(Dado) = 6 then
       Dado := Copy(Dado,1,2) + '/' +
               Copy(Dado,3,2) + '/19' +
               Copy(Dado,5,2)
  else
       if Length(Dado) = 8 then
            Dado := Copy(Dado,1,2) + '/' +
                    Copy(Dado,3,2) + '/' +
                    Copy(Dado,5,4)
       else
            Result := false;
  if Result then
  begin
       SalvaFormato := System.SysUtils.FormatSettings.ShortDateFormat;
       try
           System.SysUtils.FormatSettings.ShortDateFormat := 'd/m/y';
           DataInterna := StrToDate(Dado);
       except
           on EConvertError do
           begin
                Result := false;
                System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
           end;
       end;
       if Result then
       begin
            try
                System.SysUtils.FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
                DataExterna := DateToStr(DataInterna);
            except
                on EConvertError do
                begin
                     Result := false;
                     System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
                end;
            end;
            if Result then
            begin
                 System.SysUtils.FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
                 Hoje := DateToStr(Date);
                 if (DataExterna <> Dado) or
                    (Copy(Hoje,3,2) <> Copy(Dado,3,2)) then
                      Result := false;
            end;
       end;
       System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
  end;
end; {MesCorrenteValido}

function MesAnoCorrenteValidos(Dado: string): boolean;
var
  SalvaFormato,
  DataExterna,
  Hoje: string;
  DataInterna: TDateTime;
begin
  Result := true;
  DataInterna := 0;
  if Length(Dado) = 6 then
       Dado := Copy(Dado,1,2) + '/' +
               Copy(Dado,3,2) + '/19' +
               Copy(Dado,5,2)
  else
       if Length(Dado) = 8 then
            Dado := Copy(Dado,1,2) + '/' +
                    Copy(Dado,3,2) + '/' +
                    Copy(Dado,5,4)
       else
            Result := false;
  if Result then
  begin
       SalvaFormato := System.SysUtils.FormatSettings.ShortDateFormat;
       try
           System.SysUtils.FormatSettings.ShortDateFormat := 'd/m/y';
           DataInterna := StrToDate(Dado);
       except
           on EConvertError do
           begin
                Result := false;
                System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
           end;
       end;
       if Result then
       begin
            try
                System.SysUtils.FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
                DataExterna := DateToStr(DataInterna);
            except
                on EConvertError do
                begin
                     Result := false;
                     System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
                end;
            end;
            if Result then
            begin
                 System.SysUtils.FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
                 Hoje := DateToStr(Date);
                 if (DataExterna <> Dado) or
                    (Copy(Hoje,3,7) <> Copy(Dado,3,7)) then
                      Result := false;
            end;
       end;
       System.SysUtils.FormatSettings.ShortDateFormat := SalvaFormato;
  end;
end; {MesAnoCorrenteValidos}

function MesAnoValidos(Dado: string): boolean;
begin
  Result := DataValida('01'+Dado);
end; {MesAnoValidos}

procedure AtualizaPosicaoJanela(Form : TForm);
begin
  if Application.MainForm.MDIChildCount <= 1 then
  begin
       Form.Left := 0;
       Form.Top := 0;
  end
  else
  begin
       Form.Left := Application.MainForm.ActiveMDIChild.Left + 20;
       Form.Top := Application.MainForm.ActiveMDIChild.Top + 20;
  end;
  Form.ShowHint := Application.MainForm.ShowHint;
end; {AtualizaPosicaoJanela}

procedure ExcluiDiretorio(const Directory: string); //nelson 27-02-2002
var
  DrivesPathsBuff: array[0..1024] of char;
  DrivesPaths: string;
  Len: LongWord;
  ShortPath: array[0..MAX_PATH] of char;
  Dir: TFileName;

  procedure DelTree(const Directory: TFileName);
  var
    SearchRec: TSearchRec;
    Attributes: LongWord;
    ShortName,
    FullName: TFileName;
    PName: PChar;
  begin
       if FindFirst(Directory + '*',faAnyFile and not faVolumeID,SearchRec) = 0 then
       begin
            try
                 repeat
                      if SearchRec.FindData.cAlternateFileName[0] = #0 then
                           ShortName := SearchRec.Name
                      else
                           ShortName := SearchRec.FindData.cAlternateFileName;
                      FullName := Directory + ShortName;
                      if (SearchRec.Attr and faDirectory) <> 0 then
                      begin
                           if (ShortName <> '.') and (ShortName <> '..') then
                                DelTree(FullName + '\');
                      end
                      else
                      begin
                           PName := PChar(FullName);
                           Attributes := GetFileAttributes(PName);
                           if Attributes = $FFFFFFFF then
                                raise EInOutError.Create(SysErrorMessage(GetLastError));
                           if (Attributes and FILE_ATTRIBUTE_READONLY) <> 0 then
                                SetFileAttributes(PName,Attributes and not FILE_ATTRIBUTE_READONLY);
                           if Windows.DeleteFile(PName) = False then
                                raise EInOutError.Create(SysErrorMessage(GetLastError));
                      end;
                 until FindNext(SearchRec) <> 0;
            except
                 //FindClose(SearchRec);
                 raise;
            end;
            //FindClose(SearchRec);
       end;
       if Pos(#0 + Directory + #0, DrivesPaths) = 0 then
       begin
            PName := PChar(Directory);
            Attributes := GetFileAttributes(PName);
            if Attributes = $FFFFFFFF then
                 raise EInOutError.Create(SysErrorMessage(GetLastError));
            if (Attributes and FILE_ATTRIBUTE_READONLY) <> 0 then
                 SetFileAttributes(PName,Attributes and not FILE_ATTRIBUTE_READONLY);
            if not Windows.RemoveDirectory(PName) then
                 raise EInOutError.Create(SysErrorMessage(GetLastError));
       end;
  end;

begin
  DrivesPathsBuff[0] := #0;
  Len := GetLogicalDriveStrings(1022,@DrivesPathsBuff[1]);
  if Len = 0 then
       raise EInOutError.Create(SysErrorMessage(GetLastError));
  SetString(DrivesPaths,DrivesPathsBuff,len + 1);
  DrivesPaths := Uppercase(DrivesPaths);
  Len := GetShortPathName(PChar(Directory), ShortPath, MAX_PATH);
  if Len = 0 then
    raise EInOutError.Create(SysErrorMessage(GetLastError));
  SetString(dir,ShortPath,Len);
  dir := Uppercase(Dir);
  DelTree(IncludeTrailingPathDelimiter(Dir));
end; { ExcluiDiretorio }

function DiretorioPai(NomeDir: string): string;
begin
  if NomeDir <> '' then
  begin
       NomeDir := ExcludeTrailingPathDelimiter(NomeDir);
       while (NomeDir[Length(NomeDir)] <> '\') and (Length(NomeDir) > 0) do
            Delete(NomeDir,Length(NomeDir),1);
       if (Length(NomeDir) > 0) then
            Delete(NomeDir,Length(NomeDir),1);
       Result := NomeDir;
  end;
end; {DiretorioPai}

function DiretorioWindows: string;
var
  Buffer: array[0..144] of char;
begin
  GetWindowsDirectory(Buffer,144);
  Result := StrPas(Buffer);
end; {DiretorioWindows}

function VersaoWindows: string;
var
  VerInfo: TOSVersionInfo;
begin
  Result := '';
  VerInfo.dwOSVersionInfoSize := SizeOf(VerInfo);
  GetVersionEx(VerInfo);
  case VerInfo.dwPlatformID of
       VER_PLATFORM_WIN32S:
            Result := Result + 'Windows 3.1x running Win32s ';
       VER_PLATFORM_WIN32_WINDOWS:
            if IntToStr(VerInfo.dwMajorVersion) + '.' + IntToStr(VerInfo.dwMinorVersion) < '4.10' then
                 Result := Result + 'Windows 95 ' + VerInfo.szCSDVersion + ' '
            else
                 Result := Result + 'Windows 98 ' + VerInfo.szCSDVersion + ' ';
       VER_PLATFORM_WIN32_NT:
            Result := Result + 'Windows NT ';
  end;
  Result := Result + IntToStr(VerInfo.dwMajorVersion) + '.' + IntToStr(VerInfo.dwMinorVersion) + ' ';
  Result := Result + '(Build ' +  IntToStr(LoWord(VerInfo.dwBuildNumber)) + ') ';
  if VerInfo.dwPlatformID = VER_PLATFORM_WIN32_NT then
       Result := Result + VerInfo.szCSDVersion;
end; {VersaoWindows}

function UsuarioCorrente: string;
var
  Len: Cardinal;
begin
  Len := 255;
  SetLength(Result, Len - 1);
  if GetUserName(PChar(Result), Len) then
       SetLength(Result, Len - 1);
end; {UsuarioCorrente}

function Masc(St: string; Tam: integer): string;
var
  I: integer;
begin
  Result := St;
  for I := Length(St)+1 to Tam do
       Result := Result + ' ';
  Result := Copy(Result,1,Tam);
end; {Masc}

function MascNum(St: string; Tam: integer): string;
var
  I: integer;
begin
  Result := St;
  for I := Length(St)+1 to Tam do
       Result :=  '0'+ Result;
  Result := Copy(Result,1,Tam);
end; {MascNum}

function RemoveMascNum(St: string; ConjuntoMascara: TConjuntoMascara): extended;
var
  I: integer;
  Aux: string;
begin
  Aux := '';
  for I := 1 to Length(St) do
       if not (St[I] in ConjuntoMascara) then
            Aux := Aux + St[I];
  Result := StrToFloat(Aux);
end; {RemoveMascNum}

function RemoveMascSt(St: string; ConjuntoMascara: TConjuntoMascara): string;
var
  I: integer;
begin
  Result := '';
  for I := 1 to Length(St) do
       if not (St[I] in ConjuntoMascara) then
            Result := Result + St[I];
end; {RemoveMascSt}

function PrimeiraMaiuscula(Campo: string): string;
var
  I: integer;
begin
  Result := AnsiUpperCase(Campo);
  if Length(Campo) > 1 then
  begin
       for I := 2 to Length(Result) do
            if not (Result[I-1] in [' ','.']) then
                 Result[I] := AnsiLowerCase(Result[I])[1];
  end;
  Result := Substitui(Result,' a ',' a ',0);
  Result := Substitui(Result,' o ',' o ',0);
  Result := Substitui(Result,' De ',' de ',0);
  Result := Substitui(Result,' Da ',' da ',0);
  Result := Substitui(Result,' Do ',' do ',0);
  Result := Substitui(Result,' Das ',' das ',0);
  Result := Substitui(Result,' Dos ',' dos ',0);
  Result := Substitui(Result,' Em ',' em ',0);
  Result := Substitui(Result,' Na ',' na ',0);
  Result := Substitui(Result,' No ',' no ',0);
  Result := Substitui(Result,' Nas ',' nas ',0);
  Result := Substitui(Result,' Nos ',' nos ',0);
  I := 1;
  while (I <= Length(Result)) and (Result[I] <> '/') do
       Inc(I);
  while I <= Length(Result) do
  begin
       if Length(Result) >= I + 1 then
            Result := Copy(Result,1,I) + AnsiUpperCase(Campo[I+1]) + Copy(Result,I+2,Length(Result));
       Inc(I);
       while (I <= Length(Result)) and (Result[I] <> '/') do
            Inc(I);
  end;
end; {PrimeiraMaiuscula}

function PrimeiraMaiusculaFrase(Campo: string): string;
var
  I: integer;
begin
  Result := AnsiLowerCase(Campo);
  if Length(Campo) > 0 then
       Result := AnsiUpperCase(Campo[1]) + Copy(Result,2,Length(Result));
  I := 1;
  while (I <= Length(Result)) and (Copy(Result,I,2) <> '. ') do
       Inc(I);
  while I <= Length(Result) do
  begin
       if Length(Result) >= I + 2 then
            Result := Copy(Result,1,I+1) + AnsiUpperCase(Campo[I+2]) + Copy(Result,I+3,Length(Result));
       Inc(I);
       while (I <= Length(Result)) and (Copy(Result,I,2) <> '. ') do
            Inc(I);
  end;
end; {PrimeiraMaiuscula}

function NumeroExtenso(NumValor: extended): string;
begin
  Result := Substitui(Substitui(Extenso(NumValor),'real','',0),'reais','',0);
  if Copy(Result,Length(Result)-1,2) = ' )' then
       Result := Copy(Result,1,Length(Result)-2) + ')';
end;

function Extenso(NumValor: extended): string;
  function Unidade(TxtUnidade: string): string;
  begin
       case StrToInt(TxtUnidade) of
            1: Unidade := 'um';
            2: Unidade := 'dois';
            3: Unidade := 'três';
            4: Unidade := 'quatro';
            5: Unidade := 'cinco';
            6: Unidade := 'seis';
            7: Unidade := 'sete';
            8: Unidade := 'oito';
            9: Unidade := 'nove';
            else
               Unidade := '';
       end;
  end; {Unidade}
  function Dezena(TxtDezena: string) : string;
  var  DZ : string;
       Unid : integer;
  begin
       DZ := '';
       if StrToInt(Copy(TxtDezena,1,1)) = 1 then
            case StrToInt(TxtDezena) of
               10: DZ := 'dez';
               11: DZ := 'onze';
               12: DZ := 'doze';
               13: DZ := 'treze';
               14: DZ := 'quatorze';
               15: DZ := 'quinze';
               16: DZ := 'dezesseis';
               17: DZ := 'dezessete';
               18: DZ := 'dezoito';
               19: DZ := 'dezenove';
            end
       else
       begin
            case StrToInt(Copy(TxtDezena,1,1)) of
               2: DZ := 'vinte ';
               3: DZ := 'trinta ';
               4: DZ := 'quarenta ';
               5: DZ := 'cinqüenta ';
               6: DZ := 'sessenta ';
               7: DZ := 'setenta ';
               8: DZ := 'oitenta ';
               9: DZ := 'noventa ';
            end;
            Unid := StrToInt(Copy(TxtDezena,2,1));
            if StrToInt(Copy(TxtDezena,1,1)) <> 0 then
                 if Unid <> 0 then
                      DZ := DZ + 'e '
                 else
                      DZ := Copy(DZ,1,Length(DZ) - 1);
            DZ := DZ + Unidade(Copy(TxtDezena,2,1));
       end;
       Dezena := DZ;
  end; {Dezena}
  function Centena(NumText: string) : string;
  var  CT : string;
       X,TxtCentena : integer;
  begin
       CT := '';
       if StrToInt(NumText) > 0 then
            for X := 1 to Length(NumText) do
                 case Length(NumText) of
                      3: begin
                              if StrToInt(NumText) > 99 then
                              begin
                                   TxtCentena := StrToInt(Copy(NumText,1,1));
                                   case TxtCentena of
                                        1: if Copy(NumText,2,2) = '00' then
                                                  CT := 'cem '
                                             else
                                                  CT := 'cento ';
                                        2: CT := 'duzentos ';
                                        3: CT := 'trezentos ';
                                        4: CT := 'quatrocentos ';
                                        5: CT := 'quinhentos ';
                                        6: CT := 'seiscentos ';
                                        7: CT := 'setecentos ';
                                        8: CT := 'oitocentos ';
                                        else
                                             CT := 'novecentos ';
                                   end;
                                   { Trata a exceção: 'duzentos' e 'duzentos e' }
                                   if Copy(NumText,2,2) > '00' then
                                        CT := CT + 'e '
                                   else
                                        CT := Copy(CT,1,Length(CT)-1);
                              end;
                              NumText := Copy(NumText,2,2);
                         end;
                      2: begin
                              CT := CT + Dezena(NumText);
                              NumText := '';
                         end;
                      1: begin
                              CT := Unidade(NumText);
                         end;
                 end;
       Centena := CT;
  end; {Centena}
var
  Bloco,
  TxtBloco,
  TxtBlocoP,
  Acumula: array[1..5] of string;
  Cents,
  Ext,
  TxtValor,
  Reais,
  ConvBloco,
  TotalCents: string;
  CmpReal,
  TotalBlocos,
  N: integer;
begin
  Extenso := '';
  Ext := '';
  if NumValor = 0 then
      Extenso := '(zero reais)'
  else
  begin
       TxtBloco[1] := '';
       TxtBloco[2] := ' mil ';
       TxtBloco[3] := ' milhão ';
       TxtBloco[4] := ' bilhão ';
       TxtBloco[5] := ' trilhão ';
       TxtBlocoP[1] := '';
       TxtBlocoP[2] := ' mil e ';
       TxtBlocoP[3] := ' milhões ';
       TxtBlocoP[4] := ' bilhões ';
       TxtBlocoP[5] := ' trilhões ';
       for N := 1 to 5 do
       begin
            Bloco[N] := '';
            Acumula[N] := '';
       end;
       TxtValor := FloatToStr(NumValor);
       if Pos(',',TxtValor) = 0 then
       begin
            Reais := TxtValor;
            Cents := '00';
       end
       else
       begin
            Reais := Copy(TxtValor,1,Pos(',',TxtValor)-1);
            Cents := Copy(TxtValor,Pos(',',TxtValor)+1,255);
            if Length(Cents) = 1 then
                 Cents := Cents + '0';
       end;
       CmpReal := Length(Reais);
       if (CmpReal mod 3) = 0 then
            TotalBlocos := (CmpReal div 3)
       else
            TotalBlocos := (CmpReal div 3) + 1;
       N := 1;
       while CmpReal > 0 do
       begin
            if CmpReal > 3 then
                 Bloco[N] := Copy(Reais,Length(Reais)-2,3)
            else
                 Bloco[N] := Reais;
            if CmpReal > 3 then
                 Reais := Copy(Reais,1,CmpReal-3)
            else
                 Reais := '';
            CmpReal := Length(Reais);
            Inc(N);
       end;
       { Preenche matriz Acumula, que será usada no tratamento de exceções }
       Acumula[1] := Bloco[1];
       for N := 2 to TotalBlocos do
            Acumula[N] := Bloco[N] + Acumula[N - 1];
       for N := TotalBlocos downto 1 do
       begin
            { Controla plural: "milhões", "bilhões" etc. }
            if (N > 2) and (StrToInt(Bloco[N]) > 1) then
                 TxtBloco[N] := TxtBlocoP[N];
            { Controla "mil", "mil e" }
            if N = 2 then
            begin
                 if StrToInt(Bloco[1]) > 0 then
                 begin
                      if ((Copy(Bloco[1],2,2) = '00') or (StrToInt(Bloco[1]) < 100)) and
                         (StrToInt(Cents) = 0) then
                           TxtBloco[N] := TxtBlocoP[N];
                      if StrToInt(Bloco[N]) = 0 then
                           TxtBloco[N] := 'e';
                 end;
                 if StrToInt(Bloco[1]) = 0 then
                      if TxtBloco[N][Length(TxtBloco[N])] = ' ' then
                           TxtBloco[N] := Copy(TxtBloco[N],1,Length(TxtBloco[N])-1);
            end;
            { Adiciona 'de' e 'e' a 'milhões', 'bilhões' }
            if N > 2 then
                 if StrToInt(Acumula[N - 1]) = 0 then
                      TxtBloco[N] := TxtBloco[N] + 'de'
                 else
                      if StrToInt(Cents) = 0 then
                      begin
                           if StrToInt(Acumula[2]) = 0 then
                           begin
                                if (StrToInt(Bloco[3]) > 0) and (StrToInt(Bloco[4]) > 0) then
                                     TxtBloco[4] := TxtBloco[4] + 'e ';
                                if (StrToInt(Bloco[3]) > 0) and (StrToInt(Bloco[4]) = 0) then
                                     TxtBloco[5] := TxtBloco[5] + 'e ';
                                if (StrToInt(Bloco[3]) = 0) and (StrToInt(Bloco[4]) > 0) then
                                     TxtBloco[5] := TxtBloco[5] + 'e ';
                           end;
                           if (StrToInt(Bloco[2]) > 0) and (StrToInt(Bloco[1]) = 0) then
                                if (Copy(Bloco[2],2,2) = '00') or (StrToInt(Bloco[2]) < 100) then
                                begin
                                     if StrToInt(Bloco[3]) > 0 then
                                          TxtBloco[3] := TxtBloco[3] + 'e ';
                                     if (StrToInt(Bloco[3]) = 0) and (StrToInt(Bloco[4]) > 0) then
                                          TxtBloco[4] := TxtBloco[4] + 'e ';
                                     if (StrToInt(Bloco[3]) = 0) and (StrToInt(Bloco[4]) = 0) then
                                          TxtBloco[5] := TxtBloco[5] + 'e ';
                                end;
                           if (StrToInt(Bloco[2]) = 0) and (StrToInt(Bloco[1]) > 0) then
                                if (Copy(Bloco[1],2,2) = '00') or (StrToInt(Bloco[1]) < 100) then
                                begin
                                     if StrToInt(Bloco[3]) > 0 then
                                          TxtBloco[3] := TxtBloco[3] + 'e ';
                                     if (StrToInt(Bloco[3]) = 0) and (StrToInt(Bloco[4]) > 0) then
                                          TxtBloco[4] := TxtBloco[4] + 'e ';
                                     if (StrToInt(Bloco[3]) = 0) and (StrToInt(Bloco[4]) = 0) then
                                          TxtBloco[5] := TxtBloco[5] + 'e ';
                                end;
                      end;
            ConvBloco := Centena(Bloco[N]);
            Ext := Ext + ConvBloco;
            if ConvBloco <> '' then
                 Ext := Ext + TxtBloco[N];
       end;
       TotalCents := Dezena(Cents);
       if Trunc(NumValor) = 0 then
            if StrToInt(Cents) > 1 then
                 Ext := Ext + TotalCents + ' centavos'
            else
                 Ext := Ext + TotalCents + ' centavo';
       if Trunc(NumValor) = 1 then
            if StrToInt(Cents) = 0 then
                 Ext := Ext + ' real'
            else
                 if StrToInt(Cents) > 1 then
                      Ext := Ext + ' real e ' + TotalCents + ' centavos'
                 else
                      Ext := Ext + ' real e ' + TotalCents + ' centavo'
       else
            if StrToInt(Cents) = 0 then
                 Ext := Ext + ' reais'
            else
                 if StrToInt(Cents) > 1 then
                      Ext := Ext + ' reais e ' + TotalCents + ' centavos'
                 else
                      Ext := Ext + ' reais e ' + TotalCents + ' centavo';
      Extenso := '(' + Ext + ')';
  end;
end; {Extenso}

function Imprimir(NomeArquivo, Fonte: string; Tamanho: integer; Estilo: TFontStyles; LinhasPorPagina: double): boolean;
var
  I: Integer;
  ArquivoTexto: TStringList;
begin
  Result := true;
  if not FileExists(NomeArquivo) then
       Result := false
  else
  begin
       ArquivoTexto := TStringList.Create;
       try
            try
                 Printer.BeginDoc;
                 ArquivoTexto.LoadFromFile(NomeArquivo);
                 Printer.Canvas.Font.Name := Fonte;
                 Printer.Canvas.Font.Size := Tamanho;
                 Printer.Canvas.Font.Style := Estilo;
                 for I := 0 to ArquivoTexto.Count - 1 do
                      Printer.Canvas.TextOut(0,Trunc(Printer.PageHeight / LinhasPorPagina * I),ArquivoTexto[I]);
                 Printer.EndDoc;
            except
                 MessageDlg('Erro na impressão. Verifique se há uma impressora padrão online no Windows.',mtError,[mbOk],0);
                 Result := false;
            end;
       finally
            ArquivoTexto.Free;
       end;
  end;
end;  { Imprime direto na porta Paralela Computador }

(*function Imprimir(NomeArquivo, Porta: string): boolean;
var
  I: Integer;
  Impressora: TextFile;
  Comanda: TStringList;
begin
  Result := true;
  if not FileExists(NomeArquivo) then
       Result := false
  else
  begin
       Comanda := TStringList.Create;
       Comanda.LoadFromFile(NomeArquivo);
       if Comanda.Count = 0 then
            Result := false
       else
            try
                 try
                      AssignFile(Impressora,Porta);
                      {$I-}
                      Rewrite(Impressora);
                      {$I+}
                      if IOResult = 0 then
                      begin
                           for I := 0 to Comanda.Count - 1 do
                                WriteLn(Impressora,ConverteAcento(Comanda[I]));
                           for I := 0 to 10 do
                                WriteLn(Impressora,'');
                           System.Close(Impressora);
                      end
                      else
                      begin
                           MessageDlg('A impressora não está pronta.'+^M+
                                      'Verifique se a impressora está ligada.',mtError,[mbOk],0);
                           Result := false;
                      end;
                 except
                      MessageDlg('A impressora não está pronta.'+^M+
                                 'Verifique se a impressora está ligada.',mtError,[mbOk],0);
                      Result := false;
                 end;
            finally
                 Comanda.Free;
            end;
  end;
end;  { Imprime direto na porta Paralela Computador } *)

function Iniciais(Nome: string): string;
var
  I: integer;
begin
  Result := '';
  for I := 1 to Length(Nome) do
       if ((I = 1) or (Nome[I-1] = ' ')) and (Nome[I] <> ' ') then
            Result := Result + Nome[I];
  Result := UpperCase(Result);
end; {Iniciais}

function TXTParaString(Arquivo: string): string;
var
  Arq: TextFile;
  Linha: string;
begin
  Result := '';
  AssignFile(Arq,Arquivo);
  Reset(Arq);
  while not Eof(Arq) do
  begin
       Readln(Arq,Linha);
       Result := Result + ^J + ^M + Linha;
  end;
  System.Close(Arq);
end; {TXTparaString}

function Tamanhointegers(Tamanho: extended): string;
begin
  if Tamanho < 1000 then
       Result := IntToStr(Trunc(Tamanho))+' integers'
  else
       if Tamanho < 1000*1000 then
            Result := FormatFloat('##0.0',Tamanho/1024)+'Kb'
       else
            if Tamanho < 1000*1000*1000 then
                 Result := FormatFloat('##0.0',Tamanho/1024/1024)+'Mb'
            else
                 Result := FormatFloat('#,##0.0',Tamanho/1024/1024/1024)+'Gb';
  while Result[1] = ' ' do
       Delete(Result,1,1);
end; {Tamanhointegers}

function TamanhoArquivo(NomeArquivo: string): string;
var
  Arq: file of integer;
begin
  if FileExists(NomeArquivo) then
  begin
       AssignFile(Arq,NomeArquivo);
       Reset(Arq);
       Result := Tamanhointegers(FileSize(Arq));
       Close(Arq);
  end
  else
       Result := '';
end; {TamanhoArquivo}

function TamanhoArquivoInt(NomeArquivo: string): extended;
var
  Arq: file of integer;
begin
  if FileExists(NomeArquivo) then
  begin
       AssignFile(Arq,NomeArquivo);
       Reset(Arq);
       Result := FileSize(Arq);
       Close(Arq);
  end
  else
       Result := 0;
end; {TamanhoArquivoInt}

function Substitui(St,De,Para: string; NumVezes: word): string;
var
  I: integer;
begin
  if NumVezes <= 0 then
       NumVezes := 65535;
  I := Pos(De,St);
  while (I > 0) and (NumVezes > 0) do
  begin
       St := Copy(St,1,I-1)+Para+Copy(St,I+Length(De),Length(St)-I);
       if Pos(De,Copy(St,I+Length(Para),Length(St)-(I+Length(Para))+1)) = 0 then
            I := 0
       else
            I := Pos(De,Copy(St,I+Length(Para),Length(St)-(I+Length(Para))+1))+I+Length(Para)-1;
       Dec(NumVezes);
  end;
  Result := St;
end; {Substitui}

function NormalizaNomeArquivo(St: string): string;
var
  I: integer;
begin
  Result := St;
  for I := 1 to Length(St) do
       if St[I] in ['*','?','"',':','\','/','>','<','|',';'] then
            Result[I] := '_';
end; {NormalizaNomeArquivo}

function EnviarLixeira(Arquivo: string): boolean;
var
  ShStruct: TSHFileOpStruct;
  P1: array[byte] of char;
begin
  Result := false;
  if FileExists(Arquivo) then
  begin
       FillChar(P1,SizeOf(P1),0);
       StrPCopy(P1,ExpandFileName(Arquivo)+#0#0);
       ShStruct.wnd := 0;
       ShStruct.wFunc := FO_DELETE;
       ShStruct.pFrom := P1;
       ShStruct.pTo   := nil;
       ShStruct.fFlags:= FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
       ShStruct.fAnyOperationsAborted := false;
       ShStruct.hNameMappings := nil;
       Result := (ShFileOperation(ShStruct) = 0);
       if not Result then
            Result := FileExists(Arquivo);
  end;
end; {EnviarLixeira}

function EspacoLivre(Diretorio: string): Int64;
var
  EspacoLivreAux,
  EspacoTotalAux: Int64;
  PTotalLivreAux: PLargeInteger;
  DiretorioAux: array[0..255]of char;
begin
  New(PTotalLivreAux);
  StrPCopy(DiretorioAux,Diretorio);
  if GetDiskFreeSpaceEx(DiretorioAux,EspacoLivreAux,EspacoTotalAux,PTotalLivreAux) then
       Result := EspacoLivreAux
  else
       Result := 0;
end; {EspacoLivre}

function EspacoTotal(Diretorio: string): Int64;
var
  EspacoLivreAux,
  EspacoTotalAux: Int64;
  PTotalLivreAux: PLargeInteger;
  DiretorioAux: array[0..255]of char;
begin
  New(PTotalLivreAux);
  StrPCopy(DiretorioAux,Diretorio);
  if GetDiskFreeSpaceEx(DiretorioAux,EspacoLivreAux,EspacoTotalAux,PTotalLivreAux) then
       Result := EspacoTotalAux
  else
       Result := 0;
end; {EspacoTotal}

function ConverteAcento(Campo: string): string;
var
  I: integer;
begin
  Result := Campo;
  for I := 1 to Length(Result) do
       case Result[I] of
            'á',
            'à',
            'â',
            'ä',
            'ã': Result[I] := 'a';
            'Á',
            'À',
            'Â',
            'Ä',
            'Ã': Result[I] := 'A';
            'ê',
            'é',
            'è',
            'ë': Result[I] := 'e';
            'Ê',
            'É',
            'È',
            'Ë': Result[I] := 'E';
            'î',
            'í',
            'ì',
            'ï': Result[I] := 'i';
            'Î',
            'Í',
            'Ì',
            'Ï': Result[I] := 'I';
            'ó',
            'ò',
            'ô',
            'õ',
            'ö': Result[I] := 'o';
            'Ó',
            'Ò',
            'Ô',
            'Õ',
            'Ö': Result[I] := 'O';
            'ú',
            'ù',
            'û',
            'ü': Result[I] := 'u';
            'Ú',
            'Ù',
            'Û',
            'Ü': Result[I] := 'U';
            'Ç': Result[I] := 'C';
            'ç': Result[I] := 'c';
            'Ñ': Result[I] := 'N';
            'ñ': Result[I] := 'n';
            'Ý',
            'Ÿ': Result[I] := 'Y';
            'ý',
            'ÿ': Result[I] := 'y';
      end;
end; {ConverteAcento}

function GeraSenha: string;
var
  Numero: extended;
  Hoje: string;
begin
  Hoje := DateToStr(Date);
  Numero := Frac(Frac(Ln(StrToInt(Copy(Hoje,1,2)+Copy(Hoje,4,2)+Copy(Hoje,7,4))))*1000000);
  Result := FloatToStr(Numero);
  Result := LowerCase(Chr((StrToInt(Copy(Result,7,2)) mod 26)+65)+Chr((StrToInt(Copy(Result,9,2)) mod 26)+65)+Copy(Result,3,4));
end; {GeraSenha}

function ChaveTemporaria: integer;
begin
  Result := StrToInt(Copy(TimeToStr(Time),4,2)+Copy(TimeToStr(Time),7,2)+FormatFloat('00000',Random(100000)));
end;

function AbreArquivo(NomeArquivo: string): boolean;
var
  Erro: integer;
begin
  Erro := ShellExecute(Application.Handle,'open',PChar(NomeArquivo),nil,nil,SW_NORMAL);
  if Erro <= 32 then
  begin
       case Erro of
            SE_ERR_NOASSOC:
                 MessageDlg('Não há nenhuma aplicação associada à extensão do nome deste arquivo.',mtWarning,[mbOk],0);
            SE_ERR_FNF:
                 MessageDlg('O arquivo a ser aberto '''+NomeArquivo+''' não foi encontrado.',mtWarning,[mbOk],0);
            SE_ERR_PNF:
                 MessageDlg('O caminho do arquivo a ser aberto não foi encontrado.',mtWarning,[mbOk],0);
            ERROR_BAD_FORMAT:
                 MessageDlg('O arquivo .EXE a ser aberto possui um formato inválido.',mtWarning,[mbOk],0);
            SE_ERR_ACCESSDENIED:
                 MessageDlg('O Windows negou o acesso ao arquivo a ser aberto.',mtWarning,[mbOk],0);
            SE_ERR_ASSOCINCOMPLETE:
                 MessageDlg('A associação com o nome do arquivo está incompleta ou inválida.',mtWarning,[mbOk],0);
            SE_ERR_OOM:
                 MessageDlg('Não há memória suficiente para completar a operação.',mtWarning,[mbOk],0);
            SE_ERR_SHARE:
                 MessageDlg('Ocorreu uma violação de compartilhamento.',mtWarning,[mbOk],0);
       end;
       Result := false;
  end
  else
       Result := true;
end; {AbreArquivo}

function CriaAtalho(Objeto, IniciarEm, Descricao, ArquivoIcone: string;
                    IndiceIcone, ModoJanela: integer; NomeAtalho: WideString): boolean;
var
  IObject: IUnknown;
  ISLink: IShellLink;
  IPFile: IPersistFile;
begin
  Result := true;
  if not DirectoryExists(Objeto) then
       ForceDirectories(Objeto);
  IObject := CreateComObject(CLSID_ShellLink);
  ISLink  := IObject as IShellLink;
  ISLink.SetPath(PChar(Objeto));
  ISLink.SetDescription(PChar(Descricao));
  if IniciarEm = '' then
       IniciarEm := ExtractFilePath(Objeto);
  ISLink.SetWorkingDirectory(PChar(IniciarEm));
  if (ArquivoIcone = '') and FileExists(Objeto) then
       ArquivoIcone := Objeto;
  ISLink.SetIconLocation(PChar(ArquivoIcone),IndiceIcone);
  ISLink.SetShowCmd(ModoJanela);
  IPFile  := IObject as IPersistFile;
  IPFile.Save(PWChar(NomeAtalho),false);
end; {CriaAtalho}


function ConexaoRede(NomeLocal, NomeRemoto, NomeUsuario, Senha: string;
                     dwType, dwScope, dwDisplayType, dwUsage: dWord): string;
var
  NR: TNetResource;
  Retorno: integer;
  Aux1, Aux2: array [0..25] of char;
begin
  Result := '';
  NR.dwScope := dwScope;
  NR.dwDisplayType := dwDisplayType;
  NR.dwUsage := dwUsage;
  NR.dwType := dwType;
  NR.lpProvider := '';
  NR.lpComment :=  '';
  Aux1 := '';
  StrPCopy(Aux1, NomeLocal);
  NR.lpLocalName := Aux1;
  Aux2 := '';
  StrPCopy(Aux2, NomeRemoto);
  NR.lpRemoteName := Aux2;
  Retorno := WNetAddConnection2(NR,PChar(Senha),PChar(nomeUsuario),0);
  Result := '';
  case Retorno of
       NO_ERROR:
            Result := ''; //IntToStr(Retorno) + ' - ' + 'Conexão de rede efetuada com sucesso';
       ERROR_ACCESS_DENIED:
            Result := IntToStr(Retorno) + ' - ' + 'Access to the network resource was denied.';
       ERROR_ALREADY_ASSIGNED:
            Result := IntToStr(Retorno) + ' - ' + 'The local device specified by lpLocalName is already connected to a network resource.';
       ERROR_BAD_DEV_TYPE:
            Result := IntToStr(Retorno) + ' - ' + 'The type of local device and the type of network resource do not match.';
       ERROR_BAD_DEVICE:
            Result := IntToStr(Retorno) + ' - ' + 'The value specified by lpLocalName is invalid.';
       ERROR_BAD_NET_NAME:
            Result := IntToStr(Retorno) + ' - ' + 'The value specified by lpRemoteName is not acceptable to any network resource provider. The resource name is invalid, or the named resource cannot be located.';
       ERROR_BAD_PROFILE:
            Result := IntToStr(Retorno) + ' - ' + 'The user profile is in an incorrect format.';
       ERROR_BAD_PROVIDER:
            Result := IntToStr(Retorno) + ' - ' + 'The value specified by lpProvider does not match any provider.';
       ERROR_BUSY:
            Result := IntToStr(Retorno) + ' - ' + 'The router or provider is busy, possibly initializing. The caller should retry.';
       ERROR_CANCELLED:
            Result := IntToStr(Retorno) + ' - ' + 'The attempt to make the connection was cancelled by the user through a dialog box from one of the network resource providers, or by a called resource.';
       ERROR_CANNOT_OPEN_PROFILE:
            Result := IntToStr(Retorno) + ' - ' + 'The system is unable to open the user profile to process persistent connections.';
       ERROR_DEVICE_ALREADY_REMEMBERED:
            Result := IntToStr(Retorno) + ' - ' + 'An entry for the device specified in lpLocalName is already in the user profile.';
       ERROR_EXTENDED_ERROR:
            Result := IntToStr(Retorno) + ' - ' + 'A network-specific error occured. Call the WNetGetLastError function to get a description of the error.';
       ERROR_INVALID_PASSWORD:
            Result := IntToStr(Retorno) + ' - ' + 'The specified password is invalid.';
       ERROR_NO_NET_OR_BAD_PATH:
            Result := IntToStr(Retorno) + ' - ' + 'A network component has not started, or the specified name could not be handled.';
       ERROR_NO_NETWORK:
            Result := IntToStr(Retorno) + ' - ' + 'There is no network present.';
       else
            Result := IntToStr(Retorno) + ' - ' + 'Unknown';
  end;
end; {ConexaoRede}

function ArquivoEmUso(NomeArquivo: string): boolean;
var
  HFileRes: HFILE;
begin
  Result := false;
  if FileExists(NomeArquivo) then
  begin
       HFileRes := CreateFile(PChar(NomeArquivo),GENERIC_READ or GENERIC_WRITE,0,nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
       Result := (HFileRes = INVALID_HANDLE_VALUE);
       if not Result then
            CloseHandle(HFileRes);
  end;
end; {ArquivoEmUso}

procedure Espera(Delta: integer);
var
  Inicio: TTimeStamp;
begin
  Inicio := DateTimeToTimeStamp(Now);
  while (DateTimeToTimeStamp(Now).Time - Inicio.Time) < Delta do
       Application.ProcessMessages;
end; {Espera}

function CopiaArquivo(Origem, Destino: string): boolean;
const TamBuffer=65535;
var  ArqOrigem,
     ArqDestino: file;
     Buffer: pointer;
     HandleDestino: integer;
     TamanhoArquivo,
     integersCopiados: integer;
     SalvaAtributos: DWORD;
     MsgErro: string;
begin
  Result := true;
  MsgErro := '';
  if FileExists(Origem) then
       try
            SalvaAtributos := GetFileAttributes(PChar(Origem));
            if not DirectoryExists(ExtractFilePath(Destino)) then
                 ForceDirectories(ExtractFilePath(Destino));
            AssignFile(ArqOrigem,Origem);
            FileMode := fmShareDenyNone;
            Reset(ArqOrigem,1);
            if FileExists(Destino) then
                 SetFileAttributes(PChar(Destino),0);
            AssignFile(ArqDestino,Destino);
            FileMode := $0001;
            Rewrite(ArqDestino,1);
            GetMem(Buffer,TamBuffer);
            integersCopiados := 0;
            TamanhoArquivo := FileSize(ArqOrigem);
            Application.ProcessMessages;
            while (TamanhoArquivo - integersCopiados) div TamBuffer > 0 do
            begin
                 BlockRead(ArqOrigem,Buffer^,TamBuffer);
                 BlockWrite(ArqDestino,Buffer^,TamBuffer);
                 integersCopiados := integersCopiados + TamBuffer;
                 Application.ProcessMessages;
            end;
            if TamanhoArquivo - integersCopiados > 0 then
            begin
                 BlockRead(ArqOrigem,Buffer^,TamanhoArquivo - integersCopiados);
                 BlockWrite(ArqDestino,Buffer^,TamanhoArquivo - integersCopiados);
                 Application.ProcessMessages;
            end;
            CloseFile(ArqOrigem);
            CloseFile(ArqDestino);
            FreeMem(Buffer,TamBuffer);
            if FileExists(Destino) then
            begin
                 HandleDestino := FileOpen(Destino,fmOpenWrite or fmShareDenyNone);
                 FileSetDate(HandleDestino,FileAge(Origem));
                 FileClose(HandleDestino);
                 SetFileAttributes(PChar(Destino),SalvaAtributos);
            end
            else
                 Result := false
       except
            on Erro:EInOutError do
            begin
                 MsgErro := Erro.Message+'. Erro: '+IntToStr(Erro.ErrorCode);
                 Result := false;
            end
            else
                 Result := false;
       end
  else
  begin
       MsgErro := 'Arquivo de origem '''+Origem+''' não foi encontrado.';
       Result := false;
  end;
  if not Result then
       MessageDlg('Não foi possível copiar o arquivo '''+Origem+''' para '''+Destino+'''.'+^M^M+
                  'Mensagem: '+MsgErro,mtError,[mbOk],0);
end; {CopiaArquivo}

function CortaCasas(Valor: extended; Casas: integer): extended;
var
  I : integer;
begin
  for I := 1 to Casas do
       Valor := Valor * 10;
  Valor := Round(Valor);
  for I := 1 to Casas do
       Valor := Valor / 10;
  Result := Valor;
end; {CortaCasas}

function Alinha(St: string; Tam: integer) : string;
var I: integer;
begin
     Result := St;
     for I := Length(St)+1 to Tam do
          Result := ' ' + Result;
end; {Alinha}

function CPFComMascara(CPF: string): string;
begin
  if CPF <> '' then
       Result := Copy(CPF,1,3)+'.'+Copy(CPF,4,3)+'.'+Copy(CPF,7,3)+'-'+Copy(CPF,10,2)
  else
       Result := '';
end; { Coloca Máscara no CPF }

function CNPJComMascara(CNPJ: string): string;
begin
  if CNPJ <> '' then
       Result := Copy(CNPJ,1,2)+'.'+Copy(CNPJ,3,3)+'.'+Copy(CNPJ,6,3)+'/'+Copy(CNPJ,9,4)+'-'+Copy(CNPJ,13,2)
  else
       Result := '';
end; { Coloca Máscara no CNPJ }

function CEPComMascara(CEP: string): string;
begin
  if CEP <> '' then
       Result := Copy(CEP,1,5)+'-'+Copy(CEP,6,3)
  else
       Result := '';
end; { Coloca Máscara no CEP }

function TelefoneComMascara(Telefone: string): string;
begin
  if Telefone <> '' then
       Result := '('+Copy(Telefone,1,2)+')'+Copy(Telefone,3,4)+'-'+Copy(Telefone,7,4)
  else
       Result := '';
end; { Coloca Máscara no Telefone }

function Criptografa(Senha: string): string;
var
  I,
  Chave: integer;
begin
  for I:= 1 to Length(Senha) do
  begin
       Chave := ord(Senha[I]);
       Chave := Chave - 16;
       Result := Result + Chr(Length(Senha)+ Chave);
  end;
end; {Criptografa Senha}

function Descriptografa(Senha: string): string;
var
  I,
  Chave: integer;
begin
  for I:= 1 to Length(Senha) do
  begin
       Chave := ord(Senha[I]);
       Chave := Chave + 16;
       Chave := Chave - Length(Senha);
       Result := Result + chr(Chave);
  end;
end; {Descriptografa Senha}

function PlacaComMascara(Placa: string): string;
begin
  if Placa <> '' then
       Result := Copy(Placa,1,3)+'-'+Copy(Placa,4,4)
  else
       Result := '';
end; { Coloca Máscara na Placa}

function DateAjustado: TDateTime;
var
  Data: TDateTime;
  DataFinal: TSystemTime;
  HorasAtualizada: integer;
begin
  Data := Now;
  // Se em brasília for horário de verão e na cidade da empresa não houver considera mais uma hora
//  if (dtmBancoDados.HorarioVerao = 'S') and (dtmBancoDados.PossuiHorarioVerao = 'N') then
//       HorasAtualizada := dtmBancoDados.HorasFusoHorario - 1
//  else
       HorasAtualizada := 0;//dtmBancoDados.HorasFusoHorario;
  if HorasAtualizada < 0 then
       Data := Data - StrToTime(FormatFloat('00',HorasAtualizada * -1)+':00:00')
  else
       Data := Data + StrToTime(FormatFloat('00',HorasAtualizada)+':00:00');
  DateTimeToSystemTime(Data,DataFinal);
  Result := EncodeDate(DataFinal.wYear, DataFinal.wMonth, DataFinal.wDay);
end; { Informa data atual considerando fuso horário e horário de verão }

function NowAjustado: TDateTime;
var
  Data: TDateTime;
  DataFinal: TSystemTime;
  HorasAtualizada: integer;
begin
  Data := Now;
  // Se em brasília for horário de verão e na cidade da empresa não houver considera mais uma hora
//  if (dtmBancoDados.HorarioVerao = 'S') and (dtmBancoDados.PossuiHorarioVerao = 'N') then
//       HorasAtualizada := dtmBancoDados.HorasFusoHorario - 1
//  else
       HorasAtualizada := 0;//dtmBancoDados.HorasFusoHorario;
  if HorasAtualizada < 0 then
       Data := Data - StrToTime(FormatFloat('00',HorasAtualizada * -1)+':00:00')
  else
       Data := Data + StrToTime(FormatFloat('00',HorasAtualizada)+':00:00');
  DateTimeToSystemTime(Data,DataFinal);
  Result := EncodeDate(DataFinal.wYear, DataFinal.wMonth, DataFinal.wDay) +
            EncodeTime(DataFinal.wHour, DataFinal.wMinute, DataFinal.wSecond, DataFinal.wMilliseconds);
end; { Informa data e hora atual considerando fuso horário e horário de verão }

function TimeAjustado: TDateTime;
var
  Data: TDateTime;
  DataFinal: TSystemTime;
  HorasAtualizada: integer;
begin
  Data := Now;
  // Se em brasília for horário de verão e na cidade da empresa não houver considera mais uma hora
//  if (dtmBancoDados.HorarioVerao = 'S') and (dtmBancoDados.PossuiHorarioVerao = 'N') then
//       HorasAtualizada := dtmBancoDados.HorasFusoHorario - 1
//  else
       HorasAtualizada := 0;//dtmBancoDados.HorasFusoHorario;
  if HorasAtualizada < 0 then
       Data := Data - StrToTime(FormatFloat('00',HorasAtualizada * -1)+':00:00')
  else
       Data := Data + StrToTime(FormatFloat('00',HorasAtualizada)+':00:00');
  DateTimeToSystemTime(Data,DataFinal);
  Result := EncodeTime(DataFinal.wHour, DataFinal.wMinute, DataFinal.wSecond, DataFinal.wMilliSeconds);
end; { Informa hora atual considerando fuso horário e horário de verão }

function ConverteData(DataIni: String):String;
var
  Mes,
  Ano:String;
begin
     Mes := Copy(DataIni,3,3);
     Ano := Copy(DataIni,6,2);
     if Mes = 'JAN' then
          Mes := '01';
     if Mes = 'FEV' then
          Mes := '02';
     if Mes = 'MAR' then
          Mes := '03';
     if Mes = 'ABR' then
          Mes := '04';
     if Mes = 'MAI' then
          Mes := '05';
     if Mes = 'JUN' then
          Mes := '06';
     if Mes = 'JUL' then
          Mes := '07';
     if Mes = 'AGO' then
          Mes := '08';
     if Mes = 'SET' then
          Mes := '09';
     if Mes = 'OUT' then
          Mes := '10';
     if Mes = 'NOV' then
          Mes := '11';
     if Mes = 'DEZ' then
          Mes := '12';
     if StrToInt(Ano) < 99 then
          Ano := '20' + Ano
     else
          Ano := '21' + Ano;
     Result := Copy(DataIni,1,2) + '/' + Mes + '/' + Ano;
end;

function Advertencia(Msg: string): Boolean;
begin
  Result := MessageDlg(Msg, mtWarning, [mbOK], 0) = mrOK;
end;

procedure Cancela(Msg: string);
begin
  MessageDlg(Msg, mtWarning, [mbOK], 0);
  Abort;
end;

function Informacao(Msg: string): Boolean;
begin
  Result := MessageDlg(Msg, mtInformation, [mbOK], 0) = mrOK;
end;

function Confirme(Msg: string): Boolean;
begin
  Result := MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

function ResultadoSql(pSql: string): variant;
var v_query: TADOQuery;
begin
  try
    v_query := TADOQuery.Create(nil);
    with v_query do
    begin
      try
        SQL.Text := pSql;
        //Connection := dtmBancoDados.adcBancoDados;
        Prepared := True;
        Open;
        Result := v_query.Fields[0].Value;
      finally
        Close;
        Free;
      end;
    end;
  except
    on e: exception do
    begin
      MessageDlg('Erro ao executar o comando. ' + e.Message,mtError,[mbOk],0);
      Result := 0;
    end;
  end;
end;

// Função que executa o comando SQL. Ideal para INSERT e UPDATE
procedure ExecuteDML(comandoSql: string);
var
  comando: TADOCommand;
begin
  comando := TADOCommand.Create(nil);
  try
       comando.CommandText := comandoSql;
       comando.CommandType := cmdText;
       comando.ParamCheck := false;
       //comando.Connection := dtmBancoDados.adcBancoDados;
       try
            comando.execute;
       except
            on E: Exception do
            begin
                 Raise Exception.Create('Erro ao executar comando.' + #13 + E.Message);
            end;
       end;
  finally
      comando.free;
  end;
end;

function ClearTempInternetFiles : Boolean;
var
  Info: PInternetCacheEntryInfo;
  Diretorio: LongWord;
  Tamanho: LongWord;
begin
  try
       Tamanho := 0;
       FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), Tamanho);
       GetMem(Info, Tamanho);
       if Tamanho > 0 then
            Info^.dwStructSize := Tamanho;
       Diretorio := FindFirstUrlCacheEntry(nil, Info^, Tamanho);
       if Diretorio <> 0 then
       begin
            repeat
                 DeleteUrlCacheEntry(Info^.lpszSourceUrlName);
                 FreeMem(Info, Tamanho);
                 Tamanho := 0;
                 FindNextUrlCacheEntry(Diretorio, TInternetCacheEntryInfo(nil^), Tamanho);
                 GetMem(Info, Tamanho);
                 If tamanho > 0 then Info^.dwStructSize := Tamanho;
            until not FindNextUrlCacheEntry(Diretorio, Info^, Tamanho);
       end;
       FreeMem(Info, Tamanho);
       FindCloseUrlCache(Diretorio);
       Result := true;
  except
       Result := false;
  end;
end;
   {Limpa arquivos temporários da internet}

function AjustaMascaraTelefone(Valor: string):string;
begin
  if Valor <> '' then
  begin
       if (((Copy(Valor, 1, 3) = '119') or (Copy(Valor, 1, 3) = '129') or (Copy(Valor, 1, 3) = '139') or
                (Copy(Valor, 1, 3) = '149') or (Copy(Valor, 1, 3) = '159') or (Copy(Valor, 1, 3) = '169') or
                (Copy(Valor, 1, 3) = '179') or (Copy(Valor, 1, 3) = '189') or (Copy(Valor, 1, 3) = '199') or
                (Copy(Valor, 1, 3) = '219') or (Copy(Valor, 1, 3) = '229') or (Copy(Valor, 1, 3) = '249')or
                (Copy(Valor, 1, 3) = '319') or (Copy(Valor, 1, 3) = '318') or
                (Copy(Valor, 1, 3) = '329') or (Copy(Valor, 1, 3) = '328') or
                (Copy(Valor, 1, 3) = '339') or (Copy(Valor, 1, 3) = '338') or
                (Copy(Valor, 1, 3) = '349') or (Copy(Valor, 1, 3) = '348') or
                (Copy(Valor, 1, 3) = '359') or (Copy(Valor, 1, 3) = '358') or
                (Copy(Valor, 1, 3) = '379') or (Copy(Valor, 1, 3) = '378') or
                (Copy(Valor, 1, 3) = '389') or (Copy(Valor, 1, 3) = '388') or
                (Copy(Valor, 1, 3) = '719') or (Copy(Valor, 1, 3) = '718') or
                (Copy(Valor, 1, 3) = '739') or (Copy(Valor, 1, 3) = '738') or
                (Copy(Valor, 1, 3) = '749') or (Copy(Valor, 1, 3) = '748') or
                (Copy(Valor, 1, 3) = '759') or (Copy(Valor, 1, 3) = '758') or
                (Copy(Valor, 1, 3) = '779') or (Copy(Valor, 1, 3) = '778') or
                (Copy(Valor, 1, 3) = '799') or (Copy(Valor, 1, 3) = '798') or
                (Copy(Valor, 1, 3) = '919') or (Copy(Valor, 1, 3) = '939') or (Copy(Valor, 1, 3) = '949') or
                (Copy(Valor, 1, 3) = '959') or (Copy(Valor, 1, 3) = '969') or (Copy(Valor, 1, 3) = '929') or
                (Copy(Valor, 1, 3) = '979') or (Copy(Valor, 1, 3) = '989') or (Copy(Valor, 1, 3) = '999') or
                (Copy(Valor, 1, 3) = '819') or (Copy(Valor, 1, 3) = '829') or (Copy(Valor, 1, 3) = '839') or
                (Copy(Valor, 1, 3) = '849') or (Copy(Valor, 1, 3) = '859') or (Copy(Valor, 1, 3) = '869') or
                (Copy(Valor, 1, 3) = '879') or (Copy(Valor, 1, 3) = '889') or (Copy(Valor, 1, 3) = '899') or
                (Copy(Valor, 1, 3) = '279') or (Copy(Valor, 1, 3) = '289'))
                and ((Copy(Valor, 4, 1) = '9') or (Copy(Valor, 4, 1) = '8') or
                     (Copy(Valor, 4, 1) = '7') or (Copy(Valor, 4, 1) = '6') or (Copy(Valor, 4, 1) = '5') or ((Copy(Valor, 4, 1) = '4')))) then
            Result := '('+Copy(Valor,1,2)+')'+
                        Copy(Valor,3,5)+'-'+
                        Copy(Valor,8,4)
       else
            Result := '('+Copy(Valor,1,2)+')'+
                         Copy(Valor,3,4)+'-'+
                         Copy(Valor,7,4);
  end
  else
       Result := '';
end;

procedure AjustaTelefone(Componente: TObject);
var
  Campo: TGetString;
  Valor: String;
begin
  try
       if (Componente is TGetString) or (Componente is TDBGetString) then
       begin
            Campo := (Componente as TDBGetString);
            Valor := Campo.Value;
            if (((Copy(Campo.Value, 1, 3) = '119') or (Copy(Campo.Value, 1, 3) = '129') or (Copy(Campo.Value, 1, 3) = '139') or
                (Copy(Campo.Value, 1, 3) = '149') or (Copy(Campo.Value, 1, 3) = '159') or (Copy(Campo.Value, 1, 3) = '169') or
                (Copy(Campo.Value, 1, 3) = '179') or (Copy(Campo.Value, 1, 3) = '189') or (Copy(Campo.Value, 1, 3) = '199') or
                (Copy(Campo.Value, 1, 3) = '219') or (Copy(Campo.Value, 1, 3) = '229') or (Copy(Campo.Value, 1, 3) = '249')or
                (Copy(Campo.Value, 1, 3) = '319') or (Copy(Campo.Value, 1, 3) = '318') or
                (Copy(Campo.Value, 1, 3) = '329') or (Copy(Campo.Value, 1, 3) = '328') or
                (Copy(Campo.Value, 1, 3) = '339') or (Copy(Campo.Value, 1, 3) = '338') or
                (Copy(Campo.Value, 1, 3) = '349') or (Copy(Campo.Value, 1, 3) = '348') or
                (Copy(Campo.Value, 1, 3) = '359') or (Copy(Campo.Value, 1, 3) = '358') or
                (Copy(Campo.Value, 1, 3) = '379') or (Copy(Campo.Value, 1, 3) = '378') or
                (Copy(Campo.Value, 1, 3) = '389') or (Copy(Campo.Value, 1, 3) = '388') or
                (Copy(Campo.Value, 1, 3) = '719') or (Copy(Campo.Value, 1, 3) = '718') or
                (Copy(Campo.Value, 1, 3) = '739') or (Copy(Campo.Value, 1, 3) = '738') or
                (Copy(Campo.Value, 1, 3) = '749') or (Copy(Campo.Value, 1, 3) = '748') or
                (Copy(Campo.Value, 1, 3) = '759') or (Copy(Campo.Value, 1, 3) = '758') or
                (Copy(Campo.Value, 1, 3) = '779') or (Copy(Campo.Value, 1, 3) = '778') or
                (Copy(Campo.Value, 1, 3) = '799') or (Copy(Campo.Value, 1, 3) = '798') or
                (Copy(Campo.Value, 1, 3) = '919') or (Copy(Campo.Value, 1, 3) = '939') or (Copy(Campo.Value, 1, 3) = '949') or
                (Copy(Campo.Value, 1, 3) = '959') or (Copy(Campo.Value, 1, 3) = '969') or (Copy(Campo.Value, 1, 3) = '929') or
                (Copy(Campo.Value, 1, 3) = '979') or (Copy(Campo.Value, 1, 3) = '989') or (Copy(Campo.Value, 1, 3) = '999') or
                (Copy(Campo.Value, 1, 3) = '819') or (Copy(Campo.Value, 1, 3) = '829') or (Copy(Campo.Value, 1, 3) = '839') or
                (Copy(Campo.Value, 1, 3) = '849') or (Copy(Campo.Value, 1, 3) = '859') or (Copy(Campo.Value, 1, 3) = '869') or
                (Copy(Campo.Value, 1, 3) = '879') or (Copy(Campo.Value, 1, 3) = '889') or (Copy(Campo.Value, 1, 3) = '899') or
                (Copy(Campo.Value, 1, 3) = '279') or (Copy(Campo.Value, 1, 3) = '289'))
                 and ((Copy(Campo.Value, 4, 1) = '9') or (Copy(Campo.Value, 4, 1) = '8') or
                (Copy(Campo.Value, 4, 1) = '7') or (Copy(Campo.Value, 4, 1) = '6')  or (Copy(Campo.Value, 4, 1) = '5') or ((Copy(Campo.Value, 4, 1) = '4')))) then
            begin
                 Campo.EditMask := '(99)99999-9999';
                 Campo.Value := Valor;
            end
            else
            begin
                 Campo.EditMask := '(99)9999-9999';
                 Campo.Value := Valor;
            end;
       end;
  finally
       if Assigned(Campo) then
       begin
            Campo := nil;
       end;
  end;
end;

//procedure GerarPDF(Formulario: TQRPrinter; Destino: String);
//var
//  PDF: TQRPDFDocumentFilter;
//begin
//  PDF := TQRPDFDocumentFilter.Create(Destino);
//  try
//       PDF.TextOnTop := true;
//       PDF.leftMargin := 0;
//       PDF.TopMargin := 0;
//       PDF.CompressionOn := true;
//       PDF.Concatenating := true;
//       Formulario.Compression := true;
//       Formulario.ExportToFilter(PDF);
//       PDF.EndConcat;
//  finally
//       PDF.Free;
//  end;
//end;

function PesquisarCep(Cep: string): TStringList;
var
  Dados,
  Resultado,
  Auxiliar: TStringList;
  AchouBairro,
  AchouLogradouro,
  AchouEstado,
  AchouCidade: boolean;
  IdHttp: TidHTTP;
  I: integer;
begin
  Screen.Cursor := crHourGlass;
  Dados := TStringList.Create;
  Resultado := TStringList.Create;
  IdHttp := TIdHTTP.Create;
  Dados.Text := IdHttp.Get('http://www.buscacep.correios.com.br/servicos/dnec/consultaLogradouroAction.do?Metodo=listaLogradouro&CEP=' + Cep +'&TipoConsulta=cep');
  if Dados.Text <> '' then
  begin
       AchouLogradouro := false;
       AchouEstado := false;
       AchouCidade := false;
       AchouBairro := false; //É necessário verificar se o bairro foi preenchido pois a tag da cidade possui os mesmo valores da tag bairro
       for I := 0 to Dados.Count - 1 do
       begin
            if  Pos('<td width="268" style="padding: 2px">', Dados[I]) > 0 then
            begin
                 Resultado.Add(StringReplace(StringReplace(Copy(Dados[I], Pos('<td width="268" style="padding: 2px">', Dados[I]) + 36, Length(Dados[I]) - Pos('<td width="268" style="padding: 2px">', Dados[I]) + 36),'</td>','', [rfReplaceAll, rfIgnoreCase]),'>','',[rfReplaceAll, rfIgnoreCase]));
                 AchouLogradouro := true;
            end;
            if (Pos('<td width="140" style="padding: 2px">', Dados[I]) > 0) and not AchouBairro then
            begin
                 Resultado.Add(StringReplace(StringReplace(Copy(Dados[I], Pos('<td width="140" style="padding: 2px">', Dados[I]) + 36, Length(Dados[I]) - Pos('<td width="140" style="padding: 2px">', Dados[I]) + 36),'</td>','', [rfReplaceAll, rfIgnoreCase]),'>','',[rfReplaceAll, rfIgnoreCase]));
                 AchouBairro := true;
            end
            else
            if Pos('<td width="140" style="padding: 2px">', Dados[I]) > 0 then
            begin
                 Resultado.Add(StringReplace(StringReplace(Copy(Dados[I], Pos('<td width="140" style="padding: 2px">', Dados[I]) + 36, Length(Dados[I]) - Pos('<td width="140" style="padding: 2px">', Dados[I]) + 36),'</td>','', [rfReplaceAll, rfIgnoreCase]),'>','',[rfReplaceAll, rfIgnoreCase]));
                 AchouCidade := true;
            end;
            if Pos('<td width="25" style="padding: 2px">', Dados[I]) > 0 then
            begin
                 Resultado.Add(StringReplace(StringReplace(Copy(Dados[I], Pos('<td width="25" style="padding: 2px">', Dados[I]) + 36, Length(Dados[I]) - Pos('<td width="25" style="padding: 2px">', Dados[I]) + 36),'</td>','', [rfReplaceAll, rfIgnoreCase]),'>','',[rfReplaceAll, rfIgnoreCase]));
                 AchouEstado := true;
            end;
       end;
  end;
  Auxiliar := TStringList.Create;
  if not AchouLogradouro then
       Auxiliar.Add('');
  if not AchouBairro then
       Auxiliar.Add('');
  if not AchouCidade then
       Auxiliar.Add('');
  if not AchouEstado then
       Auxiliar.Add('');
  for I := 0 to Resultado.Count - 1 do
  begin
       Auxiliar.Add(Resultado[I]);
  end;
  Result := Auxiliar;
end;

function trocaImpressoraPadrao(pNomeNovaImpressora: string):boolean;
var
  W2KSDP: function(pszPrinter: PChar): Boolean; stdcall;
  H: THandle;
  Size, Dummy: Cardinal;
  PI: PPrinterInfo2;
begin
  Result:= False;
  try
       if pNomeNovaImpressora <> '' then
       begin
            if (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion >= 5) then
            begin
                 @W2KSDP := GetProcAddress(GetModuleHandle(winspl), 'SetDefaultPrinterA');
                 if (@W2KSDP <> nil)and(W2KSDP(PChar(pNomeNovaImpressora))) then
                      Result:= true
                 else
                      RaiseLastOSError;
            end
            else
            begin
                 if OpenPrinter(PChar(pNomeNovaImpressora), H, nil) then
                 try
                      Winspool.GetPrinter(H, 2, nil, 0, @Size);

                      if GetLastError <> ERROR_INSUFFICIENT_BUFFER then
                           RaiseLastOSError;

                      GetMem(PI, Size) ;
                      try
                           if Winspool.GetPrinter(H, 2, PI, Size, @Dummy) then
                           begin
                                PI^.Attributes := PI^.Attributes or PRINTER_ATTRIBUTE_DEFAULT;
                                if Winspool.SetPrinter(H, 2, PI, PRINTER_CONTROL_SET_STATUS) then
                                     Result:= True
                                else
                                     RaiseLastOSError;
                           end
                           else
                                RaiseLastOSError;
                      finally
                           FreeMem(PI);
                      end;
                 finally
                     ClosePrinter(H) ;
                 end
                 else
                      RaiseLastOSError;
            end;
       end;
  except
       raise;
  end;
end;
{Troca a impressora padrão do windows}

{Nova Criptografia}
function CriptografaNova(Campo: String): String;
var
  I,
  Chave: integer;
begin
  for I:= 1 to Length(Campo) do
  begin
       Chave := ord(Campo[I]);
       Chave := Chave - 3;
       Result := Result + Chr(Length(Campo)+ Chave);
  end;
end;
{Nova Criptografia}

{Nova Descriptografia}
function DescriptografaNova(Campo: String): String;
var
  I,
  Chave: integer;
begin
  for I:= 1 to Length(Campo) do
  begin
       Chave := ord(Campo[I]);
       Chave := Chave + 3;
       Chave := Chave - Length(Campo);
       Result := Result + chr(Chave);
  end;
end;
{Validar Email}
function ValidarEmail(aStr: string): Boolean;
var
  mail : String;
begin
  aStr := Trim(UpperCase(aStr));
  if aStr <> '' then
  begin
       if Pos('@', aStr) > 1 then
       begin
            Delete(aStr, 1, pos('@', aStr));{caracteres após o @}
            if Pos('.', aStr) > 1 then      {se nos caracteres após o @ existir .}
            begin
                 mail := Copy(aStr,Pos('.', aStr),100);  {copia tudo que vier após o .}
                 if Length(mail) > 1 then  {se for maior que 1, email está ok}
                      Result := True
                 else
                      Result := False;
            end
            else
                 Result := False;
            //Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
       end
       else
            Result := False;
  end;
end;

{Validar Telefone}
function ValidarTelefone(aStr: string): Boolean;
begin
  aStr := Trim(UpperCase(aStr));
  if (Length(aStr) < 10) and (aStr <> '') then
  begin
       Result := True;
  end
  else
       Result := False;
end;

{Ler html e exibir o mesmo em web browser}
procedure LerHtml(WebBrowser: TWebBrowser; html: TStringList);
var
  ms: TMemoryStream;
begin
  try
       WebBrowser.Navigate('about:blank');
       ms := TMemoryStream.Create;
       html.SaveToStream(ms);
       ms.Seek(0,0);
       (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
  finally
       ms.Free;
  end;
end;

function MatarProcesso(NomeArquivo: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(NomeArquivo)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(NomeArquivo))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function MesExtenso2(NumMes:byte):String;
  var Meses: array[1..12] of String[15];
begin
  Result:='';
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  Result:= Meses[NumMes];
end;

function DataPorExtenso(Data:TDate):String;
var Ano,Mes,Dia:word;
begin
   DecodeDate(Data,Ano,Mes,Dia);
   Result:= IntToStr(Dia)+' de '+MesExtenso2(Mes)+' de '+IntToStr(Ano);
end;

function FormataHora(Tempo:Extended):String;
var
  Dia: Integer;
  Hora,
  Minuto,
  Segundo,
  MSegundo: Word;
  AuxHoras,
  AuxMinutos,
  AuxSegundos :String;
begin
  if Trunc(Tempo) >= 1 then
       Dia:= Trunc(Tempo)* 24
  else
       Dia:= 0;
  DecodeTime(Tempo,Hora,Minuto,Segundo,MSegundo);
  if Length(IntToStr(Dia + Hora))< 2 then
       AuxHoras:= '0'+  IntToStr(Dia + Hora)
  else
       AuxHoras:= IntToStr(Dia + Hora);
  if Length(IntToStr(Minuto))< 2 then
       AuxMinutos:= '0'+ IntToStr(Minuto)
  else
       AuxMinutos:= IntToStr(Minuto);
  if Length(IntToStr(Segundo))< 2 then
       AuxSegundos:= '0'+ IntToStr(Segundo)
  else
       AuxSegundos:= IntToStr(Segundo);
  FormataHora := AuxHoras+':'+AuxMinutos+':'+AuxSegundos;
end;


//Serializa field para arquivo JSON
function ConverteJSON(field: TField): TJSONValue;
begin
  case field.DataType of
      ftString, ftWideString, ftDate, ftDateTime:
      begin
           if field.IsNull then
                Result := TJSONNull.Create
           else
                Result := TJSONString.Create(field.Value);
      end;
      ftBoolean:
      begin
           if field.IsNull then
                Result := TJSONNull.Create
           else
                if field.Value = true then
                     Result := TJSONTrue.Create
                else
                     Result := TJSONFalse.Create;
      end;
      ftInteger, ftAutoInc, ftSmallint:
      begin
           if field.IsNull then
                Result := TJSONNull.Create
           else
                Result := TJSONNumber.Create(field.Value);
      end;
      ftFloat, ftCurrency, ftBCD:
      begin
           if field.IsNull then
                Result := TJSONNumber.Create(0)
           else
                Result := TJSONNumber.Create(field.Value);
      end;
  end;
end;

function LiberarMemoria: Boolean;
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

function FileTimeToDTime(FTime: TFileTime): TDateTime;
var
  LocalFTime: TFileTime;
  STime: TSystemTime;
begin
  FileTimeToLocalFileTime(FTime, LocalFTime);
  FileTimeToSystemTime(LocalFTime, STime);
  Result := SystemTimeToDateTime(STime);
end;

function DataCriacaoArquivo(Arquivo:String):TDateTime;
var
  SR: TSearchRec;
//  CreateDT, AccessDT, ModifyDT: TDateTime;
begin
  if FindFirst(Arquivo, faAnyFile, SR) = 0 then
  begin  // Data da criação do arquivo
       Result := FileTimeToDTime(SR.FindData.ftCreationTime);
//       // Data Último Acesso
//        Result := FileTimeToDTime(SR.FindData.ftLastAccessTime);
//       // Data Modificação
//       Result := FileTimeToDTime(SR.FindData.ftLastWriteTime);
  end
  else
      Result := 0;
  //FindClose(SR);
end;

end.
