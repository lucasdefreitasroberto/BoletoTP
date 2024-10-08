unit Boleto.Interfaces;

interface

type
  ITitulo<T> = interface

    function Vencimento(Value: TDateTime): ITitulo<T>; overload;
    function Vencimento: TDateTime; overload;

    function DataDocumento(Value: TDateTime): ITitulo<T>; overload;
    function DataDocumento: TDateTime; overload;

    function NumeroDocumento(Value: String): ITitulo<T>; overload;
    function NumeroDocumento: String; overload;

    function EspecieDoc(Value: String): ITitulo<T>; overload;
    function EspecieDoc: String; overload;

    function EspecieMod(Value: String): ITitulo<T>; overload;
    function EspecieMod: String; overload;

    function DataProcessamento(Value: TDateTime): ITitulo<T>; overload;
    function DataProcessamento: TDateTime; overload;

    function Carteira(Value: String): ITitulo<T>; overload;
    function Carteira: String; overload;

    function NossoNumero(Value: String): ITitulo<T>; overload;
    function NossoNumero: String; overload;

    function NossoNumeroCorrespondente(Value: String): ITitulo<T>; overload;
    function NossoNumeroCorrespondente: String; overload;

    function ValorDocumento(Value: Currency): ITitulo<T>; overload;
    function ValorDocumento: Currency; overload;

    function SacadoNomeSacado(Value: String): ITitulo<T>; overload;
    function SacadoNomeSacado: String; overload;

    function SacadoCNPJCPF(Value: String): ITitulo<T>; overload;
    function SacadoCNPJCPF: String; overload;

    function SacadoLogradouro(Value: String): ITitulo<T>; overload;
    function SacadoLogradouro: String; overload;

    function SacadoNumero(Value: String): ITitulo<T>; overload;
    function SacadoNumero: String; overload;

    function SacadoBairro(Value: String): ITitulo<T>; overload;
    function SacadoBairro: String; overload;

    function SacadoCidade(Value: String): ITitulo<T>; overload;
    function SacadoCidade: String; overload;

    function SacadoUF(Value: String): ITitulo<T>; overload;
    function SacadoUF: String; overload;

    function SacadoCEP(Value: String): ITitulo<T>; overload;
    function SacadoCEP: String; overload;

    function ValorAbatimento(Value: Currency): ITitulo<T>; overload;
    function ValorAbatimento: Currency; overload;

    function LocalPagamento(Value: String): ITitulo<T>; overload;
    function LocalPagamento: String; overload;

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

    function Mensagem(Value: String): ITitulo<T>; overload;
    function Mensagem: String; overload;

    function OcorrenciaOriginal(Value: Integer): ITitulo<T>; overload;
    function OcorrenciaOriginal: Integer; overload;

    function Instrucao1(Value: String): ITitulo<T>; overload;
    function Instrucao1: String; overload;

    function Instrucao2(Value: String): ITitulo<T>; overload;
    function Instrucao2: String; overload;

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

  IBoleto = Interface
    function LerConfiguracao(Value: string): IBoleto;
    function Titulo: ITitulo<IBoleto>;
    procedure GerarPDF;
  end;

implementation

end.
