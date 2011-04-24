unit Brushedt;
{ Einzeiliger Editor mit Bitmuster-Hintergrund }
interface
uses
{$IFDEF FPC}
  LCLType, LCLProc,
{$ELSE}
  WinProcs, WinTypes,
{$ENDIF}
  Classes, Messages, Controls, StdCtrls,
  Graphics;

type
  TBrushEdit = class(TEdit)
   private
    FPicture: TPicture;
   protected
    procedure CNCtlColor(var Msg: TWMCtlColor); message 
CN_CTLCOLOR;
    procedure BrushPicChanged(Sender: TObject);
    procedure SetPicture(const Value: TPicture);
   public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
   published
    property BrushPicture: TPicture read FPicture write 
SetPicture;
   end;

procedure Register;

implementation

constructor TBrushEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPicture := TPicture.Create;
  FPicture.OnChange := BrushPicChanged;
end;

destructor TBrushEdit.Destroy;
begin
  FPicture.Free;
  inherited Destroy;
end;

procedure TBrushEdit.SetPicture(const Value: TPicture);
begin
  FPicture.Assign(Value);
end;

procedure TBrushEdit.BrushPicChanged(Sender: TObject);
begin
  with Brush do
    if Bitmap = nil then Bitmap := TBitmap.Create;
  Brush.Bitmap.Assign(FPicture.Bitmap);
  Invalidate;
end;

procedure TBrushEdit.CNCtlColor(var Msg: TWMCtlColor);
begin
  inherited;  { <- Msg.Result := Brush.Handle }
  SetBkMode(Msg.ChildDC, TRANSPARENT);
end;

procedure Register;
begin
  RegisterComponents('Delphi Corner',[TBrushEdit]);
end;

end.

