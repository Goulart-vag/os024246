unit uRestoreBackup;

interface

uses
  sysutils, Windows;

type
  TRestoreBackup = Class
  public
    db :string;
    restoreDb:string;
    backup:string;
    gbakPath:string;
    constructor create(gbak:string);
    function doBackup(banco:string; backup:string):string;
    function doRestore(backup:string; restore:string):string;

  end;

implementation

constructor TRestoreBackup.create(gbak:string);
begin
  gbakPath := gbak;
end;

function TRestoreBackup.doBackup(banco:string; backup:string):string;
var
comando:string;
return:integer;
begin
  try
    comando:= format('%s -b -user "SYSDBA" -pas "19983101" %s %s', [gbakPath, db, backup]);
    return := winExec(PChar(comando), SW_SHOW);
    if return >= 33 then
      result := 'Bakcup realizado com sucesso'
    else
      Result:= 'Erro ao realizar backup';
  except
    Result:= 'Erro ao realizar backup';
  end;
end;

function TRestoreBackup.doRestore(backup:string; restore:string):string;
var
comando:string;
return:integer;
begin
  try
    comando:= format('%s -c -user "SYSDBA" -pas "19983101" %s %s -REP', [gbakPath, backup, restore]);
    return := winExec(PChar(comando), SW_SHOW);
    if return >= 33 then
      result := 'Bakcup realizado com sucesso'
    else
      Result:= 'Erro ao realizar backup';
  except
    Result:= 'Erro ao realizar backup';
  end;
end;

end.
