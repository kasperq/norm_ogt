unit BasSyr_vvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DB, IBCustomDataSet, IBUpdateSQL, IBUpdSQLW, IBQuery,
  RxIBQuery, ComCtrls, ExtCtrls, DBCtrls, ToolWin, Grids, DBGridEh, FindDlgEh;

type
  TFBasSyr_vvod = class(TForm)
    DBGridEh2: TDBGridEh;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    BasSyr: TRxIBQuery;
    ImageList1: TImageList;
    BasSyrKSM_ID: TIntegerField;
    BasSyrKSM_BS: TIntegerField;
    BasSyrKORG: TIntegerField;
    BasSyrNMAT: TIBStringField;
    BasSyrNAM: TIBStringField;
    BasSyrNMAT_BS: TIBStringField;
    DSbasSyr: TDataSource;
    FindDlgEh1: TFindDlgEh;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh2SortMarkingChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBasSyr_vvod: TFBasSyr_vvod;

implementation
  uses dm;
{$R *.dfm}

procedure TFBasSyr_vvod.DBGridEh2SortMarkingChanged(Sender: TObject);
 var
  i :Integer;
begin
 Sort := ' ';
 for i := 0 to DBGridEh2.SortMarkedColumns.Count-1 do
 BEGIN
  if DBGridEh2.SortMarkedColumns[i].Title.SortMarker = smUpEh then
  begin
   Sort := Sort + '"'+ DBGridEh2.SortMarkedColumns[i].FieldName + '"'+ ' DESC , ';
  end
  else
  begin
   Sort := Sort + '"'+DBGridEh2.SortMarkedColumns[i].FieldName + '"'+ ', ';
  end;
 END;
 if Sort <> '' then
 begin
  Sort := Copy(Sort,1,Length(Sort)-2);
  BasSyr.Close;
  BasSyr.MacroByName('SORT').AsString:=SORT;
  BasSyr.Open;
 end;
end;

procedure TFBasSyr_vvod.FormShow(Sender: TObject);
begin
 SORT:=' MAT1.NMAT';
 IF BasSyr.Active THEN BasSyr.cLOSE;
 BasSyr.MacroByName('SORT').AsString:=SORT;
 BasSyr.Open;
 end;

end.
