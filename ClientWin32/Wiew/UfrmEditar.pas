unit UfrmEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TEditarLembrete = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpdBtnSalvar: TSpeedButton;
    SpdButtonDeletar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditarLembrete: TEditarLembrete;

implementation

{$R *.dfm}

end.
