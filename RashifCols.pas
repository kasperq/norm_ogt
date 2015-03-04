unit RashifCols;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, kbmMemTable, Grids, DBGridEh, IniFiles;

type
  TFRashifCols = class(TForm)
    DBGridEh1: TDBGridEh;
    DSRashifCols: TDataSource;
    mem_rashifCols: TkbmMemTable;
    mem_rashifColsNAME: TStringField;
    mem_rashifColsVISIBLE: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    rashifColsSetsIni : TIniFile;

    procedure saveRashifColsSets;

  public
    showed : boolean;
    grid : ^TDBGridEh;

  end;

var
  FRashifCols: TFRashifCols;

implementation

{$R *.dfm}

uses dm;

procedure TFRashifCols.saveRashifColsSets;
begin
  mem_rashifCols.DisableControls;
  rashifColsSetsIni := TIniFile.Create(programPath + 'rashifCols.ini');
  rashifColsSetsIni.EraseSection('rashif_cols');
  mem_rashifCols.First;
  while (not mem_rashifCols.Eof) do
  begin
    rashifColsSetsIni.WriteBool('rashif_cols', IntToStr(mem_rashifCols.RecNo - 1), mem_rashifColsVISIBLE.AsBoolean);
    mem_rashifCols.Next;
  end;
  mem_rashifCols.EnableControls;
end;

procedure TFRashifCols.DBGridEh1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (showed) then
  begin
    grid.Columns[mem_rashifCols.RecNo - 1].Visible := not mem_rashifColsVISIBLE.AsBoolean;
  end;
end;

procedure TFRashifCols.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  saveRashifColsSets;
end;

procedure TFRashifCols.FormCreate(Sender: TObject);
begin
  mem_rashifCols.EmptyTable;
  mem_rashifCols.Open;
  new(grid);
end;

procedure TFRashifCols.FormDestroy(Sender: TObject);
begin
  mem_rashifCols.EmptyTable;
  mem_rashifCols.Close;
  grid.Free;
end;

procedure TFRashifCols.FormShow(Sender: TObject);
begin
  if (showed = false) then
    showed := true;
end;

end.
