unit Boleto.Classes;

interface

uses
  Boleto.Interfaces;

type
  TTitulo<T: IInterface> = class(TInterfacedObject, ITitulo<T>)
  private
    [weak]
    FParent: T;

    FVencimento: TDateTime;
    FDataDocumento: TDateTime;
    FNumeroDocumento: String;
    FEspecieDoc: String;
    FEspecieMod: String;
    FDataProcessamento: TDateTime;
    FCarteira: String;
    FNossoNumero: String;
    FNossoNumeroCorrespondente: String;
    FValorDocumento: Currency;
    FSacadoNomeSacado: String;
    FSacadoCNPJCPF: String;
    FSacadoLogradouro: String;
    FSacadoNumero: String;
    FSacadoBairro: String;
    FSacadoCidade: String;
    FSacadoUF: String;
    FSacadoCEP: String;
    FValorAbatimento: Currency;
    FLocalPagamento: String;
    FValorMoraJuros: Currency;
    FValorDesconto: Currency;
    FDataMoraJuros: TDateTime;
    FDataDesconto: TDateTime;
    FTipoDesconto: Integer;
    FDataAbatimento: TDateTime;
    FDataProtesto: TDateTime;
    FPercentualMulta: Double;
    FCodigoMoraJuros: Integer;
    FMensagem: String;
    FOcorrenciaOriginal: Integer;
    FInstrucao1: String;
    FInstrucao2: String;
    FQtdePagamentoParcial: Integer;
    FTipoPagamento: Integer;
    FPercentualMinPagamentoo: Currency;
    FPercentualMaxPagamento: Currency;
    FValorMinPagamento: Currency;
    FValorMaxPagamento: Currency;
    FVerso: Boolean;

    constructor Create(Parent: T);
    destructor Destroy; override;
  public
    class function New(Parent: T): ITitulo<T>;

    function Vencimento(Value: TDateTime): ITitulo<T>; overload;
    function Vencimento: TDateTime; overload;
    function DataDocumento(Value: TDateTime): ITitulo<T>; overload;
    function DataDocumento: TDateTime; overload;
    function NumeroDocumento(Value: string): ITitulo<T>; overload;
    function NumeroDocumento: string; overload;
    function EspecieDoc(Value: string): ITitulo<T>; overload;
    function EspecieDoc: string; overload;
    function EspecieMod(Value: string): ITitulo<T>; overload;
    function EspecieMod: string; overload;
    function DataProcessamento(Value: TDateTime): ITitulo<T>; overload;
    function DataProcessamento: TDateTime; overload;
    function Carteira(Value: string): ITitulo<T>; overload;
    function Carteira: string; overload;
    function NossoNumero(Value: string): ITitulo<T>; overload;
    function NossoNumero: string; overload;
    function NossoNumeroCorrespondente(Value: string): ITitulo<T>; overload;
    function NossoNumeroCorrespondente: string; overload;
    function ValorDocumento(Value: Currency): ITitulo<T>; overload;
    function ValorDocumento: Currency; overload;
    function SacadoNomeSacado(Value: string): ITitulo<T>; overload;
    function SacadoNomeSacado: string; overload;
    function SacadoCNPJCPF(Value: string): ITitulo<T>; overload;
    function SacadoCNPJCPF: string; overload;
    function SacadoLogradouro(Value: string): ITitulo<T>; overload;
    function SacadoLogradouro: string; overload;
    function SacadoNumero(Value: string): ITitulo<T>; overload;
    function SacadoNumero: string; overload;
    function SacadoBairro(Value: string): ITitulo<T>; overload;
    function SacadoBairro: string; overload;
    function SacadoCidade(Value: string): ITitulo<T>; overload;
    function SacadoCidade: string; overload;
    function SacadoUF(Value: string): ITitulo<T>; overload;
    function SacadoUF: string; overload;
    function SacadoCEP(Value: string): ITitulo<T>; overload;
    function SacadoCEP: string; overload;
    function ValorAbatimento(Value: Currency): ITitulo<T>; overload;
    function ValorAbatimento: Currency; overload;
    function LocalPagamento(Value: string): ITitulo<T>; overload;
    function LocalPagamento: string; overload;
    function ValorMoraJuros(Value: Currency): ITitulo<T>; overload;
    function ValorMoraJuros: Currency; overload;
    function ValorDesconto(Value: Currency): ITitulo<T>; overload;
    function ValorDesconto: Currency; overload;
    function DataMoraJuros(Value: TDateTime): ITitulo<T>; overload;
    function DataMoraJuros: TDateTime; overload;
    function DataDesconto(Value: TDateTime): ITitulo<T>; overload;
    function DataDesconto: TDateTime; overload;
    function TipoDesconto(Value: Integer): ITitulo<T>; overload;
    function TipoDesconto: Integer; overload;
    function DataAbatimento(Value: TDateTime): ITitulo<T>; overload;
    function DataAbatimento: TDateTime; overload;
    function DataProtesto(Value: TDateTime): ITitulo<T>; overload;
    function DataProtesto: TDateTime; overload;
    function PercentualMulta(Value: Double): ITitulo<T>; overload;
    function PercentualMulta: Double; overload;
    function CodigoMoraJuros(Value: Integer): ITitulo<T>; overload;
    function CodigoMoraJuros: Integer; overload;
    function Mensagem(Value: string): ITitulo<T>; overload;
    function Mensagem: string; overload;
    function OcorrenciaOriginal(Value: Integer): ITitulo<T>; overload;
    function OcorrenciaOriginal: Integer; overload;
    function Instrucao1(Value: string): ITitulo<T>; overload;
    function Instrucao1: string; overload;
    function Instrucao2(Value: string): ITitulo<T>; overload;
    function Instrucao2: string; overload;
    function QtdePagamentoParcial(Value: Integer): ITitulo<T>; overload;
    function QtdePagamentoParcial: Integer; overload;
    function TipoPagamento(Value: Integer): ITitulo<T>; overload;
    function TipoPagamento: Integer; overload;
    function PercentualMinPagamento(Value: Currency): ITitulo<T>; overload;
    function PercentualMinPagamento: Currency; overload;
    function PercentualMaxPagamento(Value: Currency): ITitulo<T>; overload;
    function PercentualMaxPagamento: Currency; overload;
    function ValorMinPagamento(Value: Currency): ITitulo<T>; overload;
    function ValorMinPagamento: Currency; overload;
    function ValorMaxPagamento(Value: Currency): ITitulo<T>; overload;
    function ValorMaxPagamento: Currency; overload;
    function Verso(Value: Boolean): ITitulo<T>; overload;
    function Verso: Boolean; overload;

    function &End: T;
  end;

implementation

{ TTitulo<T> }

constructor TTitulo<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TTitulo<T>.Destroy;
begin

  inherited;
end;

function TTitulo<T>.&End: T;
begin
  Result := FParent;
end;

class function TTitulo<T>.New(Parent: T): ITitulo<T>;
begin
  Result := Self.Create(Parent);
end;

function TTitulo<T>.Carteira(Value: string): ITitulo<T>;
begin
  Result := Self;
  FCarteira := Value;
end;

function TTitulo<T>.Carteira: string;
begin
  Result := FCarteira;
end;

function TTitulo<T>.CodigoMoraJuros(Value: Integer): ITitulo<T>;
begin
  Result := Self;
  FCodigoMoraJuros := Value;
end;

function TTitulo<T>.CodigoMoraJuros: Integer;
begin
  Result := FCodigoMoraJuros;
end;

function TTitulo<T>.DataAbatimento(Value: TDateTime): ITitulo<T>;
begin
  Result := Self;
  FDataAbatimento := Value;
end;

function TTitulo<T>.DataAbatimento: TDateTime;
begin
  Result := FDataAbatimento;
end;

function TTitulo<T>.DataDesconto(Value: TDateTime): ITitulo<T>;
begin
  Result := Self;
  FDataDesconto := Value;
end;

function TTitulo<T>.DataDesconto: TDateTime;
begin
  Result := FDataDesconto;
end;

function TTitulo<T>.DataDocumento(Value: TDateTime): ITitulo<T>;
begin
  Result := Self;
  FDataDocumento := Value;
end;

function TTitulo<T>.DataDocumento: TDateTime;
begin
  Result := FDataDocumento;
end;

function TTitulo<T>.DataMoraJuros(Value: TDateTime): ITitulo<T>;
begin
  Result := Self;
  FDataMoraJuros := Value;
end;

function TTitulo<T>.DataMoraJuros: TDateTime;
begin
  Result := FDataMoraJuros;
end;

function TTitulo<T>.DataProcessamento(Value: TDateTime): ITitulo<T>;
begin
  Result := Self;
  FDataProcessamento := Value;
end;

function TTitulo<T>.DataProcessamento: TDateTime;
begin
  Result := FDataProcessamento;
end;

function TTitulo<T>.DataProtesto(Value: TDateTime): ITitulo<T>;
begin
  Result := Self;
  FDataProtesto := Value;
end;

function TTitulo<T>.DataProtesto: TDateTime;
begin
  Result := FDataProtesto;
end;

function TTitulo<T>.EspecieDoc(Value: string): ITitulo<T>;
begin
  Result := Self;
  FEspecieDoc := Value;
end;

function TTitulo<T>.EspecieDoc: string;
begin
  Result := FEspecieDoc;
end;

function TTitulo<T>.EspecieMod(Value: string): ITitulo<T>;
begin
  Result := Self;
  FEspecieMod := Value;
end;

function TTitulo<T>.EspecieMod: string;
begin
  Result := FEspecieMod;
end;

function TTitulo<T>.Instrucao1(Value: string): ITitulo<T>;
begin
  Result := Self;
  FInstrucao1 := Value;
end;

function TTitulo<T>.Instrucao1: string;
begin
  Result := FInstrucao1;
end;

function TTitulo<T>.Instrucao2(Value: string): ITitulo<T>;
begin
  Result := Self;
  FInstrucao2 := Value;
end;

function TTitulo<T>.Instrucao2: string;
begin
  Result := FInstrucao2;
end;

function TTitulo<T>.LocalPagamento(Value: string): ITitulo<T>;
begin
  Result := Self;
  FLocalPagamento := Value;
end;

function TTitulo<T>.LocalPagamento: string;
begin
  Result := FLocalPagamento;
end;

function TTitulo<T>.Mensagem(Value: string): ITitulo<T>;
begin
  Result := Self;
  FMensagem := Value;
end;

function TTitulo<T>.Mensagem: string;
begin
  Result := FMensagem;
end;

function TTitulo<T>.NossoNumero(Value: string): ITitulo<T>;
begin
  Result := Self;
  FNossoNumero := Value;
end;

function TTitulo<T>.NossoNumero: string;
begin
  Result := FNossoNumero;
end;

function TTitulo<T>.NossoNumeroCorrespondente(Value: string): ITitulo<T>;
begin
  Result := Self;
  FNossoNumeroCorrespondente := Value;
end;

function TTitulo<T>.NossoNumeroCorrespondente: string;
begin
  Result := FNossoNumeroCorrespondente;
end;

function TTitulo<T>.NumeroDocumento(Value: string): ITitulo<T>;
begin
  Result := Self;
  FNumeroDocumento := Value;
end;

function TTitulo<T>.NumeroDocumento: string;
begin
  Result := FNumeroDocumento;
end;

function TTitulo<T>.OcorrenciaOriginal(Value: Integer): ITitulo<T>;
begin
  Result := Self;
  FOcorrenciaOriginal := Value;
end;

function TTitulo<T>.OcorrenciaOriginal: Integer;
begin
  Result := FOcorrenciaOriginal;
end;

function TTitulo<T>.PercentualMaxPagamento(Value: Currency): ITitulo<T>;
begin
  Result := Self;
  FPercentualMaxPagamento := Value;
end;

function TTitulo<T>.PercentualMaxPagamento: Currency;
begin
  Result :=   FPercentualMaxPagamento;
end;

function TTitulo<T>.PercentualMinPagamento(Value: Currency): ITitulo<T>;
begin
  Result := Self;
  FPercentualMinPagamentoo := Value;
end;

function TTitulo<T>.PercentualMinPagamento: Currency;
begin
  Result := FPercentualMinPagamentoo;
end;

function TTitulo<T>.PercentualMulta(Value: Double): ITitulo<T>;
begin
  Result := Self;
  FPercentualMulta := Value;
end;

function TTitulo<T>.PercentualMulta: Double;
begin
  Result := FPercentualMulta;
end;

function TTitulo<T>.QtdePagamentoParcial(Value: Integer): ITitulo<T>;
begin
  Result := Self;
  FQtdePagamentoParcial := Value;
end;

function TTitulo<T>.QtdePagamentoParcial: Integer;
begin
  Result := FQtdePagamentoParcial;
end;

function TTitulo<T>.SacadoBairro(Value: string): ITitulo<T>;
begin
  Result:= Self;
  FSacadoBairro := Value;
end;

function TTitulo<T>.SacadoBairro: string;
begin
  Result := FSacadoBairro;
end;

function TTitulo<T>.SacadoCEP(Value: string): ITitulo<T>;
begin
  Result := Self;
  FSacadoCEP := Value;
end;

function TTitulo<T>.SacadoCEP: string;
begin
  Result := FSacadoCEP;
end;

function TTitulo<T>.SacadoCidade(Value: string): ITitulo<T>;
begin
  Result := Self;
  FSacadoCidade := Value;
end;

function TTitulo<T>.SacadoCidade: string;
begin
  Result := FSacadoCidade;
end;

function TTitulo<T>.SacadoCNPJCPF(Value: string): ITitulo<T>;
begin
  Result := Self;
  FSacadoCNPJCPF := Value;
end;

function TTitulo<T>.SacadoCNPJCPF: string;
begin
  Result := FSacadoCNPJCPF;
end;

function TTitulo<T>.SacadoLogradouro(Value: string): ITitulo<T>;
begin
  Result := Self;
  FSacadoLogradouro := Value;
end;

function TTitulo<T>.SacadoLogradouro: string;
begin
  Result := FSacadoLogradouro;
end;

function TTitulo<T>.SacadoNomeSacado(Value: string): ITitulo<T>;
begin
  Result := Self;
  FSacadoNomeSacado := Value;
end;

function TTitulo<T>.SacadoNomeSacado: string;
begin
  Result := FSacadoNomeSacado;
end;

function TTitulo<T>.SacadoNumero(Value: string): ITitulo<T>;
begin
  Result := Self;
  FSacadoNumero := Value;
end;

function TTitulo<T>.SacadoNumero: string;
begin
  Result := FSacadoNumero;
end;

function TTitulo<T>.SacadoUF(Value: string): ITitulo<T>;
begin
  Result := Self;
  FSacadoUF := Value;
end;

function TTitulo<T>.SacadoUF: string;
begin
  Result := FSacadoUF;
end;

function TTitulo<T>.TipoDesconto(Value: Integer): ITitulo<T>;
begin
  Result := Self;
  FTipoDesconto := Value;
end;

function TTitulo<T>.TipoDesconto: Integer;
begin
  Result := FTipoDesconto;
end;

function TTitulo<T>.TipoPagamento(Value: Integer): ITitulo<T>;
begin
  Result := Self;
  FTipoPagamento := Value;
end;

function TTitulo<T>.TipoPagamento: Integer;
begin
  Result := FTipoPagamento;
end;

function TTitulo<T>.ValorAbatimento(Value: Currency): ITitulo<T>;
begin
  Result := Self;
  FValorAbatimento := Value;
end;

function TTitulo<T>.ValorAbatimento: Currency;
begin
  Result := FValorAbatimento;
end;

function TTitulo<T>.ValorDesconto(Value: Currency): ITitulo<T>;
begin
  Result := Self;
  FValorDesconto := Value;
end;

function TTitulo<T>.ValorDesconto: Currency;
begin
  Result := FValorDesconto;
end;

function TTitulo<T>.ValorDocumento(Value: Currency): ITitulo<T>;
begin
  Result := Self;
  FValorDocumento := Value;
end;

function TTitulo<T>.ValorDocumento: Currency;
begin
  Result := FValorDocumento;
end;

function TTitulo<T>.ValorMaxPagamento(Value: Currency): ITitulo<T>;
begin
  Result := Self;
  FValorMaxPagamento := Value;
end;

function TTitulo<T>.ValorMaxPagamento: Currency;
begin
  Result := FValorMaxPagamento;
end;

function TTitulo<T>.ValorMinPagamento(Value: Currency): ITitulo<T>;
begin
  Result := Self;
  FValorMinPagamento := Value;
end;

function TTitulo<T>.ValorMinPagamento: Currency;
begin
  Result := FValorMinPagamento;
end;

function TTitulo<T>.ValorMoraJuros(Value: Currency): ITitulo<T>;
begin
  Result := Self;
  FValorMoraJuros := Value;
end;

function TTitulo<T>.ValorMoraJuros: Currency;
begin
  Result := FValorMoraJuros;
end;

function TTitulo<T>.Vencimento(Value: TDateTime): ITitulo<T>;
begin
  Result := Self;
  FVencimento := Value;
end;

function TTitulo<T>.Vencimento: TDateTime;
begin
  Result := FVencimento;
end;

function TTitulo<T>.Verso(Value: Boolean): ITitulo<T>;
begin
  Result := Self;
  FVerso := Value;
end;

function TTitulo<T>.Verso: Boolean;
begin
  Result := FVerso;
end;

end.
