unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Buttons, classe.Abastecimento;

type
  TfrmPrincipal = class(TForm)
    Panel6: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    btnAbastecimento: TSpeedButton;
    btnRelatorios: TSpeedButton;
    Label5: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    procedure btnAbastecimentoClick(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uCadAbastecimento, uDM, uRelatorio;

procedure TfrmPrincipal.btnAbastecimentoClick(Sender: TObject);
begin
  //Chama Tela de Cadastro de Abastecimento

  try
    frmAbastecimento := TfrmAbastecimento.Create(self);
    frmAbastecimento.ShowModal;
  finally
    frmAbastecimento.Free;
  end;
end;

procedure TfrmPrincipal.btnRelatoriosClick(Sender: TObject);
begin
  //Chama tela de Relatórios
  try
    frmRelatorio := TfrmRelatorio.Create(self);
    frmRelatorio.ShowModal;
  finally
    frmRelatorio.Free;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dm.Abastecimento := TAbastecimento.Create(dm.FDConnection1);
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
       close;
end;

end.
