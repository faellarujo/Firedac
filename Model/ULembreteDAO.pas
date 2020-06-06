unit ULembreteDAO;

interface

uses ULembrete, classes, DB, SysUtils, generics.defaults,FireDAC.Stan.Intf, FireDAC.Stan.Option,
FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.VCLUI.Login, FireDAC.Comp.UI,
FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.IBBase,
generics.collections, Dialogs, Udm, UBaseDAO;


Type

  TULembreteDAO = class(TBaseDAO) // Herança

  private
    ListaDeLembretes : TObjectList<Tlembrete>;



  public
    constructor create;
    destructor Destroy; override;
    function Inserir(plembrete : Tlembrete): boolean;
    function Alterar(plembrete : Tlembrete): boolean;
    function Deletar(plembrete : Tlembrete): boolean;
    function ListarPorTitulo_Descricao(pConteudo : String) : TObjectList<Tlembrete>;
    procedure PreencherColecao(Ds : TFDQuery);
  published
    { published declarations }
  end;

implementation

{ TULembreteDAO }

function TULembreteDAO.Alterar(plembrete: Tlembrete): boolean;
 var
  sql : string;
begin
  sql := ' Update lembrete ' +
         ' Set Titulo    =    '  + Quotedstr(plembrete.Titulo)    + ' , ' +
         '     Descricao =    '  + Quotedstr(plembrete.Descricao) + ' , ' +
         '     DataHora  =     ' + Quotedstr(FormatDateTime('yyy-mm-dd hh:mm', plembrete.DataHora)) + ' , ' +
         ' where IDLEMBRETE = '  + IntToStr(plembrete.Idlembrete);

  result := ExecutarComando(sql) > 0;
end;

constructor TULembreteDAO.create;
begin
 Inherited;
 ListaDeLembretes := TObjectList<Tlembrete>.create;
end;

function TULembreteDAO.Deletar(plembrete: Tlembrete): boolean;
 var
  sql : String;
begin
  sql := ' Delete         ' +
         ' from lembrete  ' +
         ' where IDLEMBRETE = '  + IntToStr(plembrete.Idlembrete);
  Result := ExecutarComando(sql) > 0;
  end;

destructor TULembreteDAO.Destroy;
begin
  inherited;
  try
   if Assigned(ListaDeLembretes) then
    begin
      FreeAndNil(ListaDeLembretes);
    end;
  except on E: Exception do
  raise Exception.Create('Error Message');
  end;


end;

function TULembreteDAO.Inserir(plembrete: Tlembrete): boolean;
 var
  sql : string;

begin
  sql := ' INSERT INTO lembrete (Titulo,DESCRICAO,DataHora) '+
         ' VALUES ( '+
           Quotedstr(plembrete.Titulo)    + ',' +
           Quotedstr(plembrete.Descricao) + ',' +
           Quotedstr(FormatDateTime('dd.MM.yyyy hh:MM:ss', plembrete.DataHora))  + ')';
  result := ExecutarComando(sql) > 0;
end;

function TULembreteDAO.ListarPorTitulo_Descricao(
  pConteudo: String): TObjectList<Tlembrete>;
var
   sql : String;

begin
 result := nil;
 sql := ' select lembrete.idlembrete,'+
        ' lembrete.titulo,'+
        ' lembrete.descricao,'+
        ' lembrete.datahora'+
        ' from lembrete ';

 if pConteudo = '' then
  begin
   sql := sql + 'where lembrete.datahora >= '
              + QuotedStr(FormatDateTime('dd.MM.yyyy', Now));
  end
  else
   begin
    Sql := Sql + '  WHERE lembrete.titulo    like '
             + QuotedStr('%'+pConteudo+'%')+
          '     OR lembrete.descricao like ' + QuotedStr('%'+pConteudo+'%');
   end;

 Sql := Sql + '  ORDER BY lembrete.datahora     ';
 _FQry := RetornaDataSete(sql);

 if not (_FQry.IsEmpty) then
  begin
    PreencherColecao(_FQry);
    result := ListaDeLembretes;
  end;

end;
procedure TULembreteDAO.PreencherColecao(Ds : TFDQuery);
var
    I: Integer;
   begin
    I := 0;
    ListaDeLembretes.Clear;
    while not Ds.eof do
     begin
      ListaDeLembretes.Add(TLembrete.Create);
    ListaDeLembretes[I].IDLembrete :=
          Ds.FieldByName('IDLembrete').AsInteger;
    ListaDeLembretes[I].Titulo     :=
          Ds.FieldByName('Titulo'    ).AsString;
    ListaDeLembretes[I].Descricao  :=
          Ds.FieldByName('Descricao' ).AsString;
    ListaDeLembretes[I].DataHora   :=
          Ds.FieldByName('DataHora'  ).AsDateTime;
    Ds.Next;
     I := I + 1;
   end;
 end;
end.
