unit SearchU;

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
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VirtualTrees, ExtCtrls, Transedt;

type
  TfrmSearch = class(TForm)
    VSTree: TVirtualStringTree;
    imgSearchBG: TImage;
    lblSearchTitle: TLabel;
    imgSearchSearch: TImage;
    imgDone: TImage;
    ChkImg: TTimer;
    ImageChecked: TImage;
    imgTitlesOnly: TImage;
    lblTitlesOnly: TLabel;
    EditSearchText: TTransEdit;
    procedure CreateCheckBox;
    procedure LoadSkin;
    procedure FormCreate(Sender: TObject);
    procedure AddSearchFoundNode(Node: PVirtualNode);
    procedure VSTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure VSTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure imgSearchBGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditSearchTextKeyPress(Sender: TObject; var Key: Char);
    procedure VSTreeGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VSTreePaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure imgDoneClick(Sender: TObject);
    procedure ChkImgTimer(Sender: TObject);
    procedure imgSearchSearchClick(Sender: TObject);
    procedure imgSearchSearchMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgSearchSearchMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgDoneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgDoneMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure VSTreeKeyPress(Sender: TObject; var Key: Char);
    procedure TitlesOnlyClick;
    procedure imgTitlesOnlyMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageCheckedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblTitlesOnlyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure VSTreeDblClick(Sender: TObject);
  private
    { Private declarations }
    bTitlesOnly: Boolean;
  public
    { Public declarations }
  end;

type
  VTreeDataSearch = record
    RealNode: PVirtualNode;
  end;
  PTreeDataSearch = ^VTreeDataSearch; // Pointer to VTreeDataSearch

////////////////////////////////////////////////////////////////////////

var
  frmSearch: TfrmSearch;

////////////////////////////////////////////////////////////////////////

implementation

uses
  GoWinU, SkinButton;

var
  btnSearch: TSkinButton;
  btnDone: TSkinButton;

////////////////////////////////////////////////////////////////////////

function AdjustColor(color: TColor; adjust: integer): TColor;
var
  r, g, b: integer;
begin
  r := color and $000000FF;
  r := r + adjust;
  if r < 0 then r := 0;
  if r > 255 then r := 255;

  g := (color and $0000FF00) div 256;
  g := g + adjust;
  if g < 0 then g := 0;
  if g > 255 then g := 255;

  b := (color and $00FF0000) div 256 div 256;
  b := b + adjust;
  if b < 0 then b := 0;
  if b > 255 then b := 255;

  Result := RGB(r, g, b);
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.CreateCheckBox;
var
  x, y: integer;
begin
  // Create checkbox adjusted to background
  // copy rect from background to dsktop image
  for y := 0 to 24 do
    for x := 0 to 24 do
      imgTitlesOnly.Canvas.Pixels[x, y] :=
        imgSearchBg.Canvas.Pixels[imgTitlesOnly.Left + x,
        imgTitlesOnly.Top + y];


  // top checbox dark color
  y := 6;
  for x := 9 to 23 do
    imgTitlesOnly.Canvas.Pixels[x, y] :=
      AdjustColor(imgSearchBG.Canvas.Pixels[imgTitlesOnly.Left + x,
      imgTitlesOnly.Top + y], - 20);
  Inc(y);
  for x := 10 to 23 do
    imgTitlesOnly.Canvas.Pixels[x, y] :=
      AdjustColor(imgSearchBG.Canvas.Pixels[imgTitlesOnly.Left + x,
      imgTitlesOnly.Top + y], - 40);

  // middle checbox - background color
  for y := 9 to 19 do
    for x := 11 to 21 do
      imgTitlesOnly.Canvas.Pixels[x, y] := frmMain.VSTree.Color;

  // buttom checbox dark color
  y := 20;
  for x := 10 to 22 do
    imgTitlesOnly.Canvas.Pixels[x, y] :=
      AdjustColor(imgSearchBG.Canvas.Pixels[imgTitlesOnly.Left + x,
      imgTitlesOnly.Top + y], 40);
  Inc(y);
  for x := 9 to 23 do
    imgTitlesOnly.Canvas.Pixels[x, y] :=
      AdjustColor(imgSearchBG.Canvas.Pixels[imgTitlesOnly.Left + x,
      imgTitlesOnly.Top + y], 20);

  // left checbox dark color
  x := 9;
  for y := 6 to 21 do
    imgTitlesOnly.Canvas.Pixels[x, y] :=
      AdjustColor(imgSearchBG.Canvas.Pixels[imgTitlesOnly.Left + x,
      imgTitlesOnly.Top + y], - 20);
  Inc(x);
  for y := 7 to 20 do
    imgTitlesOnly.Canvas.Pixels[x, y] :=
      AdjustColor(imgSearchBG.Canvas.Pixels[imgTitlesOnly.Left + x,
      imgTitlesOnly.Top + y], - 40);

  // right checbox dark color
  x := 22;
  for y := 7 to 20 do
    imgTitlesOnly.Canvas.Pixels[x, y] :=
      AdjustColor(imgSearchBG.Canvas.Pixels[imgTitlesOnly.Left + x,
      imgTitlesOnly.Top + y], 40);
  Inc(x);
  for y := 6 to 21 do
    imgTitlesOnly.Canvas.Pixels[x, y] :=
      AdjustColor(imgSearchBG.Canvas.Pixels[imgTitlesOnly.Left + x,
      imgTitlesOnly.Top + y], 20);

  // set background color for checkbox tick
  for x := 0 to ImageChecked.Width do
    for y := 0 to ImageChecked.Height do
      if ImageChecked.Picture.Bitmap.Canvas.Pixels[x, y] = 16777215 then
        ImageChecked.Picture.Bitmap.Canvas.Pixels[x, y] := frmMain.VSTree.Color
  else
    ImageChecked.Picture.Bitmap.Canvas.Pixels[x, y] :=
      frmMain.lblMessage.Font.Color;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.LoadSkin;
begin
  if (not frmMain.ExistsSkinImage('search')) or
     (frmMain.SearchPosSize.iSearchTextWidth +
     frmMain.SearchPosSize.iSearchTextHeight = 0) then
    Exit;

  imgDone.Transparent := ButtonsTransparent;
  imgSearchSearch.Transparent := ButtonsTransparent;

  with frmMain.SearchPosSize do
  begin
    try
      lblSearchTitle.Left := iTitleX;
      lblSearchTitle.Top := iTitleY;

      EditSearchText.Left:=iSearchTextX;
      EditSearchText.Top:=iSearchTextY;
      EditSearchText.Width:=iSearchTextWidth;
      EditSearchText.Height:=iSearchTextHeight;

      VSTree.Left:=iSearchResultsX;
      VSTree.Top:=iSearchResultsY;
      VSTree.Width:=iSearchResultsWidth;
      VSTree.Height:=iSearchResultsHeight;

      lblTitlesOnly.Left := iTitlesOnlyX + 17;
      imgTitlesOnly.Left := iTitlesOnlyX - 12;
      ImageChecked.Left := iTitlesOnlyX;
      lblTitlesOnly.Top := iTitlesOnlyY;
      imgTitlesOnly.Top := iTitlesOnlyY - 6;
      ImageChecked.Top := iTitlesOnlyY + 5;

      imgSearchSearch.Left := iSearchX;
      imgSearchSearch.Top := iSearchY;

      imgDone.Left := iDoneX;
      imgDone.Top := iDoneY;
    except
    end;
  end;


  // load background image
  {$IFNDEF FPC}
  frmMain.LoadSkinImage(imgSearchBg.Picture, 'Search', True);
  {$ENDIF}

  // Let background image decide form size
  frmSearch.Width := imgSearchBg.Width;
  frmSearch.Height := imgSearchBg.Height;

  // Install path edit transparent
  EditSearchText.BackBmp.Bitmap.Width := EditSearchText.Width;
  EditSearchText.BackBmp.Bitmap.Height := EditSearchText.Height;
  BitBlt(EditSearchText.BackBmp.Bitmap.Canvas.Handle,  // Destination
         0, 0,                                         // X, Y (target pos)
         EditSearchText.Width, EditSearchText.Height,  // Size to copy
         imgSearchBG.Canvas.handle,                      // Source
         EditSearchText.Left, EditSearchText.Top,      // X, Y (source pos)
         SrcCopy);                                     // plain copy


  // Make background transparent
  frmMain.MakeTransparent(frmSearch, imgSearchBg);

  // Draw title
  lblSearchTitle.Font:=frmMain.lblMessage.Font;
  lblSearchTitle.Font.Color:=frmMain.lblTitle.Font.Color;
  lblSearchTitle.Font.Size := frmMain.othertitlesfontsize;
  lblSearchTitle.Caption:=LanguageGo.sSearchTitle;
  frmMain.DrawAALabel(imgSearchBg.Picture.Bitmap, lblSearchTitle, '', '', 0);

  lblTitlesOnly.Caption:=LanguageGo.sSearchTitlesOnly;

  EditSearchText.Font:=frmMain.lblMessage.Font;
  EditSearchText.Color:=frmMain.VSTree.Color;

  // set selected bg color - win highlight color
  EditSearchText.SelectionBrush.Color := GetSysColor(COLOR_HIGHLIGHT);


  VSTree.DefaultNodeHeight:=frmMain.VSTree.DefaultNodeHeight;
  VSTree.Images:=frmMain.VSTree.Images;
  VSTree.Color:=frmMain.lblMsgInfoBack.Color;
  VSTree.Font:=frmMain.lblMessage.Font;
  VSTree.TreeOptions:=frmMain.VSTree.TreeOptions;
  VSTree.TreeOptions.PaintOptions :=
    frmMain.VSTree.TreeOptions.PaintOptions - [toShowTreeLines];
  VSTree.TreeOptions.PaintOptions :=
    frmMain.VSTree.TreeOptions.PaintOptions - [toShowRoot];

  if toShowBackground in VSTree.TreeOptions.PaintOptions then
  begin // copy background of treeview from imgMain
    VSTree.Background.Bitmap.Width := VSTree.Width;
    VSTree.Background.Bitmap.Height := VSTree.Height;
    BitBlt(VSTree.Background.Bitmap.Canvas.Handle,  // Destination
      0, 0,                                    // X, Y (target pos)
      VSTree.Width, VSTree.Height,             // Size to copy
      imgSearchBg.Canvas.handle,                   // Source
      VSTree.Left, VSTree.Top,                 // X, Y (source pos)
      SrcCopy);                                // plain copy
  end;

  // init button images
  SkinButtonInit(btnSearch);
  SkinButtonInit(btnDone);

  // load Search Button images
  if frmMain.ExistsSkinImage('SearchSearch') then
    frmMain.LoadSkinButton(imgSearchSearch, btnSearch, 'SearchSearch', True);

  // load Done Button images
  if frmMain.ExistsSkinImage('SearchDone') then
    frmMain.LoadSkinButton(imgDone, btnDone, 'SearchDone', True);

  CreateCheckBox;
  lblTitlesOnly.Font:=VSTree.Font;
  lblTitlesOnly.Font.Color:=frmMain.lblMessage.Font.Color;
  lblTitlesOnly.Font.Size:=9;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.FormCreate(Sender: TObject);
begin
  bTitlesOnly:=True;

  VSTree.NodeDataSize := SizeOf(VTreeDataSearch);

  LoadSkin;

  EditSearchText.Text := '';
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.VSTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  Data: PTreeData;
  DataSearch: PTreeDataSearch;
begin
  DataSearch := Sender.GetNodeData(Node);
  if DataSearch.RealNode <> nil then
  begin
    Data:=frmMain.VSTree.GetNodeData(DataSearch.RealNode);
    if Data <> nil then
      CellText := Data.wsText;
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.AddSearchFoundNode(Node: PVirtualNode);
var
  NodeSearch: PVirtualNode;
  NodeDataSearch: PTreeDataSearch;
begin
  Application.ProcessMessages;
  NodeSearch := VSTree.AddChild(nil);
  NodeDataSearch:=VSTree.GetNodeData(NodeSearch);
  NodeDataSearch.RealNode:=Node;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.VSTreeChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  NodeDataSearch: PTreeDataSearch;
begin
  NodeDataSearch := Sender.GetNodeData(Node);
  if NodeDataSearch <> nil then
  begin
    if NodeDataSearch.RealNode <> nil then
    begin
      frmMain.VSTree.Selected[NodeDataSearch.RealNode] := True;
      frmMain.VSTree.ScrollIntoView(NodeDataSearch.RealNode, False);
    end;
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.imgSearchBGMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform({$IFDEF FPC}LM_SysCommand{$ELSE}WM_SysCommand{$ENDIF}, $F012, 0);
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.EditSearchTextKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    imgSearchSearchClick(Sender)
  else if Key=#27 then
    imgDoneClick(Sender);
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.VSTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
var
  DataSearch: PTreeDataSearch;
  Data: PTreeData;
begin
  DataSearch := VSTree.GetNodeData(Node);
  if DataSearch <> nil then
  begin
    if DataSearch.RealNode <> nil then
    begin
      Data := VSTree.GetNodeData(DataSearch.RealNode);
      if Data <> nil then
        ImageIndex := Data.iIcon;
    end;
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.VSTreePaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
begin
  if (Node = VSTree.HotNode) and (toHotTrack in VSTree.TreeOptions.PaintOptions) then
    TargetCanvas.Font.Color := UrlHottrackColor; // mouse over color  (hottrack)
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.imgDoneClick(Sender: TObject);
begin
  ModalResult:=1;
  VSTree.Clear;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.ChkImgTimer(Sender: TObject);
var
  x, y : integer;
  blnSearch: boolean;
  blnDone: boolean;
begin
// Close/Minimize Status
// 0 = normal
// 1 = mouse over
// 2 = down

  blnSearch:=False;
  blnDone:=False;

  x:=Mouse.CursorPos.x - frmSearch.Left;
  y:=Mouse.CursorPos.y - frmSearch.Top;;

  if frmMain.MouseOverImage(btnSearch, imgSearchSearch, x, y) then
    blnSearch:=True
  else if frmMain.MouseOverImage(btnDone, imgDone, x, y) then
    blnDone:=True;

  if (not blnSearch) and (btnSearch.Status <> 0) and (btnSearch.Status <> 2) then
  begin
    imgSearchSearch.Picture.Assign(btnSearch.pic);
    btnSearch.Status:=0; // 0 = normal
  end;
  if (not blnDone) and (btnDone.Status <> 0) and (btnDone.Status <> 2) then
  begin
    imgDone.Picture.Assign(btnDone.pic);
    btnDone.Status:=0; // 0 = normal
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.imgSearchSearchClick(Sender: TObject);
var
  Node: PVirtualNode;
  NodeData: PTreeData;
  strSS: string; // Search String
begin
  Screen.Cursor := crHourGlass;
  strSS:=AnsiLowerCase(EditSearchText.Text);
  VSTree.Clear;
  VSTree.BeginUpdate;
  Node:=frmMain.VSTree.GetFirst;
  while Node <> nil do
  begin
    NodeData:=frmMain.VSTree.GetNodeData(Node);
    if Pos(strSS, AnsiLowerCase(NodeData.wsText)) > 0 then
      AddSearchFoundNode(Node)
    else if not bTitlesOnly then
    begin
      if bShowCustom1 and (Pos(strSS, AnsiLowerCase(NodeData.sCustomField1)) > 0) then
        AddSearchFoundNode(Node)
      else if bShowCustom2 and (Pos(strSS, AnsiLowerCase(NodeData.sCustomField2)) > 0) then
        AddSearchFoundNode(Node)
      else if bShowCustom3 and (Pos(strSS, AnsiLowerCase(NodeData.sCustomField3)) > 0) then
        AddSearchFoundNode(Node)
      else if bShowCustom4 and (Pos(strSS, AnsiLowerCase(NodeData.sCustomField4)) > 0) then
        AddSearchFoundNode(Node)
      else if bShowCustom5 and (Pos(strSS, AnsiLowerCase(NodeData.sCustomField5)) > 0) then
        AddSearchFoundNode(Node)
      else if Pos(strSS, AnsiLowerCase(NodeData.sDescr)) > 0 then
        AddSearchFoundNode(Node)
      else if Pos(strSS, AnsiLowerCase(NodeData.sNote)) > 0 then
        AddSearchFoundNode(Node)
    end;
    Node:=frmMain.VSTree.GetNext(Node);
  end;
  VSTree.EndUpdate;
  Screen.Cursor := crDefault;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.imgSearchSearchMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    imgSearchSearch.Picture.Assign(btnSearch.picMDown);
    btnSearch.Status := 2; // 2 = Mouse Down
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.imgSearchSearchMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnSearch.Status := 3; // let timer deceide
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.imgDoneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    imgDone.Picture.Assign(btnDone.picMDown);
    btnDone.Status := 2; // 2 = Mouse Down
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.imgDoneMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  btnDone.Status := 3; // let timer deceide
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.VSTreeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then
    imgDoneClick(Sender);
end;

////////////////////////////////////////////////////////////////////////
procedure TfrmSearch.TitlesOnlyClick;
begin
  bTitlesOnly := not bTitlesOnly; // reverse setting
  ImageChecked.Visible := bTitlesOnly;
  frmSearch.Refresh;
end; // TitlesOnlyClick

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.imgTitlesOnlyMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    TitlesOnlyClick;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.ImageCheckedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    TitlesOnlyClick;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.lblTitlesOnlyMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    TitlesOnlyClick;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmSearch.VSTreeDblClick(Sender: TObject);
begin
  imgDoneClick(Sender);
end;

////////////////////////////////////////////////////////////////////////

end.

////////////////////////////////////////////////////////////////////////
