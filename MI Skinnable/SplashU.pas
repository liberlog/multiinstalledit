unit SplashU;

interface

{$IFDEF FPC}
{$Mode Delphi}
{$R *.lfm}
{$ELSE}
{$R *.DFM}
{$ENDIF}

uses
  SysUtils, Graphics, Forms, Classes, ExtCtrls, Controls;

type

  { TfrmSplashScreen }

  TfrmSplashScreen = class(TForm)
    ImageSplash: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplashScreen: TfrmSplashScreen;

implementation

uses GoWinU;

procedure TfrmSplashScreen.FormCreate(Sender: TObject);
begin
  if FileExists(GoWinDir + '\splash.jpg') then
    ImageSplash.Picture.LoadFromFile(GoWinDir + '\splash.jpg')
  else if FileExists(GoWinDir + '\splash.gif') then
    ImageSplash.Picture.LoadFromFile(GoWinDir + '\splash.gif')
  else if FileExists(GoWinDir + '\splash.bmp') then
    ImageSplash.Picture.LoadFromFile(GoWinDir + '\splash.bmp')
  else if FileExists(GoWinDir + '\splash.png') then
    ImageSplash.Picture.LoadFromFile(GoWinDir + '\splash.png');
  frmSplashScreen.Width:=ImageSplash.Width;
  frmSplashScreen.Height:=ImageSplash.Height;
end;

end.