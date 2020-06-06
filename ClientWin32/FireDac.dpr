program FireDac;

uses
  Vcl.Forms,
  UfrmConsulta in 'Wiew\UfrmConsulta.pas' {Form1},
  ULembrete in '..\Model\ULembrete.pas',
  UfrmEditar in 'Wiew\UfrmEditar.pas' {EditarLembrete},
  UfrmInserir in 'Wiew\UfrmInserir.pas' {frmInserir},
  UBaseDAO in '..\DAO\UBaseDAO.pas',
  Udm in 'Udm.pas' {DM: TDataModule},
  ULembreteDAO in '..\Model\ULembreteDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TEditarLembrete, EditarLembrete);
  Application.CreateForm(TfrmInserir, frmInserir);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
