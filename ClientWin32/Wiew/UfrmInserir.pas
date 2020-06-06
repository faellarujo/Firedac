unit UfrmInserir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, ULembreteDAO, ULembrete;

type
  TfrmInserir = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpdBtnSalvar: TSpeedButton;
    EdtTitulo: TEdit;
    MemoDescrição: TMemo;
    DTPDataHora: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpdBtnSalvarClick(Sender: TObject);
  private
   _UlembreteDAO : TULembreteDAO;
   _Lembrete : Tlembrete;
   procedure PreencheLembrete;

  public
    { Public declarations }
  end;

var
  frmInserir: TfrmInserir;

implementation

{$R *.dfm}


{ TfrmInserir }

procedure TfrmInserir.FormCreate(Sender: TObject);
begin
 DTPDataHora.DateTime :=  Now;
 _UlembreteDAO := TULembreteDAO.create;
 _Lembrete     := Tlembrete.create;
end;

procedure TfrmInserir.FormDestroy(Sender: TObject);
begin
 try
  if Assigned(_UlembreteDAO) then
   FreeAndNil(_UlembreteDAO);
    if Assigned(_Lembrete) then
     FreeAndNil(_Lembrete);
 except on E: Exception do
 end;
end;

procedure TfrmInserir.PreencheLembrete;
begin
 _Lembrete.Titulo    := EdtTitulo.Text;
 _Lembrete.Descricao := MemoDescrição.Text;
 _Lembrete.DataHora  := DTPDataHora.DateTime;
end;

procedure TfrmInserir.SpdBtnSalvarClick(Sender: TObject);
begin
 if EdtTitulo.Text = '' then
  ShowMessage('Prencher o campo Titulo');
 if MemoDescrição.Text = '' then
  ShowMessage('Prencher o campo Descrição');
 PreencheLembrete;
 if _UlembreteDAO.Inserir(_Lembrete) then
 begin
  ShowMessage('Registro inserido com sucesso!!!');
  close;
 end;
end;

end.

