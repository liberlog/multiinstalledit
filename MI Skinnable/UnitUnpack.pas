unit UnitUnpack;

interface

{$IFDEF FPC}
{$Mode Delphi}
{$R *.lfm}
{$ELSE}
{$R *.DFM}
{$ENDIF}

uses
  {$IFDEF FPC}
  LCLType, FileUtil,
  {$ELSE}
  Windows,
  {$ENDIF}
  Messages, SysUtils, Classes, Graphics,
  Controls, Forms, ExtCtrls,
  StdCtrls, Dialogs, ComCtrls;

type
  TfrmUnpack = class(TForm)
    lblBytes: TLabel;
    lblCurrentFileLabel: TLabel;
    lblAllFilesLabel: TLabel;
    lblTotalMB: TLabel;
    lblLabelElapsedTime: TLabel;
    lblLabelEstimatedTime: TLabel;
    lblEstiTime: TLabel;
    lblElapTime: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblCurrentFile: TLabel;
    imgUnpack: TImage;
    lblUnpackTitle: TLabel;
    Gauge2: TProgressBar;
    Gauge1: TProgressBar;
    ChkImg: TTimer;
    imgCancel: TImage;
    procedure LoadSkin;
    procedure FormCreate(Sender: TObject);
    {
    procedure imgUnpackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);}
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var AAction: TCloseAction);
    procedure imgCancelClick(Sender: TObject);
    procedure ChkImgTimer(Sender: TObject);
    procedure imgCancelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCancelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CopyFileWithProgress(CopySource: string; CopyDest: string; CopyOverWrite: boolean; const Title: string);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NewSkinName: string;
  end;

var
  frmUnpack: TfrmUnpack;

implementation

uses
  GoWinU, InstallU, SkinButton, MsgboxU;

var
  // Cancel button with normal, mouse over, mouse down
  btnCancel: TSkinButton;

procedure TfrmUnpack.LoadSkin;
begin
  try
  {$IFNDEF FPC}
  frmMain.LoadSkinImage(imgUnpack.Picture,'unpack',True);
  {$ENDIF}
  frmUnpack.Width:=imgUnpack.Width; // Use width from image
  frmUnpack.Height:=imgUnpack.Height; // Use height from image

  imgCancel.Transparent := ButtonsTransparent;

  with frmMain.UnpackPosSize do
  begin
    lblUnpackTitle.Left:=TitleX;
    lblUnpackTitle.Top:=TitleY;

    lblCurrentFileLabel.Left:=Progressbar1TitleX;
    lblCurrentFileLabel.Top:=Progressbar1TitleY;
    lblCurrentFile.Top:=Progressbar1TitleY;
    lblCurrentFile.Left:=lblCurrentFileLabel.Left+lblCurrentFileLabel.Width+5;
    Gauge1.Left:=Progressbar1X;
    Gauge1.Top:=Progressbar1Y;
    Gauge1.Width:=Progressbar1Width;
    Gauge1.Height:=Progressbar1Height;
    lblBytes.Left:=Progressbar1StatusX;
    lblBytes.Top:=Progressbar1StatusY;

    lblAllFilesLabel.Left:=Progressbar2TitleX;
    lblAllFilesLabel.Top:=Progressbar2TitleY;
    Gauge2.Left:=Progressbar2X;
    Gauge2.Top:=Progressbar2Y;
    Gauge2.Width:=Progressbar2Width;
    Gauge2.Height:=Progressbar2Height;
    lblTotalMB.Left:=Progressbar2StatusX;
    lblTotalMB.Top:=Progressbar2StatusY;

    lblLabelElapsedTime.Left:=TimeElapsedX;
    lblLabelElapsedTime.Top:=TimeElapsedY;
    Label3.Top:=TimeElapsedY;
    lblElapTime.Top:=TimeElapsedY;

    lblLabelEstimatedTime.Left:=TimeEstimatedX;
    lblLabelEstimatedTime.Top:=TimeEstimatedY;
    Label4.Top:=TimeEstimatedY;
    lblEstiTime.Top:=TimeEstimatedY;

    imgCancel.Left:=CancelX;
    imgCancel.Top:=CancelY;
  end;

  SkinButtonInit(btnCancel);
  if frmMain.ExistsSkinImage('UnpackCancel') then
    frmMain.LoadSkinButton(imgCancel, btnCancel, 'UnpackCancel', True);


  lblUnpackTitle.Font:=frmMain.lblScreenshotCounter.Font;
  lblUnpackTitle.Font.Size:=14;
  lblCurrentFileLabel.Font:=frmMain.lblScreenshotCounter.Font;
  lblCurrentFile.Font:=lblCurrentFileLabel.Font;
  lblBytes.Font:=lblCurrentFileLabel.Font;
  lblAllFilesLabel.Font:=lblCurrentFileLabel.Font;
  lblTotalMB.Font:=lblCurrentFileLabel.Font;
  lblLabelElapsedTime.Font:=lblCurrentFileLabel.Font;
  lblLabelEstimatedTime.Font:=lblCurrentFileLabel.Font;
  lblElapTime.Font:=lblCurrentFileLabel.Font;
  lblEstiTime.Font:=lblCurrentFileLabel.Font;
  label3.Font:=lblCurrentFileLabel.Font;
  label4.Font:=lblCurrentFileLabel.Font;

  // Current file
  lblCurrentFile.Left:=lblCurrentFileLabel.Width + lblCurrentFileLabel.Left + 5;

  // Elapsed time
  Label3.Left := lblLabelElapsedTime.Left + lblLabelElapsedTime.Width + 5;
  lblElapTime.Left := Label3.Left + Label3.Width + 5;

  // Estimated time left
  Label4.Left := lblLabelEstimatedTime.Left + lblLabelEstimatedTime.Width + 5;
  lblEstiTime.Left := Label4.Left + Label4.Width + 5;


  Gauge1.Font:=frmMain.VSTree.Font;
  Gauge2.Font:=frmMain.VSTree.Font;
{
  Gauge1.BackColor:=frmMain.VSTree.Color;
  Gauge2.BackColor:=frmMain.VSTree.Color;

  Gauge1.ForeColor:=frmMain.lblMessage.Font.Color;
  Gauge2.ForeColor:=frmMain.lblMessage.Font.Color;
 }
  frmMain.MakeTransparent(frmUnpack, imgUnpack);

  {$IFNDEF FPC}
  frmMain.MakeTranslucency(frmUnpack.Handle, vtranslucenty);
  {$ENDIF}
  except
    on E: Exception do ShowMessage(E.Message);
  end;
end;

procedure TfrmUnpack.FormCreate(Sender: TObject);
begin
  lblCurrentFileLabel.Caption:=LanguageGo.sCurrentFile;
  lblAllFilesLabel.Caption:=LanguageGo.sTotalProgress;
  lblLabelElapsedTime.Caption:=LanguageGo.sElapsed;
  lblLabelEstimatedTime.Caption:=LanguageGo.sEstimated;

  LoadSkin;

  Gauge1.Max := 100;
  Gauge2.Max := 100;
end; // FormCreate
{
procedure TfrmUnpack.imgUnpackMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    perform(WM_SysCommand, $F012, 0);
  end;
end;
 }
procedure TfrmUnpack.FormActivate(Sender: TObject);
begin
// Autosize window title
  lblUnpackTitle.Font:=frmMain.lblTitle.Font;
  lblUnpackTitle.Font.Size:=frmMain.othertitlesfontsize;
  while (lblUnpackTitle.Width > imgUnpack.Width) and
        (lblUnpackTitle.Font.Size > 1) do
  begin
    lblUnpackTitle.Font.Size:=lblUnpackTitle.Font.Size-1;
    lblUnpackTitle.Top:=lblUnpackTitle.Top+2;
  end;
end; // FormActivate

procedure TfrmUnpack.FormClose(Sender: TObject; var AAction: TCloseAction);
begin
//  frmInstall.DoCancel;
  btnCancel.Status := 3;
end;

procedure TfrmUnpack.imgCancelClick(Sender: TObject);
begin
//  frmInstall.DoCancel;
  btnCancel.Status := 3;
end;

procedure TfrmUnpack.ChkImgTimer(Sender: TObject);
var
  x, y : integer;
  blnCancel: boolean;
begin
// Cancel Status
// 0 = normal
// 1 = mouse over
// 2 = down

  blnCancel:=False;

  x:=Mouse.CursorPos.x - frmUnpack.Left;
  y:=Mouse.CursorPos.y - frmUnpack.Top;;

  if frmMain.MouseOverImage(btnCancel, imgCancel, x, y) then
    blnCancel:=True;

  if (not blnCancel) and (btnCancel.Status <> 0) then
  begin
    if imgCancel.Enabled then
      imgCancel.Picture.Assign(btnCancel.pic)
    else
      imgCancel.Picture.Assign(btnCancel.picMDown);
    btnCancel.Status:=0; // 0 = normal
  end;
end;

procedure TfrmUnpack.imgCancelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    imgCancel.Picture.Assign(btnCancel.picMDown);
    btnCancel.Status := 2; // 2 = Mouse Down
  end;
end;

procedure TfrmUnpack.imgCancelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnCancel.Status := 3; // let timer deceide
end;

procedure TfrmUnpack.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then // Esc
    imgCancelClick(Sender);
end;

//////////////////////////////////////////////////////////////////////

function MyGetFileSize(Filename: string): int64;
// GetFileSizeKB - works for large files too
var
  fLOdword: dword;
  fHIdword: dword;
  FFileHandle: File;
  I: Int64;
begin
  AssignFile(FFileHandle,FileName);
  if not FileExists(FileName) Then
       Rewrite(FFileHandle)
  Else Reset(FFileHandle);
  fLOdword := FileSize(Filename);
  Close(FFileHandle);
  TULargeInteger(I).LowPart := fLOdword;
  TULargeInteger(I).HighPart := fHIdword;
  Result := I;
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmUnpack.CopyFileWithProgress(CopySource: string; CopyDest: string; CopyOverWrite: boolean; const Title: string);
var
  CopyBuffer: Pointer; // buffer for copying
  BytesCopied: Longint;
  Source, Dest: Integer; // handles
  AllCopiedBytes: int64;
  TotalBytes: int64;
const
  ChunkSize: Longint = 8192; // copy in 8K chunks
begin
  imgCancel.Visible := True;
  imgCancel.Enabled := False;
  frmInstall.InstallCancel := False;

  lblCurrentFile.Caption := ExtractFilename(CopySource);
  lblTotalMB.Caption := '';
  Gauge1.Step := 0;
  Gauge2.Step := 0;
  ChkImg.Enabled := True;

  TotalBytes := MyGetFileSize(CopySource); // get byte size

  if TotalBytes > DiskFree(Ord(UpCase(CopyDest[1])) - 64) then
  begin
    frmMsgBox.MsgBox('Not enough free space on drive ' + Uppercase(CopySource[1]) + '!', mtError, [mbOK], 0);
    ChkImg.Enabled := False;
    Exit;
  end;

  GetMem(CopyBuffer, ChunkSize); // allocate the buffer
  try
    Source := FileOpen(CopySource, fmShareDenyWrite); // open source file
    if Source < 0 then
    begin
      frmMsgBox.MsgBox('Unable to open source file - copy failed', mtError, [mbOK], 0);
      ChkImg.Enabled := False;
      Exit;
    end;
    try
      if not DirectoryExists(CopyDest) then
        frmMain.MakeDir(CopyDest);
      if DirectoryExists(CopyDest) then
      begin
        if CopyDest[Length(CopyDest)] = '\' then
          CopyDest := CopyDest + ExtractFilename(CopySource)
        else
          CopyDest := CopyDest + '\' + ExtractFilename(CopySource)
      end;

      if FileExists(CopyDest) then
      begin
        DeleteFile(CopyDest);
        Application.ProcessMessages;
      end;

      AllCopiedBytes := 0;
      Dest := FileCreate(CopyDest); // create output file; overwrite existing
      if Dest < 0 then
      begin
        frmMsgBox.MsgBox('Unable to open target file - copy failed', mtError, [mbOK], 0);
        ChkImg.Enabled := False;
        Exit;
      end;
      try
        repeat
          BytesCopied := FileRead(Source, CopyBuffer^, ChunkSize); // read chunk
          if BytesCopied > 0 then // if we read anything...
          begin
            if FileWrite(Dest, CopyBuffer^, BytesCopied) = -1 then // ...write chunk
            begin
              frmMsgBox.MsgBox('An unexpected error occured - copy failed', mtError, [mbOK], 0);
              ChkImg.Enabled := False;
              Exit;
            end;
            Inc (AllCopiedBytes, BytesCopied);

            Gauge1.Step := Round(AllCopiedBytes * 100 / TotalBytes);
            Gauge2.Step := Gauge1.Step;

            lblBytes.Caption := frmMain.SizeKbToStr(AllCopiedBytes div 1024) +
                                ' ' + LanguageGo.sXOfY + ' ' +
                                frmMain.SizeKbToStr(TotalBytes div 1024);

            frmInstall.UpdateEstimatedTime;

            Application.ProcessMessages;
          end;
        until (BytesCopied < ChunkSize) or frmInstall.InstallCancel; // until we run out of chunks
      finally
        FileClose(Dest); // close the destination file
      end;
    finally
      FileClose(Source); // close the source file
    end;
  finally
    FreeMem(CopyBuffer, ChunkSize); // free the buffer }
  end;
  ChkImg.Enabled := False;

  frmMsgBox.MsgBox(LanguageGo.sCopyDoneMsg1 + ' ' + Title +
                   ' ' + LanguageGo.sCopyDoneMsg2 + CopyDest,
                   mtInformation, [mbOK], 0);

end;

//////////////////////////////////////////////////////////////////////

procedure TfrmUnpack.FormShow(Sender: TObject);
begin
  if NewSkinName <> '' then
  begin
    LoadSkin;
    NewSkinName := '';
  end;
end;

////////////////////////////////////////////////////////////////////////

end.

