program TesteBoleto;

uses
  Vcl.Forms,
  ProjetoBoleto in '..\ProjetoBoleto.pas' {frmPrincipal},
  Boleto.Interfaces in 'Interface\Boleto.Interfaces.pas',
  Boleto.Classes in 'classe\Boleto.Classes.pas',
  Boleto.Implement in 'Implement\Boleto.Implement.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
