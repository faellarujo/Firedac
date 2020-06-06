unit UBaseDAO;

interface

uses

 Firedac.Comp.Client, System.SysUtils, Udm, Data.DB, Vcl.Dialogs,
 FireDAC.Stan.Intf, FireDAC.Stan.Option,
 FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
 FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
 FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
 FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.VCLUI.Login, FireDAC.Comp.UI,
 FireDAC.Comp.DataSet, FireDAC.Phys.IBBase,
 System.Classes;

 type

 TBaseDAO = class(Tobject)

 private
  { private declarations }
 protected
  _FQry : TFDQuery;
 public
  Constructor create;
  Destructor Destroy; Override;
  FUNCTION RetornaDataSete (pSQL : String ) : TFDQuery;
  FUNCTION ExecutarComando (pSQL : String ) : Integer;

published
  { published declarations }
end;


implementation

Constructor TBaseDAO.create;
begin
 Inherited Create;
 _FQry := TFDQuery.Create(nil);
 _FQry.Connection := DM.FDConnection1;

end;

Destructor TBaseDAO.Destroy;
begin
 try
   if Assigned(_FQry) then
    begin

    end;
 except
  on E: Exception do
   raise Exception.Create('Error Message');
 end;
end;

FUNCTION TBaseDAO.ExecutarComando (pSQL : String ) : Integer;
begin
 try
  Dm.FDConnection1.StartTransaction;  // Inicia a transa��o do DB
  _FQry.SQL.Text :=  pSQL;            // Passa a String SQL que veio como parametro
  _FQry.ExecSQL;                      // executa o SQL
  Result := _FQry.RowsAffected;       // Retorna o numero de Linhas afetadas
  dm.FDConnection1.Commit;            // Comita a transa��o do DB
 except on E: Exception do
  raise Exception.Create('Error Message');
 end;

 end;

FUNCTION TBaseDAO.RetornaDataSete (pSQL : String ) : TFDQuery;
begin
 _FQry.SQL.Text := pSQL;
 _FQry.Active   := True;
 Result         := _FQry;
end;
end.
