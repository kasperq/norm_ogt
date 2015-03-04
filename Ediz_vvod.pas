unit Ediz_vvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, ImgList, IBUpdateSQL, IBUpdSQLW, IBQuery,
  RxIBQuery, ComCtrls, ExtCtrls, DBCtrls, ToolWin, Grids, DBGridEh,UtilRIB;

type
  TFEdiz_vvod = class(TForm)
    DBGridEh2: TDBGridEh;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    Ediz: TRxIBQuery;
    IBUpdateEdiz: TIBUpdateSQLW;
    DSEdiz: TDataSource;
    ImageList1: TImageList;
    EdizKEI_ID: TSmallintField;
    EdizNEIS: TIBStringField;
    EdizDECZNAK: TSmallintField;
    ImageList2: TImageList;
    ToolButton4: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdiz_vvod: TFEdiz_vvod;

implementation
  uses dm;
{$R *.dfm}

procedure TFEdiz_vvod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (ediz.Modified) or (ediz.State =dsEdit)
  or (ediz.State =dsInsert) then
  ediz.Post;
 if ediz.UpdatesPending  then
 begin
     if MessageDlg('Записать изменения?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
     begin
      try
       ediz.ApplyUpdates;
       DM1.IBT_Write.CommitRetaining;
      except
       MessageDlg('Произошла ошибка при записи !', mtWarning, [mbOK], 0);
       ediz.CancelUpdates;
       DM1.IBT_Write.RollbackRetaining;
      end;
     end
     else
     begin
      ediz.CancelUpdates;
      DM1.IBT_Write.RollbackRetaining;
     end;
 end;
 ediz.Close;
 dm1.IBT_Write.Active:=false;
 dm1.IBT_Write.Active:=true;
 dm1.IBT_read.Active:=false;
 dm1.IBT_Read.Active:=true;
end;

procedure TFEdiz_vvod.FormShow(Sender: TObject);
begin
 if ediz.Active then ediz.Active:=false;
 ediz.Active:=true;
end;

procedure TFEdiz_vvod.ToolButton1Click(Sender: TObject);
var acc: variant;
begin
 acc:=SelectToVarIB('SELECT distinct normn.kei_id FROM normn WHERE '+
 ' normn.kei_id = '+inttostr(edizKei_id.AsInteger),dm1.belmed,dm1.ibt_read);
 If acc<>Null then
 begin
  MessageDlg('Запись нельзя удалять!', mtWarning, [mbOK], 0);
  abort;
 end
 else
   Ediz.Delete;
end;

procedure TFEdiz_vvod.ToolButton2Click(Sender: TObject);
begin
 ediz.Append;
end;

procedure TFEdiz_vvod.ToolButton3Click(Sender: TObject);
begin
 if (ediz.Modified) or (ediz.State =dsEdit)
    or (ediz.State =dsInsert) then
  ediz.Post;
  dm1.startWriteTrans;
 try
  if ediz.UpdatesPending then
   ediz.ApplyUpdates;
  DM1.IBT_Write.CommitRetaining;
 except
  on E: Exception do
  begin
   MessageDlg('Произошла ошибка при записи !'+E.Message, mtWarning, [mbOK], 0);
   raise;
   ediz.CancelUpdates;
   DM1.IBT_Write.RollbackRetaining;
  end;
 end;
 ediz.Close;
 dm1.IBT_Write.Active:=false;
 dm1.IBT_Write.Active:=true;
 dm1.IBT_read.Active:=false;
 dm1.IBT_Read.Active:=true;
 ediz.Open;
end;

procedure TFEdiz_vvod.ToolButton4Click(Sender: TObject);
begin
 dm1.Copy_Ediz;
end;

end.
