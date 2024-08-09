unit ProjetoBoleto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Boleto.Implement;

type
  TfrmPrincipal = class(TForm)
    btnLerArquivo: TBitBtn;
    btnGerarPDF: TBitBtn;
    OpenDialog: TOpenDialog;
    procedure btnLerArquivoClick(Sender: TObject);
    procedure btnGerarPDFClick(Sender: TObject);
  private
    FArquivo: string;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnGerarPDFClick(Sender: TObject);
begin
  TBoleto.New
    .LerConfiguracao(FArquivo)
    .Titulo
        .Vencimento(Now)
        .DataDocumento(Now)
        .NumeroDocumento('teste')
        .EspecieDoc('0001')
        .EspecieMod('DM')
        .DataProcessamento(Now)
        .Carteira('1')
        .NossoNumero('123456')
        .NossoNumeroCorrespondente('0101')
        .ValorDocumento(1000)
        .SacadoNomeSacado('Lucas')
        .SacadoCNPJCPF('09087645322')
        .SacadoLogradouro('Rua 2')
        .SacadoNumero('221')
        .SacadoBairro('São João')
        .SacadoCidade('ubá')
        .SacadoUF('MG')
        .SacadoCEP('36507122')
        .ValorAbatimento(0)
        .LocalPagamento('Casa Principal')
        .ValorMoraJuros(5)
        .ValorDesconto(0)
        .ValorAbatimento(0)
        .DataMoraJuros(Now)
        .DataDesconto(Now)
        .TipoDesconto(0)
        .DataAbatimento(Now)
        .DataProtesto(Now)
        .PercentualMulta(1)
        .CodigoMoraJuros(3)
        .Mensagem('Boleto blablabla')
        .OcorrenciaOriginal(0)
        .Instrucao1('')
        .Instrucao2('')
        .QtdePagamentoParcial(1)
        .TipoPagamento(2)
        .PercentualMinPagamento(0)
        .PercentualMaxPagamento(0)
        .ValorMinPagamento(0)
        .ValorMaxPagamento(0)
        .Verso(False)
    .&End
    .GerarPDF
end;

procedure TfrmPrincipal.btnLerArquivoClick(Sender: TObject);
begin
  if OpenDialog.Execute then
   FArquivo := OpenDialog.FileName;
end;

end.
