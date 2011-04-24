unit libraries; 

{$mode delphi}

interface

uses
  Classes, SysUtils;

{$IFDEF WINDOWS}
function dlopen ( lpLibFileName : PAnsiChar) : HMODULE; stdcall; external 'kernel32.dll' name 'LoadLibraryA';
function dlclose( hLibModule : HMODULE ) : Boolean; stdcall; external 'kernel32.dll' name 'FreeLibrary';
function dlsym  ( hModule : HMODULE; lpProcName : PAnsiChar) : Pointer; stdcall; external 'kernel32.dll' name 'GetProcAddress';

function MessageBoxA( hWnd : LongWord; lpText, lpCaption : PAnsiChar; uType : LongWord) : Integer; stdcall; external 'user32.dll';
{$ELSE}
function dlopen ( Name : PChar; Flags : longint) : Pointer; cdecl; external 'dl';
function dlclose( Lib : Pointer) : Longint; cdecl; external 'dl';
function dlsym  ( Lib : Pointer; Name : Pchar) : Pointer; cdecl; external 'dl';
{$ENDIF}

implementation

end.

