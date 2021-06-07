unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, gtClasses, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, Vcl.Grids, Vcl.Bind.Grid,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid,
  Data.Bind.DBScope;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Button1: TButton;
    Edit1: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo2: TMemo;
    Memo3: TMemo;
    Label1: TLabel;
    TabSheet3: TTabSheet;
    StringGrid1: TStringGrid;
    BindingsList1: TBindingsList;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 APIkey: String;
begin
 FDMemTable1.Active := False;
 RESTClient1.ResetToDefaults;
 RESTClient1.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
 RESTClient1.AcceptCharset := 'UTF-8, *;q=0.8';
 RESTClient1.BaseURL := 'https://vision.googleapis.com';
 RESTClient1.HandleRedirects := True;
 RESTClient1.RaiseExceptionOn500 := False;

 APIkey := '** PUT YOUR GOOGLE API KEY HERE **';
 RESTRequest1.Resource := Format('v1/images:annotate?key=%s', [APIkey]);

 RESTRequest1.Client := RESTClient1;
 RESTRequest1.Response := RESTResponse1;
 RESTRequest1.SynchronizedEvents := False;

 RESTResponse1.ContentType := 'application/json';

 RESTRequest1.Params[0].Value := Format(
 '{"requests": [{"features": [{"type": "TEXT_DETECTION"}],"image": {'+
 '"source": {"imageUri": "%s"}}}]}', [Edit1.text]);


 RESTResponse1.RootElement := 'responses[0].textAnnotations';

 RESTRequest1.Execute;

 memo2.Lines := RESTResponse1.Headers;
 memo3.Lines.text := RESTResponse1.Content;
end;

end.
