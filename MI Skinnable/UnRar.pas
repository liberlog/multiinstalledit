// Delphi interface unit for UnRAR.dll
// Translated from unrar.h
// Use Delphi 2.0 or higher to compile this module
//
// Ported to Delphi by Eugene Kotlyarov, fidonet: 2:5058/26.9 ek@oris.ru
// Fixed version by Alexey Torgashin <alextp@mail.ru>, 2:5020/604.24@fidonet
//
// Revisions:
// Aug 2001 - changed call convention for TChangeVolProc and TProcessDataProc
//          - added RARGetDllVersion function, see comment below
//
// Jan 2002 - Added RARSetCallback
//
// Jan 2002 - Changed to load dll *dynamic*, by Nikolaj Lynge Olsson <nikse@e-mail.dk>
//
// Feb 2004 - Added RARHeaderDataEx, RAROpenArchiveDataEx

unit UnRAR;

interface

uses Windows;

//////////////////////////////////////////////////////////////////////

const
  ERAR_END_ARCHIVE    = 10;
  ERAR_NO_MEMORY      = 11;
  ERAR_BAD_DATA       = 12;
  ERAR_BAD_ARCHIVE    = 13;
  ERAR_UNKNOWN_FORMAT = 14;
  ERAR_EOPEN          = 15;
  ERAR_ECREATE        = 16;
  ERAR_ECLOSE         = 17;
  ERAR_EREAD          = 18;
  ERAR_EWRITE         = 19;
  ERAR_SMALL_BUF      = 20;
  ERAR_UNKNOWN        = 21;

  RAR_OM_LIST         =  0;
  RAR_OM_EXTRACT      =  1;

  RAR_SKIP            =  0;
  RAR_TEST            =  1;
  RAR_EXTRACT         =  2;

  RAR_VOL_ASK         =  0;
  RAR_VOL_NOTIFY      =  1;

  RAR_DLL_VERSION     =  3;

  UCM_CHANGEVOLUME    =  0;
  UCM_PROCESSDATA     =  1;
  UCM_NEEDPASSWORD    =  2;

//////////////////////////////////////////////////////////////////////

type
  TRARHeaderData = packed record
    ArcName: packed array[0..Pred(260)] of Char;
    FileName: packed array[0..Pred(260)] of Char;
    Flags: UINT;
    PackSize: UINT;
    UnpSize: UINT;
    HostOS: UINT;
    FileCRC: UINT;
    FileTime: UINT;
    UnpVer: UINT;
    Method: UINT;
    FileAttr: UINT;
    CmtBuf: PChar;
    CmtBufSize: UINT;
    CmtSize: UINT;
    CmtState: UINT;
  end;

  TRARHeaderDataEx = packed record
    ArcName: packed array [0..1023] of char;
    ArcNameW: packed array [0..1023] of WideChar;
    FileName: packed array [0..1023] of char;
    FileNameW: packed array [0..1023] of WideChar;
    Flags: UINT;
    PackSize: UINT;
    PackSizeHigh: UINT;
    UnpSize: UINT;
    UnpSizeHigh: UINT;
    HostOS: UINT;
    FileCRC: UINT;
    FileTime: UINT;
    UnpVer: UINT;
    Method: UINT;
    FileAttr: UINT;
    CmtBuf: PChar;
    CmtBufSize: UINT;
    CmtSize: UINT;
    CmtState: UINT;
    Reserved: packed array [0..1023] of UINT;
  end;

  TRAROpenArchiveData = packed record
    ArcName: PChar;
    OpenMode: UINT;
    OpenResult: UINT;
    CmtBuf: PChar;
    CmtBufSize: UINT;
    CmtSize: UINT;
    CmtState: UINT;
  end;

  TRAROpenArchiveDataEx = packed record
    ArcName: PChar;
    ArcNameW: PWideChar;
    OpenMode: UINT;
    OpenResult: UINT;
    CmtBuf: PChar;
    CmtBufSize: UINT;
    CmtSize: UINT;
    CmtState: UINT;
    Flags: UINT;
    Reserved: packed array [0..31] of UINT;
  end;

  TUnrarCallback = function (Msg: UINT; UserData, P1, P2: Integer) :Integer; stdcall;

  TRAROpenArchive = function (var ArchiveData: TRAROpenArchiveData): THandle; stdcall;
  TRAROpenARchiveEx = function (var ArchiveData: TRAROpenArchiveDataEx): THandle; stdcall;
  TRARCloseArchive = function (hArcData: THandle): Integer; stdcall;
  TRARReadHeader = function (hArcData: THandle; var HeaderData: TRARHeaderData): Integer; stdcall;
  TRARReadHeaderEx = function (hArcData: THandle; var HeaderData: TRARHeaderDataEx): Integer; stdcall;
  TRARProcessFile = function (hArcData: THandle; Operation: Integer; DestPath, DestName: PChar): Integer;  stdcall;
  TRARSetCallback = procedure (hArcData: THandle; UnrarCallback: TUnrarCallback; UserData:Integer); stdcall;
  TRARSetPassword = procedure (hArcData: THandle; Password: PChar); stdcall;
  TRARGetDllVersion = function: integer; stdcall;


// Wrapper for DLL's function - old unrar.dll doesn't export RARGetDllVersion
// Returns: -1 = DLL not found; 0 = old ver. (C-style callbacks); >0 = new ver.
function RARDllGetVersion: integer;

// Dynamic loading of DLL
function UnrarDllLoad(const dllfilename : string) : Boolean;

procedure UnrarDllUnload;

//////////////////////////////////////////////////////////////////////

var
  UnrarDllHandle        : THandle;
  RAROpenArchive        : TRAROpenArchive;
  RAROpenArchiveEx      : TRAROpenArchiveEx;
  RARCloseArchive       : TRARCloseArchive;
  RARReadHeader         : TRARReadHeader;
  RARReadHeaderEx       : TRARReadHeaderEx;
  RARProcessFile        : TRARProcessFile;
  RARSetPassword        : TRARSetPassword;
  RARSetCallback        : TRARSetCallback;

//////////////////////////////////////////////////////////////////////

implementation

var
  RARGetDllVersion      : TRARGetDllVersion;

//////////////////////////////////////////////////////////////////////

function RARDllGetVersion: integer;
begin
  if @RARGetDllVersion=nil then
    Result:= 0
  else
    Result:= RARGetDllVersion;
end;

//////////////////////////////////////////////////////////////////////

// Return: True = success
function UnrarDllLoad(const dllfilename : string) : Boolean;
var
  r : Boolean;
begin
  r:=False;
  try
    UnrarDllHandle := LoadLibrary(PChar(dllfilename));
    if UnrarDllHandle <> 0 then
    begin
      @RAROpenArchive     := GetProcAddress(UnrarDllHandle, 'RAROpenArchive');
      @RAROpenArchiveEx   := GetProcAddress(UnrarDllHandle, 'RAROpenArchiveEx');
      @RARCloseArchive    := GetProcAddress(UnrarDllHandle, 'RARCloseArchive');
      @RARReadHeader      := GetProcAddress(UnrarDllHandle, 'RARReadHeader');
      @RARReadHeaderEx    := GetProcAddress(UnrarDllHandle, 'RARReadHeaderEx');
      @RARProcessFile     := GetProcAddress(UnrarDllHandle, 'RARProcessFile');
      @RARSetPassword     := GetProcAddress(UnrarDllHandle, 'RARSetPassword');
      @RARSetCallback     := GetProcAddress(UnrarDllHandle, 'RARSetCallback');
      @RARGetDllVersion   := GetProcAddress(UnrarDllHandle, 'RARGetDllVersion');
      if (@RAROpenArchive = nil) or (@RARCloseArchive = nil) or
         (@RARReadHeader = nil) or (@RARProcessFile = nil) or
         (@RARSetPassword = nil) or (@RARSetCallback = nil) or
         (@RAROpenArchiveEx = nil) or (@RARReadHeaderEx = nil) then
        FreeLibrary(UnrarDllHandle)
      else
        r:=True;
    end;
  except
  end;
  Result:=r;
end;

//////////////////////////////////////////////////////////////////////

procedure UnrarDllUnload;
begin
  if UnrarDllHandle <> 0 then
    FreeLibrary(UnrarDllHandle);
end;

//////////////////////////////////////////////////////////////////////

end.
