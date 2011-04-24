unit EnterPasswordU;

interface

uses
  {$IFDEF FPC}
  LCLType,
  {$ELSE}
  Windows,
  {$ENDIF}
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmEnterPassword = class(TForm)
    EditPassword: TEdit;
    lblEnterPassword: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnterPassword: TfrmEnterPassword;

implementation

{$R *.dfm}

procedure TfrmEnterPassword.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    EditPassword.Text := '';
    ModalResult := mrCancel;
  end
  else if Key = #13 then
    ModalResult := mrOK;
end;

end.