unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Edit;

type
  TfMain = class(TForm)
    PnlAddKey: TPanel;
    PnlMgmtData: TPanel;
    PnlAddSettings: TPanel;
    StringGridArray: TStringGrid;
    EdtAddKey: TEdit;
    BtnOutDisplay: TButton;
    BtnReset: TButton;
    Rbtn11: TRadioButton;
    Rbtn13: TRadioButton;
    Rbtn17: TRadioButton;
    BtnAddKey: TButton;
    BtnSearchKey: TButton;
    LblAddSettings: TLabel;
    procedure BtnAddKeyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.fmx}

uses Hash;


procedure TfMain.BtnAddKeyClick(Sender: TObject);
var
  KeyString: string;
  Column, I: Integer;
begin
  Column:= 1;
  KeyString:= EdtAddKey.Text;
  AddKeyMainArray(KeyString);//<<Добавление в массив ключа с преобразованных хэш-функцией индексом
//-----------------------------
//Блок вывода на экран значений в массиве
//Начало
    for I := Low(MainArray) to High(MainArray) do
    begin
      StringGridArray.Cells[Column,0]:= I.ToString;
      StringGridArray.Cells[Column,1]:= MainArray[I];
      Inc(Column);
    end;
//Конец
//-----------------------------
end;


procedure TfMain.FormCreate(Sender: TObject);
begin
  while StringGridArray.ColumnCount < m+1 do
  StringGridArray.AddObject(TStringColumn.Create(StringGridArray));
  StringGridArray.Cells[0,0]:= 'Индекс';
  StringGridArray.Cells[0,1]:= 'Ключ';
  CreateArray();
end;

end.
