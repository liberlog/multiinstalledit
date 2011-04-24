// For info see unit GoWinU

unit InstallU;

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
  Messages, SysUtils, Classes, Graphics, Controls,
  Forms, StdCtrls, Dialogs, FileCtrl, ComCtrls,
  ExtCtrls, clipbrd,Registry,
  UnitUnpack, EditBtn,
  GoWinU, VirtualTrees, ShellCtrls,
  Transedt;

{$IFNDEF FPC}
function CallAceInitDll: integer;
function StateProc(State: pACEStateCallbackProcStruc): integer; stdcall;
procedure AceDisplayProgress(FileProcessedSize,
  FileSize,
  TotalProcessedSize,
  TotalSize: int64);
{$ENDIF}

type
  TULargeInteger = record
    LowPart  ,
    HighPart : Integer;
  end;

  { TfrmInstall }

  TfrmInstall = class(TForm)
    StartTimer: TTimer;
    imgInstall: TImage;
    lblSpaceAvail: TLabel;
    lblSpaceReq: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    lblSpaceReqLabel: TLabel;
    lblSpaceAvailLabel: TLabel;
    lblDekstopIcon: TLabel;
    imgDesktopIcon: TImage;
    lblInstallTitle: TLabel;
    ImageChecked: TImage;
    VET: TShellTreeview;
    imgFinish: TImage;
    imgCancel: TImage;
    ChkImg: TTimer;
    EInstallPath: TTransEdit;
    VECombobox: TShellListView;

    procedure SetNodeData(var Node: PTreeData);
    procedure SetCopyData(var Node: PTreeData);
    procedure CreateUninstXML;
    procedure MakeUninstall;
    procedure BackToMain;
    procedure FinishInstall;
    procedure StartTimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function AdjustColor(AColor: TColor; adjust: integer): TColor;
    procedure LoadSkin;
    procedure FormCreate(Sender: TObject);
    {$IFNDEF FPC}
    procedure UnloadUnrar;
    procedure UnloadUnAce;
    procedure ExtractRARArchive;
    procedure RarBackTo(const ToFile: string; var RARhnd: THandle);
//    procedure ZipMaster1Message(Sender: TObject; ErrCode: integer;  Message: string);
    procedure ZipMaster1ProgressDetails(Sender: TObject;  details: TProgressDetails);
    procedure DoCancel;
    procedure VETChange(Sender: TObject; Node: TTreeNode);
    {$ENDIF}
    procedure lblDekstopIconClick(Sender: TObject);
    procedure imgInstallMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure EInstallPathKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgFinishClick(Sender: TObject);
    procedure imgCancelClick(Sender: TObject);
    procedure ChkImgTimer(Sender: TObject);
    procedure imgFinishMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgFinishMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgCancelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgCancelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgDesktopIconMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure lblDekstopIconMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure UpdateGauge1;
    procedure UpdateGauge2;
    procedure UpdateEstimatedTime;
    procedure VEComboboxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    arcext: string;
    arcpath: string;
    InstallCancel: boolean; // stop installation
    NewSkinName: string;
  end;

const
  EST_TIMES_PREV_MAX = 75;

type
  CharMAX_PATH = array [0..MAX_PATH] of char;

var
  frmInstall: TfrmInstall;
  CurNodeData: PTreeData;
  bMakeUninst: boolean;
  slInstShortcuts: TStringList; // installed files
  sMsgscs: string;
  iDesktopShortcuts: integer;
  bDesktopShortcutChecked: boolean;
  sFinishText: string;
  slInstFiles: TStringList; // installed files
  CurCategory: string;
  InstPath: string;
  zipfile: string;
  picdir: string;
  bPlainCopy: boolean;
  CopySource: string;

implementation

uses
  {$IFDEF FPC}
  LCLIntf,
  {$ELSE}
  Consts,
  {$ENDIF}
  MsgboxU, SkinButton;

var
//  RAROpenArchiveDataEx: TRAROpenArchiveDataEx;
//  RARHeaderDataEx: TRARHeaderDataEx;
  RARExtract: boolean;
  RARComment: CharMAX_PATH;
  RARPwd: array [0..80] of char;
  RARFileName: CharMAX_PATH;
  RarDllLoaded: boolean;

  // ACE specific variables
  AceArchiveName: string;
  AceDllLoaded: boolean;

  // Miscellaneous variables
  lKBytesDone: int64;

  ArchivePwd: string;
  Ssize: string;
  sTitle: string;
  StartTimeMiliSec: integer;
  StartTime: integer; // start time of installation
  EstTimesPrev: array [1..EST_TIMES_PREV_MAX] of integer;
  EstTimesPrevIdx: integer;
  EstTimesPrevMax: integer;

  lTotalSize: int64; // Total extracted size for zip/ace/rar file in Kb
  lKBWritten: int64; // KB installed (total)
  lLastTotalSize: int64;
  InstallDone: boolean;
  slInstZipDirs: TStringList; // installed files

  // buttons with normal, mouse over, mouse down
  btnFinish: TSkinButton;
  btnCancel: TSkinButton;

  // progress
  Gauge1progress: int64; // Bytes
  Gauge1max: int64;
  Gauge2progress: int64;  // KB
  Gauge2max: int64;


////////////////////////////////////////////////////////////////////////

function MakeI64(low, high: dword): int64;
var
  j: int64;
begin
  j := 0;
  TULargeInteger(j).LowPart := low;
  TULargeInteger(j).HighPart := high;
  Result := j;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmInstall.SetNodeData(var Node: PTreeData);
var
  i: integer;
begin
  CurNodeData := Node;
  bPlainCopy := False;

  sSize := CurNodeData.sSize;
  sTitle := CurNodeData.wsText;
  frmInstall.Caption := LanguageGo.sInstallOf1 + ' ' +
                        CurNodeData.wsText +
                        LanguageGo.sInstallOf2;
  frmInstall.lblInstallTitle.Caption := LanguageGo.sInstallOf1 + ' ' +
                                        CurNodeData.wsText +
                                        LanguageGo.sInstallOf2;

  frmUnpack.lblUnpackTitle.Caption := LanguageGo.sUnpacking1 + ' ' +
    CurNodeData.wsText + LanguageGo.sUnpacking2;

  if iDesktopShortcuts = 0 then
  begin
    lblDekstopIcon.Visible := False;
    imgDesktopIcon.Visible := False;
    ImageChecked.Visible := False;
    lblDekstopIcon.Caption := '';
    bDesktopShortcutChecked := False;
  end
  else
  begin
    if iDesktopShortcuts > 1 then
      lblDekstopIcon.Caption := LanguageGo.sAddIcons
    else
      lblDekstopIcon.Caption := LanguageGo.sAddIcon;

    ImageChecked.Visible := bDesktopShortcutChecked;
    lblDekstopIcon.Visible := True;
    imgDesktopIcon.Visible := True;
  end;

  if (Trim(Node.sArchivePwd) = '') or (Trim(Node.sArchivePwd) = '-') then
    ArchivePwd := ''
  else
  begin
    ArchivePwd := Node.sArchivePwd + #0;
    for i := 1 to Length(ArchivePwd) do
      RARPwd[i - 1] := ArchivePwd[i];
    ArchivePwd := Node.sArchivePwd;
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmInstall.SetCopyData(var Node: PTreeData);
begin
  CurNodeData := Node;
  bPlainCopy := True;

  CopySource := Node.sPgmName;

  sSize := CurNodeData.sSize;
  sTitle := CurNodeData.wsText;
  frmInstall.Caption := LanguageGo.sInstallOf1 + ' ' +
                        CurNodeData.wsText +
                        LanguageGo.sInstallOf2;
  frmInstall.lblInstallTitle.Caption := LanguageGo.sInstallOf1 + ' ' +
                                        CurNodeData.wsText +
                                        LanguageGo.sInstallOf2;


  if iDesktopShortcuts = 0 then
  begin
    lblDekstopIcon.Visible := False;
    imgDesktopIcon.Visible := False;
    ImageChecked.Visible := False;
    lblDekstopIcon.Caption := '';
    bDesktopShortcutChecked := False;
  end
end;

////////////////////////////////////////////////////////////////////////

// Convert any integer type to a string
function MakeItAString(I: longint): string;
var
  S: string[20];
begin
  Str(I, S);
  Result := S;
end; // MakeItAString

////////////////////////////////////////////////////////////////////////

function TimeString(i: longint): string;
var
  ihour: longint;
  imin: longint;
  isec: longint;
  s: string;
begin
  ihour := i div 3600;
  i := i mod 3600;
  if ihour > 9 then
    s := MakeItAString(ihour)
  else
    s := '0' + MakeItAString(ihour);
  imin := i div 60;
  i := i mod 60;
  if imin > 9 then
    s := s + ':' + MakeItAString(imin)
  else
    s := s + ':0' + MakeItAString(imin);
  isec := i;
  if isec > 9 then
    s := s + ':' + MakeItAString(isec)
  else
    s := s + ':0' + MakeItAString(isec);

  Result := s;
end; // TimeString

////////////////////////////////////////////////////////////////////////

procedure UninstWriteShortCut(var fout: TextFile; const t: string; const f: string; d: boolean);
begin
  if Trim(f + t) <> '' then
  begin
    WriteLn(fout, '<SHORTCUT>');
    Writeln(fout, '<FILE>' + f + '</FILE>');
    Writeln(fout, '<TEXT>' + t + '</TEXT>');
    if d then
      Writeln(fout, '<DESKTOP>YES</DESKTOP>');
    WriteLn(fout, '</SHORTCUT>');
  end;
end; // UninstWriteShortCut

////////////////////////////////////////////////////////////////////////

procedure TfrmInstall.CreateUninstXML;
var
  fout: TextFile;
  i: integer;
begin
  {$I-}
  AssignFile(fout, EInstallPath.Text + '\uninst.xml');
  FileMode := 1;  { Set file access to write only }
  Rewrite(fout);
  {$I+}
  Writeln(fout, '<?xml version="1.0"?>');
  Writeln(fout, '');
  Writeln(fout, '<UNINSTALL>');
  Writeln(fout, '<NAME>' + sTitle + '</NAME>');
  Writeln(fout, '<DATETIME>' + DateTimeToStr(Now) + '</DATETIME>');

  WriteLn(fout, '<LANGUAGE>');
  WriteLn(fout, '<UNINSTALLTITLE>' + LanguageGo.sUninstTitle + '</UNINSTALLTITLE>');
  WriteLn(fout, '<UNINSTALLSUBTITLE>' + LanguageGo.sUninstSubTitle + '</UNINSTALLSUBTITLE>');
  WriteLn(fout, '<UNINSTALLINFO1>' + LanguageGo.sUninstInfo1 + '</UNINSTALLINFO1>');
  WriteLn(fout, '<UNINSTALLINFO2>' + LanguageGo.sUninstInfo2 + '</UNINSTALLINFO2>');
  WriteLn(fout, '<UNINSTALLREMOVE>' + LanguageGo.sRemove + '</UNINSTALLREMOVE>');
  WriteLn(fout, '<UNINSTALLCANCEL>' + LanguageGo.sCancel + '</UNINSTALLCANCEL>');
  WriteLn(fout, '<UNINSTALLREMOVEDMSG1>' + LanguageGo.sRemoved1 + '</UNINSTALLREMOVEDMSG1>');
  WriteLn(fout, '<UNINSTALLREMOVEDMSG2>' + LanguageGo.sRemoved2 + '</UNINSTALLREMOVEDMSG2>');
  WriteLn(fout, '<UNINSTALLPROGRESS>' + LanguageGo.sUninstProgress + '</UNINSTALLPROGRESS>');
  WriteLn(fout, '<UNINSTALLFILES>' + LanguageGo.sUninstFiles + '</UNINSTALLFILES>');
  WriteLn(fout, '<UNINSTALLSHORTCUTS>' + LanguageGo.sUninstSC + '</UNINSTALLSHORTCUTS>');
  WriteLn(fout, '</LANGUAGE>');

  if slInstFiles.Count > 0 then
  begin
    WriteLn(fout, '<FILES>');
    Writeln(fout, '<COUNT>' + IntToStr(slInstFiles.Count) + '</COUNT>');
    for i := slInstFiles.Count downto 1 do
      Writeln(fout, '<FILE>' + Trim(slInstFiles.Strings[i - 1]) + '</FILE>');
    WriteLn(fout, '</FILES>');
  end;
  if slInstShortcuts.Count > 0 then
  begin
    WriteLn(fout, '<SHORTCUTS>');
    Writeln(fout, '<COUNT>' + IntToStr(slInstShortcuts.Count) + '</COUNT>');
    for i := slInstShortcuts.Count downto 1 do
      Writeln(fout, '<FILE>' + Trim(slInstShortcuts.Strings[i - 1]) + '</FILE>');
    WriteLn(fout, '</SHORTCUTS>');
  end;

  Writeln(fout, '</UNINSTALL>');

  CloseFile(fout);
end; // CreateUninstXML

////////////////////////////////////////////////////////////////////////

// Create Shortcuts in the Start Menu under Programs
// Pre: scpath must not be empty
procedure TfrmInstall.MakeUninstall;
var
  reg: TRegistry;
  currentDir: string;
  uninstfname: string;
  i: integer;
begin
  if bMakeUninst then
  begin
    currentDir := GoWinDir;
    if currentDir[Length(currentDir)] = '\' then
      Delete(currentDir, Length(currentDir), 1);   // remove last backslash
    if FileExists(currentDir + '\uninst.ex_') then
    begin
      i := 0;
      uninstfname := 'Uninst';
      if FileExists(EInstallPath.Text + '\' + uninstfname + '.exe') then
      begin
        while ((FileExists(EInstallPath.Text + '\' + uninstfname + IntToStr(i) + '.exe')) and
          (i < 500)) do
          Inc(i);
        uninstfname := uninstfname + IntToStr(i);
      end;
      uninstfname := uninstfname + '.exe';
      frmMain.FCopy(currentDir + '\uninst.ex_', EInstallPath.Text + '\' + uninstfname);
      CreateUninstXML;

      reg := TRegistry.Create;
      reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey // Add/remove programs
        ('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' + sTitle,
        True) then
      begin
        reg.WriteString('DisplayName', sTitle);
        reg.WriteString('DisplayIcon', EInstallPath.Text + '\' + uninstfname + ',0');
        reg.WriteString('UninstallString', EInstallPath.Text + '\' + uninstfname);
        reg.CloseKey;
      end;
      reg.Free;
    end;
  end;
end; // MakeUninstall

////////////////////////////////////////////////////////////////////////

procedure TfrmInstall.BackToMain;
begin
  StartTimer.Enabled := False;
  Application.Title := frmMain.sTBName;
  frmMain.Show;
  frmInstall.Hide;
  frmUnpack.Hide;
end;

////////////////////////////////////////////////////////////////////////

//  This procedure is called when all the files have been installed.
//  Shortcuts are created and post-install-script executed.
//  After that, it returns control to the main form (frmMain).

procedure TfrmInstall.FinishInstall;
var
  sUnpackedText: string;
begin
  if not InstallDone then
  begin
    frmUnpack.ChkImg.Enabled := False;
    InstallDone := True;
    if not InstallCancel then
    begin
      if (Gauge1Progress > 0) or (Gauge2Progress > 0) then
      begin
        frmUnpack.lblEstiTime.Caption := '00:00:00';
        if (frmUnpack.lblTotalMB.Caption = '0 ' + LanguageGo.sMB + ' ' +
          LanguageGo.sXOfY + ' 1 ' + LanguageGo.sMB) or
          (frmUnpack.lblTotalMB.Caption = '') then
          frmUnpack.lblTotalMB.Caption := '1 ' + LanguageGo.sMB + ' ' +
            LanguageGo.sXOfY + ' 1 ' + LanguageGo.sMB;
        if Gauge2Max = 0 then
          Gauge2Max := 1;
        if Gauge1Max < 1024 then
          Gauge1Max := 1024;
        Gauge1Progress := Gauge1Max;
        Gauge2Progress := Gauge2Max;
        UpdateGauge1;
        UpdateGauge2;
        frmUnpack.Repaint;
      end;
      sMsgScs := '';
      sFinishText := '';


      frmMain.bAllowDesktopShortcuts := bDesktopShortcutChecked;
      if Length(CurNodeData.sScript) > 0 then
        frmMain.RunScript(CurNodeData.sScript);
      MakeUninstall; // Make uninstallation files and copy uninst.exe to dist folder
      frmMain.bAllowDesktopShortcuts := True;

      // Build unpack text
      sUnpackedText := LanguageGo.sDoneMsg1 + ' ' + sTitle +
        ' ' + LanguageGo.sDoneMsg2 + sMsgScs;
      if (Length(sUnpackedText) > 1) and (sUnpackedText[1] = ' ') then
        Delete(sUnpackedText, 1,1);
      if Trim(sFinishText) <> '' then
        sUnpackedText := sUnpackedText + #13#10 + #13#10 + sFinishText;

      if not bDisableFinishMsg then
        frmMsgBox.MsgBox(sUnpackedText, mtInformation, [mbOK], 0)
    end;
{
    if arcext = '.ZIP' then
    begin
      frmMain.ZipMaster1.OnProgressDetails := nil;
      frmMain.ZipMaster1.OnMessage := nil;
    end;
 }
    BackToMain;
  end;
end; // FinishInstall

////////////////////////////////////////////////////////////////////////

// This procedure is called during extracting of a rar archive
// See 'ZipMaster1Progress' for the how the zip version is handled
{
function RarCallbackProc(msg: UINT; UserData, P1, P2: integer): integer; stdcall;
begin
  Result := 0;
  case msg of
//    UCM_CHANGEVOLUME:
//      if (P2 = RAR_VOL_ASK) then
//      begin
//      end;
    UCM_PROCESSDATA:
    begin
      if RARExtract then
      begin
        lKBytesDone := lKBytesDone + P2; // bytes written so far

        // Current file progress
        Gauge1Progress := Gauge1Progress + P2;
        frmInstall.UpdateGauge1;

        // Total progress
        lKBWritten := lKBWritten + (P2 div 1024);
        Gauge2Progress := lKBWritten;
        frmInstall.UpdateGauge2;
        frmInstall.Refresh; // refresh misc status text
        Application.ProcessMessages; // like DoEvents in VB
        Result := 1;

        if frmInstall.InstallCancel then
          Result := -1
      end
      else
        Result := 1;
    end;
  end;
end; // RarCallbackProc

////////////////////////////////////////////////////////////////////////

// Go to a specified file name in the current rar archive

procedure TfrmInstall.RarBackTo(const ToFile: string; var RARhnd: THandle);
var
  RARrc: integer;
  s: string;
  Mode: integer;
begin
  RARExtract := False;
  Mode := RAR_OM_EXTRACT;

  if RARCloseArchive(RARhnd) <> 0 then
    frmMsgBox.MsgBox('Unable to close rar archive!', mtError, [mbOK], 0);

  RAROpenArchiveDataEx.OpenResult := 99;
  RAROpenArchiveDataEx.OpenMode := Mode; // open for extracting
  RAROpenArchiveDataEx.ArcName := @RARFileName;
  RAROpenArchiveDataEx.CmtBuf := @RARComment; // Maybee RARcomment will be
  RAROpenArchiveDataEx.CmtBufSize := 255;   // used in a future version...

  // Open RAR archive and allocate memory
  RARhnd := RAROpenArchiveEx(RAROpenArchiveDataEx);
  if RAROpenArchiveDataEx.OpenResult <> 0 then
  begin
    case RAROpenArchiveDataEx.OpenResult of
      ERAR_NO_MEMORY: s := 'Not enough memory to initialize data structures';
      ERAR_BAD_DATA: s := 'Archive header broken';
      ERAR_BAD_ARCHIVE: s := 'File is not valid RAR archive';
      ERAR_EOPEN: s := 'File open error';
    end;
    frmMsgBox.MsgBox('RarBackTo - Unable to open rar archive: ' + s + '!',
      mtError, [mbOK], 0);
    InstallDone := True;

    frmInstall.BackToMain;
    Exit;
  end;

  if ArchivePwd <> '' then // set pwd if specified
    RARSetPassword(RARhnd, @RARPwd);

  RARSetCallback(RARhnd, RarCallbackProc, integer(@Mode));
  repeat
    RARrc := RARReadHeaderEx(RARhnd, RARHeaderDataEx);// Read header
    if (RARrc = 0) and (ToFile <> RARHeaderDataEx.FileName) then
      RARrc := RARProcessFile(RARhnd, RAR_SKIP, nil, nil);
  until (RARrc <> 0) or (ToFile = RARHeaderDataEx.FileName);

  RARExtract := True;
end; // RarBackTo

////////////////////////////////////////////////////////////////////////

function a2o(const s: string): string;
begin
  SetLength(Result, Length(s));
  AnsiToOemBuff(PChar(S), PChar(Result), Length(s));
end; // a2o

////////////////////////////////////////////////////////////////////////

procedure TfrmInstall.ExtractRARArchive;
var
  sDir: string;
  s: string;
  RARhnd: THandle;
  RARrc: integer;
  PDestPath: CharMAX_PATH;
  Mode: integer;
begin
  RARExtract := True;
  Mode := RAR_OM_EXTRACT; // open for extracting
  lKBWritten := 0;
  Gauge2Max := lTotalSize;
  Gauge2Progress := 0;
  UpdateGauge2;

  RAROpenArchiveDataEx.OpenResult := 99;
  RAROpenArchiveDataEx.OpenMode := Mode;
  RAROpenArchiveDataEx.ArcName := @RARFileName;
  RAROpenArchiveDataEx.CmtBuf := @RARComment; // Maybee RARcomment will be
  RAROpenArchiveDataEx.CmtBufSize := 255;   // used in a future version...

  // Open RAR archive and allocate memory structures
  RARhnd := RAROpenArchiveEx(RAROpenArchiveDataEx);
  if RAROpenArchiveDataEx.OpenResult <> 0 then
  begin
    case RAROpenArchiveDataEx.OpenResult of
      ERAR_NO_MEMORY: s := 'Not enough memory to initialize data structures';
      ERAR_BAD_DATA: s := 'Archive header broken';
      ERAR_BAD_ARCHIVE: s := 'File is not valid RAR archive';
      ERAR_EOPEN: s := 'File open error';
    end;
    frmMsgBox.MsgBox('Unable to open rar archive: ' + s + '!', mtError, [mbOK], 0);
    InstallDone := True;
    frmInstall.BackToMain;
    Exit;
  end;

  if ArchivePwd <> '' then // set pwd if specified
    RARSetPassword(RARhnd, @RARPwd);

  RARSetCallback(RARhnd, RarCallbackProc, integer(@Mode));
  StrPCopy(@PDestPath, a2o(EInstallPath.Text)); // unrar uses oem
  sDir := EInstallPath.Text;
  if sDir[Length(sDir)] <> '\' then
    sDir := sDir + '\';

  repeat
    RARrc := RARReadHeaderEx(RARhnd, RARHeaderDataEx); // Read header

    if RARrc <> ERAR_END_ARCHIVE then
    begin
      Gauge1Progress := 0;
      Gauge1Max := MakeI64(RARHeaderDataEx.UnpSize, RARHeaderDataEx.UnpSizeHigh);
      UpdateGauge1;
      s := StrPas(RARHeaderDataEx.FileName);
      frmUnpack.lblCurrentFile.Caption := s;
      if bMakeUninst then
        slInstFiles.Add(s); // for uninstall
      lKBytesDone := 0;
      frmInstall.Refresh;
      Application.ProcessMessages; // like DoEvents in VB
    end;

    if RARrc = 0 then
      RARrc := RARProcessFile(RARhnd, RAR_EXTRACT, @PDestPath, nil);
    if (RARrc <> 0) and (RARrc <> ERAR_END_ARCHIVE) then
    begin
      if (RARrc = 12) or (RARrc = 16) then
      begin // check if file allready exists and if can be deleted
        if FileExists(sDir + s) then
        begin
          if (FileGetAttr(sDir + s)) and (faReadOnly) = 1 then
          begin
            FileSetAttr(sDir + s, faAnyFile and not faReadOnly);
            if DeleteFile(sDir + s) then
              RarBackTo(s, RARhnd)
            else
              frmMsgBox.MsgBox('Unable to overwrite ' + sDir + s + '!', mtError, [mbOK], 0);
          end;
          RARrc := RARProcessFile(RARhnd, RAR_EXTRACT, @PDestPath, nil);
        end;
      end;
      if RARrc = 12 then
      begin
        frmMsgBox.MsgBox('An Error occured during extracting of ' + s + '!' + #13#10 +
          'RARProcessFile: ' + MakeItAString(RARrc), mtError, [mbOK], 0);

        BackToMain;
        Exit;
      end
      else
        RARrc := 0;
    end;
  until (RARrc <> 0) or (InstallCancel);

  if InstallCancel then
    frmMsgBox.MsgBox(LanguageGo.sCancelMsg, mtInformation, [mbOK], 0);

  // close RAR archive and free memory
  if RARCloseArchive(RARhnd) <> 0 then
  begin
    frmMsgBox.MsgBox('Unable to close rar archive!', mtError, [mbOK], 0);
    BackToMain;
  end;
end; // ExtractRARArchive
 }
////////////////////////////////////////////////////////////////////////

// Event manager (OnTimer) for StartTimer
procedure TfrmInstall.StartTimerTimer(Sender: TObject);
var
  AllTimes: longint;
  i: integer;
begin // Is called each second if StartTimer is enabled
  if StartTimeMiliSec >= 1 then
  begin
    Inc(StartTime); // Contains seconds since installation started
    frmUnpack.lblElapTime.Caption := TimeString(StartTime);
    StartTimeMiliSec := 0;
  end
  else
    Inc(StartTimeMiliSec);

  AllTimes := 0;
  for i:=1 to EstTimesPrevMax do
    Inc(AllTimes, EstTimesPrev[i]);
  frmUnpack.lblEstiTime.Caption := TimeString(AllTimes div EstTimesPrevMax);
end; // StartTimerTimer

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.FormActivate(Sender: TObject);
var
  s: string;
  j: int64;
  RARrc: integer;
  RARhnd: THandle;
  A: CharMAX_PATH;
  ErrOccured: boolean;
  ValCode: integer;
begin
  EInstallPath.Enabled := True;

  ErrOccured := False;
  lblSpaceAvail.Caption := '';
  lblSpaceReq.Caption := '';
  Gauge1Max := 0;
  Gauge1Progress := 0;
  Gauge2Max := 0;
  Gauge2Progress := 0;
  UpdateGauge1;
  UpdateGauge2;


  EstTimesPrevMax := EST_TIMES_PREV_MAX; // max value
  for ValCode:=1 to EstTimesPrevMax do
    EstTimesPrev[ValCode] := 60;
  EstTimesPrevIdx := 1;

  StartTimeMiliSec:=10;


  // Autosize window title
  lblInstallTitle.Font := frmMain.lblTitle.Font;
  lblInstallTitle.Font.Size := frmMain.othertitlesfontsize;
  lblInstallTitle.Font.Size := lblInstallTitle.Font.Size - 2;
  while (lblInstallTitle.Width > imgInstall.Width) and
    (lblInstallTitle.Font.Size > 1) do
  begin
    lblInstallTitle.Font.Size := Pred(lblInstallTitle.Font.Size);
    lblInstallTitle.Top := lblInstallTitle.Top + 2;
  end;

  SetCurrentDir(GoWinDir);


  if (Length(arcpath) > 0) and  (arcpath[length(arcpath)] <> '\') then
    s := arcpath + '\' + ArchiveDirB + zipfile
  else
    s := arcpath + ArchiveDirB + zipfile;

  Val(Ssize, lTotalSize, ValCode);
  if ValCode <> 0 then
    lTotalSize := 0;

  if bPlainCopy then // copy file
  begin
    imgFinish.Enabled := False;
    btnFinish.Status := 3;
    imgCancel.Enabled := False;
    btnCancel.Status := 3;
  end
{  else if arcext = '.ZIP' then
  begin // initializes zip variables
    frmmain.ZipMaster1.Cancel := False;
    frmMain.ZipMaster1.ZipFileName := '';
    frmMain.ZipMaster1.ZipFileName := s;
    frmMain.ZipMaster1.FSpecArgs.Text := '*.*';
    frmMain.ZipMaster1.ExtrOptions := [ExtrOverwrite] + [ExtrDirNames];

    imgFinish.Enabled := False;
    btnFinish.Status := 3;
    imgCancel.Enabled := False;
    btnCancel.Status := 3;
  end
  else if arcext = '.ACE' then
  begin // initializes ACE variables
    if not AceDllLoaded then
    begin
      frmMsgBox.MsgBox('UnAceV2.dll not found!', mtError, [mbOK], 0);
      InstallDone := True;
      exit;
    end;
    AceArchiveName := s;
    imgFinish.Enabled := False;
    btnFinish.Status := 3;
    imgCancel.Enabled := False;
    btnCancel.Status := 3;

    // ace does not display status very often, so estimated time history
    // will have to be a small number
    EstTimesPrevMax:= 3;
  end
  else if arcext = '.RAR' then
  begin
    RAROpenArchiveDataEx.OpenResult := 99;
    StrPCopy(@RARFileName, s); // RARFileName -> rar archive
    RAROpenArchiveDataEx.ArcName := @RARFileName;
    RAROpenArchiveDataEx.OpenMode := RAR_OM_LIST; // open for listing
    RAROpenArchiveDataEx.CmtBuf := @RARComment; // Maybee RARcomment will be
    RAROpenArchiveDataEx.CmtBufSize := 255;   // used in a future version...

    if ValCode <> 0 then
    begin
      // Open RAR archive and allocate memory structures
      RARhnd := RAROpenArchiveEx(RAROpenArchiveDataEx);
      if RAROpenArchiveDataEx.OpenResult <> 0 then
      begin
        case RAROpenArchiveDataEx.OpenResult of
          ERAR_NO_MEMORY: s := 'Not enough memory to initialize data structures';
          ERAR_BAD_DATA: s := 'Archive header broken';
          ERAR_BAD_ARCHIVE: s := 'File is not valid RAR archive';
          ERAR_EOPEN: s := 'File open error';
        end;
        frmMsgBox.MsgBox('Unable to open rar archive: ' + s + '!', mtError, [mbOK], 0);
        ErrOccured := True;
      end
      else
      begin
        if ArchivePwd <> '' then // set pwd if specified
          RARSetPassword(RARhnd, @RARPwd);
        RARHeaderDataEx.UnpSize := 0;
        RARHeaderDataEx.UnpSizeHigh := 0;
        s := 'c:\RARTEST';
        StrPCopy(@A, s); // a -> rar dest
        repeat
          // Read header of file in archive
          RARrc := RARReadHeaderEx(RARhnd, RARHeaderDataEx);
          if RARrc = 0 then
          begin
            RARrc := RARProcessFile(RARhnd, RAR_SKIP, @A, @A);
            j := MakeI64(RARHeaderDataEx.UnpSize, RARHeaderDataEx.UnpSizeHigh) div 1024;
            lTotalSize := lTotalSize + j;
          end
          else if (RARrc <> 0) and (RARrc <> ERAR_END_ARCHIVE) then
          begin
            frmMsgBox.MsgBox('Header file broken!', mtError, [mbOK], 0);
            ErrOccured := True;
          end;
        until RARrc <> 0;


        // close RAR archive and free memory
        if RARCloseArchive(RARhnd) <> 0 then
        begin
          frmMsgBox.MsgBox('Unable to close rar archive!', mtError, [mbOK], 0);
          ErrOccured := True;
        end;
      end;
    end;
  end}
  else
  begin
    frmMsgBox.MsgBox('Please use either ZIP, RAR, or ACE as extension!',
      mtError, [mbOK], 0);
    ErrOccured := True;
  end;

  imgFinish.Enabled := not ErrOccured;
  btnFinish.Status := 3;
  imgCancel.Enabled := True;
  btnCancel.Status := 3;

  Gauge2Max := lTotalSize;
  Gauge2Progress := 0;
  UpdateGauge2;

  // init space available and space requested
  lblSpaceReq.Caption := frmMain.SizeKbToStr(lTotalSize);
  frmUnpack.lblCurrentFile.Caption := '';
  frmUnpack.lblBytes.Caption := '';
  frmUnpack.lblTotalMB.Caption := '';
  frmUnpack.lblElapTime.Caption := '00:00:00';
  frmUnpack.lblEstiTime.Caption := '00:00:00';

  j := DiskFree(Ord(UpCase(EInstallPath.Text[1])) - 64) div 1024;
  if j = 0 then j := 1;
  lblSpaceAvail.Caption := frmMain.SizeKbToStr(j);
end; // FormActivate

//////////////////////////////////////////////////////////////////////

function TfrmInstall.AdjustColor(AColor: TColor; adjust: integer): TColor;
var
  r, g, b: integer;
begin
  r := AColor and $000000FF;
  r := r + adjust;
  if r < 0 then r := 0;
  if r > 255 then r := 255;

  g := (AColor and $0000FF00) div 256;
  g := g + adjust;
  if g < 0 then g := 0;
  if g > 255 then g := 255;

  b := (AColor and $00FF0000) div 256 div 256;
  b := b + adjust;
  if b < 0 then b := 0;
  if b > 255 then b := 255;

  Result := RGB(r, g, b);
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.LoadSkin;
var
  x, y: integer;
begin
  // Button images
  SkinButtonInit(btnFinish);
  SkinButtonInit(btnCancel);

  imgFinish.Transparent := ButtonsTransparent;
  imgCancel.Transparent := ButtonsTransparent;


  if frmMain.ExistsSkinImage('InstallFinish') then
    frmMain.LoadSkinButton(imgFinish, btnFinish, 'InstallFinish', True);

  if frmMain.ExistsSkinImage('InstallCancel') then
    frmMain.LoadSkinButton(imgCancel, btnCancel, 'InstallCancel', True);


  if frmMain.instPosSize.iEditPathWidth + frmMain.instPosSize.iEditPathHeight = 0 then
    Exit;

  with frmMain.instPosSize do
  begin
    lblInstallTitle.Left := iTitleX;
    lblInstallTitle.Top := iTitleY;
    EInstallPath.Left := iEditPathX;
    EInstallPath.Top := iEditPathY;
    EInstallPath.Width := iEditPathWidth;
    EInstallPath.Height := iEditPathHeight;
    VET.Left := iExpTreeX;
    VET.Top := iExpTreeY;
    VET.Width := iExpTreeWidth;
    VET.Height := iExpTreeHeight;
    VECombobox.Left := iDriveBoxX;
    VECombobox.Top := iDriveBoxY;
    VECombobox.Width := iDriveBoxWidth;
    VECombobox.Height := iDriveBoxHeight;
    lblSpaceAvailLabel.Left := iSpaceAvailX;
    lblSpaceAvailLabel.Top := iSpaceAvailY;
    Label7.Top := iSpaceAvailY;
    lblSpaceAvail.Top := iSpaceAvailY;
    lblSpaceReqLabel.Left := iSpaceReqX;
    lblSpaceReqLabel.Top := iSpaceReqY;
    Label8.Top := iSpaceReqY;
    lblSpaceReq.Top := iSpaceReqY;
    lblDekstopIcon.Left := iAddIconX + 19;
    imgDesktopIcon.Left := iAddIconX - 12;
    ImageChecked.Left := iAddIconx;
    lblDekstopIcon.Top := iAddIconY;
    imgDesktopIcon.Top := iAddIconY - 6;
    ImageChecked.Top := iAddIconY + 5;
    imgFinish.Left := iFinishX;
    imgFinish.Top := iFinishY;
    imgCancel.Left := iCancelX;
    imgCancel.Top := iCancelY;
  end;

  // load background image
  frmMain.LoadSkinImage(imgInstall.Picture, 'install', True);

  // Let background image decide form size
  frmInstall.Width := imgInstall.Width;
  frmInstall.Height := imgInstall.Height;

  // Create checkbox adjusted to background
  // copy rect from background to dsktop image
  for y := 0 to 24 do
    for x := 0 to 24 do
      imgDesktopIcon.Canvas.Pixels[x, y] :=
        imgInstall.Canvas.Pixels[imgDesktopIcon.Left + x,
        imgDesktopIcon.Top + y];


  // top checbox dark AColor
  y := 6;
  for x := 9 to 23 do
    imgDesktopIcon.Canvas.Pixels[x, y] :=
      AdjustColor(imgInstall.Canvas.Pixels[imgDesktopIcon.Left + x,
      imgDesktopIcon.Top + y], - 20);
  Inc(y);
  for x := 10 to 23 do
    imgDesktopIcon.Canvas.Pixels[x, y] :=
      AdjustColor(imgInstall.Canvas.Pixels[imgDesktopIcon.Left + x,
      imgDesktopIcon.Top + y], - 40);

  // middle checbox - background AColor
  for y := 9 to 19 do
    for x := 11 to 21 do
      imgDesktopIcon.Canvas.Pixels[x, y] := frmMain.VSTree.Color;

  // buttom checbox dark AColor
  y := 20;
  for x := 10 to 22 do
    imgDesktopIcon.Canvas.Pixels[x, y] :=
      AdjustColor(imgInstall.Canvas.Pixels[imgDesktopIcon.Left + x,
      imgDesktopIcon.Top + y], 40);
  Inc(y);
  for x := 9 to 23 do
    imgDesktopIcon.Canvas.Pixels[x, y] :=
      AdjustColor(imgInstall.Canvas.Pixels[imgDesktopIcon.Left + x,
      imgDesktopIcon.Top + y], 20);

  // left checbox dark AColor
  x := 9;
  for y := 6 to 21 do
    imgDesktopIcon.Canvas.Pixels[x, y] :=
      AdjustColor(imgInstall.Canvas.Pixels[imgDesktopIcon.Left + x,
      imgDesktopIcon.Top + y], - 20);
  Inc(x);
  for y := 7 to 20 do
    imgDesktopIcon.Canvas.Pixels[x, y] :=
      AdjustColor(imgInstall.Canvas.Pixels[imgDesktopIcon.Left + x,
      imgDesktopIcon.Top + y], - 40);

  // right checbox dark AColor
  x := 22;
  for y := 7 to 20 do
    imgDesktopIcon.Canvas.Pixels[x, y] :=
      AdjustColor(imgInstall.Canvas.Pixels[imgDesktopIcon.Left + x,
      imgDesktopIcon.Top + y], 40);
  Inc(x);
  for y := 6 to 21 do
    imgDesktopIcon.Canvas.Pixels[x, y] :=
      AdjustColor(imgInstall.Canvas.Pixels[imgDesktopIcon.Left + x,
      imgDesktopIcon.Top + y], 20);

  // set background AColor for checkbox tick
  for x := 0 to ImageChecked.Width do
    for y := 0 to ImageChecked.Height do
      if ImageChecked.Picture.Bitmap.Canvas.Pixels[x, y] = 16777215 then
        ImageChecked.Picture.Bitmap.Canvas.Pixels[x, y] := frmMain.VSTree.Color
  else
    ImageChecked.Picture.Bitmap.Canvas.Pixels[x, y] :=
      frmMain.lblMessage.Font.Color;

  frmInstall.Update;
  bDesktopShortcutChecked := True;

  lblInstallTitle.Font := frmMain.lblTitle.Font;
  lblInstallTitle.Font.Size := frmMain.othertitlesfontsize;
  lblDekstopIcon.Font := frmMain.lblMessage.Font;
  lblDekstopIcon.Font.Color := frmMain.lblTitle.Font.Color;

  if lblDekstopIcon.Width > 110 then
    lblDekstopIcon.Font.Size := Pred(lblDekstopIcon.Font.Size);

  EInstallPath.Font.Name := frmMain.lblMessage.Font.Name;
  VET.Font.Name := frmMain.lblMessage.Font.Name;
  VEComboBox.Font.Name := frmMain.lblMessage.Font.Name;

  lblSpaceAvailLabel.Font := frmMain.lblScreenshotCounter.Font;
  lblSpaceReqLabel.Font := frmMain.lblScreenshotCounter.Font;
  label7.Font := frmMain.lblScreenshotCounter.Font;
  label8.Font := frmMain.lblScreenshotCounter.Font;
  lblSpaceAvail.Font := frmMain.lblScreenshotCounter.Font;
  lblSpaceReq.Font := frmMain.lblScreenshotCounter.Font;


  // Space Available
  Label7.Left := lblSpaceAvailLabel.Left + lblSpaceAvailLabel.Width + 5;
  lblSpaceAvail.Left := Label7.Left + Label7.Width + 5;

  // Space Required
  Label8.Left := lblSpaceReqLabel.Left + lblSpaceReqLabel.Width + 5;
  lblSpaceReq.Left := Label8.Left + Label8.Width + 5;

  // set background AColor
  EInstallPath.Color := frmMain.VSTree.Color;

  // set selected bg AColor - win highlight AColor
//  EInstallPath.SelectionBrush.Color := GetSysColor(COLOR_HIGHLIGHT);

  VET.Color := frmMain.VSTree.Color;
  VEComboBox.Color := frmMain.VSTree.Color;
//  VEComboBox.PopupAutoCompleteOptions.Color := frmMain.VSTree.Color;
//  VEComboBox.PopupExplorerOptions.Color := frmMain.VSTree.Color;


//  VET.TreeOptions.PaintOptions := frmMain.VSTree.TreeOptions.PaintOptions;
//  VET.Colors.HotColor := UrlHottrackColor;

  // Create background image for treeview
//  VET.Background.Bitmap.Width := VET.Width;
//  VET.Background.Bitmap.Height := VET.Height;
{  BitBlt(VET.Background.Bitmap.Canvas.Handle,  // Destination
         0, 0,                                 // X, Y (target pos)
         VET.Width, VET.Height,                // Size to copy
         imgInstall.Canvas.handle,             // Source
         VET.Left, VET.Top,                    // X, Y (source pos)
         SrcCopy);                             // plain copy


  // Install path edit transparent
  EInstallPath.BackBmp.Bitmap.Width := EInstallPath.Width;
  EInstallPath.BackBmp.Bitmap.Height := EInstallPath.Height;
  BitBlt(EInstallPath.BackBmp.Bitmap.Canvas.Handle,  // Destination
         0, 0,                                       // X, Y (target pos)
         EInstallPath.Width, EInstallPath.Height,    // Size to copy
         imgInstall.Canvas.handle,                   // Source
         EInstallPath.Left, EInstallPath.Top,        // X, Y (source pos)
         SrcCopy);                                   // plain copy


  // set text AColor and font for controls
  EInstallPath.Font := frmMain.lblMessage.Font;
 } VET.Font := frmMain.lblMessage.Font;
  VEComboBox.Font := frmMain.lblMessage.Font;

  frmMain.MakeTransparent(frmInstall, imgInstall);

  if not trlunpack then
    frmMain.MakeTranslucency(frmInstall.Handle, vtranslucenty);
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.FormCreate(Sender: TObject);
begin

  lblSpaceAvailLabel.Caption := LanguageGo.sSpaceAvail;
  lblSpaceReqLabel.Caption := LanguageGo.sSpaceReq;

  LoadSkin;
{
// Load dll files - may first be extracted from resource zip file
  if frmMain.UnpackFromResToTemp('UNACEV2.DLL') then
    AceDllLoaded := LoadAceDLL(tmpdir)
  else
    AceDllLoaded := LoadAceDLL(unpackdllpath);
  if AceDllLoaded then
    CallAceInitDll;

  if frmMain.UnpackFromResToTemp('unrar.dll') then
    RarDllLoaded := UnrarDllLoad(tmpdir + '\unrar.dll')
  else
    RarDllLoaded := UnrarDllLoad(unpackdllpath + 'unrar.dll');
 }

  VEComboBox.Update;
end; // FormCreate

//////////////////////////////////////////////////////////////////////

{procedure TfrmInstall.ZipMaster1Message(Sender: TObject; ErrCode: integer; Message: string);
begin
  if (ErrCode > 0) and not frmMain.ZipMaster1.Unattended then
  begin
    if InstallCancel then
      frmMsgBox.MsgBox(LanguageGo.sCancelMsg, mtConfirmation, [mbOK], 0)
    else if (not InstallDone) and (ErrCode <> 8323940) then
      // 8323940 = FileSpec not matched - sometimes just pops up...?
      ShowMessage('Error Msg (' + MakeItAString(ErrCode) + '): ' + Message);
  end;
end; // ZipMaster1Message
 }
//////////////////////////////////////////////////////////////////////
{
procedure TfrmInstall.ZipMaster1ProgressDetails(Sender: TObject;  details: TProgressDetails);
var
  s: string;
begin
// NewFile, ProgressUpdate, EndOfBatch, TotalFiles2Process, TotalSize2Process, NewExtra, ExtraUpdate
 case details.Order of
    TotalSize2Process:
    begin // initialize
      Gauge2Progress := 0;
      lTotalSize := Details.TotalSize div 1024;
      if lTotalSize = 0 then
        Inc(lTotalSize);
      Gauge2Max := lTotalSize;
      UpdateGauge2;
      lKBWritten := 0;
      lLastTotalSize := 0;
    end;
    //      TotalFiles2Process:
    //         begin
    //         end;
    NewFile:
    begin
      lLastTotalSize :=  details.TotalPosition;
      frmUnpack.lblCurrentFile.Caption := details.ItemName;

      // for uninstall
      s := ExtractFilePath(details.ItemName);
      if bMakeUninst then
      begin
        if (s <> '') and (slInstZipDirs.IndexOf(s) = -1) then
        begin
          slInstZipDirs.Add(s);
          slInstFiles.Add(s); // add directory
        end;
        slInstFiles.Add(details.ItemName);
      end;

      Gauge1Progress := 0;
      Gauge1Max := details.ItemSize;
      UpdateGauge1;
      Application.ProcessMessages;
    end;
    ProgressUpdate:
    begin
      lKBWritten := details.TotalPosition;
      Gauge1Progress := lKBWritten - lLastTotalSize;
      UpdateGauge1;

      // current file
      Gauge2Progress := lKBwritten div 1024;
      UpdateGauge2;
      Application.ProcessMessages;
    end;

  end;   // EOF Case
end;
 }
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
/// UnAce event handlers (callback functions)
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// InfoProc callback
{
function InfoProc(Info: pACEInfoCallbackProcStruc): integer; stdcall;
var
  InfoStr: string;
begin
  case Info^.Global.Code of
    ACE_CALLBACK_INFO_FILELISTCREATE:
      InfoStr := 'Creating file list';
    ACE_CALLBACK_INFO_FILELISTCREATEEND:
      InfoStr := 'Finished creating file list';
    ACE_CALLBACK_INFO_FILELISTADD:
      InfoStr := 'adding file to file list';
    else
      InfoStr := '';
  end;
  Result := ACE_CALLBACK_RETURN_OK;
end;
////////////////////////////////////////////////////////////////////////
// HandleErrorGlobal

function HandleErrorGlobal(Error: pACECallbackGlobalStruc): integer;
var
  ErrorStr: string;
begin
  Result := ACE_CALLBACK_RETURN_OK;

  case Error^.Code of
    ACE_CALLBACK_ERROR_MEMORY:
      ErrorStr := 'not enough memory';
    ACE_CALLBACK_ERROR_UNCSPACE:
      ErrorStr := 'could not detect available space on network drive';
    else
    begin
      ErrorStr := 'unknown';
      Result := ACE_CALLBACK_RETURN_CANCEL;
    end;
  end;
  MessageDlg('Error: ' + Errorstr, mtError, [mbOK], 0);
end;

////////////////////////////////////////////////////////////////////////
// HandleErrorArchive

function HandleErrorArchive(Error: pACECallbackArchiveStruc): integer;
var
  ErrorStr: string;
begin
  Result := ACE_CALLBACK_RETURN_OK;
  case Error^.Code of
    ACE_CALLBACK_ERROR_AV:
      ErrorStr := 'AV of archive %s invalid';
    ACE_CALLBACK_ERROR_OPENARCHIVEREAD:
      ErrorStr := 'could not open archive %s for reading';
    ACE_CALLBACK_ERROR_READARCHIVE:
      ErrorStr := 'error reading from archive %s';
    ACE_CALLBACK_ERROR_ARCHIVEBROKEN:
      ErrorStr := 'archive %s is broken';
    ACE_CALLBACK_ERROR_NOFILES:
      ErrorStr := 'no files specified';
    ACE_CALLBACK_ERROR_ISNOTANARCHIVE:
      ErrorStr := 'file is not an ACE archive';
    ACE_CALLBACK_ERROR_HIGHERVERSION:
      ErrorStr := 'this Dll version is not able to handle the archive';
    else
    begin
      ErrorStr := 'unknown';
      Result := ACE_CALLBACK_RETURN_CANCEL;
    end;
  end;
  MessageDlg(ErrorStr + Error^.ArchiveData^.ArchiveName, mtError, [mbOK], 0);
end;

////////////////////////////////////////////////////////////////////////
// HandleErrorArchivedFile

function HandleErrorArchivedFile(Error: pACECallbackArchivedFileStruc): integer;
var
  ErrorStr: string;
begin
  Result := ACE_CALLBACK_RETURN_OK;
  case Error^.Code of

    ACE_CALLBACK_ERROR_CREATIONNAMEINUSE:
      ErrorStr := 'could not extract %s: name used by directory';
    ACE_CALLBACK_ERROR_WRITE:
      ErrorStr := 'error writing %s';
    ACE_CALLBACK_ERROR_OPENWRITE:
      ErrorStr := 'error opening %s for writing';
    ACE_CALLBACK_ERROR_METHOD:
      ErrorStr := 'compression method not known to this Dll version';
    ACE_CALLBACK_ERROR_EXTRACTSPACE:
      ErrorStr := 'not enough space to extract %s';
    ACE_CALLBACK_ERROR_CREATION:
      ErrorStr := 'creation of %s failed (write-protection?)';
    else
    begin
      ErrorStr := 'unknown';
      Result := ACE_CALLBACK_RETURN_CANCEL;
    end;
  end;
  MessageDlg(ErrorStr + Error^.FileData^.SourceFileName, mtError, [mbOK], 0);
end;

////////////////////////////////////////////////////////////////////////
// HandleErrorRealFile

function HandleErrorRealFile(Error: pACECallbackRealFileStruc): integer;
var
  ErrorStr: string;
begin
  ErrorStr := 'unknown';
  Result := ACE_CALLBACK_RETURN_CANCEL;
  MessageDlg(ErrorStr + Error^.FileName, mtError, [mbOK], 0);
end;

////////////////////////////////////////////////////////////////////////
// HandleErrorSpace

function HandleErrorSpace(Error: pACECallbackSpaceStruc): integer;
var
  ErrorStr: string;
begin
  ErrorStr := 'unknown';
  Result := ACE_CALLBACK_RETURN_CANCEL;
  MessageDlg(ErrorStr + Error^.Directory, mtError, [mbOK], 0);
end;

////////////////////////////////////////////////////////////////////////
// HandleErrorSFXFile

function HandleErrorSFXFile(Error: pACECallbackSFXFileStruc): integer;
var
  ErrorStr: string;
begin
  ErrorStr := 'unknown';
  Result := ACE_CALLBACK_RETURN_CANCEL;
  MessageDlg(ErrorStr + Error^.SFXFileName, mtError, [mbOK], 0);
end;

////////////////////////////////////////////////////////////////////////
// ErrorProc callback

function ErrorProc(Error: pACEErrorCallbackProcStruc): integer; stdcall;
begin
  case Error^.StructureType of
    ACE_CALLBACK_TYPE_GLOBAL:
      Result := HandleErrorGlobal(@Error^.Global);
    ACE_CALLBACK_TYPE_ARCHIVE:
      Result := HandleErrorArchive(@Error^.Archive);
    ACE_CALLBACK_TYPE_ARCHIVEDFILE:
      Result := HandleErrorArchivedFile(@Error^.ArchivedFile);
    ACE_CALLBACK_TYPE_REALFILE:
      Result := HandleErrorRealFile(@Error^.RealFile);
    ACE_CALLBACK_TYPE_SPACE:
      Result := HandleErrorSpace(@Error^.Space);
    ACE_CALLBACK_TYPE_SFXFILE:
      Result := HandleErrorSFXFile(@Error^.SFXFile);
    else
      Result := ACE_CALLBACK_RETURN_CANCEL;
  end;
end;
     
////////////////////////////////////////////////////////////////////////
// HandleRequestGlobal

function HandleRequestGlobal(Request: pACECallbackGlobalStruc): integer;
begin
  MessageDlg('unknown request', mtError, [mbOK], 0);
  Result := ACE_CALLBACK_RETURN_CANCEL;
end;

////////////////////////////////////////////////////////////////////////
// HandleRequestArchive

function HandleRequestArchive(Request: pACECallbackArchiveStruc): integer;
begin
  case Request^.Code of
    ACE_CALLBACK_REQUEST_CHANGEVOLUME:
      Result := ACE_CALLBACK_RETURN_OK // Yes, do not prompt for next volume
      else
      begin
        MessageDlg('unknown request - How did this happen?', mtError, [mbOK], 0);
        Result := ACE_CALLBACK_RETURN_CANCEL;
        Exit;
      end;
  end;
end;

////////////////////////////////////////////////////////////////////////
// HandleRequestArchivedFile

function HandleRequestArchivedFile(Request: pACECallbackArchivedFileStruc): integer;
begin
  case Request^.Code of
    ACE_CALLBACK_REQUEST_OVERWRITE:
      Result := ACE_CALLBACK_RETURN_OK; // Overwrite normal files
    ACE_CALLBACK_REQUEST_OVERWRITESYSFILE:
      Result := ACE_CALLBACK_RETURN_OK; // Overwrite system / readonly files
    ACE_CALLBACK_REQUEST_PASSWORD:
    begin
      ArchivePwd := InputBox('Enter password for ' + Request^.FileData^.SourceFileName,
        'Enter password', ArchivePwd);
      if ArchivePwd = '' then
        Result := ACE_CALLBACK_RETURN_CANCEL
      else
      begin
        Request^.GlobalData^.DecryptPassword := PChar(ArchivePwd);
        Result := ACE_CALLBACK_RETURN_OK;
      end;
    end
    else
    begin
      MessageDlg('unknown request', mtError, [mbOK], 0);
      Result := ACE_CALLBACK_RETURN_CANCEL;
      Exit;
    end
  end;
end;

////////////////////////////////////////////////////////////////////////
//  HandleRequestRealFile

function HandleRequestRealFile(Request: pACECallbackRealFileStruc): integer;
begin
  MessageDlg('unknown request', mtError, [mbOK], 0);
  Result := ACE_CALLBACK_RETURN_CANCEL;
end;

////////////////////////////////////////////////////////////////////////
// RequestProc callback

function RequestProc(Request: pACERequestCallbackProcStruc): integer; stdcall;
begin
  case Request^.StructureType of
    ACE_CALLBACK_TYPE_GLOBAL:
      Result := HandleRequestGlobal(@Request^.Global);
    ACE_CALLBACK_TYPE_ARCHIVE:
      Result := HandleRequestArchive(@Request^.Archive);
    ACE_CALLBACK_TYPE_ARCHIVEDFILE:
      Result := HandleRequestArchivedFile(@Request^.ArchivedFile);
    ACE_CALLBACK_TYPE_REALFILE:
      Result := HandleRequestRealFile(@Request^.RealFile);
    else
      Result := ACE_CALLBACK_RETURN_CANCEL;
  end;
end;

////////////////////////////////////////////////////////////////////////
// HandleStateStartArchive

function HandleStateStartArchive(Archive: pACECallbackArchiveStruc): integer;
var
  ActionStr: string;
begin
  case Archive^.Operation of
    ACE_CALLBACK_OPERATION_LIST:
      ActionStr := 'Listing ' + Archive^.ArchiveData^.ArchiveName;
    ACE_CALLBACK_OPERATION_TEST:
      ActionStr := 'Testing ' + Archive^.ArchiveData^.ArchiveName;
    ACE_CALLBACK_OPERATION_EXTRACT:
      ActionStr := 'Extracting ' + Archive^.ArchiveData^.ArchiveName;
    else
      ActionStr := 'unknown operation on ' + Archive^.ArchiveData^.ArchiveName;
  end;

  Result := ACE_CALLBACK_RETURN_OK;
end;

////////////////////////////////////////////////////////////////////////
// HandleStateStartFile

function HandleStateStartFile(ArchivedFile: pACECallbackArchivedFileStruc): integer;
var
  ActionStr: string;
begin
  case ArchivedFile^.Operation of
    ACE_CALLBACK_OPERATION_LIST:
      ActionStr := 'Found';
    ACE_CALLBACK_OPERATION_TEST:
      ActionStr := 'Testing';
    ACE_CALLBACK_OPERATION_ANALYZE:
      ActionStr := 'Analyzing';
    ACE_CALLBACK_OPERATION_EXTRACT:
    begin
      ActionStr := 'Extracting';
      frmUnpack.lblCurrentFile.Caption := ArchivedFile^.FileData^.SourceFileName;

      // for uninstall
      if bMakeUninst then
        slInstFiles.Add(ArchivedFile^.FileData^.SourceFileName);

      Gauge1Max := ArchivedFile^.FileData^.Size;
    end;
    else
      ActionStr := 'unknown operation on';
  end;

  Result := ACE_CALLBACK_RETURN_OK;
end;
}

///////////////////////////////////////////////////////////////////////
// AceDisplayProgress

procedure AceDisplayProgress(FileProcessedSize,
  FileSize,
  TotalProcessedSize,
  TotalSize: int64);
begin
  // Display/calculate progress for ACE extracting
  lKBWritten := TotalProcessedSize;

  Gauge1Progress := FileProcessedSize; // current file
  Gauge2Progress := lKBwritten div 1024; // all files - total progress

  frmInstall.UpdateGauge1;
  frmInstall.UpdateGauge2;

  Application.ProcessMessages;
end; // AceDisplayProgress

////////////////////////////////////////////////////////////////////////
// StateProc callback
{
function StateProc(State: pACEStateCallbackProcStruc): integer; stdcall;
begin
  if frmInstall.InstallCancel then
  begin
    Result := ACE_CALLBACK_RETURN_CANCEL;
    Exit;
  end;

  case State^.StructureType of
    ACE_CALLBACK_TYPE_ARCHIVEDFILE:
    begin
      case State^.ArchivedFile.Code of
        ACE_CALLBACK_STATE_STARTFILE:
        begin
          Result := HandleStateStartFile(@State^.ArchivedFile);
          exit;
        end;
//        ACE_CALLBACK_STATE_ENDNOCRCCHECK:
//        begin
//        end;
      end;
    end;
    ACE_CALLBACK_TYPE_PROGRESS:
    begin
      if State^.Progress.Code = ACE_CALLBACK_STATE_PROGRESS then
      begin
        AceDisplayProgress(State^.Progress.ProgressData^.FileProcessedSize,
          State^.Progress.ProgressData^.FileSize,
          State^.Progress.ProgressData^.TotalProcessedSize,
          State^.Progress.ProgressData^.TotalSize);
      end;
    end;
    ACE_CALLBACK_TYPE_CRCCHECK:
    begin
      if State^.CRCCheck.Code = ACE_CALLBACK_STATE_ENDCRCCHECK then
      begin
        if not State^.CRCCheck.CRCOk then
          MessageDlg('CRC-check error', mtError, [mbOK], 0);
      end;
    end;
  end;

  Result := ACE_CALLBACK_RETURN_OK;
end;

////////////////////////////////////////////////////////////////////////
// ACE Init Dll

function CallAceInitDll: integer;
var
  DllData: tACEInitDllStruc;
  zTempDir: array[0..MAX_PATH] of char;
begin
  FillChar(DllData, SizeOf(DllData), #0);                 // set all fields to zero

  DllData.GlobalData.MaxArchiveTestBytes := $1ffFF;      // search for archive
  // header in first 128k
  // of file
  DllData.GlobalData.MaxFileBufSize := $2ffFF;      // read/write buffer size
  // is 256k

  DllData.GlobalData.Comment.BufSize := Pred(SizeOf(CommentBuf));
  DllData.GlobalData.Comment.Buf := @CommentBuf; // set comment bufffer
  // to receive comments
  // of archive and/or
  // set comments

  GetTempPath(255, @zTempDir);
  DllData.GlobalData.TempDir := @zTempDir;

  // set callback function pointers
  DllData.GlobalData.InfoCallbackProc := nil;
  DllData.GlobalData.ErrorCallbackProc := @ErrorProc;
  DllData.GlobalData.RequestCallbackProc := @RequestProc;
  DllData.GlobalData.StateCallbackProc := @StateProc;

  Result := ACEInitDll(@DllData);
end;
}
//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.lblDekstopIconClick(Sender: TObject);
var
  s: string;
begin
  bDesktopShortcutChecked := not bDesktopShortcutChecked; // reverse setting
  s := GoWindir;
  if s[Length(s)] <> '\' then
    s := s + '\';
  ImageChecked.Visible := bDesktopShortcutChecked;
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.imgInstallMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform({$IFDEF FPC}LM_SysCommand{$ELSE}WM_SysCommand{$ENDIF}, $F012, 0);
  end;
end;

//////////////////////////////////////////////////////////////////////
{
procedure TfrmInstall.DoCancel;
begin
  frmMsgBox.MsgBox(LanguageGo.sCancelPrompt, mtConfirmation, [mbOK] + [mbCancel], 0);
  if frmMsgBox.msgboxReturn = mrOk then
  begin
    if arcext = '.ZIP' then
      frmMain.ZipMaster1.Cancel := True;
    InstallCancel := True;

    frmUnpack.imgCancel.Enabled := False;
  end;
end;
 }
//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.EInstallPathKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then // Enter
    imgFinishClick(Sender)
  else if Key = #27 then // Esc
    imgCancelClick(Sender);
end;
{
procedure TfrmInstall.VETChange(Sender: TObject; Node: TTreeNode);
begin
  if Namespace.Parent.IsMyComputer then
  begin
    AllowAsChild := not (Namespace.ReadOnly or Namespace.IsControlPanel)
  end
  else if Namespace.IsRecycleBin then
    AllowAsChild := False
  else
    AllowAsChild := True;

end;
 }
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  imgCancelClick(Sender);
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.imgFinishClick(Sender: TObject);
var
  s: string;
  iAvail: longint;
  iReq: longint;
  err: boolean;
begin
  slInstFiles := TStringList.Create;
  slInstShortcuts := TStringList.Create;
  err := False;
  SetCurrentDir(GoWinDir);
  s := EInstallPath.Text;
  if Trim(s) = '' then
    frmMsgBox.MsgBox('Please specify a path!', mtError, [mbOK], 0)
  else
  begin
    if s[Length(s)] = '\' then
      Delete(s, Length(s), 1); // remove last backslash
    EInstallPath.Text := s;

    iReq := lTotalSize div 1024;
    iAvail := (DiskFree(Ord(UpCase(EInstallPath.Text[1])) - 64) div 1024) div 1024;
    if iReq = 0 then iAvail := 1;

    if iAvail <= iReq then
      frmMsgBox.MsgBox(LanguageGo.sDiskFreeLow, mtError, [mbOK], 0)
    else
    begin
      if frmMain.MakeDir(EInstallPath.Text) then
      begin
        s := frmInstall.Caption;
        Delete(s, 1, 16);
        lKBytesDone := 0;
        InstallDone := False;
        StartTimer.Enabled := True;
        InstallCancel := False;

        frmUnpack.imgCancel.Enabled := True;
        frmUnpack.ChkImg.Enabled := True;


        if bPlainCopy then
        begin
          frmInstall.Hide;
          frmUnpack.Show;
          frmUnpack.CopyFileWithProgress(CopySource, EInstallPath.Text, True, sTitle);
          BackToMain;
          Exit;
        end;

        StartTime := 0;
        {
        if arcext = '.ZIP' then
        begin
          slInstZipDirs := TStringList.Create;
          frmInstall.Hide;
          if not bDisableUnpackWin then
            frmUnpack.Show;
          frmMain.ZipMaster1.ExtrOptions := [ExtrOverwrite, ExtrDirNames];
          frmMain.ZipMaster1.OnProgressDetails := ZipMaster1ProgressDetails;
//            frmMain.ZipMaster1.OnMessage := ZipMaster1Message;
          frmMain.ZipMaster1.ExtrBaseDir := EInstallPath.Text;
          frmMain.ZipMaster1.Password := ArchivePwd;
          frmMain.ZipMaster1.Unattended := True;
          frmMain.ZipMaster1.Extract; // start event handler ZipMaster1Progress
          slInstZipDirs.Free;
        end
        else if arcext = '.RAR' then
        begin
          if RarDllLoaded then
          begin
            frmInstall.Hide;
            if not bDisableUnpackWin then
              frmUnpack.Show;
            ExtractRARArchive;
          end
          else
          begin
            frmMsgBox.MsgBox('Unrar.dll not found!', mtError, [mbOK], 0);
            err := True;
          end;
        end
        else if arcext = '.ACE' then
        begin
          if AceDllLoaded then
          begin
            frmInstall.Hide;
            if not bDisableUnpackWin then
            begin
              frmUnpack.Show;
              frmUnpack.Refresh;
            end;

            Gauge1Progress := 0; // current file
            Gauge2Progress := 0; // total progress
            UpdateGauge1;
            UpdateGauge2;
            lKBWritten := 0;

            CallACEExtract(AceArchiveName,
              EInstallPath.Text + '\',
              ArchivePwd,
              False); // DoExcludePath
            // this proc will start event handlers for ACE

            if InstallCancel then
              frmMsgBox.MsgBox(LanguageGo.sCancelMsg, mtInformation, [mbOK], 0)
          end
          else
          begin
            frmMsgBox.MsgBox('UnAceV2.dll not found!', mtError, [mbOK], 0);
            err := True;
          end;
        end
        else
          frmMsgBox.MsgBox('Unknown extension: ' + arcext, mtError, [mbOK], 0);

          }
        if not err then
        begin
          StartTimer.Enabled := False;
          FinishInstall; // finish message
        end;
      end
      else
        frmMsgBox.MsgBox('Unable to create the direcotry ' + EInstallPath.Text,
          mtError, [mbOK], 0);
    end;
  end;
  SetCurrentDir(GoWinDir);
  slInstFiles.Free;
  btnCancel.Status:=0; // 0 = normal
end; // imgFinishClick

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.imgCancelClick(Sender: TObject);
begin
{  if arcext = '.ZIP' then
  begin
    frmMain.ZipMaster1.OnProgressDetails := nil;
    frmMain.ZipMaster1.OnMessage := nil;
  end;
 }
  frmMain.Show;
  frmInstall.Hide;
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.ChkImgTimer(Sender: TObject);
var
  x, y: integer;
  blnFinish: boolean;
  blnCancel: boolean;
begin
  // Close/Minimize Status
  // 0 = normal
  // 1 = mouse over
  // 2 = down

  blnFinish := False;
  blnCancel := False;

  x := Mouse.CursorPos.x - frmInstall.Left;
  y := Mouse.CursorPos.y - frmInstall.Top;;

  if frmMain.MouseOverImage(btnFinish, imgFinish, x, y) then
    blnFinish := True
  else if frmMain.MouseOverImage(btnCancel, imgCancel, x, y) then
    blnCancel := True;

  if (not blnFinish) and (btnFinish.Status <> 0) then
  begin
    if imgFinish.Enabled then
      imgFinish.Picture.Assign(btnFinish.pic)
    else
      imgFinish.Picture.Assign(btnFinish.picMDown);
    btnFinish.Status := 0; // 0 = normal
  end;
  if (not blnCancel) and (btnCancel.Status <> 0) then
  begin
    if imgCancel.Enabled then
      imgCancel.Picture.Assign(btnCancel.pic)
    else
      imgCancel.Picture.Assign(btnCancel.picMDown);
    btnCancel.Status := 0; // 0 = normal
  end;
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.imgFinishMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgFinish.Picture.Assign(btnFinish.picMDown);
    btnFinish.Status := 2; // 2 = Mouse Down
  end;
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.imgFinishMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  btnFinish.Status := 3; // let timer deceide
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.imgCancelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgCancel.Picture.Assign(btnCancel.picMDown);
    btnCancel.Status := 2; // 2 = Mouse Down
  end;
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.imgCancelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  btnCancel.Status := 3; // let timer deceide
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.imgDesktopIconMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
    lblDekstopIconClick(Sender);
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.lblDekstopIconMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
    lblDekstopIconClick(Sender);
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.UpdateGauge1;
begin
  if Gauge1Max > 0 then
    frmUnpack.Gauge1.Step := Round(Gauge1Progress * 100 / Gauge1Max);

  frmUnpack.lblBytes.Caption := frmMain.SizeKbToStr(Gauge1Progress div 1024) +
                                ' ' + LanguageGo.sXOfY + ' ' +
                                frmMain.SizeKbToStr(Gauge1Max div 1024);
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.UpdateEstimatedTime;
begin
  if frmUnpack.Gauge2.Step > 0 then
  begin
    EstTimesPrev[EstTimesPrevIdx] := ((StartTime * 100) div frmUnpack.Gauge2.Step) - StartTime;
    if EstTimesPrevIdx >= EstTimesPrevMax then
      EstTimesPrevIdx := 1
    else
      Inc(EstTimesPrevIdx);

    Application.Title := IntToStr(frmUnpack.Gauge2.Step) + '% ' +  sTitle;
  end;
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.UpdateGauge2;
begin
  if Gauge2Max > 0 then
  begin
    frmUnpack.Gauge2.Step := Round(Gauge2Progress * 100 / Gauge2Max);
    UpdateEstimatedTime;
  end;
  frmUnpack.lblTotalMB.Caption := frmMain.SizeKbToStr(Gauge2Progress) +
                                  ' ' + LanguageGo.sXOfY + ' ' +
                                  frmMain.SizeKbToStr(Gauge2Max);
end;

//////////////////////////////////////////////////////////////////////
{
procedure TfrmInstall.UnloadUnrar;
begin
  UnrarDllUnload;
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.UnloadUnAce;
begin
  UnLoadAceDll;
end;
 }
//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.VEComboboxChange(Sender: TObject);
var
  j: int64;
begin
  if DirectoryExists(VECombobox.ShellTreeView.GetSelectedNodePath()) then
  begin
    EInstallPath.Text := VEComboBox.ShellTreeView.GetSelectedNodePath();

    j := DiskFree(Ord(UpCase(EInstallPath.Text[1])) - 64) div 1024;
    if j = 0 then j := 1;
    lblSpaceAvail.Caption := frmMain.SizeKbToStr(j);
  end
{  else
  begin
    VET.Di := EInstallPath.Text;
  end;}
end;

//////////////////////////////////////////////////////////////////////

procedure TfrmInstall.FormShow(Sender: TObject);
begin
  if NewSkinName <> '' then
  begin
    LoadSkin;
    NewSkinName := '';
  end;
end;

//////////////////////////////////////////////////////////////////////

end.