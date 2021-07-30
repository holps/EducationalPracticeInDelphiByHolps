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
    EdtInfo: TEdit;
    LblInfo: TLabel;
    BtnAddNode: TButton;
    LblNumberOfNodes: TLabel;
    EdtNumberOfNodes: TEdit;
    BtnFillTree: TButton;
    PnlSearchNodeByKey: TPanel;
    PnlMgmtData: TPanel;
    LblPnlSearchNodeByKey: TLabel;
    LblSearchKey: TLabel;
    EdtSearchKey: TEdit;
    BtnSearchNodeByKey: TButton;
    LblPnlMgmtData: TLabel;
    BtnResetBinarySearchTree: TButton;
    PnlOutDataVisualView: TPanel;
    LblDataAsIs: TLabel;
    LblOutTreeInDirectOrder: TLabel;
    LblOutTreeInSymmetricOrder: TLabel;
    MemoDataAsIs: TMemo;
    MemoOutTreeInDirectOrder: TMemo;
    MemoOutTreeInSymmetricOrder: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.fmx}

end.
