//������ ������ � ��������

unit Hash;

interface

uses
    FMX.Dialogs, SysUtils;

type

  TMainArray = array of string;//<<���������� �������

const
  m = 11;
var
  MainArray: TMainArray;

procedure AddKeyMainArray(Words: string);//���������� � ������ �����
procedure CreateArray; //�������� �������
//procedure ExistArray(MainArray);//�������� ������������� �������
//������ �������
function KeyConversion(KeyWord: string): Integer;//���������� �������� ���-������� ��� ��������� �����
//���������� ���� ���� � ��������
function KeyIndex(Words: string): Integer;//���������� �������� ����������� ���-�������� ��� ��������� �����


implementation

//�������� �������
procedure CreateArray;
begin
  SetLength(MainArray, m);//<<�������� ����������� ������ �� ����, �������������
end;

//���������� � ������ �����
procedure AddKeyMainArray(Words: string);
begin
  MainArray[KeyIndex(Words)] := Words;
  ShowMessage(IntToStr(KeyIndex(Words)) + ' : ' + Words);//<<�������� ��� ��������
end;

//�������������� � ������������� ����������
function KeyConversion(KeyWord: string): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := Low (KeyWord) to High (KeyWord) do
    Result := Result + Ord(KeyWord[I]);//<<��������� ���� �������������� ��������
end;

//���������� �������� ����������� ���-�������� ��� ��������� �����
function KeyIndex(Words: string): Integer;
var
  x: Integer;
begin
  x := KeyConversion(Words);
  ShowMessage(IntToStr(x));//<<�������� ��� ��������
  Result := x mod m;
end;

//�����


//�������� ���������� ����������� ������

{
//����� �������� �������
procedure IndexPassArray; //������ �� �������
var
  I: Integer;
begin
  for I in MainArray do
      begin

      end;
end;

//����� ������ �������
procedure KeyPassArray;

begin

end;
}


end.
