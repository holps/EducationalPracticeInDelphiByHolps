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
    PnlAddSettings: TPanel;
    StringGridArray: TStringGrid;
    EdtAddKey: TEdit;
    Rbtn11: TRadioButton;
    Rbtn13: TRadioButton;
    Rbtn17: TRadioButton;
    BtnAddKey: TButton;
    BtnSearchKey: TButton;
    LblAddSettings: TLabel;
    BtnResetArray: TButton;
    procedure BtnAddKeyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ArrayOutDisplay;
    procedure BtnSearchKeyClick(Sender: TObject);
    procedure BtnResetArrayClick(Sender: TObject);
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

//��������� ���� � ������
procedure TfMain.BtnAddKeyClick(Sender: TObject);
var
  KeyString: string;
  Column: Integer;
begin
  KeyString:= EdtAddKey.Text;
  AddKeyMainArray(KeyString);//<<���������� � ������ ����� � ��������������� ���-�������� ��������
  ArrayOutDisplay;
  EdtAddKey.Text := '';
  EdtAddKey.SetFocus;
end;

procedure TfMain.BtnResetArrayClick(Sender: TObject);
begin
  while StringGridArray.ColumnCount < m+1 do
  StringGridArray.AddObject(TStringColumn.Create(StringGridArray));
  StringGridArray.Cells[0,0]:= '������:';
  StringGridArray.Cells[0,1]:= '����:';
  StringGridArray.Cells[0,2]:= '������:';
  SetLength(MainArray,0);
  CreateArray();
  ArrayOutDisplay;
  EdtAddKey.SetFocus;
end;

procedure TfMain.BtnSearchKeyClick(Sender: TObject);
begin
  SearchKey(EdtAddKey.Text);
  EdtAddKey.Text := '';
  EdtAddKey.SetFocus;
end;

//�������� ��� �������� �����
procedure TfMain.FormCreate(Sender: TObject);
begin
  while StringGridArray.ColumnCount < m+1 do
  StringGridArray.AddObject(TStringColumn.Create(StringGridArray));
  StringGridArray.Cells[0,0]:= '������:';
  StringGridArray.Cells[0,1]:= '����:';
  StringGridArray.Cells[0,2]:= '������:';
  CreateArray();
  ArrayOutDisplay;
  EdtAddKey.SetFocus;
end;

//����� ������� �� �����
procedure TfMain.ArrayOutDisplay;
var
  Column, I: Integer;
begin
  Column:= 1;
  for I := Low(MainArray) to High(MainArray) do
    begin
      StringGridArray.Cells[Column,0]:= I.ToString;//<<������ �������
      StringGridArray.Cells[Column,1]:= MainArray[I].Keys.ToString;//<<����� �������
      StringGridArray.Cells[Column,2]:= MainArray[I].Info;//<<������ �������
      Inc(Column);
    end;
end;

end.
