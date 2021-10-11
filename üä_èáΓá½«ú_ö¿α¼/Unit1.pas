unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Grids, DBGrids, Db, DBTables, Buttons, StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Recherche1: TMenuItem;
    DBGrid1: TDBGrid;
    Table1: TTable;
    DataSource1: TDataSource;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Modif: TGroupBox;
    Label10: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Ajouter: TGroupBox;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Recherche2: TMenuItem;
    Quitter1: TMenuItem;
    ListeComplte1: TMenuItem;
    EditionFiltre1: TMenuItem;
    GroupBox2: TGroupBox;
    Nom: TEdit;
    GroupBox3: TGroupBox;
    Raison: TEdit;
    GroupBox4: TGroupBox;
    Adresse: TEdit;
    GroupBox5: TGroupBox;
    Wilaya: TComboBox;
    GroupBox6: TGroupBox;
    Activite: TEdit;
    GroupBox7: TGroupBox;
    Produit: TComboBox;
    GroupBox8: TGroupBox;
    TypeEnt: TComboBox;
    GroupBox9: TGroupBox;
    Statut: TComboBox;
    GroupBox10: TGroupBox;
    Capital: TEdit;
    GroupBox11: TGroupBox;
    Annee: TComboBox;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    Classe: TEdit;
    Tel: TEdit;
    Email: TEdit;
    procedure Quitter1Click(Sender: TObject);
    procedure Fichier1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Recherche1Click(Sender: TObject);
    procedure Recherche2Click(Sender: TObject);
    procedure ListeComplte1Click(Sender: TObject);
    procedure EditionFiltre1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

uses Unit3, Unit4, Unit6;

{$R *.DFM}

procedure TForm1.Quitter1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Fichier1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
Modif.Caption := 'Modifier les Informations: ';


  if((Table1.RecordCount=0)and(Table1.State<>dsInsert))then exit;

// quitte la procédure si la table est vide et qu'on est pas en insertion

  Nom.Text:=Table1.FieldByName('Nom').AsString;                          // Récupére la quantité de fourniture dans Quant
  Raison.Text:=Table1.FieldByName('Raison Sociale').AsString;                         // Récupére l'observation dans Obs
  Adresse.Text:=Table1.FieldByName('Adresse').AsString;
  Wilaya.Text:=Table1.FieldByName('Wilaya').AsString;
  Activite.Text:=Table1.FieldByName('Activite').AsString;
  Produit.Text:=Table1.FieldByName('Produits Services').AsString;
  TypeEnt.Text:=Table1.FieldByName('Type Entreprise').AsString;
  Statut.Text:=Table1.FieldByName('Statut').AsString;
  Capital.Text:=Table1.FieldByName('Capital').AsString;
  Annee.Text:=Table1.FieldByName('Annee Creation').AsString;
  Classe.Text:=Table1.FieldByName('Classe Entreprise').AsString;
  Tel.Text:=Table1.FieldByName('TEL FAX').AsString;
  Email.Text:=Table1.FieldByName('Email').AsString;
  Modif.Enabled := true;

end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
var rep : integer; er : boolean;
begin
Table1.Post ;
Ajouter.Enabled := False;
DBGrid1.ReadOnly := True ;
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
Table1.Cancel ;
Ajouter.Enabled := False;
DBGrid1.ReadOnly := True ;

end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
if messagedlg('Voulez_Vous Vraiment Supprimer l''entreprise Selectionner?',mtconfirmation,[mbyes,mbno],0)=mryes then
Table1.Delete;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
Table1.Next ; // Déplace le curseur sur l'enregistrement suivant
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
Table1.Prior ;// Déplace le curseur sur l'enregistrement précédant
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
Table1.First; // Déplace le curseur sur le premier enregistrement

end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
Table1.Last; // Déplace le curseur sur le dernier enregistrement

end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
Table1.Append;
if((Table1.RecordCount=0) and (Table1.State <> dsInsert)) then exit;
Ajouter.Enabled := True;
DBGrid1.ReadOnly := False ;
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
var Option : TLocateOptions;
begin

end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var  er : boolean;
begin
er:=false;


  if Nom.Text =''      then   MessageBox(0,'Saisie de Nom Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Raison.Text =''   then   MessageBox(0,'Saisie de Raison Sociale Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Adresse.Text =''  then   MessageBox(0,'Saisie de Adresse Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Wilaya.Text =''   then   MessageBox(0,'Saisie de Wilaya Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Activite.Text ='' then   MessageBox(0,'Saisie de Activité Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Produit.Text =''  then   MessageBox(0,'Saisie de Produit Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if TypeEnt.Text =''  then   MessageBox(0,'Saisie de Type Entreprise Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Statut.Text =''   then   MessageBox(0,'Saisie de Statut Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Capital.Text =''  then   MessageBox(0,'Saisie de Capital Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Annee.Text =''    then   MessageBox(0,'Saisie de Année Création Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Classe.Text =''   then   MessageBox(0,'Saisie de Classe Entreprise Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Tel.Text =''      then   MessageBox(0,'Saisie de Tel et Fax Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;
  if Email.Text =''    then   MessageBox(0,'Saisie de Email Obligatoire ...!','Erreur de Saisie ... !',MB_OK or MB_ICONSTOP) ;


  if (Nom.Text<>'')and(Raison.Text <>'')and(Adresse.Text<>'')and(Wilaya.Text<>'')and(Activite.Text<>'')and(Produit.Text<>'')and(TypeEnt.Text<>'')and(Statut.Text<>'')and(Capital.Text<>'')and(Annee.Text<>'')and(Classe.Text<>'')and(Tel.Text<>'')and(Email.Text<>'') then er:=True;


  if er=True then
  begin
Table1.Edit;

Table1.FieldByName('Nom').Value := Nom.Text  ;
Table1.FieldByName('Raison Sociale').Value := Raison.Text  ;
Table1.FieldByName('Adresse').Value := Adresse.Text  ;
Table1.FieldByName('Wilaya').Value := Wilaya.Text  ;
Table1.FieldByName('Activite').Value := Activite.Text  ;
Table1.FieldByName('Produits Services').Value := Produit.Text  ;
Table1.FieldByName('Type Entreprise').Value := TypeEnt.Text  ;
Table1.FieldByName('Statut').Value := Statut.Text  ;
Table1.FieldByName('Capital').Value := Capital.Text  ;
Table1.FieldByName('Classe Entreprise').Value := Classe.Text  ;
Table1.FieldByName('Tel Fax').Value := Tel.Text  ;
Table1.FieldByName('Email').Value := Email.Text  ;
Table1.FieldByName('Annee Creation').Value := Annee.Text  ;

Table1.Post();

Nom.Text :='' ;
Raison.Text :='' ;
Adresse.Text :='' ;
Wilaya.Text :='';
Activite.Text :='';
Produit.Text :='';
TypeEnt.Text :='' ;
Statut.Text :='';
Capital.Text :='';
Annee.Text :='';
Classe.Text :='';
Tel.Text:='' ;
Email.Text :='' ;

Modif.Caption:= '';
Modif.Enabled := False;
  end;
end;

procedure TForm1.SpeedButton13Click(Sender: TObject);
begin
Nom.Text :='';
Raison.Text :='';
Adresse.Text :='';
Wilaya.Text :='';
Activite.Text :='';
Produit.Text :='';
TypeEnt.Text :='';
Statut.Text :='';
Capital.Text :='';
Annee.Text :='';
Classe.Text :='';
Tel.Text :='';
Email.Text :='';

Modif.Caption:= '';
Modif.Enabled := False;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
If TDBGrid(Sender).DataSource.DataSet.RecNo/2=trunc(TDBGrid(Sender).DataSource.DataSet.RecNo/2)

Then

TDBGrid(Sender).Canvas.Brush.Color := clSilver

Else

TDBGrid(Sender).Canvas.Brush.Color := clwhite;

TDBGrid(Sender).DefaultDrawColumnCell(rect,datacol,column,state);
end;

procedure TForm1.Recherche1Click(Sender: TObject);
begin
//Form3.Showmodal;
end;

procedure TForm1.Recherche2Click(Sender: TObject);
begin
Form3.ShowModal;
end;

procedure TForm1.ListeComplte1Click(Sender: TObject);
begin
Form4.QuickRep1.Preview ;
end;

procedure TForm1.EditionFiltre1Click(Sender: TObject);
begin
Form6.QuickRep1.Preview ;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Table1.DatabaseName:=ExtractFilePath(ParamStr(0));
 Table1.Open;
end;

end.
