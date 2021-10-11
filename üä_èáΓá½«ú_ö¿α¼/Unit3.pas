unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Db, DBTables, Grids, DBGrids;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid1: TDBGrid;
    dsannuaire: TDataSource;
    tannuaire: TTable;
    Edit1: TEdit;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form3: TForm3;

implementation

{$R *.DFM}

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

procedure TForm3.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if TDBGrid(Sender).DataSource.DataSet.RecNo/2=trunc(TDBGrid(Sender).DataSource.DataSet.RecNo/2)

Then

TDBGrid(Sender).Canvas.Brush.Color := clSilver

Else

TDBGrid(Sender).Canvas.Brush.Color := clwhite;

TDBGrid(Sender).DefaultDrawColumnCell(rect,datacol,column,state);
end;

procedure TForm3.Edit1Change(Sender: TObject);
var Filtre : string;
begin
Filtre := 'Nom =''' + Edit1.Text  + '*'''  ;

   if Edit1.Text ='' then // Test si il n'y a rien dans le TEdit
    begin
      tannuaire.Filtered:=false; // Arrête le filtrage de la table
      exit; // quitte la methode
     end;
   tannuaire.Filter := Filtre; // Mise en place du filtre
   tannuaire.Filtered := true; // Activation du filtre

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
 tannuaire.DatabaseName:=ExtractFilePath(ParamStr(0));
 tannuaire.Open;
end;

end.
