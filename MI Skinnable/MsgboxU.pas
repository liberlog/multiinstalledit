unit MsgboxU; // modal msgbox

interface

{$IFDEF FPC}
{$Mode Delphi}
{$R *.lfm}
{$ELSE}
{$R *.DFM}
{$ENDIF}

uses
  {$IFDEF FPC}
  LCLType, lmessages,
  {$ELSE}
  Windows,
  {$ENDIF}
  Classes, Graphics, RichView,
  Controls, Forms, Dialogs, Messages,
  StdCtrls, ExtCtrls, sysutils, Menus;

type
  TfrmMsgBox = class(TForm)
    lblMsgTitle: TLabel;
    imgMsgBox: TImage;
    RichViewMsgBox: TRichView;
    ChkImg: TTimer;
    imgOK: TImage;
    imgOCCancel: TImage;
    imgOCOK: TImage;
    PopupMenuMsgBox: TPopupMenu;
    mnuMsgBoxSelectAll: TMenuItem;
    mnuMsgBoxCopy: TMenuItem;
    procedure LoadSkin;
    procedure FormCreate(Sender: TObject);
    procedure MsgBox(Msg: string; AType: TMsgDlgType;
      AButtons: TMsgDlgButtons; HelpCtx: longint);
    procedure SBOkClick(Sender: TObject);
    procedure SBCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RichViewMsgBoxJump(Sender: TObject; id: integer);
    procedure RichViewMsgBoxKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var AAction: TCloseAction);
    procedure imgOKClick(Sender: TObject);
    procedure ChkImgTimer(Sender: TObject);
    procedure imgOKMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgOKMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgOCCancelClick(Sender: TObject);
    procedure imgOCCancelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgOCCancelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure lblMsgTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgMsgBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgOCOKMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgOCOKMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure mnuMsgBoxSelectAllClick(Sender: TObject);
    procedure mnuMsgBoxCopyClick(Sender: TObject);
    procedure PopupMenuMsgBoxPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    msgboxReturn: word;
    NewSkinName: string;
  end;

var
  frmMsgBox: TfrmMsgBox;
  btns: TMsgDlgButtons;
  MsgBoxUrls: TStringList;

implementation

uses
  {$IFDEF FPC}
  LCLIntf,
  {$ENDIF}
  GoWinU, SkinButton;

var
  btnOk: TSkinButton;
  btnOcOk: TSkinButton;
  btnOcCancel: TSkinButton;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.LoadSkin;
begin
  frmMain.LoadSkinImage(imgMsgBox.Picture, 'msgbox', True);
  frmMsgBox.Width := imgMsgBox.Width;
  frmMsgBox.Height := imgMsgBox.Height;

  if frmMain.MsgBoxPosSize.TextboxWidth +
     frmMain.MsgBoxPosSize.TextboxHeight = 0 then
    Exit;

  imgOk.Transparent := ButtonsTransparent;
  imgOcOk.Transparent := ButtonsTransparent;
  imgOcCancel.Transparent := ButtonsTransparent;

  with frmMain.MsgBoxPosSize do
  begin
    lblMsgTitle.Left := TitleX;
    lblMsgTitle.Top := TitleY;
    RichViewMsgBox.Left := TextboxX;
    RichViewMsgBox.Top := TextboxY;
    RichViewMsgBox.Width := TextboxWidth;
    RichViewMsgBox.Height := TextboxHeight;

    imgOK.Left := OKX;
    imgOK.Top := OKY;

    imgOcOK.Left := OcOKX;
    imgOcOK.Top := OcOKY;

    imgOcCancel.Left := OcCancelX;
    imgOcCancel.Top := OcCancelY;
  end;

  SkinButtonInit(btnOk);
  if frmMain.ExistsSkinImage('MsgBoxOK') then
    frmMain.LoadSkinButton(imgOK, btnOk, 'MsgBoxOK', imgOK.Visible);

  SkinButtonInit(btnOcOk);
  if frmMain.ExistsSkinImage('MsgBoxOcOK') then
    frmMain.LoadSkinButton(imgOcOK, btnOcOk, 'MsgBoxOcOK', imgOcOK.Visible);

  SkinButtonInit(btnOcCancel);
  if frmMain.ExistsSkinImage('MsgBoxOcCancel') then
    frmMain.LoadSkinButton(imgOcCancel, btnOcCancel, 'MsgBoxOcCancel', imgOcCancel.Visible);


  lblMsgTitle.Font := frmMain.lblTitle.Font;
  lblMsgTitle.Font.Size := frmMain.othertitlesfontsize;

  frmMain.MakeTransparent(frmMsgBox, imgMsgBox);

  if not trlunpack then
    frmMain.MakeTranslucency(frmMsgBox.Handle, vtranslucenty);

  // copy background of imgMsgBox to background of NFO textbox
  RichViewMsgBox.BackgroundBitmap.Width := RichViewMsgBox.Width;
  RichViewMsgBox.BackgroundBitmap.Height := RichViewMsgBox.Height;
  BitBlt(RichViewMsgBox.BackgroundBitmap.Canvas.Handle,    // Destination
    0, 0,                                                  // X, Y (target pos)
    RichViewMsgBox.Width, RichViewMsgBox.Height,           // Size to copy
    imgMsgBox.Canvas.handle,                               // Source
    RichViewMsgBox.Left, RichViewMsgBox.Top,               // X, Y (source pos)
    SrcCopy);                                              // plain copy
  RichViewMsgBox.BackgroundStyle := bsTiledAndScrolled;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.FormCreate(Sender: TObject);
begin
  LoadSkin;

  mnuMsgBoxSelectAll.Caption:=frmMain.mnuDescrSelectAll.Caption;
  mnuMsgBoxCopy.Caption:=frmMain.mnuDescrCopy.Caption;
  if not frmMain.RichViewDescr.AllowSelection then
  begin
    RichViewMsgBox.AllowSelection := False;
    RichViewMsgBox.PopupMenu := nil;
  end;

  MsgBoxUrls := TStringList.Create;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.MsgBox(Msg: string; AType: TMsgDlgType;
  AButtons: TMsgDlgButtons; HelpCtx: longint);
begin
  btns := AButtons;
  case AType of
    mtWarning: lblMsgTitle.Caption := LanguageGo.sWarning;
    mtError: lblMsgTitle.Caption := LanguageGo.sError;
    mtInformation: lblMsgTitle.Caption := LanguageGo.sInformation;
    mtConfirmation: lblMsgTitle.Caption := LanguageGo.sConfirmation;
    mtCustom: lblMsgTitle.Caption := 'Retry';
    else
      lblMsgTitle.Caption := 'Multi Install';
  end;

  if ((mbOK in AButtons) and // OK + Cancel
    (mbCancel in AButtons)) or
    ((mbYes in AButtons) and // Yes + No
    (mbNo in AButtons)) then
  begin
    imgOcOK.Visible := True;
    imgOcCancel.Visible := True;
    imgOK.Visible := False;
  end
  else if mbOK in AButtons then // OK only
  begin
    imgOcOK.Visible := False;
    imgOcCancel.Visible := False;
    imgOK.Visible := True;
  end;

  RichViewMsgBox.Clear;
  frmMain.UrlHighLight(RichViewMsgBox, msg, MsgBoxUrls);
  RichViewMsgBox.Format;

  ChkImg.Enabled := True; // start timer for mouse over gfx buttons
  frmMsgBox.ShowModal
end; // MsgBox

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.SBOkClick(Sender: TObject);
begin
  if mbOK in btns then
    msgBoxReturn := mrOk
  else
    msgBoxReturn := mrYes;
  ModalResult := 1;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.SBCancelClick(Sender: TObject);
begin
  ChkImg.Enabled := False; // stop timer for mouse over gfx buttons
  msgBoxReturn := mrCancel;
  ModalResult := 1;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.FormDestroy(Sender: TObject);
begin
  MsgBoxUrls.Free;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.RichViewMsgBoxJump(Sender: TObject; id: integer);
var
  s: string;
begin
  if MsgBoxUrls.Count > id then
  begin
    s := MsgBoxUrls.Strings[id];
    if Copy(s, 1, 7) = 'script:' then
      frmMain.RunScript(s)
    else
      frmMain.UrlJumpTo(s);
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.RichViewMsgBoxKeyPress(Sender: TObject;
  var Key: char);
begin
  if Key = #27 then
  begin
    msgBoxReturn := mrCancel;
    ModalResult := 1;
  end
  else if Key = #13 then
    ModalResult := 1;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.FormClose(Sender: TObject; var AAction: TCloseAction);
begin
  ChkImg.Enabled := False; // stop timer for mouse over gfx buttons
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.imgOKClick(Sender: TObject);
begin
  ChkImg.Enabled := False; // stop timer for mouse over gfx buttons
  if mbOK in btns then
    msgBoxReturn := mrOk
  else
    msgBoxReturn := mrYes;
  ModalResult := 1;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.ChkImgTimer(Sender: TObject);
var
  x, y: integer;
  blnOk: boolean;
  blnOcOk: boolean;
  blnOcCancel: boolean;
begin
  // Cancel Status
  // 0 = normal
  // 1 = mouse over
  // 2 = down

  blnOk := False;
  blnOcOk := False;
  blnOcCancel := False;

  x := Mouse.CursorPos.x - frmMsgBox.Left;
  y := Mouse.CursorPos.y - frmMsgBox.Top;;

  if frmMain.MouseOverImage(btnOk, imgOK, x, y) then
    blnOk := True
  else if frmMain.MouseOverImage(btnOcOk, imgOcOK, x, y) then
    blnOcOk := True
  else if frmMain.MouseOverImage(btnOcCancel, imgOcCancel, x, y) then
    blnOcCancel := True;

  if (not blnOk) and (btnOk.Status <> 0) then
  begin
    if imgOk.Visible then
      imgOk.Picture.Assign(btnOk.pic);
    btnOk.Status := 0; // 0 = normal
  end;
  if (not blnOcOk) and (btnOcOk.Status <> 0) then
  begin
    if imgOcOk.Visible then
      imgOcOk.Picture.Assign(btnOcOk.pic);
    btnOcOk.Status := 0; // 0 = normal
  end;
  if (not blnOcCancel) and (btnOcCancel.Status <> 0) then
  begin
    if imgOcCancel.Visible then
      imgOcCancel.Picture.Assign(btnOcCancel.pic);
    btnOcCancel.Status := 0; // 0 = normal
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.imgOKMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgOk.Picture.Assign(btnOk.picMDown);
    btnOk.Status := 2; // 2 = Mouse Down
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.imgOKMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  btnOk.Status := 3; // let timer deceide
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.imgOCCancelClick(Sender: TObject);
begin
  ChkImg.Enabled := False; // stop timer for mouse over gfx buttons
  msgBoxReturn := mrCancel;
  ModalResult := 1;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.imgOCCancelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgOcCancel.Picture.Assign(btnOcCancel.picMDown);
    btnOcCancel.Status := 2; // 2 = Mouse Down
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.imgOCCancelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  btnOcCancel.Status := 2; // let timer deceide
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.lblMsgTitleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform({$IFDEF FPC}LM_SysCommand{$ELSE}WM_SysCommand{$ENDIF}, $F012, 0);
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.imgMsgBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform({$IFDEF FPC}LM_SysCommand{$ELSE}WM_SysCommand{$ENDIF}, $F012, 0);
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.imgOCOKMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgOcOK.Picture.Assign(btnOcOK.picMDown);
    btnOcOK.Status := 2; // 2 = Mouse Down
  end;
end;

procedure TfrmMsgBox.imgOCOKMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  btnOcOK.Status := 3; // 3 = let timer deceide
end;

procedure TfrmMsgBox.mnuMsgBoxSelectAllClick(Sender: TObject);
begin
  RichViewMsgBox.SelectAll;
  RichViewMsgBox.Format;
  RichViewMsgBox.Refresh;
end;

procedure TfrmMsgBox.mnuMsgBoxCopyClick(Sender: TObject);
begin
  RichViewMsgBox.CopyText;
end;

procedure TfrmMsgBox.PopupMenuMsgBoxPopup(Sender: TObject);
begin
  mnuMsgBoxCopy.Enabled := RichViewMsgBox.SelectionExists;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMsgBox.FormShow(Sender: TObject);
begin
  if NewSkinName <> '' then
  begin
    LoadSkin;
    NewSkinName := '';
  end;
end;

////////////////////////////////////////////////////////////////////////

end.

////////////////////////////////////////////////////////////////////////