object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'FrmPrincipal'
  ClientHeight = 147
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnLerArquivo: TBitBtn
    Left = 0
    Top = 0
    Width = 241
    Height = 73
    Align = alTop
    Caption = 'Ler Arquivo Ini'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnLerArquivoClick
  end
  object btnGerarPDF: TBitBtn
    Left = 0
    Top = 73
    Width = 241
    Height = 73
    Align = alTop
    Caption = 'Gerar PDF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnGerarPDFClick
  end
  object OpenDialog: TOpenDialog
    Left = 232
    Top = 200
  end
end
