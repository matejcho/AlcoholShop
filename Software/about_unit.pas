unit about_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, ShellApi;

type

  { TForm3 }

  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Memo1: TMemo;
    procedure Memo1Click(Sender: TObject);

  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }



procedure TForm3.Memo1Click(Sender: TObject);
begin
  ShellExecute(0,nil, PChar('cmd'),PChar('/c start www.facebook.com/matejcho'),nil,0)
end;

end.

