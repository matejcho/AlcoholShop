unit login_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, sqldb, odbcconn, db, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ordering_unit;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private

  public
  id : integer;
  address:string;
  end;

var
  Form2: TForm2;
  i: integer;

implementation

{$R *.lfm}

{ TForm2 }
uses admin_unit;
procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then Edit2.PasswordChar := #0
                                 else Edit2.PasswordChar := '*';
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  if (Edit1.Text = 'Admin') and (Edit2.Text = 'admin') then
     begin

         Form7:=TForm7.Create(Nil);
         Form7.ShowModal;
         FreeAndNil(Form7);

         Close;

      end
  else
  begin
  if SQLQuery1.Active then SQLQuery1.Close;
  SQLQuery1.UsePrimaryKeyAsKey := False;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Text := 'select * from Client where Username = '''+Edit1.Text
                                             +''' and Lozinka = '''+Edit2.Text+'''   ';
  SQLQuery2.UsePrimaryKeyAsKey := False;
  SQLQuery2.SQL.Clear;
  SQLQuery2.SQL.Text := 'select ClientId AS ClientId from Client where Username = '''+Edit1.Text
                                              +''' and Lozinka = '''+Edit2.Text+'''   ';
  SQLQuery3.UsePrimaryKeyAsKey := False;
  SQLQuery3.SQL.Clear;
  SQLQuery3.SQL.Text := 'select Address AS Address from Client where Username = '''+Edit1.Text
                                              +''' and Lozinka = '''+Edit2.Text+'''   ';
  //address:=SQLQuery1.FieldByName('Address').AsString;
   SqlQuery1.Open;
  if SQLQuery2.Active then SQLQuery2.Close;
  if SQLQuery3.Active then SQLQuery3.Close;
  if SQLQuery1.RecordCount > 0 then
     begin

     SQLQuery1.Close;
     SQLQuery2.Open;
     if SQLQuery2.Active then
        begin
          Edit3.Text := SQLQuery2.FieldByName('ClientId').AsString;
          id := strtoint(Edit3.Text);

        end;
     SQLQuery2.Close;
     SQLQuery3.Open;
     if SQLQuery3.Active then
     begin
        address := SQLQuery3.FieldByName('Address').AsString;
      end;
     Form4:=TForm4.Create(Nil);
     Form4.ShowModal;
     FreeAndNil(Form4);

     Close;

      end
  else
  begin
    ShowMessage(' Wrong user or pasword! Try again!');
          Inc(i);
          if i = 3 then Close;

  end;
  end;



end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

