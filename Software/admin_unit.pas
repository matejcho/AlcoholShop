unit admin_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, ExtCtrls, DBCtrls, Buttons;

type

  { TForm7 }

  TForm7 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
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
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure SQLQuery1AfterOpen(DataSet: TDataSet);
  private

  public

  end;

var
  Form7: TForm7;

implementation

{$R *.lfm}

{ TForm7 }

procedure TForm7.FormCreate(Sender: TObject);
begin
  SQLQuery1.UsePrimaryKeyAsKey := False;
   SQLQuery1.Open;
end;

procedure TForm7.SQLQuery1AfterOpen(DataSet: TDataSet);
begin
  Edit5.Text := SQLQuery1.FieldByName('ClientId').AsString;
end;

procedure TForm7.DBGrid1CellClick(Column: TColumn);
begin
     Edit5.Text := SQLQuery1.FieldByName('ClientId').AsString;
     Edit1.Text := SQLQuery1.FieldByName('Name').AsString;
     Edit2.Text := SQLQuery1.FieldByName('Address').AsString;
     Edit3.Text := SQLQuery1.FieldByName('Username').AsString;
     Edit4.Text := SQLQuery1.FieldByName('Lozinka').AsString;
end;

procedure TForm7.BitBtn1Click(Sender: TObject);
begin
  if SQLQuery1.Active then SQLQuery1.Close;

  if SQLQuery2.Active then SQLQuery2.Close;
   SQLQuery2.UsePrimaryKeyAsKey := False;
   SQLQuery2.SQL.Clear;
   SQLQuery2.SQL.Add('insert into Client (Name, Address, Username, Lozinka)');
   SQLQuery2.SQL.Add('values ('''+ Edit1.Text+''', '''+Edit2.Text+''', '''+Edit3.Text+''', '''+Edit4.Text+''' ) ');


  if MessageDlg('Question?','Do you want to CREATE new record?',mtWarning,[mbOk, mbNo, mbCancel], 0) = mrOk then
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

procedure TForm7.BitBtn2Click(Sender: TObject);
begin
  if SQLQuery1.Active then SQLQuery1.Close;

    if SQLQuery2.Active then SQLQuery2.Close;
     SQLQuery2.UsePrimaryKeyAsKey := False;
     SQLQuery2.SQL.Clear;
     SQLQuery2.SQL.Add('DELETE FROM Client ');
     SQLQuery2.SQL.Add('WHERE ClientId = '+Edit5.Text );


     if MessageDlg('Warning!','Do you want to delete this record?',mtWarning,[mbOk, mbNo, mbCancel], 0) = mrOk then
     begin
        try
            SQlQuery2.ExecSQL;
        except
           ShowMessage(' No, there is a problem. No delete!');
        end;
     end
     else MessageDlg('Information!','Nothing is deleted! ',mtInformation,[mbOk], 0);

     SQLQuery1.Open;
end;

procedure TForm7.BitBtn3Click(Sender: TObject);
begin
  if SQLQuery1.Active then SQLQuery1.Close;
     if SQLQuery2.Active then SQLQuery2.Close;

     SQLQuery2.UsePrimaryKeyAsKey := False;
      SQLQuery2.SQL.Clear;
      SQLQuery2.SQL.Add('update Client ');
      SQLQuery2.SQL.Add('set  ');
      SQLQuery2.SQL.Add('Name = '''+ Edit1.Text+'''  , ' );
      SQLQuery2.SQL.Add('Address = '''+ Edit2.Text+'''  ,' );
      SQLQuery2.SQL.Add('Username = '''+ Edit3.Text+'''  , ' );
      SQLQuery2.SQL.Add('Lozinka = '''+ Edit4.Text+''' ' );
      SQLQuery2.SQL.Add('where ClientId = '+ Edit5.Text);


     if MessageDlg('Question?','Do you want to UPDATE this record?',mtWarning,[mbOk, mbNo, mbCancel], 0) = mrOk then
        begin
            try
              SQlQuery2.ExecSQL;
            except
              ShowMessage(' No, there is a problem. ');
            end;
        end
       else
          MessageDlg('Information!','Nothing is being changed! Aborted! ',mtInformation,[mbOk], 0) ;


      SQLQuery1.Open;
end;

procedure TForm7.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

end.

