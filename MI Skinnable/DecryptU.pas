unit DecryptU;

interface

{$IFDEF FPC}
{$Mode Delphi}
{$R *.lfm}
{$ELSE}
{$R *.DFM}
{$ENDIF}

uses
{$IFDEF FPC}
  LCLType, LCLIntf,
{$ELSE}
  Windows,
{$ENDIF}
  Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, EditBtn, Classes;

type

  { TfrmDecrypt }

  TfrmDecrypt = class(TForm)
    Panel1: TPanel;
    ProgressBar: TProgressBar;
    lblDecrypt: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SetPassword(const SMsg: string);
    function GetEof: boolean;

    procedure DecryptOpen(const fname: string);
    procedure DecryptClose;
    function Decrypt: string;

  private
    { Private declarations }
  public
    { Public declarations }
    encdecf: integer;
    Pwd: string;
    OriginalPwd: string;
  end;

var
  frmDecrypt: TfrmDecrypt;

implementation

uses
  GoWinU, SysUtils, Messages, Dialogs, Graphics, EnterPasswordU;

var
  a: int64;
  fsize: int64;
  PwdChk: int64;
  PasswordDigit: int64;

////////////////////////////////////////////////////////////////////////

procedure TfrmDecrypt.SetPassword(const sMsg: string);
begin
  Application.CreateForm(TfrmEnterPassword, frmEnterPassword);
  frmEnterPassword.lblEnterPassword.Caption := sMsg;

//  Pwd := InputBox('Enter password', sMsg, '');
  if frmEnterPassword.ShowModal = mrOK then
    Pwd := frmEnterPassword.EditPassword.Text
  else
    Pwd := '';

  frmEnterPassword.Free;
  OriginalPwd := Pwd;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmDecrypt.FormCreate(Sender: TObject);
begin
  frmDecrypt.Width := Panel1.Width;
  frmDecrypt.Height := Panel1.Height;
  frmDecrypt.Top := (Screen.Height div 2) - (frmDecrypt.Height div 2);
  frmDecrypt.Left := (Screen.Width div 2) - (frmDecrypt.Width div 2);
  Pwd := '';
end;

////////////////////////////////////////////////////////////////////////

function RotateBits(C: char; Bits64: int64): char;
var
  Bits: integer;
  SI: word;
begin
  Bits := Bits64 mod 8;
  // Are we shifting left?
  if Bits < 0 then
  begin
    // Put the data on the right half of a Word (2 bytes)
    SI := MakeWord(byte(C), 0);
    // Now shift it left the appropriate number of bits
    SI := SI shl Abs(Bits);
  end
  else
  begin
    // Put the data on the left half of a Word (2 bytes)
    SI := MakeWord(0,byte(C));
    // Now shift it right the appropriate number of bits
    SI := SI shr Abs(Bits);
  end;
  // Finally, Swap the bytes
  SI := Swap(SI);
  // And OR the two halves together
  SI := Lo(SI) or Hi(SI);
  Result := Chr(SI);
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmDecrypt.DecryptOpen(const fname: string);
var
  i: integer;
  SRec: TSearchRec;
begin
  if Trim(Pwd) <> '' then
  begin
    PasswordDigit := 1;
    PwdChk := 0;
    lblDecrypt.Caption := 'Reading the file ' + fname + '...';
    frmDecrypt.Refresh;
    lblDecrypt.Caption := 'Decrypting ' + ExtractFileName(fname) + '...';
    frmDecrypt.Refresh;
    frmMain.Refresh;

    encdecf := FileOpen(fname, fmShareDenyNone);

    for i := 1 to Length(Pwd) do
      Inc(PwdChk, Ord(Pwd[i]));

    ProgressBar.Position := 0;

    i := FindFirst(fname, faAnyfile, srec);
    if (i = 0) and (srec.size <> 0) then
    begin
      ProgressBar.Max := 100;
      fsize := srec.size;
    end;
    FindClose(srec);

    a := 0;
  end;
end;

////////////////////////////////////////////////////////////////////////

function TfrmDecrypt.GetEof: boolean;
begin
  Result := a >= fsize
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmDecrypt.DecryptClose;
begin
  FileClose(encdecf);
end;

////////////////////////////////////////////////////////////////////////

function TfrmDecrypt.Decrypt: string;
var
  i: integer;
  nychar: integer;
  ShiftVal: integer;
  ch: char;
  endofline: boolean;
  s: string;
begin
  s := '';
  endofline := False;
  while (not GetEof) and (not endofline) do
  begin
    for i := 1 to Length(Pwd) do
      Inc(PwdChk, Ord(Pwd[i]));

    Inc(a);

    ShiftVal := Ord(Pwd[PasswordDigit]);

    FileRead(encdecf, ch, 1);

    if ch = #0 then
      nychar := Ord(Pwd[PasswordDigit])
    else
      nychar := (Ord(Pwd[PasswordDigit]) + Ord(ch)) mod 255;

    Pwd[PasswordDigit] := char(nychar);

    if Odd(a) then
      ch := RotateBits(ch, - 1 * (ShiftVal + PwdChk))
    else
      ch := RotateBits(ch, 1 * (ShiftVal + PwdChk));

    s := s + ch; // decrypted string

    if PasswordDigit = Length(Pwd) then
      PasswordDigit := 1
    else
      Inc(PasswordDigit);

    if length(s) > 1 then
    begin
      if (s[Length(s) - 1] = #13) and (s[Length(s)] = #10) then
        endofline := True;
    end;
  end;
  ProgressBar.Position := (a * 100) div fsize;
  Result := s;
end; // Decrypt

////////////////////////////////////////////////////////////////////////

end.
