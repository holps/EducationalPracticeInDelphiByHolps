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
var
  y: Integer;
begin
  y:= 0;//<<������� ����� ���������
  if MainArray[KeyIndex(Words)].IsNullOrEmpty(MainArray[KeyIndex(Words)]) then //<<�������� ������ �� �������. �������. ���� ������ ����������� �� �����.
    begin
      inc(y);
      //ShowMessage(MainArray[KeyIndex(Words)]);
      MainArray[KeyIndex(Words)] := Words;
      ShowMessage(IntToStr(KeyIndex(Words)) + ' : ' + Words + '. ����� ���������: ' + y.ToString);
    end
    else
      begin

        ShowMessage('������ �� �����');

        //����� ���������� �����
        //������� ���������
      end;


      //ShowMessage(MainArray[KeyIndex(Words)]);
      //MainArray[KeyIndex(Words)] := Words;

      //ShowMessage(IntToStr(KeyIndex(Words)) + ' : ' + Words);//<<�������� ��� ��������
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
  //ShowMessage(IntToStr(x));//<<�������� ��� ��������
  Result := x mod m;
end;

//����� ��������� ������ �������� ������������
function SearchFreeIndex(KI: Integer): Integer;
var i: Integer;
begin
        for i := 0 to m-2 do
          begin
            Result :=  ((KI + i) mod m)+ 1;
            ShowMessage(Result.ToString);
            //AddKeyMainArray(Words);
          end;
end;



//�������� ���������� ����������� ������



end.
