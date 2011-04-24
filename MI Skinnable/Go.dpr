program Go;

uses
  Forms,
  SysUtils,
  GoWinU in 'GoWinU.pas' {frmMain},
  InstallU in 'InstallU.pas' {frmInstall},
  UnitUnpack in 'UnitUnpack.pas' {frmUnpack},
  MsgboxU in 'MsgboxU.pas' {frmMsgBox},
  SplashU in 'SplashU.pas' {frmSplashScreen},
  DecryptU in 'DecryptU.pas' {frmDecrypt},
  NfoU in 'NfoU.pas' {frmNFO},
  SearchU in 'SearchU.pas' {frmSearch},
  EnterPasswordU in 'EnterPasswordU.pas' {frmEnterPassword},
  ScreenshotU in 'ScreenshotU.pas' {frmScreenshot};

{$R *.RES}
{$R ZipMsgUS.res}

begin
  Application.Initialize;
  Application.Title := 'Multi Install Skinnable 2.4.5';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmInstall, frmInstall);
  Application.CreateForm(TfrmUnpack, frmUnpack);
  Application.CreateForm(TfrmMsgBox, frmMsgBox);
  Application.Run;
end.
