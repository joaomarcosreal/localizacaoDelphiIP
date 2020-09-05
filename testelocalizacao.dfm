object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 393
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 43
    Width = 60
    Height = 13
    Caption = 'Endere'#231'o ip:'
  end
  object Label2: TLabel
    Left = 6
    Top = 84
    Width = 86
    Height = 13
    Caption = 'Json de resposta:'
  end
  object Label3: TLabel
    Left = 12
    Top = 195
    Width = 531
    Height = 74
    Caption = 
      'Coloquei aqui apenas os dados principais. Para acesso aos outros' +
      ' dados, interpretem o JSON'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object memo: TJvMemo
    Left = 8
    Top = 97
    Width = 625
    Height = 89
    TabOrder = 0
  end
  object Button1: TButton
    Left = 225
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object edEnderecoIP: TEdit
    Left = 7
    Top = 61
    Width = 210
    Height = 21
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 314
    Width = 761
    Height = 79
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'continent_name'
        Title.Caption = 'Continente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'country_name'
        Title.Caption = 'Pa'#237's'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'region_name'
        Title.Caption = 'Estado'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'region_code'
        Title.Caption = 'UF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'latitude'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'longitude'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datetime'
        Visible = True
      end>
  end
  object IdHTTP1: TIdHTTP
    IOHandler = Id_HandlerSocket
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 475
    Top = 28
  end
  object Id_HandlerSocket: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 381
    Top = 8
  end
  object memtable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 596
    Top = 31
    object memtablecountry_name: TStringField
      FieldName = 'country_name'
    end
    object memtableregion_name: TStringField
      FieldName = 'region_name'
      Size = 30
    end
    object memtableregion_code: TStringField
      FieldName = 'region_code'
      Size = 5
    end
    object memtablecontinent_name: TStringField
      FieldName = 'continent_name'
    end
    object memtablelatitude: TStringField
      FieldName = 'latitude'
      Size = 15
    end
    object memtablelongitude: TStringField
      FieldName = 'longitude'
      Size = 15
    end
    object memtabledatetime: TStringField
      FieldName = 'datetime'
    end
    object memtablecity: TStringField
      FieldName = 'city'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = memtable
    Left = 646
    Top = 31
  end
end
