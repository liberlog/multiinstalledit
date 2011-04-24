unit ScreenshotU;

interface

uses
{$IFDEF FPC}
  LCLType, LCLIntf, lmessages,
{$ELSE}
  Windows,
{$ENDIF}
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfrmScreenshot = class(TForm)
    imgScreenshot: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure imgScreenshotClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmScreenshot: TfrmScreenshot;

implementation

{$R *.dfm}

procedure TfrmScreenshot.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := 1;
end;

procedure TfrmScreenshot.imgScreenshotClick(Sender: TObject);
begin
  ModalResult := 1;
end;

end.