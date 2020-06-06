unit ULembrete;

interface

uses
  System.SysUtils;


 Type

 Tlembrete = class

private
    FIdlembrete : Integer;
    FTitulo: String;
    FDataHora: TDateTime;
    FDescricao: String;
    procedure SetDataHora(const Value: TDateTime);
    procedure SetDescricao(const Value: String);
    procedure SetIdlembrete(const Value: Integer);
    procedure SetTitulo(const Value: String);
  { private declarations }
protected
  { protected declarations }
public


 constructor create;
 property Idlembrete: Integer    read FIdlembrete write SetIdlembrete;
 property Titulo    : String     read FTitulo     write SetTitulo;
 property Descricao : String     read FDescricao  write SetDescricao;
 property DataHora  : TDateTime  read FDataHora   write SetDataHora;


published
  { published declarations }
end;

implementation

{ Tlembrete }

constructor Tlembrete.create;
begin

end;

procedure Tlembrete.SetDataHora(const Value: TDateTime);
begin
  FDataHora := Value;
end;

procedure Tlembrete.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure Tlembrete.SetIdlembrete(const Value: Integer);
begin
  FIdlembrete := Value;
end;

procedure Tlembrete.SetTitulo(const Value: String);
begin
  FTitulo := Value;
end;

end.
