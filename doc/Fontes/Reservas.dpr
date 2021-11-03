program Reservas;
{$APPTYPE CONSOLE}

{$R *.dres}

uses
  System.SysUtils,
  Winapi.Windows,
  IdHTTPWebBrokerBridge,
  Web.WebReq,
  Web.WebBroker,
  Datasnap.DSSession,
  Midaslib,
  IdSSLOpenSSL,
  IniFiles,
  IWSystem,
  UMetodos in 'UMetodos.pas' {Locavia: TDataModule},
  URotinasSistema in 'URotinasSistema.pas',
  UConfiguracao in 'UConfiguracao.pas' {dtmConfiguracao: TWebModule};

{$R *.res}

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

type
  TGetSSLPassword = class
    procedure OnGetSSLPassword(var APassword: String);
end;

procedure TGetSSLPassword.OnGetSSLPassword(var APassword: String);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(gsAppPath + gsAppName + '.ini');
  APassword := Descriptografa(ArqIni.ReadString('Certificado','passcrt',''));
  ArqIni.Free;
end;

procedure RunServer(APort: Integer);
var
  LInputRecord: TInputRecord;
  LEvent: DWord;
  LHandle: THandle;
  LServer: TIdHTTPWebBrokerBridge;
  LGetSSLPassword: TGetSSLPassword;
  LIOHandleSSL: TIdServerIOHandlerSSLOpenSSL;
  ArqIni: TIniFile;
begin
  Writeln(Format('Starting HTTP Server or port %d', [APort]));
  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  LGetSSLPassword := nil;
  try
    ArqIni := TIniFile.Create(gsAppPath + gsAppName + '.ini');
    if ArqIni.ReadString('Certificado','Protocolo','') = 'https' then
    begin
         LGetSSLPassword := TGetSSLPassword.Create;
         LIOHandleSSL := TIdServerIOHandlerSSLOpenSSL.Create(LServer);
         LIOHandleSSL.SSLOptions.CertFile := ArqIni.ReadString('Certificado','CertFile','');
         LIOHandleSSL.SSLOptions.RootCertFile := ArqIni.ReadString('Certificado','RootCertFile','');
         LIOHandleSSL.SSLOptions.KeyFile := ArqIni.ReadString('Certificado','KeyFile','');
         LIOHandleSSL.OnGetPassword := LGetSSLPassword.OnGetSSLPassword;
         LServer.IOHandler := LIOHandleSSL;
    end;
    ArqIni.Free;
    LServer.DefaultPort := APort;
    LServer.Active := True;
    Writeln('Press ESC to stop the server');
    Writeln('');
    Writeln('Web Server Reservas Locavia');
    LHandle := GetStdHandle(STD_INPUT_HANDLE);
    while True do
    begin
      Win32Check(ReadConsoleInput(LHandle, LInputRecord, 1, LEvent));
      if (LInputRecord.EventType = KEY_EVENT) and
      LInputRecord.Event.KeyEvent.bKeyDown and
      (LInputRecord.Event.KeyEvent.wVirtualKeyCode = VK_ESCAPE) then
        break;
    end;
    TerminateThreads();
  finally
    LServer.Free;
    LGetSSLPassword.Free;
  end;
end;

begin
  try
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
    RunServer(8078);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.
