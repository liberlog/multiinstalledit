unit SkinButton;

interface

uses
  LCLType, Graphics;

type
  TSkinButton = record
    pic: TPicture;
    picMOver: TPicture;
    gifMOver: TGifImage;
    picMDown: TPicture;
    Status: integer;
  end;

  procedure SkinButtonInit(var sbtn: TSkinButton);
  procedure SkinButtonFree(var sbtn: TSkinButton);

implementation

procedure SkinButtonInit(var sbtn: TSkinButton);
begin
  sbtn.pic := TPicture.Create;
  sbtn.picMOver := TPicture.Create;
  sbtn.picMDown := TPicture.Create;
  sbtn.Status := 0; // 0 = normal
end;

procedure SkinButtonFree(var sbtn: TSkinButton);
begin
  sbtn.pic.Free;
  sbtn.picMOver.Free;
  sbtn.picMDown.Free;
  sbtn.gifMOver.Free;
end;

end.
