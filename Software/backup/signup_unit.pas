unit signup_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, odbcconn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, ExtCtrls, login_unit;

type

  { TForm5 }

  TForm5 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form5: TForm5;

implementation

{$R *.lfm}

{ TForm5 }
procedure TForm5.BitBtn1Click(Sender: TObject);
begin
 if Edit4.text = Edit5.text then
  begin
   if SQLQuery1.Active then SQLQuery1.Close;

  if SQLQuery2.Active then SQLQuery2.Close;
   SQLQuery2.UsePrimaryKeyAsKey := False;
   SQLQuery2.SQL.Clear;
   SQLQuery2.SQL.Add('insert into Client (Name, Address, Username, Lozinka)');
   SQLQuery2.SQL.Add('values ('''+ Edit1.Text+''', '''+Edit2.Text+''', '''+Edit3.Text+''', '''+Edit4.Text+''' ) ');

   //ShowMessage(' the query is '+SQlQuery2.SQL.Text);

  if MessageDlg('Question?','Do you want to CREATE new record?',mtWarning,[mbOk, mbNo, mbCancel], 0) = mrOk then
     begin
         try
           SQlQuery2.ExecSQL;
            Form2.ShowModal;
         except
           ShowMessage(' No, there is a problem. ');
         end;
     end
    else
       MessageDlg('Information!','Nothing is being inserted! Aborted! ',mtInformation,[mbOk], 0) ;


   SQLQuery1.Open;
  end;
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  SQLQuery1.UsePrimaryKeyAsKey := False;
   SQLQuery1.Open;


end;



end.

