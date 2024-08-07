unit Boleto.Implement;

interface

uses
  Boleto.Interfaces, ACBrBase, ACBrUtil, ACBrMail, ACBrUtil.FilesIO,
  ACBrBoletoConversao, ACBrBoletoRetorno, ACBrBoletoFPDF, ComCtrls,
  ACBrBoletoFCFortesFr, ACBrBoletoFCFR, ACBrBoleto, Boleto.Classes;

type
  TBoleto = class(TInterfacedObject, IBoleto)
  private
    FACBrBoleto: TACBrBoleto;
    FACBrMail: TACBrMail;
    FACBrBoletoFPDF: TACBrBoletoFPDF;
    FTitulo: ITitulo<IBoleto>;
    procedure IncluirBoleto;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: IBoleto;
    function LerConfiguracao(Value: string): IBoleto;
    function Titulo: ITitulo<IBoleto>;
    procedure GerarPDF;

  end;

implementation

{ TBoleto }

constructor TBoleto.Create;
begin
  FACBrBoleto := TACBrBoleto.Create(nil);
  FACBrMail := TACBrMail.Create(FACBrBoleto);
  FACBrBoletoFPDF := TACBrBoletoFPDF.Create(FACBrBoleto);
  FACBrBoleto.ACBrBoletoFC := TACBrBoletoFCClass(FACBrBoletoFPDF);
end;

destructor TBoleto.Destroy;
begin
  FACBrBoleto.Free;
  inherited;
end;

procedure TBoleto.GerarPDF;
begin

  FACBrBoleto.GerarPDF;
end;

procedure TBoleto.IncluirBoleto;
begin
   var Titulo := FACBrBoleto.CriarTituloNaLista;

  Titulo.Vencimento        := FTitulo.Vencimento;
  Titulo.DataDocumento     := FTitulo.DataDocumento;
  Titulo.NumeroDocumento   := FTitulo.NumeroDocumento;
  Titulo.EspecieDoc        := FTitulo.EspecieDoc;
  Titulo.EspecieMod        := FTitulo.EspecieMod;
//  Titulo.Aceite := atSim
  Titulo.Aceite := atNao;
  Titulo.DataProcessamento := FTitulo.DataProcessamento;
  Titulo.Carteira          := edtCarteira.Text;
  Titulo.NossoNumero       := edtNossoNro.Text;
  Titulo.NossoNumeroCorrespondente := ''; //utilizado na Consulta, Alteração e Baixa da API Inter com QrCode
  Titulo.ValorDocumento    := StrToCurr(edtValorDoc.Text);
  Titulo.Sacado.NomeSacado := edtNome.Text;
  Titulo.Sacado.CNPJCPF    := OnlyNumber(edtCPFCNPJ.Text);
  Titulo.Sacado.Logradouro := edtEndereco.Text;
  Titulo.Sacado.Numero     := edtNumero.Text;
  Titulo.Sacado.Bairro     := edtBairro.Text;
  Titulo.Sacado.Cidade     := edtCidade.Text;
  Titulo.Sacado.UF         := edtUF.Text;
  Titulo.Sacado.CEP        := OnlyNumber(edtCEP.Text);
  Titulo.ValorAbatimento   := StrToCurrDef(edtValorAbatimento.Text,0);
  Titulo.LocalPagamento    := edtLocalPag.Text;
  Titulo.ValorMoraJuros    := StrToCurrDef(edtMoraJuros.Text,0);
  Titulo.ValorDesconto     := StrToCurrDef(edtValorDesconto.Text,0);
  Titulo.ValorAbatimento   := StrToCurrDef(edtValorAbatimento.Text,0);
  Titulo.DataMoraJuros     := StrToDateDef(edtDataMora.Text, 0);
  Titulo.DataDesconto      := StrToDateDef(edtDataDesconto.Text, 0);
  Titulo.TipoDesconto      := tdNaoConcederDesconto;
  Titulo.DataAbatimento    := StrToDateDef(edtDataAbatimento.Text, 0);
  Titulo.DataProtesto      := StrToDateDef(edtDataProtesto.Text, 0);
  Titulo.PercentualMulta   := StrToCurrDef(edtMulta.Text,0);
  Titulo.CodigoMoraJuros   := cjValorMensal;
  Titulo.Mensagem.Text     := memMensagem.Text;
  Titulo.OcorrenciaOriginal.Tipo := toRemessaRegistrar;
  Titulo.Instrucao1        := trim(edtInstrucoes1.Text);
  Titulo.Instrucao2        := trim(edtInstrucoes2.Text);

  Titulo.QtdePagamentoParcial   := 1;
  Titulo.TipoPagamento          := tpNao_Aceita_Valor_Divergente;
  Titulo.PercentualMinPagamento := 0;
  Titulo.PercentualMaxPagamento := 0;
  Titulo.ValorMinPagamento      := 0;
  Titulo.ValorMaxPagamento      := 0;
  if cxbEMV.Checked then
    Titulo.QrCode.emv := '00020101021226870014br.gov.bcb.pix2565qrcodepix-h.bb.com.br/pix/v2/22657e83-ecac-4631-a767-65e16fc56bff5204000053039865802BR5925EMPRORT AMBIENTAL        6008BRASILIA62070503***6304BD3D';

 // FACBrBoleto.AdicionarMensagensPadroes(Titulo,Mensagem);

  if cbxLayOut.ItemIndex = 6 then
  begin
    for i:=0 to 3 do
    begin
      VLinha := '.';

      VQtdeCarcA := length('Descrição Produto/Serviço ' + IntToStr(I));
      VQtdeCarcB := Length('Valor:');
      VQtdeCarcC := 85 - (VQtdeCarcA + VQtdeCarcB);

      VLinha := PadLeft(VLinha,VQtdeCarcC,'.');

      Titulo.Detalhamento.Add('Descrição Produto/Serviço ' + IntToStr(I) + ' '+ VLinha + ' Valor:   '+  PadRight(FormatCurr('R$ ###,##0.00', StrToCurr(edtValorDoc.Text) * 0.25),18,' ') );
    end;
    Titulo.Detalhamento.Add('');
    Titulo.Detalhamento.Add('');
    Titulo.Detalhamento.Add('');
    Titulo.Detalhamento.Add('');
    Titulo.Detalhamento.Add('Desconto ........................................................................... Valor: R$ 0,00' );
  end;

  //if FileExists(ExtractFileDir(ParamStr(0)) + '\acbr_logo.jpg') then
    // logo := ExtractFileDir(ParamStr(0)) + '\acbr_logo.jpg';

  //Titulo.ArquivoLogoEmp := logo;  // logo da empresa
  Titulo.Verso := ((cbxImprimirVersoFatura.Checked) and ( cbxImprimirVersoFatura.Enabled = true ));

end;

function TBoleto.LerConfiguracao(Value: string): IBoleto;
begin
  Result := Self;
  FACBrBoleto.LerConfiguracao(Value);
end;

class function TBoleto.New: IBoleto;
begin
  Result := Self.Create;
end;

function TBoleto.Titulo: ITitulo<IBoleto>;
begin
  if not Assigned(FTitulo) then
    FTitulo := TTitulo<IBoleto>.New(Self);
  Result := FTitulo;
end;

end.

