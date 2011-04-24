{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit laztransctrls; 

interface

uses
  Transedt, LazarusPackageIntf;

implementation

procedure Register; 
begin
  RegisterUnit('Transedt', @Transedt.Register); 
end; 

initialization
  RegisterPackage('laztransctrls', @Register); 
end.
