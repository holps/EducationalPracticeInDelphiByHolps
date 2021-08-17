unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.Edit;

type
  TfMain = class(TForm)
    PnlManualGenData: TPanel;
    PnlAutoGenData: TPanel;
    LblPnlManualGenData: TLabel;
    LblPnlAutoGenData: TLabel;
    LblKey: TLabel;
    EdtKey: TEdit;
    BtnAddNode: TButton;
    LblCountNode: TLabel;
    EdtCountNode: TEdit;
    BtnRandom: TButton;
    PnlSearchNodeByKey: TPanel;
    PnlMgmtData: TPanel;
    LblPnlSearchNodeByKey: TLabel;
    LblSearchKey: TLabel;
    EdtSearchKey: TEdit;
    BtnSearchNodeByKey: TButton;
    LblPnlMgmtData: TLabel;
    BtnResetBinarySearchTree: TButton;
    PnlOutDataVisualView: TPanel;
    LblInputKeySequence: TLabel;
    LblOutTreeInDirectOrder: TLabel;
    LblOutTreeInSymmetricOrder: TLabel;
    MemoInputKeySequence: TMemo;
    MemoOutTreePreOrder: TMemo;
    MemoOutTreeInOrder: TMemo;
    BtnPreOrderBinarySearchTree: TButton;
    BtnInOrderBinarySearchTree: TButton;
    procedure Show(const Msg: string);
    procedure BtnAddNodeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSearchNodeByKeyClick(Sender: TObject);
    procedure BtnPreOrderBinarySearchTreeClick(Sender: TObject);
    procedure BtnInOrderBinarySearchTreeClick(Sender: TObject);
    procedure BtnResetBinarySearchTreeClick(Sender: TObject);
    procedure BtnRandomClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;
  //WorkTree: pTreeNode;

implementation

{$R *.fmx}

uses BSTree;

//Фокус при открытии формы на ввод ключа
procedure TfMain.FormShow(Sender: TObject);
begin
    EdtKey.SetFocus;
end;

//Форматирование текста вывода последовательности ключей
procedure TfMain.Show(const Msg: string);
begin
  MemoInputKeySequence.Lines.Text := MemoInputKeySequence.Text + Msg + ' -> ';
end;

//Вывод на экран дерева в прямом порядке
procedure TfMain.BtnPreOrderBinarySearchTreeClick(Sender: TObject);
var LvlRootNode: Integer;
s: string;
begin
  s := '';
  LvlRootNode := 0;
  PreOrder(WorkTree, LvlRootNode, s);
  MemoOutTreePreOrder.Lines.Add(s);
end;

//Процедура вывода на экран дерева в симметричном порядке
procedure TfMain.BtnInOrderBinarySearchTreeClick(Sender: TObject);
var LvlRootNode: Integer;
s: string;
begin
  s := '';
  LvlRootNode := 0;
  InOrder(WorkTree, LvlRootNode, s);
  MemoOutTreeInOrder.Lines.Add(s);
end;

//Вывод на экран входной последовательности ключей
 procedure TfMain.BtnAddNodeClick(Sender: TObject);
var
  TextKey: Integer;
begin
  TextKey := EdtKey.Text.ToInteger;
  if (EdtKey.Text = '') then
    begin
      ShowMessage('Не задан ключ нового узла!');
      EdtKey.SetFocus;
    end
  else
    begin
      AddNode(WorkTree,TextKey);
      Show(IntToStr(TextKey)); //Вывод вершин в последовательности ввода пользователем
      EdtKey.Text := '';
      EdtKey.SetFocus;
    end;
end;

//Вывод на экран найденной вершины
procedure TfMain.BtnSearchNodeByKeyClick(Sender: TObject);
begin
  if (EdtSearchKey.Text = '') then
    begin
      ShowMessage('Требуется ввести значение!');
      EdtSearchKey.SetFocus;
    end
   else
     begin
       SearchKey(EdtSearchKey.Text.ToInteger);
       EdtSearchKey.Text := '';
     end;
end;

//Блок генерации дерева произвольными ключами с заданным пользователем количеством вершин
procedure TfMain.BtnRandomClick(Sender: TObject);
var
  CountNode: Integer;
  NewKey: Integer;
begin
  CountNode := EdtCountNode.Text.ToInteger;
  while CountNode > 0 do  //<<Заполняем дерево с заданным количеством вершин
    begin
      Randomize;
      NewKey := 1 + Random(100); //Выставляем диапазон случайных чисел
      AddNode(WorkTree,NewKey);
      Show(IntToStr(NewKey));
      Dec(CountNode);
    end;

end;

//Сброс: удаление дерева, reset forms
procedure TfMain.BtnResetBinarySearchTreeClick(Sender: TObject);
begin
  MemoInputKeySequence.Lines.Clear;
  MemoOutTreePreOrder.Lines.Clear;
  MemoOutTreeInOrder.Lines.Clear;
  EdtKey.Text := '';
  EdtSearchKey.Text := '';
  EdtCountNode.Text := '';
  FreeBSTree(WorkTree);
  EdtKey.SetFocus;
end;


end.
