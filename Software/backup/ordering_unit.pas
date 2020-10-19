unit ordering_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, Forms, Controls, Graphics, Dialogs, DBGrids,
  Buttons, DBCtrls, ExtCtrls, StdCtrls, ActnList, confirmation_unit;

type

  { TForm4 }

  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    DataSource8: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ListBox1: TListBox;
    RadioButton1: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    SQLQuery4: TSQLQuery;
    SQLQuery5: TSQLQuery;
    SQLQuery6: TSQLQuery;
    SQLQuery7: TSQLQuery;
    SQLQuery8: TSQLQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private

  public
   sumPrice, itemcounter : integer;
   listofitems: String;
  end;

var
  Form4: TForm4;
  item, numItems, i, deleteprice, deletenumitems, priceperitem, j : integer;
  wholeprice,tmplist,tempitem : string;
implementation

{$R *.lfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin
  SQLQuery1.UsePrimaryKeyAsKey := False;
  SQLQuery2.UsePrimaryKeyAsKey := False;
  SQLQuery3.UsePrimaryKeyAsKey := False;
  SQLQuery4.UsePrimaryKeyAsKey := False;
  SQLQuery5.UsePrimaryKeyAsKey := False;
  SQLQuery6.UsePrimaryKeyAsKey := False;
  SQLQuery7.UsePrimaryKeyAsKey := False;
  SQLQuery8.UsePrimaryKeyAsKey := False;
end;





procedure TForm4.BitBtn1Click(Sender: TObject);
begin
     Edit1.Text := '';
     Edit2.Text := '';
      //GroupBox1.Visible:=False;
      RadioButton9.Checked := False;
      RadioButton10.Checked := False;
      RadioButton11.Checked := False;
      RadioButton12.Checked := False;
      RadioButton13.Checked := False;
      RadioButton14.Checked := False;
      RadioButton15.Checked := False;
      RadioButton16.Checked := False;
      RadioButton17.Checked := False;
      RadioButton18.Checked := False;
      if SQLQuery1.Active then SQLQuery1.Close;
 if RadioButton1.Checked then
    begin
    try
       DBGrid1.DataSource := DataSource1;
       SQlQuery1.Open;
   except
       ShowMessage(' No, there is a problem. ');
   end;

    end
  else SQLQuery1.Close;
  if SQLQuery2.Active then SQLQuery2.Close;
  if RadioButton2.Checked then
    begin
    try
       DBGrid1.DataSource := DataSource2;
       SQLQuery2.Open;
   except
       ShowMessage(' No, there is a problem. ');
   end;

    end
  else SQLQuery2.Close;
  if SQLQuery3.Active then SQLQuery3.Close;
  if RadioButton3.Checked then
    begin
    try
       DBGrid1.DataSource := DataSource3;
       SQLQuery3.Open;
   except
       ShowMessage(' No, there is a problem. ');
   end;
    end
  else SQLQuery3.Close;
  if SQLQuery4.Active then SQLQuery4.Close;
  if RadioButton4.Checked then
    begin
    try
       DBGrid1.DataSource := DataSource4;
       SQLQuery4.Open;
   except
       ShowMessage(' No, there is a problem. ');
   end;
    end
  else SQLQuery4.Close;
  if SQLQuery5.Active then SQLQuery5.Close;
  if RadioButton5.Checked then
    begin
    try
       DBGrid1.DataSource := DataSource5;
       SQLQuery5.Open;
   except
       ShowMessage(' No, there is a problem. ');
   end;
    end
  else SQLQuery5.Close;
  if SQLQuery6.Active then SQLQuery6.Close;
  if RadioButton6.Checked then
    begin
    try
       DBGrid1.DataSource := DataSource6;
       SQLQuery6.Open;
   except
       ShowMessage(' No, there is a problem. ');
   end;
    end
  else SQLQuery6.Close;
  if SQLQuery7.Active then SQLQuery7.Close;
  if RadioButton7.Checked then
    begin
    try
       DBGrid1.DataSource := DataSource7;
       SQLQuery7.Open;
   except
       ShowMessage(' No, there is a problem. ');
   end;
    end
  else SQLQuery7.Close;
  if SQLQuery8.Active then SQLQuery8.Close;
  if RadioButton8.Checked then
    begin
    try
       DBGrid1.DataSource := DataSource8;
       SQLQuery8.Open;
   except
       ShowMessage(' No, there is a problem. ');
   end;
    end
  else SQLQuery8.Close;


end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
   item:=Strtoint(Edit2.Text);

   if MessageDlg('Question?','Do you want more then one piece from this type of drink?',mtConfirmation,[mbOk, mbNo, mbCancel], 0) = mrOk then
    begin

     GroupBox1.Visible:=True;

     if RadioButton9.Checked then numItems :=1 else RadioButton9.Checked := False;
     if RadioButton10.Checked then numItems :=2 else RadioButton10.Checked := False;
     if RadioButton11.Checked then numItems :=3 else RadioButton11.Checked := False;
     if RadioButton12.Checked then numItems :=4 else RadioButton12.Checked := False;
     if RadioButton13.Checked then numItems :=5 else RadioButton13.Checked := False;
     if RadioButton14.Checked then numItems :=6 else RadioButton14.Checked := False;
     if RadioButton15.Checked then numItems :=7 else RadioButton15.Checked := False;
     if RadioButton16.Checked then numItems :=8 else RadioButton16.Checked := False;
     if RadioButton17.Checked then numItems :=9 else RadioButton17.Checked := False;
     if RadioButton18.Checked then numItems :=10 else RadioButton18.Checked := False;

      sumPrice :=sumPrice + (numItems*item);

    end
else
   begin
    GroupBox1.Visible:=False;
    itemcounter:=itemcounter+1;
    sumPrice :=sumPrice + item ;
    ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text);
   end;

   Edit3.text := Inttostr(sumPrice);
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
   for i := 0 to ListBox1.Items.Count -1 do
     begin
      tempitem:= ListBox1.Items[i];
     tmplist:=listofitems;
     listofitems:= tmplist + tempitem +';';
     end;
         Form6:=TForm6.Create(Nil);
         Form6.ShowModal;
         FreeAndNil(Form6);
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
  Close;
end;


procedure TForm4.Button1Click(Sender: TObject);
begin
      if RadioButton9.Checked then
      begin
      numItems :=1;
      itemcounter := itemcounter + numItems;
      ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text);
      end
      else RadioButton9.Checked := False;
      if RadioButton10.Checked  then
      begin
      numItems :=2;
      itemcounter := itemcounter + numItems;
      ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text+ ' X 2;');
      end
      else RadioButton10.Checked := False;
      if RadioButton11.Checked then
      begin
      numItems :=3 ;
      itemcounter := itemcounter + numItems;
      ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text+ ' X 3;');
      end
      else RadioButton11.Checked := False;
      if RadioButton12.Checked then
      begin
      numItems :=4;
      itemcounter := itemcounter + numItems;
      ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text+ ' X 4;');
      end
      else RadioButton12.Checked := False;
      if RadioButton13.Checked then
      begin
      numItems :=5;
      itemcounter := itemcounter + numItems;
      ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text+ ' X 5;');
      end
      else RadioButton13.Checked := False;
      if RadioButton14.Checked then
      begin
      numItems :=6;
      itemcounter := itemcounter + numItems;
      ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text+ ' X 6;');
      end
      else RadioButton14.Checked := False;
      if RadioButton15.Checked then
      begin
      numItems :=7;
      itemcounter := itemcounter + numItems;
      ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text+ ' X 7;');
      end
      else RadioButton15.Checked := False;
      if RadioButton16.Checked then
      begin
      numItems :=8;
      itemcounter := itemcounter + numItems;
      ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text+ ' X 8;');
      end
      else RadioButton16.Checked := False;
      if RadioButton17.Checked then
      begin
      numItems :=9 ;
      itemcounter := itemcounter + numItems;
      ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text+ ' X 9;');
      end
      else RadioButton17.Checked := False;
      if RadioButton18.Checked then
      begin
      numItems :=10 ;
      itemcounter := itemcounter + numItems;
      ListBox1.Items.Add('Product: '+Edit1.Text+' Price: '+Edit2.Text+ ' X 10;');
      end
      else RadioButton18.Checked := False;

   sumPrice :=sumPrice + (numItems*item);
   Edit3.text := Inttostr(sumPrice);


end;

procedure TForm4.Button2Click(Sender: TObject);
begin

  if ListBox1.SelCount > 0 then
    for i:=ListBox1.Items.Count - 1 downto 0 do
      if ListBox1.Selected[i] then
      begin
      wholeprice := Listbox1.items[i].Split(':')[2];
       deletenumitems := Strtoint(wholeprice.Split('X')[1]);
        priceperitem := Strtoint(wholeprice.Split('X')[0].Trim);
       sumPrice := sumprice - (priceperitem*deletenumitems);
        ListBox1.Items.Delete(i);
      end;
    Edit3.text := Inttostr(sumPrice);
end;



procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
      Edit1.Text := '';
      Edit2.Text := '';
      RadioButton9.Checked := False;
      RadioButton10.Checked := False;
      RadioButton11.Checked := False;
      RadioButton12.Checked := False;
      RadioButton13.Checked := False;
      RadioButton14.Checked := False;
      RadioButton15.Checked := False;
      RadioButton16.Checked := False;
      RadioButton17.Checked := False;
      RadioButton18.Checked := False;
  if SQLQuery1.Active then
   begin
     Edit1.Text := SQLQuery1.FieldByName('ProductName').AsString;
     Edit2.Text := SQLQuery1.FieldByName('Price').AsString;
end else SQLQuery1.Close;
  if SQLQuery2.Active then
   begin
     Edit1.Text := SQLQuery2.FieldByName('ProductName').AsString;
     Edit2.Text := SQLQuery2.FieldByName('Price').AsString;
end else SQLQuery2.Close;
  if SQLQuery3.Active then
   begin
     Edit1.Text := SQLQuery3.FieldByName('ProductName').AsString;
     Edit2.Text := SQLQuery3.FieldByName('Price').AsString;
   end else SQLQuery3.Close;
  if SQLQuery4.Active then
   begin
     Edit1.Text := SQLQuery4.FieldByName('ProductName').AsString;
     Edit2.Text := SQLQuery4.FieldByName('Price').AsString;
end else SQLQuery4.Close;
  if SQLQuery5.Active then
     begin
       Edit1.Text := SQLQuery5.FieldByName('ProductName').AsString;
       Edit2.Text := SQLQuery5.FieldByName('Price').AsString;
end else SQLQuery5.Close;
  if SQLQuery6.Active then
     begin
       Edit1.Text := SQLQuery6.FieldByName('ProductName').AsString;
       Edit2.Text := SQLQuery6.FieldByName('Price').AsString;
end else SQLQuery6.Close;
  if SQLQuery7.Active then
     begin
       Edit1.Text := SQLQuery7.FieldByName('ProductName').AsString;
       Edit2.Text := SQLQuery7.FieldByName('Price').AsString;
end else SQLQuery7.Close;
  if SQLQuery8.Active then
     begin
       Edit1.Text := SQLQuery8.FieldByName('ProductName').AsString;
       Edit2.Text := SQLQuery8.FieldByName('Price').AsString;
end else SQLQuery8.Close;




end;


end.

