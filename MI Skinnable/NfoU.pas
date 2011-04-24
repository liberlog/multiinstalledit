unit NfoU;

interface

{$IFDEF FPC}
{$Mode Delphi}
{$R *.lfm}
{$ELSE}
{$R *.DFM}
{$ENDIF}

uses
{$IFDEF FPC}
  LCLType, LCLIntf, lmessages,
{$ELSE}
  Windows,
{$ENDIF}
  Messages, Classes, Graphics, Forms,
  GoWinU, ExtCtrls, Controls, Sysutils,
  RichView, Menus, RVSTyle;

type
  TfrmNFO = class(TForm)
    ImgNFO: TImage;
    RichViewNFO: TRichView;
//    RVStyleNFO: TRVStyle;
    ChkImg: TTimer;
    imgClose: TImage;
    PopupMenuNfo: TPopupMenu;
    mnuNfoSelectAll: TMenuItem;
    mnuNfoCopy: TMenuItem;
    procedure ImgNFOMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LoadSkin;
    procedure FormCreate(Sender: TObject);
    procedure RichViewNFOKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure RichViewNFOJump(Sender: TObject; id: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChkImgTimer(Sender: TObject);
    procedure imgCloseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCloseMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCloseClick(Sender: TObject);
    procedure PopupMenuNfoPopup(Sender: TObject);
    procedure mnuNfoSelectAllClick(Sender: TObject);
    procedure mnuNfoCopyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowNfoFile(const filename : string; stream : TStream);
  end;

var
  frmNFO     : TfrmNFO;

implementation

uses
  SkinButton;

var
  NfoUrls    : TStringList;
  btnClose: TSkinButton; // Close button with normal, mouse over, mouse down

////////////////////////////////////////////////////////////////////////

procedure TfrmNFO.ShowNfoFile(const filename : string; stream : TStream);
var
  sl : TStringList;
begin
  sl:=TStringList.Create;

  if filename <> '' then
  begin
    if FileExists(filename) then
      sl.LoadFromFile(filename)
    else
      Exit;
  end
  else if stream <> nil then
    sl.LoadFromStream(stream)
  else
    Exit;

  RichViewNFO.Clear;
  frmMain.UrlHighLight(RichViewNFO, sl.Text, NfoUrls);
  RichViewNFO.Format;

  frmNFO.ShowModal;

  sl.Free;

  frmNfo.ChkImg.Enabled := True;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmNFO.ImgNFOMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform({$IFDEF FPC}LM_SysCommand{$ELSE}WM_SysCommand{$ENDIF}, $F012, 0);
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmNFO.LoadSkin;
begin
  // set positions and sizes of controls
  RichViewNFO.Left:=frmMain.NfoPosSize.iTextboxX;
  RichViewNFO.Top:=frmMain.NfoPosSize.iTextboxY;
  RichViewNFO.Width:=frmMain.NfoPosSize.iTextboxWidth;
  RichViewNFO.Height:=frmMain.NfoPosSize.iTextboxHeight;
  imgClose.Left:=frmMain.NfoPosSize.iOKX;
  imgClose.Top:=frmMain.NfoPosSize.iOKY;

  // Create button images
  SkinButtonInit(btnClose);

  imgClose.Transparent := ButtonsTransparent;

  if frmMain.ExistsSkinImage('NfoOK') then
    frmMain.LoadSkinButton(imgClose, btnClose, 'NfoOk', True);
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmNFO.FormCreate(Sender: TObject);
begin
  LoadSkin;
  NfoUrls:=TStringList.Create;

  if not frmMain.RichViewDescr.AllowSelection then
  begin
    RichViewNfo.AllowSelection := False;
    RichViewNfo.PopupMenu := nil;
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmNFO.RichViewNFOKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := 1;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmNFO.FormDestroy(Sender: TObject);
begin
  NfoUrls.Free;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmNFO.RichViewNFOJump(Sender: TObject; id: Integer);
begin
  if NfoUrls.Count > id then
    frmMain.UrlJumpTo(NfoUrls.Strings[id]);
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmNFO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ChkImg.Enabled := False;
  ModalResult := 1;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmNFO.ChkImgTimer(Sender: TObject);
var
  x, y : integer;
  blnClose: boolean;
begin
// Close/Minimize Status
// 0 = normal
// 1 = mouse over
// 2 = down

  blnClose:=False;

  x:=Mouse.CursorPos.x - frmNFO.Left;
  y:=Mouse.CursorPos.y - frmNFO.Top;

  if frmMain.MouseOverImage(btnClose, imgClose, x, y) then
    blnClose := True;

  if (not blnClose) and (btnClose.Status <> 0) and (btnClose.Status <> 2) then
  begin
    imgClose.Picture.Assign(btnClose.pic);
    btnClose.Status:=0; // 0 = normal
  end;
end;

procedure TfrmNFO.imgCloseMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    imgClose.Picture.Assign(btnClose.picMDown);
    btnClose.Status := 2; // 2 = Mouse Down
  end;
end;

procedure TfrmNFO.imgCloseMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  btnClose.Status := 3; // 3 = Nothing - let timer decide
end;

procedure TfrmNFO.imgCloseClick(Sender: TObject);
begin
  ModalResult := 1;
end;

procedure TfrmNFO.PopupMenuNfoPopup(Sender: TObject);
begin
  mnuNfoCopy.Enabled:=RichViewNfo.SelectionExists;
end;

procedure TfrmNFO.mnuNfoSelectAllClick(Sender: TObject);
begin
  RichViewNfo.SelectAll;
  RichViewNfo.Format;
  RichViewNfo.Refresh;
end;

procedure TfrmNFO.mnuNfoCopyClick(Sender: TObject);
begin
  RichViewNfo.CopyText;
end;

end.