object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Google Vision Text Detection API '
  ClientHeight = 497
  ClientWidth = 490
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
    Left = 8
    Top = 16
    Width = 52
    Height = 13
    Caption = 'Image URL'
  end
  object Button1: TButton
    Left = 8
    Top = 113
    Width = 474
    Height = 25
    Caption = 'Send Request'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 9
    Top = 31
    Width = 473
    Height = 21
    TabOrder = 1
    Text = 
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Entard' +
      'ecer_elevedor_lacerda.jpg/1280px-Entardecer_elevedor_lacerda.jpg'
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 144
    Width = 474
    Height = 345
    ActivePage = TabSheet2
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Headers'
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 466
        Height = 317
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Body'
      ImageIndex = 1
      object Memo3: TMemo
        Left = 0
        Top = 0
        Width = 466
        Height = 317
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Tabular Data'
      ImageIndex = 2
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 466
        Height = 317
        Align = alClient
        ColCount = 1
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
        ColWidths = (
          64)
        ColAligments = (
          0)
      end
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://vision.googleapis.com'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 328
    Top = 208
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        ContentType = ctAPPLICATION_JSON
      end>
    Resource = 'v1/images:annotate?key=AIzaSyBLSdcJ7BKTrM-0CSBHJ9u4yZCOXe'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 328
    Top = 264
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 328
    Top = 320
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 140
    Top = 221
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <>
    end
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 324
    Top = 376
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 324
    Top = 432
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = FDMemTable1
    ScopeMappings = <>
    Left = 240
    Top = 256
  end
end
