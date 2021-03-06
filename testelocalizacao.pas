unit testelocalizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvMemo, System.JSON,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,   DataSet.Serialize,
  Vcl.OleCtrls, SHDocVw, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdSSLOpenSSL, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    memo: TJvMemo;
    Button1: TButton;
    Id_HandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
    edEnderecoIP: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    memtable: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    memtablecountry_name: TStringField;
    memtableregion_name: TStringField;
    memtableregion_code: TStringField;
    memtablecontinent_name: TStringField;
    memtablelatitude: TStringField;
    memtablelongitude: TStringField;
    memtabledatetime: TStringField;
    memtablecity: TStringField;
    Label3: TLabel;
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
 jsonObj : TJSONObject;
 jv: TJSONValue;

begin

  try
    memo.Lines.Clear;
    IdHTTP1.Request.BasicAuthentication := False;
    IdHTTP1.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
    Id_HandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create( IdHTTP1 );
    Id_HandlerSocket.SSLOptions.Mode := sslmClient;
    Id_HandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdHTTP1.IOHandler := Id_HandlerSocket;
    memo.lines.add(IdHTTP1.get('https://tools.keycdn.com/geo.json?host='+edEnderecoIP.Text)) ;
    jsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(memo.Text), 0) as TJSONObject;
    jv := jsonObj.Get('data').JsonValue;
    jsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(jv.ToJSON), 0) as TJSONObject;
    jv := jsonObj.Get('geo').JsonValue;
    memtable.Active := false;
    memtable.LoadFromJSON(jv.ToString);
  except
   showmessage('Erro ao obter dados de localização!');
  end;




end;

end.
