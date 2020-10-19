unit confirmation_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls, ExtCtrls;

type

  { TForm6 }

  TForm6 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Image1: TImage;
    Image2: TImage;
    ListBox1: TListBox;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  Form6: TForm6;
  totalPrice, numberOfItems, ClientId : Integer;
  listofitems,itemlist,address,OrderId : String;


implementation

{$R *.lfm}

{ TForm6 }
uses ordering_unit, login_unit;
procedure TForm6.BitBtn1Click(Sender: TObject);
begin

   Edit1.Visible := True;
   BitBtn2.Visible := True;


     //showmessage(itemlist)

end;

procedure TForm6.BitBtn2Click(Sender: TObject);
begin
  address:=Edit1.Text;
end;

procedure TForm6.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  SQLQuery1.UsePrimaryKeyAsKey := False;
  SQLQuery1.Open;
   totalPrice := Form4.sumprice;
   numberofitems := Form4.itemcounter;
   ClientId := Form2.id;
   listofitems := Form4.listofitems;
   address:=Form2.address;
   for i := 0 to Form4.ListBox1.Items.Count -1 do
     begin
      itemlist:=listofitems.Split(';')[i];
      ListBox1.Items.Add(itemlist+LineEnding);
     end;
end;

procedure TForm6.Image1Click(Sender: TObject);
begin
   Edit2.Text:=inttostr(ClientId);
   Edit3.Text:=address;
   Edit4.Text:=inttostr(numberofitems);
   Edit5.Text:=inttostr(totalprice);

   if SQLQuery1.Active then SQLQuery1.Close;

  if SQLQuery2.Active then SQLQuery2.Close;
   SQLQuery2.UsePrimaryKeyAsKey := False;
   SQLQuery2.SQL.Clear;
   SQLQuery2.SQL.Add('INSERT INTO Orders (ClientIdFk, OrderTo, NoOfProducts, TotalPrice)');
   SQLQuery2.SQL.Add('VALUES ('''+ Edit2.Text+''', '''+Edit3.Text+''', '''+Edit4.Text+''', '''+Edit5.Text+''' ) ');


  if MessageDlg('Question?','Do you want to CREATE new record?',mtConfirmation,[mbOk, mbNo, mbCancel], 0) = mrOk then
     begin
         try
           SQlQuery2.ExecSQL;
         except
           ShowMessage(' No, there is a problem. ');
         end;
     end
    else
       MessageDlg('Information!','Nothing is being inserted! Aborted! ',mtInformation,[mbOk], 0) ;


   SQLQuery1.Open;
end;

end.

