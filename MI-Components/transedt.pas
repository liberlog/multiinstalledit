unit Transedt; { as, JUL-96 }
{ TEdit und TMemo vor einem Bitmap-Hintergrund. Funktionsprinzip:
  Parent-Fenster mit TEdit bzw. TMemo ("Memo") und TMemoPane
  TMemoPane deckt das Memo (bis auf Bildlaufleisten) ab, reicht
  Botschaften an das Memo weiter und dient als Zeichenflche. }

interface
{$IFDEF FPC}
{$Mode Delphi}
{$ENDIF}
uses
   {$IFDEF FPC}
   LCLProc, LCLType, lmessages,
   {$ELSE}
   WinProcs, WinTypes,
   {$ENDIF}
   StdCtrls, Controls, Messages, Classes,
   Graphics, Forms, ExtCtrls, SysUtils;

type
 TPublicEdit = class(TCustomEdit); 
 { macht Text, BorderStyle etc. verfgbar }
 TTransBase = class;

 { Fenster zum berlagern von TEdit/TMemo; nur via TTransBase }
 TMemoPane = class(TCustomControl)
 private
   FOwner: TTransBase;
   Memo: TCustomEdit;  { das ist die Basisklasse von TMemo und TEdit }
 protected
   procedure WMEraseBkGnd(var Msg: TWMEraseBkGnd); 
                          message WM_ERASEBKGND;
   procedure WMLButtonDown(var Msg: {$IFDEF FPC}TLMMouse{$ELSE}TWMMouse{$ENDIF}); message {$IFDEF FPC}LM_LBUTTONDOWN{$ELSE}WM_LBUTTONDOWN{$ENDIF};
   procedure Paint; override;
 public
   constructor Create(AOwner: TComponent); override;
 end;

 { Basisklasse fr TTransMemo und TTransEdit }
 TTransBase = class(TCustomControl)
 private
   FLastCaretPos: TPoint; { nur fr TTransEdit in fokuslosen Zeiten }
   FPane: TMemoPane; { Fenster zum Abdecken von TEdit bzw. TMemo }
   FBackBMP: TPicture; FBackBuf: TBitmap;  { Hintergrund, Z.puffer }
   FMemoMouseDown, FMemoCaretVisible: Boolean;
   FSelectionBrush: TBrush; { Fr die Auswahl-Darstellung }
   SelStart, SelEnd, CharCount: LongInt;
   { Start/Ende Auswahl, Zeichenzhler }
   FShowSel, InSelection: Boolean;  { Auswahl in Blau }
   FOnChange, FOnClick, FOnDblClick: TNotifyEvent;
   FOnMouseDown, FOnMouseUp: TMouseEvent; 
   FOnMouseMove: TMouseMoveEvent;
   FOnDragDrop: TDragDropEvent; FOnDragOver: TDragOverEvent;
   FOnEndDrag: TEndDragEvent; FOnKeyDown, FOnKeyUp: TKeyEvent; 
   FOnKeyPress: TKeyPressEvent;
 protected
   procedure SelectBrush;
   procedure PaintSelLine(var XPos: Integer; YPos: Integer;
     var Line: String; StrLen: Integer);
   procedure WMCommand(var Msg: {$IFDEF FPC}TLMCommand{$ELSE}TWMCommand{$ENDIF}); message {$IFDEF FPC}LM_COMMAND{$ELSE}WM_COMMAND{$ENDIF};
             { Notifys }
   procedure WMEraseBkGnd(var Msg: TWMEraseBkGnd); 
                          message WM_ERASEBKGND;
   procedure CMFontChanged(var Msg: TMessage); message CM_FONTCHANGED;
   procedure SetBackBMP(BMP: TPicture);
   procedure ShowMemoCaret(AShow: Boolean);
   function GetEditCtrl: TPublicEdit; virtual; abstract; 
                         { TEdit oder TMemo }
   procedure SetName(const Value: TComponentName); override;
   procedure MemoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
   procedure MemoMouseMove(Sender: TObject; Shift: TShiftState; 
                           X,Y: Integer);
   procedure MemoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
   procedure SetOnChange(Value: TNotifyEvent);
   procedure MemoClick(Sender: TObject);
   procedure MemoDblClick(Sender: TObject);
   procedure MemoDragDrop(Sender, Source: TObject; X, Y: Integer);
   procedure MemoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
   procedure MemoEndDrag(Sender, Target: TObject; X, Y: Integer);
   procedure MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   procedure MemoKeyPress(Sender: TObject; var Key: Char);
   procedure MemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   procedure SetHideSel(Value: Boolean); function GetHideSel: Boolean;
   procedure SetText(const Value: String); function GetText: String;
   procedure SetBorderStyle(Value: TBorderStyle); 
   function GetBorderStyle: TBorderStyle;
   procedure CustomBounds(ALeft,ATop,AWidth,AHeight,
                          PaneW,PaneH: Integer);
   procedure Paint; override;
   procedure PostCreate;
   procedure OnCaretTimer(Sender: TObject);
 public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
 published
   property Brush; { Standard-Hintergrund, falls kein Bitmap gesetzt }
   property SelectionBrush: TBrush read FSelectionBrush 
                            write FSelectionBrush;
   property BackBMP: TPicture read FBackBMP write SetBackBMP;
   property OnChange: TNotifyEvent read FOnChange write SetOnChange;
   property OnMouseDown: TMouseEvent 
                         read FOnMouseDown write FOnMouseDown;
   property OnMouseMove: TMouseMoveEvent 
                         read FOnMouseMove write FOnMouseMove;
   property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp;
   property OnClick: TNotifyEvent read FOnClick write FOnClick;
   property OnDblClick: TNotifyEvent 
                        read FOnDblClick write FOnDblClick;
   property OnDragDrop: TDragDropEvent 
                        read FOnDragDrop write FOnDragDrop;
   property OnDragOver: TDragOverEvent 
                        read FOnDragOver write FOnDragOver;
   property OnEndDrag: TEndDragEvent read FOnEndDrag write FOnEndDrag;
   property OnKeyDown: TKeyEvent read FOnKeyDown write FOnKeyDown;
   property OnKeyPress: TKeyPressEvent 
                        read FOnKeyPress write FOnKeyPress;
   property OnKeyUp: TKeyEvent read FOnKeyUp write FOnKeyUp;
   property HideSelection: Boolean read GetHideSel write SetHideSel;
   property BorderStyle: TBorderStyle read GetBorderStyle 
            write SetBorderStyle;
   property Color; property Font; property DragCursor; 
   property DragMode; property OnEnter; property OnExit; 
   property Enabled;
 end;

type
  TTransEdit = class(TTransBase)
  private
    FEdit: TEdit;
    FOldSel: LongInt; FCaretInFront: Boolean; 
            { Auswahl (Start-/EndIndex) }
  protected
   procedure Paint; override;
   function GetEditCtrl: TPublicEdit; override;  { liefert FEdit }
  public
   constructor Create(AOwner: TComponent); override;
   procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  published
   property Text: String read GetText write SetText;
  end;

  TTransMemo = class(TTransBase)
  private
    FMemo: TMemo;
  protected
   procedure SetScrollBars(const Value: TScrollStyle);
   function GetScrollBars: TScrollStyle;
   procedure SetLines(Value: TStrings); function GetLines: TStrings;
   procedure Paint; override;
   function GetEditCtrl: TPublicEdit; override;  { liefert FMemo }
  public
   constructor Create(AOwner: TComponent); override;
   procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  published
   property ScrollBars: TScrollStyle 
                        read GetScrollBars write SetScrollBars;
   property Lines: TStrings read GetLines write SetLines;
  end;

 procedure Register;

implementation
{$IFDEF FPC}
uses   LCLIntf;
{$ENDIF}

const { "Caret" aus, an; Neuzeichnen }
  MEMO_CARETOFF = $1000; MEMO_CARETON = $1001;
  MEMO_SELCHANGED = $1002;
var CaretTimer: TTimer; { Caret-Blinkerei, fr alle Objekte }

type
  TModifiedMemo = class(TMemo)
  protected
    procedure WndProc(var Msg: TMessage); override;
  end;

  TModifiedEdit = class(TEdit)
  protected
    procedure WndProc(var Msg: TMessage); override;
  end;

procedure ParentNotify(Ctrl: TWinControl; NotifyVal: Word);
begin
{$IFDEF WIN32}
  Ctrl.Parent.Perform(WM_COMMAND,NotifyVal shl 16, Ctrl.Handle);
{$ELSE}
{$IFDEF FPC}
  Ctrl.Parent.Perform(LM_COMMAND,NotifyVal shl 16, Ctrl.Handle);
{$ELSE}
  Ctrl.Parent.Perform(WM_COMMAND,0,MakeLong(Ctrl.Handle,NotifyVal));
{$ENDIF}
{$ENDIF}
end;

procedure TModifiedMemo.WndProc(var Msg: TMessage);
var OldSelLen: Integer;
begin
  OldSelLen := -1;
  with Msg do
    if (Msg = WM_VSCROLL) and (wParam = SB_THUMBTRACK) then
      ParentNotify(Self,{$IFDEF FPC}CN_VSCROLL{$ELSE}EN_VSCROLL{$ENDIF} )
    else if (Msg = WM_HSCROLL) and (wParam = SB_THUMBTRACK) then
      ParentNotify(Self,{$IFDEF FPC}CN_HSCROLL{$ELSE}EN_HSCROLL{$ENDIF})
    else if (Msg = {$IFDEF FPC}LM_KEYDOWN{$ELSE}WM_KEYDOWN{$ENDIF}) then
    begin
      OldSelLen := SelLength;
      ParentNotify(Self,MEMO_CARETOFF);
    end;

  inherited WndProc(Msg);

  if Msg.Msg = {$IFDEF FPC}LM_KEYDOWN{$ELSE}WM_KEYDOWN{$ENDIF} then
    if OldSelLen <> SelLength then
      ParentNotify(Self,MEMO_SELCHANGED)
    else
      ParentNotify(Self,MEMO_CARETON);
end;

procedure TModifiedEdit.WndProc(var Msg: TMessage);
begin
  if Msg.Msg = {$IFDEF FPC}LM_KEYDOWN{$ELSE}WM_KEYDOWN{$ENDIF} then ParentNotify(Self,MEMO_CARETOFF);
  inherited WndProc(Msg);
  if Msg.Msg = {$IFDEF FPC}LM_KEYDOWN{$ELSE}WM_KEYDOWN{$ENDIF} then ParentNotify(Self,MEMO_SELCHANGED);
end;

constructor TMemoPane.Create(AOwner: TComponent);
begin
  if AOwner is TTransBase then
  begin
    inherited Create(AOwner);
    FOwner := AOwner as TTransBase;
    Cursor := crIBeam;
  end
   else raise Exception.Create('TMemoPane: Owner <> TTransMemo/Edit');
end;

procedure TMemoPane.WMEraseBkGnd(var Msg: TWMEraseBkGnd);
begin
  Msg.Result := 1;
end;

procedure TMemoPane.WMLButtonDown(var Msg: {$IFDEF FPC}TLMMouse{$ELSE}TWMMouse{$ENDIF});
begin
  if Memo <> nil then
  begin { Muá VOR einem eventuellen Fokuswechsel verarbeitet werden,
          sonst kommt Windows durcheinander(!) }
    with Msg do Result := Memo.Perform(Msg,Keys,LongInt(Pos));
    if not Memo.Focused then Memo.SetFocus;
    Invalidate;
  end;
end;

procedure TMemoPane.Paint;
begin
  FOwner.Paint;
end;

procedure TTransBase.SetOnChange(Value: TNotifyEvent);
begin FOnChange := Value; end;

procedure TTransBase.CMFontChanged(var Msg: TMessage);
begin
  if FBackBuf <> nil then FBackBuf.Canvas.Font := Font;
  if GetEditCtrl <> nil then GetEditCtrl.Font := Font;
  Left := Left;  { Edit verndert seine Hhe(!) -> SetBounds }
end;

procedure TTransBase.SetName(const Value: TComponentName);
var OldName: TComponentName;
begin
  OldName := Name; inherited SetName(Value);
  with GetEditCtrl do if Text = OldName then Text := Value;
end;

constructor TTransBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  {$IFNDEF FPC}
  Ctl3D := False; ParentCtl3D := False;
  {$ENDIF}
  FBackBMP := TPicture.Create;
  FBackBuf := TBitmap.Create;
  FSelectionBrush := TBrush.Create;
  with FSelectionBrush do
  begin
    Style := bsSolid; Color := clBlue;
  end;
  FPane := TMemoPane.Create(Self);
  with FPane do
  begin
    Parent := Self;
    OnMouseMove := MemoMouseMove;  { nur wg. OnMouseMove }
    OnClick := MemoClick; OnDblClick := MemoDblClick;
    OnDragDrop := MemoDragDrop; OnDragOver := MemoDragOver;
    OnEndDrag := MemoEndDrag;
  end;
end;

procedure TTransBase.PostCreate;
begin
  with GetEditCtrl do
  begin
    Parent := Self;
    OnMouseDown := MemoMouseDown; OnMouseMove := MemoMouseMove;
    OnMouseUp := MemoMouseUp;
    OnClick := MemoClick; OnDblClick := MemoDblClick;
    OnDragOver := MemoDragOver; OnDragDrop := MemoDragDrop;
    OnEndDrag := MemoEndDrag;
    OnKeyPress := MemoKeyPress; OnKeyDown := MemoKeyDown;
    OnKeyUp := MemoKeyUp;
  end;
  FPane.Memo := GetEditCtrl; FPane.BringToFront;
  SetBounds(Left,Top,GetEditCtrl.Width,GetEditCtrl.Height);
end;

destructor TTransBase.Destroy;
begin
  FBackBMP.Free; FBackBuf.Free; FSelectionBrush.Free;
  inherited Destroy;  { FMemo und FPane: Destroy via Owner }
end;

constructor TTransMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMemo := TModifiedMemo.Create(Self);
  PostCreate;
end;

function TTransMemo.GetEditCtrl: TPublicEdit;
begin Result := TPublicEdit(FMemo); end;

constructor TTransEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEdit := TModifiedEdit.Create(Self);
  PostCreate;
end;

function TTransEdit.GetEditCtrl: TPublicEdit;
begin Result := TPublicEdit(FEdit); end;

procedure TTransBase.CustomBounds(ALeft,ATop,AWidth,AHeight,
  PaneW,PaneH: Integer);
var XYOff: Integer;
begin
  inherited SetBounds(ALeft,ATop,AWidth,AHeight);
  GetEditCtrl.SetBounds(0,0,AWidth,AHeight);
  if GetEditCtrl.BorderStyle = bsNone then XYOff := 0 else XYOff := 1;
  FPane.SetBounds(XYOff,XYOff,PaneW-XYOff*2,PaneH-XYOff*2);
  { Fr Vergráerungen, wenn FPicture noch undefiniert ist }
  FBackBuf.Canvas.Brush.Assign(Brush); { Style := bsSolid; ###}
  if FPane.Width >= 0 then FBackBuf.Width := FPane.Width;
  if FPane.Height >= 0 then FBackBuf.Height := FPane.Height;
  Invalidate;
end;

procedure TTransEdit.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin { Pane ist genauso groá wie das Fenster }
  CustomBounds(ALeft,ATop,AWidth,AHeight,AWidth,AHeight);
end;

procedure TTransMemo.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var PaneW, PaneH, VScrollW, HScrollH: Integer;
begin
  HScrollH := GetSystemMetrics(SM_CYHSCROLL);
  VScrollW := GetSystemMetrics(SM_CXVSCROLL);
     { Fehler in Win3.x, auch bei Win95 }
{$IFNDEF WIN32} Dec(HScrollH); Dec(VScrollW); {$ENDIF}
  PaneW := AWidth; PaneH := AHeight;
  case FMemo.ScrollBars of
    ssVertical: Dec(PaneW,VScrollW);
    ssHorizontal: Dec(PaneH,HScrollH);
    ssBoth: begin
              Dec(PaneW,VScrollW); Dec(PaneH,HScrollH);
           end;
  end;
  CustomBounds(ALeft,ATop,AWidth,AHeight,PaneW,PaneH);
end;

procedure TTransBase.WMCommand(var Msg: {$IFDEF FPC}TLMCommand{$ELSE}TWMCommand{$ENDIF});
begin
  {$IFNDEF FPC}
  with Msg do
    if Ctl = GetEditCtrl.Handle then
    case NotifyCode of
      EN_UPDATE,
      EN_CHANGE:
        begin
          FPane.Invalidate;
          if Assigned(FOnChange) then
          begin
            Update; FOnChange(Self);
          end;
        end;
      {$IFDEF FPC}CN_HSCROLL{$ELSE}EN_HSCROLL{$ENDIF},
      {$IFDEF FPC}CN_VSCROLL{$ELSE}EN_VSCROLL{$ENDIF}: Invalidate;
      EN_SETFOCUS:
        begin
         Invalidate;
         with CaretTimer do
         begin
           OnTimer := OnCaretTimer;
           Enabled := True;
          Interval := GetCaretBlinkTime;
         end;
       end;
      EN_KILLFOCUS:
        begin
          ShowMemoCaret(False);
          if GetEditCtrl.HideSelection then FPane.Invalidate;
        end;
      MEMO_CARETOFF: ShowMemoCaret(False);
      MEMO_CARETON: ShowMemoCaret(True);
      MEMO_SELCHANGED: FPane.Invalidate;  { SelLength gendert }
      else
        raise Exception.Create(Name+': NotifyCode = '+
                               IntToStr(NotifyCode)+'?');
      end;
  {$ENDIF}
  inherited;
end;

{ -------- Weitergereichte Eigenschaften ----------------- }
procedure TTransBase.SetBackBMP(BMP: TPicture);
begin FBackBMP.Assign(BMP); FPane.Invalidate; end;

procedure TTransBase.SetText(const Value: String);
begin ShowMemoCaret(False); GetEditCtrl.Text := Value; end;

function TTransBase.GetText: String;
begin Result := GetEditCtrl.Text; end;

function TTransBase.GetBorderStyle: TBorderStyle;
begin Result := GetEditCtrl.BorderStyle; end;

procedure TTransBase.SetBorderStyle(Value: TBorderStyle);
begin
  GetEditCtrl.BorderStyle := Value; Left := Left; { Recalc }
end;

procedure TTransBase.SetHideSel(Value: Boolean);
begin
  GetEditCtrl.HideSelection := Value; FPane.Invalidate;
end;

function TTransBase.GetHideSel: Boolean;
begin Result := GetEditCtrl.HideSelection; end;

procedure TTransMemo.SetScrollBars(const Value: TScrollStyle);
begin
  FMemo.ScrollBars := Value; Left := Left;  { Recalc bounds }
end;

function TTransMemo.GetScrollBars: TScrollStyle;
begin Result := FMemo.ScrollBars; end;

function TTransMemo.GetLines: TStrings;
begin Result := FMemo.Lines; end;

procedure TTransMemo.SetLines(Value: TStrings);
begin FMemo.Lines := Value; end;

{ -------- Weitergereichte Ereigniszuordnungen ----------------- }
procedure TTransBase.MemoMouseDown(Sender: TObject; Button: 
          TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then FMemoMouseDown := True;
  if Assigned(FOnMouseDown) 
    then FOnMouseDown(Sender,Button,Shift,X,Y);
end;

procedure TTransBase.MemoMouseMove(Sender: TObject; 
          Shift: TShiftState; X,Y: Integer);
begin
  if FMemoMouseDown then FPane.Invalidate;
  if Assigned(FOnMouseMove) then FOnMouseMove(Sender,Shift,X,Y);
end;

procedure TTransBase.MemoMouseUp(Sender: TObject; 
          Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then FMemoMouseDown := False;
  if Assigned(FOnMouseUp) then FOnMouseUp(Sender,Button,Shift,X,Y);
end;

procedure TTransBase.MemoClick(Sender: TObject);
begin if Assigned(FOnClick) then FOnClick(Self); end;

procedure TTransBase.MemoDblClick(Sender: TObject);
begin if Assigned(FOnDblClick) then FOnDblClick(Self); end;

procedure TTransBase.MemoDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin if Assigned(FOnDragDrop) then FOnDragDrop(Sender,Source,X,Y);
end;

procedure TTransBase.MemoDragOver(Sender, Source: TObject; 
          X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Assigned(FOnDragOver) 
    then FOnDragOver(Sender,Source,X,Y,State,Accept);
end;

procedure TTransBase.MemoEndDrag(Sender, Target: TObject; 
                                 X, Y: Integer);
begin if Assigned(FOnEndDrag) then FOnEndDrag(Sender,Target,X,Y); end;

procedure TTransBase.MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
begin if Assigned(FOnKeyDown) then FOnKeyDOwn(Sender,Key,Shift); end;

procedure TTransBase.MemoKeyPress(Sender: TObject; var Key: Char);
begin if Assigned(FOnKeyPress) then FOnKeyPress(Sender,Key); end;

procedure TTransBase.MemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
begin if Assigned(FOnKeyUp) then FOnKeyUp(Sender,Key,Shift); end;

{ -------- Paint & Co. -------------------- }
procedure TTransBase.WMEraseBkGnd(var Msg: TWMEraseBkGnd);
begin
  Msg.Result := 1;
end;

procedure TTransBase.Paint;
begin
  FMemoCaretVisible := False;  { wird bermalt }
  if (BackBMP.Width < Width) or (BackBMP.Height < Height) then
  begin { Falls BackBMP < Fenster: Fllen mit eigenem Brush }
    FillRect(FBackBuf.Canvas.Handle,Rect(0,0,Width,Height),
             Brush.Handle);
  end;
  { Hintergrund-Bitmap -> Puffer }
  with FBackBuf do Canvas.CopyRect(Rect(0,0,Width,Height),
    BackBMP.Bitmap.Canvas,Rect(0,0,Width,Height));
  SelStart := GetEditCtrl.SelStart;
  SelEnd := SelStart+GetEditCtrl.SelLength;
  FShowSel := (SelStart <> SelEnd) and
              (GetEditCtrl.Focused or not HideSelection);
end;

procedure TTransBase.PaintSelLine(var XPos: Integer; YPos: Integer;
    var Line: String; StrLen: Integer);
var PartStr: String;
begin
  PartStr := Copy(Line,1,StrLen); System.Delete(Line,1,StrLen);
  with FBackBuf.Canvas do
  begin
    TextOut(XPos,YPos,PartStr);
    Inc(XPos,TextWidth(PartStr)); Inc(CharCount,Length(PartStr));
  end;
end;

procedure TTransBase.SelectBrush;
begin  { Blau oder transparent }
  InSelection := (SelStart <= CharCount) and (SelEnd > CharCount) and 
                 FShowSel;
  with FBackBuf.Canvas.Brush do
    if InSelection then Assign(FSelectionBrush) else Style := bsClear;
end;

procedure TTransEdit.Paint;
var XPos, CaretIndex: Integer; CaretPos: TPoint; Line: String;
begin
  inherited Paint;  { setzt FBackBuf, Brush, SelStart, SelEnd }
  Line := FEdit.Text;
  { TEdit hat im Gegensatz zu TMemo keine Bildlaufleiste. Deshalb:
a)  Bestimmung, ob das Caret (Index) am Anfang oder Ende einer 
       Auswahl ist
    b) Ermittlung der echten Caret-Position (Pixel)
    c) String krzen, bis ermittelte = abgefragte Caret-Position }
  if SelStart <> LoWord(FOldSel) then FCaretInFront := True;
  if SelEnd <> HiWord(FOldSel) then FCaretInFront := False;
  FOldSel := MakeLong(SelStart,SelEnd);
  if FCaretInFront then CaretIndex := SelStart 
                   else CaretIndex := SelEnd;

  if FEdit.Focused then
  begin  
  { Caretposition (Pixel), bei fehlendem Fokus letztgespeich. Pos. }
    GetCaretPos(CaretPos); FLastCaretPos := CaretPos;
  end else CaretPos := FLastCaretPos;
  { String bei Bedarf verkrzen }
  CharCount := 0; { "bereits ausgegebene Zeichen" }
  while (FBackBuf.Canvas.TextWidth(Copy(Line,CharCount+1,
                                   CaretIndex-CharCount))
    > CaretPos.X) do Inc(CharCount);
  Delete(Line,1,CharCount);
  SelectBrush; XPos := 0;
  if FShowSel then
  begin
    if not InSelection then
    begin  { Text vor der Auswahl }
      PaintSelLine(XPos,0,Line,SelStart-CharCount); SelectBrush;
    end;                  { Auswahl }
    PaintSelLine(XPos,0,Line,SelEnd-CharCount); SelectBrush;
  end;
  PaintSelLine(XPos,0,Line,255); { Rest nach Auswahl oder Zeile }
  Canvas.Draw(FPane.Left,FPane.Top,FBackBuf); { Bitmap -> Bildschirm }
  ShowMemoCaret(True);
end;

procedure TTransMemo.Paint;
var XStart, XPos, YPos, StartLine, LineHeight, LineLen: Integer;
    Line: String;
begin
  inherited Paint;  { setzt Bitmaps, SelStart, SelEnd }
  {$IFNDEF FPC}
  StartLine := SendMessage(FMemo.Handle,EM_GETFIRSTVISIBLELINE,0,0);
  {$ENDIF}
  LineHeight := FBackBuf.Canvas.TextHeight('X');
  { Vor der obersten Zeile liegende Zeichen "sind schon ausgegeben" }
  {$IFNDEF FPC}
  CharCount := FMemo.Perform(EM_LINEINDEX,StartLine,0);
  {$ENDIF}
  SelectBrush; YPos := 0;
  XStart := -GetScrollPos(FMemo.Handle,SB_HORZ);
  while (StartLine < FMemo.Lines.Count) and 
        (YPos+LineHeight < FBackBuf.Height) do
  begin
    XPos := XStart;  { kann durchaus negativ sein }
    Line := FMemo.Lines[StartLine];
    LineLen := Length(Line)+2; { CR/LF }
    if (InSelection and (SelEnd < CharCount+LineLen)) or 
       (not InSelection and (SelStart >= CharCount) and 
        (SelStart < CharCount+LineLen)) then
    begin { Wechsel des Auswahlzustands in dieser Zeile }
      if not InSelection then
      begin  { Text vor der Auswahl }
        PaintSelLine(XPos,YPos,Line,SelStart-CharCount); SelectBrush;
      end;                    { Auswahl }
      PaintSelLine(XPos,YPos,Line,SelEnd-CharCount); SelectBrush;
    end;     { Text nach Auswahl bzw. komplette Zeile. +2 wg. CR/LF }
    PaintSelLine(XPos,YPos,Line,255); Inc(CharCount,2);
    Inc(YPos,LineHeight); Inc(StartLine);
  end;
  Canvas.Draw(FPane.Left,FPane.Top,FBackBuf);
  ShowMemoCaret(True);
end;

procedure TTransBase.ShowMemoCaret(AShow: Boolean);
begin
  if (FMemoCaretVisible = AShow) or
     (AShow and not GetEditCtrl.Focused) then Exit;
  FMemoCaretVisible := AShow;
  Canvas.Pen.Mode := pmXor; Canvas.Pen.Color := clWhite;
  Canvas.Pen.Width := 2;
  if AShow then GetCaretPos(FLastCaretPos); { else alte Position }
  Canvas.MoveTo(FLastCaretPos.X,FLastCaretPos.Y);
  Canvas.LineTo(FLastCaretPos.X,FLastCaretPos.Y + 
                FBackBuf.Canvas.TextHeight('X'));
end;

procedure TTransBase.OnCaretTimer(Sender: TObject);
begin ShowMemoCaret(not FMemoCaretVisible); end;

procedure Register;
begin RegisterComponents('Delphi Corner',[TTransEdit,TTransMemo]); 
end;

begin  { wird mit der App zusammen wieder abgerumt }
  CaretTimer := TTimer.Create(Application);
end.