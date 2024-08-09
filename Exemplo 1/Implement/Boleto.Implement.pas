unit Boleto.Implement;

interface

uses
  Boleto.Interfaces, ACBrBase, ACBrUtil, ACBrMail, ACBrUtil.FilesIO,
  ACBrBoletoConversao, ACBrBoletoRetorno, ACBrBoletoFPDF, ComCtrls,
  ACBrBoletoFCFortesFr, ACBrBoletoFCFR, ACBrBoleto, Boleto.Classes,
  System.IniFiles;

type
  TBoleto = class(TInterfacedObject, IBoleto)
  private
    FACBrBoleto: TACBrBoleto;
    FACBrMail: TACBrMail;
    FACBrBoletoFPDF: TACBrBoletoFPDF;  //GERADOR_PDF
    FACBrBoletoFCFR: TACBrBoletoFCFR; //GERADOR_FAST_REPORT
    FACBrBoletoFCRL: TACBrBoletoFCFortes; //GERADOR_FORTES_REPORT
    FArquivo : string;
    FTitulo: ITitulo<IBoleto>;
    procedure IncluirBoleto;
    function GetINIValue(const FileName, Section, Key: string): string;

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

function TBoleto.GetINIValue(const FileName, Section, Key: string): string;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(FileName);
  try
    Result := IniFile.ReadString(Section, Key, '');
  finally
    IniFile.Free;
  end;
end;

constructor TBoleto.Create;
begin
  FACBrBoleto := TACBrBoleto.Create(nil);
  FACBrMail := TACBrMail.Create(FACBrBoleto);
  {GERADOR_PDF}
  //FACBrBoletoFPDF := TACBrBoletoFPDF.Create(FACBrBoleto);
  //FACBrBoleto.ACBrBoletoFC := TACBrBoletoFCClass(FACBrBoletoFPDF);

  {GERADOR_FAST_REPORT}
  FACBrBoletoFCFR   := TACBrBoletoFCFR.Create(FACBrBoleto);
  FACBrBoleto.ACBrBoletoFC := TACBrBoletoFCClass(FACBrBoletoFCFR);

  {GERADOR_FORTES_REPORT}
  //FACBrBoletoFCRL   := TACBrBoletoFCFortes.Create(FACBrBoleto);
  //FACBrBoleto.ACBrBoletoFC := TACBrBoletoFCClass(FACBrBoletoFCRL);
end;

class function TBoleto.New: IBoleto;
begin
  Result := Self.Create;
end;

destructor TBoleto.Destroy;
begin
  FACBrBoleto.Free;
  inherited;
end;

procedure TBoleto.GerarPDF;
begin
  Self.IncluirBoleto;
  FACBrBoletoFCFR.FastReportFile := Self.GetINIValue(FArquivo, 'PATH', 'BOLETOFR3');  //'G:\Arquivos\Projetos Delphi\BoletoTip-Teste\Arq.Boleto\Boleto.fr3';
  FACBrBoleto.GerarPDF;
  FACBrBoleto.Imprimir;
end;

procedure TBoleto.IncluirBoleto;
begin
 var
  Titulo := FACBrBoleto.CriarTituloNaLista;

  Titulo.Vencimento        := FTitulo.Vencimento;
  Titulo.DataDocumento     := FTitulo.DataDocumento;
  Titulo.NumeroDocumento   := FTitulo.NumeroDocumento;
  Titulo.EspecieDoc        := FTitulo.EspecieDoc;
  Titulo.EspecieMod        := FTitulo.EspecieMod;
  Titulo.Aceite := atNao; { atSim ou atNao = Direcionei Direto atNao}
  Titulo.DataProcessamento := FTitulo.DataProcessamento;
  Titulo.Carteira          := FTitulo.Carteira;
  Titulo.NossoNumero       := FTitulo.NossoNumero;
  Titulo.NossoNumeroCorrespondente := FTitulo.NossoNumeroCorrespondente;
  Titulo.ValorDocumento    := FTitulo.ValorDocumento;
  Titulo.Sacado.NomeSacado := FTitulo.SacadoNomeSacado;
  Titulo.Sacado.CNPJCPF    := FTitulo.SacadoCNPJCPF;
  Titulo.Sacado.Logradouro := FTitulo.SacadoLogradouro;
  Titulo.Sacado.Numero     := FTitulo.SacadoNumero;
  Titulo.Sacado.Bairro     := FTitulo.SacadoBairro;
  Titulo.Sacado.Cidade     := FTitulo.SacadoCidade;
  Titulo.Sacado.UF         := FTitulo.SacadoUF;
  Titulo.Sacado.CEP        := FTitulo.SacadoCEP;
  Titulo.ValorAbatimento   := FTitulo.ValorAbatimento;
  Titulo.LocalPagamento    := FTitulo.LocalPagamento;
  Titulo.ValorMoraJuros    := FTitulo.ValorMoraJuros;
  Titulo.ValorDesconto     := FTitulo.ValorDesconto;
  Titulo.ValorAbatimento   := FTitulo.ValorAbatimento;
  Titulo.DataMoraJuros     := FTitulo.DataMoraJuros;
  Titulo.DataDesconto      := FTitulo.DataDesconto;
  Titulo.TipoDesconto      := TACBrTipoDesconto(FTitulo.TipoDesconto);
  Titulo.DataAbatimento    := FTitulo.DataAbatimento;
  Titulo.DataProtesto      := FTitulo.DataProtesto;
  Titulo.PercentualMulta   := FTitulo.PercentualMulta;
  Titulo.CodigoMoraJuros   := TACBrCodigoJuros(FTitulo.CodigoMoraJuros);
  Titulo.Mensagem.Text     := FTitulo.Mensagem;
  Titulo.OcorrenciaOriginal.Tipo := TACBrTipoOcorrencia(FTitulo.OcorrenciaOriginal);
  Titulo.Instrucao1        := FTitulo.Instrucao1;
  Titulo.Instrucao2        := FTitulo.Instrucao2;
  Titulo.QtdePagamentoParcial   := FTitulo.QtdePagamentoParcial;
  Titulo.TipoPagamento          := TTipo_Pagamento(FTitulo.TipoPagamento);
  Titulo.PercentualMinPagamento := FTitulo.PercentualMinPagamento;
  Titulo.PercentualMaxPagamento := FTitulo.PercentualMaxPagamento;
  Titulo.ValorMinPagamento      := FTitulo.ValorMinPagamento;
  Titulo.ValorMaxPagamento      := FTitulo.ValorMaxPagamento;
  Titulo.Verso := FTitulo.Verso;

end;

function TBoleto.LerConfiguracao(Value: string): IBoleto;
begin
  Result := Self;
  FACBrBoleto.LerConfiguracao(Value);
  FArquivo:= Value;
end;

function TBoleto.Titulo: ITitulo<IBoleto>;
begin
  if not Assigned(FTitulo) then
    FTitulo := TTitulo<IBoleto>.New(Self);
  Result := FTitulo;
end;

end.

