unit welcome_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  login_unit, about_unit, odbcconn, sqldb, signup_unit;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Image1: TImage;
    ODBCConnection1: TODBCConnection;
    SQLTransaction1: TSQLTransaction;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    Form2:=TForm2.Create(Nil);
    Form2.ShowModal;
    FreeAndNil(Form2);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
    Form5:=TForm5.Create(Nil);
    Form5.ShowModal;
    FreeAndNil(Form5);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
    Form3:=TForm3.Create(Nil);
    Form3.ShowModal;
    FreeAndNil(Form3);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ODBCConnection1.Driver := 'Microsoft Access Driver (*.mdb, *.accdb)';
    ODBCConnection1.Params.Add('DBQ=c:\AlchoholShop\Data\Beverages.accdb');      // or specify full path to mdb file
    ODBCConnection1.Params.Add('Locale Identifier=1031');
    ODBCConnection1.Params.Add('ExtendedAnsiSQL=1');
    ODBCConnection1.Params.Add('CHARSET=ansi');
    ODBCConnection1.Connected := True;
    ODBCConnection1.KeepConnection := True;
    //ShowMessage(' Connection established!');
    SQLTransaction1.DataBase := ODBCConnection1;
    SQLTransaction1.Action := caCommit;
    SQLTransaction1.Active := True;
    //ShowMessage(' Transaction connection - Connection established!');
end;

end.

