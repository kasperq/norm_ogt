unit Rashif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Grids, DBGridEh, DBCtrls, StdCtrls, Buttons, ExtCtrls, Spin,
  ComCtrls, ToolWin, Mask,RxStrUtils,VCLUtils, DB, DBTables, IBCustomDataSet,
  IBQuery,DateUtils,SplshWnd,RxMemDS, Placemnt,FileUtil, ToolEdit, RxIBQuery,
  Menus, IniFiles, kbmMemTable;

type
  TFRashif = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton4: TToolButton;
    Label1: TLabel;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    Panel1: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label22: TLabel;
    Label19: TLabel;
    Label29: TLabel;
    Label21: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label41: TLabel;
    SpeedButton2: TSpeedButton;
    Label53: TLabel;
    Label34: TLabel;
    Label51: TLabel;
    Label27: TLabel;
    Label52: TLabel;
    Label43: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    DBNavigator2: TDBNavigator;
    DBGridEh3: TDBGridEh;
    ImageList1: TImageList;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label23: TLabel;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    DATABox: TDBLookupListBox;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Label14: TLabel;
    RadioGroup2: TRadioGroup;
    Splitter1: TSplitter;
    Label10: TLabel;
    Label17: TLabel;
    ToolButton1: TToolButton;
    FormStorage1: TFormStorage;
    Splitter2: TSplitter;
    Panel2: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    ToolButton2: TToolButton;
    calcKursCenaBtn: TToolButton;
    kursGB: TGroupBox;
    kursPrintBtn: TToolButton;
    showRashifColsBtn: TToolButton;
    percEdit: TLabeledEdit;
    procedure ProsmRashif;
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinEdit2Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure DATABoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ComboBox1Change(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure calcKursCenaBtnClick(Sender: TObject);
    procedure kursPrintBtnClick(Sender: TObject);
    procedure DBGridEh3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure showRashifColsBtnClick(Sender: TObject);
    procedure percEditChange(Sender: TObject);

  private
//    rashifColsSetsIni : TIniFile;

    function findLastNorm(kodPrep : integer; normDate : string) : boolean;
    procedure calcKurs;
//    procedure readRashifColsSettings;

  public
    { Public declarations }
  end;

var
   FRashif: TFRashif;
   dAT_Doc: tdate;
   v_doc: integer;
   yr:integer;
   mm:integer;
   dd:integer;
   vDocNorm_id:integer;

implementation

uses dm, Find_Spprod, Find_Matrop, Decode_Spprod, Razdel, RashifCols;
{$R *.dfm}

procedure TFRashif.calcKursCenaBtnClick(Sender: TObject);
begin
  calcKurs;
end;

procedure TFRashif.calcKurs;
begin
  dm1.Rashif.DisableControls;
  dm1.forceCalc := false;
  dm1.Rashif.First;
  while (not dm1.Rashif.Eof) do
  begin
    dm1.calcKursRashifRecord;
    dm1.Rashif.Next;
  end;
  dm1.Rashif.First;
  dm1.Rashif.EnableControls;
end;

procedure TFRashif.ComboBox1Change(Sender: TObject);
begin
  god := SpinEdit2.Value;
  mes := ComboBox1.ItemIndex+1;
  IF (MES < 10) THEN
    S_MES := '0' + INTTOSTR(MES)
  ELSE
    S_MES := INTTOSTR(MES);
  S_DAT1 := '01.' + S_MES + '.' + copy(INTTOSTR(GOD), 3, 2);
  S_DAT2 := datetostr(IncMonth(strtodate(s_dat1), 1) -1);
end;

procedure TFRashif.DATABoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if s_kodp<>0 then
   begin
    if (dm1.Datcen.Active) then
    begin
     s_dat_cen:=datetostr(dm1.DatcenDatcen.AsDateTime);
     ProsmRashif;
    end
    else
    begin
     dm1.Datcen.ParamByName('DATN1').AsDate :=StrToDate(s_dat_cen1);
     dm1.Datcen.ParamByName('DATN2').AsDate :=StrToDate(s_dat_cen2);
     dm1.Datcen.Active :=True;
     s_dat_cen:=datetostr(dm1.DatcenDatcen.AsDateTime);
     ProsmRashif;
    end;
   end;
end;

procedure TFRashif.DBGridEh3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if (dm1.RashifVC.AsInteger > 0) and (dm1.kurs) then
    DBGridEh3.Canvas.Brush.Color := clMoneyGreen;
  DBGridEh3.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFRashif.Edit1Change(Sender: TObject);
begin
if edit1.text<>''   then begin
 skod:=replacestr(edit1.text,',','.')+'%';
 DM1.IBQuery1.Active := False;
 DM1.IBQuery1.SQL.Clear;
 DM1.IBQuery1.SQL.Add('SELECT SPPROD.STRUK_ID,SPPROD.NMAT, SPPROD.KOD_PROD, SPPROD.KEI_ID,SPPROD.KSM_ID');
 DM1.IBQuery1.SQL.Add(' FROM SPPROD');
 DM1.IBQuery1.SQL.Add(' WHERE SPPROD.KOD_PROD like '+''''+skod+'''');
 DM1.IBQuery1.Active := True;
 if not dm1.IBQuery1.Eof then
  begin
   s_kodp:=DM1.IBQuery1.FieldByName('ksm_id').AsInteger;
   Label19.Caption:=DM1.IBQuery1.FieldByName('kod_PROD').Asstring+DM1.IBQuery1.FieldByName('nmat').AsString;
  end
  else
  begin
   s_kodp:=0;
   Label19.Caption:='';
 end;
 Label19.Refresh;
end;
end;

procedure TFRashif.Edit1Click(Sender: TObject);
begin
  edit1.text := '';
end;

procedure TFRashif.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (s_kodp <> 0) then
    begin
      EDIT1.OnChange := nil;
      edit1.text := DM1.IBQuery1.FieldByName('kod_PROD').Asstring;
      EDIT1.OnChange := Edit1Change;
      DM1.IBQuery1.Active := False;
      DM1.IBQuery1.SQL.Clear;
      DM1.IBQuery1.SQL.Add('SELECT SPPROD.STRUK_ID,SPPROD.NMAT, SPPROD.KOD_PROD, '
                           + 'SPPROD.KEI_ID, SPPROD.KSM_ID, spprod.sprod_id,');
      DM1.IBQuery1.SQL.Add('SPPROD.GOST, EDIZ.NEIS,SPPROD.KORG, SPPROD.XARKT, '
                           + 'SPPROD.ACTIVP, SPRORG.NAM,');
      DM1.IBQuery1.SQL.Add('SPVIS.NAMEVIS, PRSYR.NAMSPSR, STRUK.STNAME, REGION.NAM NAME_REG');
      DM1.IBQuery1.SQL.Add(' FROM SPPROD');
      DM1.IBQuery1.SQL.Add(' INNER JOIN EDIZ ON (SPPROD.KEI_ID = EDIZ.KEI_ID)');
      DM1.IBQuery1.SQL.Add(' left JOIN SPRORG ON (SPPROD.KORG = SPRORG.KOD)');
      DM1.IBQuery1.SQL.Add(' left JOIN REGION ON (SPPROD.Reg = REGION.reg)');
      DM1.IBQuery1.SQL.Add(' INNER JOIN SPVIS ON (SPPROD.SPVIS = SPVIS.SPVIS)');
      DM1.IBQuery1.SQL.Add(' INNER JOIN PRSYR ON (SPPROD.SPSR = PRSYR.SPSR)');
      DM1.IBQuery1.SQL.Add(' INNER JOIN STRUK ON (SPPROD.STRUK_ID = STRUK.STRUK_ID)');
      DM1.IBQuery1.SQL.Add(' WHERE SPPROD.Ksm_id=' + inttostr(s_kodp));
      DM1.IBQuery1.Active := True;
      s_gost := DM1.IBQuery1.FieldByName('GOST').AsString;
      s_xarkt := DM1.IBQuery1.FieldByName('XARKT').AsString;
      s_nmat := DM1.IBQuery1.FieldByName('NMAT').AsString;
      s_kei := DM1.IBQuery1.FieldByName('KEI_ID').VALUE;
      s_korg := DM1.IBQuery1.FieldByName('KORG').VALUE;
      s_kodProd := DM1.IBQuery1.FieldByName('KOD_PROD').AsString;
      s_namorg := DM1.IBQuery1.FieldByName('NAM').AsString;
      s_neiz := DM1.IBQuery1.FieldByName('NEIS').AsString;
      s_reg := DM1.IBQuery1.FieldByName('Name_Reg').AsString;
      s_pr_syr := DM1.IBQuery1.FieldByName('Namspsr').AsString;
      s_vid_isp := DM1.IBQuery1.FieldByName('Namevis').AsString;
      s_stname := DM1.IBQuery1.FieldByName('STNAME').AsString;
      struk := DM1.IBQuery1.FieldByName('struk_ID').AsInteger;
      s_sprod := DM1.IBQuery1.FieldByName('sprod_ID').AsInteger;
      label8.caption := s_stname;
      label19.caption := s_NMAT;
      label27.caption := s_vid_isp;
      label34.caption := s_pr_syr;
      label43.caption := s_reg;
      label29.caption := s_namorg;
      label21.caption := s_Neiz;
      label22.caption := s_GOST;
      label41.caption := s_Xarkt;
//    DM1.VoprosWriteNorm;
//    ProsmRashif;
      if (dm1.Datcen.Active)  then
      begin
        if (not dm1.datcen.Eof) then
          s_dat_cen := datetostr(dm1.DatcenDatcen.AsDateTime)
        else
          s_dat_cen := ''
      end
      else
      begin
        dm1.Datcen.ParamByName('DATN1').AsDate := StrToDate(s_dat_cen1);
        dm1.Datcen.ParamByName('DATN2').AsDate := StrToDate(s_dat_cen2);
        dm1.Datcen.Active := True;
        s_dat_cen := datetostr(dm1.DatcenDatcen.AsDateTime);
      end;
      ProsmRashif;
    end;
  end;
end;


procedure TFRashif.FormCreate(Sender: TObject);
begin
  Radiogroup2.ItemIndex := 0;
  vtip_op_id := 120;
  v_tip_dok := 103;
  pr_itogi := 'p';
  label14.Caption := ' Полная расшифровка ';
  label17.Caption := '';
  s_dat_cen := '';
//  if (dm1.kurs) then
//    readRashifColsSettings;
end;

//procedure TFRashif.readRashifColsSettings;
//var
//  indx : integer;
//begin
//  rashifColsSetsIni := TIniFile.Create(programPath + 'rashifCols.ini');
//  if (FRashifCols = nil) then
//    FRashifCols := TFRashifCols.Create(self);
//  FRashifCols.mem_rashifCols.Open;
//  FRashifCols.mem_rashifCols.EmptyTable;
//  for indx := 0 to DBGridEh3.Columns.Count - 1 do
//  begin
//    FRashifCols.mem_rashifCols.Append;
//    FRashifCols.mem_rashifCols.Edit;
//    FRashifCols.mem_rashifColsNAME.AsString := DBGridEh3.Columns[indx].Title.Caption;
//    FRashifCols.mem_rashifColsVISIBLE.AsBoolean := rashifColsSetsIni.ReadBool('rashif_cols',
//                                                                              IntToStr(indx),
//                                                                              DBGridEh3.Columns[indx].Visible);
//    FRashifCols.mem_rashifCols.Post;
//    if (DBGridEh3.Columns[indx].Title.Caption = 'CALC') then
//      DBGridEh3.Columns[indx].Visible := true
//    else
//      DBGridEh3.Columns[indx].Visible := FRashifCols.mem_rashifColsVISIBLE.AsBoolean;
//  end;
//end;

procedure TFRashif.FormShow(Sender: TObject);
begin
  dm1.IBT_WRITE.Active := FALSE;
  dm1.IBT_READ.Active := FALSE;
  dm1.startRWTranss;
  if (FRazdel = nil) then
    FRazdel := TFRazdel.Create(Application);
  FRazdel.Razdel.Active := true;
  SpinEdit2.OnChange := nil;
  SpinEdit2.Value := god;
  SpinEdit2.OnChange := SpinEdit2Change;
  ComboBox1.OnChange := nil;
  ComboBox1.ItemIndex := mes - 1;
  ComboBox1.OnChange := ComboBox1Change;
  if (s_kodp <> 0) then
  begin
  DM1.IBQuery1.Active := False;
  DM1.IBQuery1.SQL.Clear;
  DM1.IBQuery1.SQL.Add('SELECT SPPROD.STRUK_ID,SPPROD.NMAT, SPPROD.KOD_PROD, SPPROD.KEI_ID,SPPROD.KSM_ID,');
  DM1.IBQuery1.SQL.Add('SPPROD.GOST,EDIZ.NEIS,SPPROD.KORG,SPPROD.XARKT,SPPROD.ACTIVP,SPRORG.NAM,');
  DM1.IBQuery1.SQL.Add('SPVIS.NAMEVIS, PRSYR.NAMSPSR,STRUK.STNAME, REGION.NAM NAME_REG');
  DM1.IBQuery1.SQL.Add(' FROM SPPROD');
  DM1.IBQuery1.SQL.Add(' INNER JOIN EDIZ ON (SPPROD.KEI_ID = EDIZ.KEI_ID)');
  DM1.IBQuery1.SQL.Add(' left JOIN SPRORG ON (SPPROD.KORG = SPRORG.KOD)');
  DM1.IBQuery1.SQL.Add(' left JOIN REGION ON (SPPROD.Reg = REGION.reg)');
  DM1.IBQuery1.SQL.Add(' INNER JOIN SPVIS ON (SPPROD.SPVIS = SPVIS.SPVIS)');
  DM1.IBQuery1.SQL.Add(' INNER JOIN PRSYR ON (SPPROD.SPSR = PRSYR.SPSR)');
  DM1.IBQuery1.SQL.Add(' INNER JOIN STRUK ON (SPPROD.STRUK_ID = STRUK.STRUK_ID)');
  DM1.IBQuery1.SQL.Add(' WHERE SPPROD.Ksm_id='+inttostr(s_kodp));
  DM1.IBQuery1.Active := True;
  EDIT1.OnChange:=nil;
  edit1.text:=DM1.IBQuery1.FieldByName('kod_PROD').Asstring;
  EDIT1.OnChange:=Edit1Change;
  s_gost:=DM1.IBQuery1.FieldByName('GOST').AsString;
  s_xarkt:=DM1.IBQuery1.FieldByName('XARKT').AsString;
  s_nmat:=DM1.IBQuery1.FieldByName('NMAT').AsString;
  s_kei:=DM1.IBQuery1.FieldByName('KEI_ID').VALUE;
  s_korg:=DM1.IBQuery1.FieldByName('KORG').VALUE;
  s_kodProd:=DM1.IBQuery1.FieldByName('KOD_PROD').AsString;
  s_namorg:=DM1.IBQuery1.FieldByName('NAM').AsString;
  s_neiz:=DM1.IBQuery1.FieldByName('NEIS').AsString;
  s_reg:=DM1.IBQuery1.FieldByName('Name_Reg').AsString;
  s_pr_syr:=DM1.IBQuery1.FieldByName('Namspsr').AsString;
  s_vid_isp:=DM1.IBQuery1.FieldByName('Namevis').AsString;
  s_stname:= DM1.IBQuery1.FieldByName('STNAME').AsString;
  label8.caption:=s_stname;
  label19.caption:=s_NMAT;
  label27.caption:=s_vid_isp;
  label34.caption:=s_pr_syr;
  label43.caption:=s_reg;
  label29.caption:=s_namorg;
  label21.caption:=s_Neiz;
  label22.caption:=s_GOST;
  label41.caption:=s_Xarkt;
  s_dat_cens:='';
  if dm1.Datcen.Active =False then
  begin
   IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
   S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
   S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
   if mes<>1 then
   begin
    mes_c:=mes-1;
    god_c:=god;
   end
   else
   begin
    mes_c:=12;
    god_c:=god-1;
   end;
   SpinEdit3.OnChange:=nil;
   SpinEdit4.OnChange:=nil;
   SpinEdit3.Value:=mes_c;
   SpinEdit4.Value:=god_c;
   SpinEdit3.OnChange:=SpinEdit3Change;
   SpinEdit4.OnChange:=SpinEdit4Change;
   s_dat_cen1:='01.'+inttostr(MES_c)+'.'+copy(INTTOSTR(GOD_c),3,2);
   s_dat_cen2:=datetostr(IncMonth(strtodate(s_dat_cen1),1)-1);
   dm1.Datcen.Active :=False;
   dm1.Datcen.ParamByName('DATN1').AsDate :=StrToDate(s_dat_cen1);
   dm1.Datcen.ParamByName('DATN2').AsDate :=StrToDate(s_dat_cen2);
   dm1.Datcen.Active :=True;
   if dm1.Datcen.Eof then
   begin
    if mes_c<>1 then
    begin
     mes_c:=mes_c-1;
     god_c:=god_c;
    end
    else
    begin
     mes_c:=12;
     god_c:=god_c-1;
    end;
    SpinEdit3.OnChange:=nil;
    SpinEdit4.OnChange:=nil;
    SpinEdit3.Value:=mes_c;
    SpinEdit4.Value:=god_c;
    SpinEdit3.OnChange:=SpinEdit3Change;
    SpinEdit4.OnChange:=SpinEdit4Change;
    s_dat_cen1:='01.'+inttostr(MES_c)+'.'+copy(INTTOSTR(GOD_c),3,2);
    s_dat_cen2:=datetostr(IncMonth(strtodate(s_dat_cen1),1)-1);
    dm1.Datcen.Active :=False;
    dm1.Datcen.ParamByName('DATN1').AsDate :=StrToDate(s_dat_cen1);
    dm1.Datcen.ParamByName('DATN2').AsDate :=StrToDate(s_dat_cen2);
    dm1.Datcen.Active :=True;
    if dm1.datcen.Eof then s_dat_cen:='';
   end
   else s_dat_cen:=datetostr(dm1.DatcenDatcen.AsDateTime);
  end
  else s_dat_cen:=datetostr(dm1.DatcenDatcen.AsDateTime);
  prosmRashif;
 end
 else
 begin
  label19.Caption:='';
  label21.Caption:='';
  label8.Caption:='';
  label22.Caption:='';
  label29.Caption:='';
  label41.Caption:='';
  label34.Caption:='';
  label27.Caption:='';
  label43.Caption:='';
  IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
  S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
  S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
  if mes<>1 then
  begin
    mes_c:=mes-1;
    god_c:=god;
  end
  else
  begin
    mes_c:=12;
    god_c:=god-1;
  end;
  SpinEdit3.OnChange:=nil;
  SpinEdit4.OnChange:=nil;
  SpinEdit3.Value:=mes_c;
  SpinEdit4.Value:=god_c;
  SpinEdit3.OnChange:=SpinEdit3Change;
  SpinEdit4.OnChange:=SpinEdit4Change;
  s_dat_cen1:='01.'+inttostr(MES_c)+'.'+copy(INTTOSTR(GOD_c),3,2);
  s_dat_cen2:=datetostr(IncMonth(strtodate(s_dat_cen1),1)-1);
  dm1.Datcen.Active :=False;
  dm1.Datcen.ParamByName('DATN1').AsDate :=StrToDate(s_dat_cen1);
  dm1.Datcen.ParamByName('DATN2').AsDate :=StrToDate(s_dat_cen2);
  dm1.Datcen.Active :=True;
  if dm1.Datcen.Eof then
  begin
   if mes_c<>1 then
   begin
    mes_c:=mes_c-1;
    god_c:=god_c;
   end
   else
   begin
    mes_c:=12;
    god_c:=god_c-1;
   end;
   SpinEdit3.OnChange:=nil;
   SpinEdit4.OnChange:=nil;
   SpinEdit3.Value:=mes_c;
   SpinEdit4.Value:=god_c;
   SpinEdit3.OnChange:=SpinEdit3Change;
   SpinEdit4.OnChange:=SpinEdit4Change;
   s_dat_cen1:='01.'+inttostr(MES_c)+'.'+copy(INTTOSTR(GOD_c),3,2);
   s_dat_cen2:=datetostr(IncMonth(strtodate(s_dat_cen1),1)-1);
   dm1.Datcen.Active :=False;
   dm1.Datcen.ParamByName('DATN1').AsDate :=StrToDate(s_dat_cen1);
   dm1.Datcen.ParamByName('DATN2').AsDate :=StrToDate(s_dat_cen2);
   dm1.Datcen.Active :=True;
    if (dm1.Datcen.Eof) then
      s_dat_cen := '';
    end
    else
      s_dat_cen := datetostr(dm1.DatcenDatcen.AsDateTime);
    databox.SetFocus;
  end;

//  kursGB.Visible := dm1.kurs;
//  calcKursCenaBtn.Visible := dm1.kurs;
  dm1.percents := StrToInt(percEdit.Text);
  kursPrintBtn.Visible := dm1.kurs;
//  showRashifColsBtn.Visible := dm1.kurs;
  if (not dm1.kurs) then
  begin
    DBGridEh3.Columns[12].Visible := dm1.kurs;
  end;
end;

procedure TFRashif.kursPrintBtnClick(Sender: TObject);
begin
  if (vDocument_id <> 0) then
  begin
    dm1.kursPrint := true;
    dm1.r_sprod.Active := False;
    dm1.r_sprod.MacroByName('usl').AsString := ' spprod.ksm_id=' + inttostr(s_kodp)
                                               + ' and spprod.struk_id=' + inttostr(struk);
    dm1.r_sprod.MacroByName('ut_tek_plan').AsString := '';
    dm1.r_sprod.ParamByName('mes').AsInteger := mes;
    dm1.r_sprod.ParamByName('god').AsInteger := god;
    dm1.r_sprod.Active := true;
    if (dm1.ITOGI.Active) then
      dm1.ITOGI.Active := false;
    dm1.ITOGI.MacroByName('usl').AsString := ' itogi.mes=' + inttostr(mes)
                                             + ' and itogi.god='
                                             + inttostr(god)+ ' and itogi.kodp='
                                             + inttostr(s_kodp)
                                             + ' and itogi.datec=' + '''' + s_dat_cen
                                             + '''' + ' and itogi.pr=' + ''''
                                             + pr_itogi + '''';
    dm1.ITOGI.Active := true;
    if (dm1.p_rashif.Active) then
      dm1.p_rashif.Close;
    dm1.p_rashif.EmptyTable;
    dm1.p_rashif.LoadFromDataSet(DM1.rashif, [mtcpoAppend]);
    dm1.p_rashif.Active := True;
    dm1.p_rashif.First;
    if (RadioGroup2.ItemIndex = 0) then
      s_prras := 'p'
    else
      s_prras := 'k';
    DM1.p_rashif.First;
    while (not DM1.p_rashif.Eof) do
    begin
      DM1.p_rashif.Edit;
      DM1.p_rashifPrras.AsString := s_prras;
      DM1.p_rashif.Post;
      DM1.p_rashif.Next;
    end;
    s_kodp_s := 0;
    struks := 0;
    DM1.FrxReport1.LoadFromFile(reportPath + 'P_rashg_kurs2.fr3');
    DM1.FrxReport1.ShowReport(true);
  end;
end;

procedure TFRashif.percEditChange(Sender: TObject);
begin
  if (percEdit.Text = '') then
    dm1.percents := 0
  else
    dm1.percents := StrToInt(percEdit.Text);
end;

procedure TFRashif.RadioGroup2Click(Sender: TObject);
begin
  IF (Radiogroup2.ItemIndex = 0) THEN
  begin
    pr_itogi := 'p';
    vtip_op_id := 120;
    v_tip_dok := 103;
    label14.Caption := ' Полная расшифровка ';
  end
  else
  begin
    pr_itogi := 'k';
    vtip_op_id := 119;
    v_tip_dok := 104;
    Label14.Caption := ' Короткая расшифровка ';
  end;
  if (edit1.Text <> '') then
    ProsmRashif;
end;

procedure TFRashif.SpeedButton2Click(Sender: TObject);
begin
  if (FindSpprod = nil) then
    FindSpprod := TfindSpprod.Create(Application);
  FindSpprod.DataBaseName := dm1.BELMED;
  FindSpprod.ReadOnly := true;
  FindSpprod.ShowModal;
  if (FindSpprod.ModalResult > 50) then
  begin
    EDIT1.OnChange := nil;
    edit1.text := FindSpprod.IBSpprodKod_Prod.Asstring;
    EDIT1.OnChange := Edit1Change;
    s_kodp := FindSpprod.ModalResult - 50;
    s_gost := FindSpprod.IBSpprodGOST.AsString;
    s_xarkt := FindSpprod.IBSpprodXARKT.AsString;
    s_nmat := FindSpprod.IBSpprodNMAT.AsString;
    s_kei := FindSpprod.IBSpprodKEI_ID.VALUE;
    s_korg := FindSpprod.IBSpprodKORG.VALUE;
    s_kodProd := FindSpprod.IBSpprodKOD_PROD.AsString;
    s_namorg := FindSpprod.IBSpprodNAME_ORG.AsString;
    s_neiz := FindSpprod.IBSpprodNEIS.AsString;
    s_reg := FindSpprod.IBSpprod.FieldByName('Name_Reg').AsString;
    s_pr_syr := FindSpprod.IBSpprod.FieldByName('Namspsr').AsString;
    s_vid_isp := FindSpprod.IBSpprod.FieldByName('Namevis').AsString;
    s_stname := FindSpprod.IBSpprod.FieldByName('STNAME').AsString;
    struk := FindSpprod.IBSpprod.FieldByName('struk_ID').AsInteger;
    s_sprod := FindSpprod.IBSpprod.FieldByName('sprod_ID').AsInteger;
    label19.caption := s_NMAT;
    label8.caption := s_stname;
    label29.caption := s_namorg;
    label21.caption := s_Neiz;
    label22.caption := s_GOST;
    label41.caption := s_Xarkt;
    label27.caption := s_vid_isp;
    label34.caption := s_pr_syr;
    label43.caption := s_reg;
  //  DM1.VoprosWriteNorm;
    if (edit1.Text <> '') then
      ProsmRashif;
  end;
end;

procedure TFRashif.SpinEdit2Change(Sender: TObject);
begin
  god := SpinEdit2.Value;
  IF (MES < 10) THEN
    S_MES := '0' + INTTOSTR(MES)
  ELSE
    S_MES := INTTOSTR(MES);
  S_DAT1 := '01.' + S_MES + '.' + copy(INTTOSTR(GOD), 3, 2);
  S_DAT2 := datetostr(IncMonth(strtodate(s_dat1), 1) - 1);
end;

procedure TFRashif.SpinEdit3Change(Sender: TObject);
begin
 s_god12:=inttostr(SpinEdit4.Value);
 s_mes12:=inttostr(SpinEdit3.Value);
 IF SpinEdit3.Value<10 THEN S_MES12:='0'+INTTOSTR(SpinEdit3.Value) ELSE S_MES12:=INTTOSTR(SpinEdit3.Value);
 S_DAT_cen1:='01.'+S_MES12+'.'+copy(s_GOD12,3,2);
 S_DAT_cen2:=datetostr(IncMonth(strtodate(s_dat_cen1),1)-1);
 dm1.Datcen.Active :=False;
 dm1.Datcen.ParamByName('DATN1').AsDate :=StrToDate(s_dat_cen1);
 dm1.Datcen.ParamByName('DATN2').AsDate :=StrToDate(s_dat_cen2);
 dm1.Datcen.Active :=True;
end;

procedure TFRashif.SpinEdit4Change(Sender: TObject);
begin
 s_god12:=inttostr(SpinEdit4.Value);
 s_mes12:=inttostr(SpinEdit3.Value);
 IF SpinEdit3.Value<10 THEN S_MES12:='0'+INTTOSTR(SpinEdit3.Value) ELSE S_MES12:=INTTOSTR(SpinEdit3.Value);
 S_DAT_cen1:='01.'+S_MES12+'.'+copy(s_GOD12,3,2);
 S_DAT_cen2:=datetostr(IncMonth(strtodate(s_dat_cen1),1)-1);
 dm1.Datcen.Active :=False;
 dm1.Datcen.ParamByName('DATN1').AsDate :=StrToDate(s_dat_cen1);
 dm1.Datcen.ParamByName('DATN2').AsDate :=StrToDate(s_dat_cen2);
 dm1.Datcen.Active :=True;
end;

procedure TFRashif.ToolButton1Click(Sender: TObject);
begin
  ProsmRashif;
end;

procedure TFRashif.ToolButton2Click(Sender: TObject);
begin
  if (s_kodp <> 0) and (pr_itogi = 'p') then
  begin
    if (S_dat_cen = '') then
    begin
      MessageDlg('Задайте дату цены!', mtWarning, [mbOK], 0);
      Abort;
    end;
    if (dm1.IBT_Read.Active) then
      dm1.IBT_Read.Active := false;
    if (dm1.IBT_WRITE.Active) then
      dm1.IBT_WRITE.Active:=false;
    dm1.startRWTranss;
    Splash := ShowSplashWindow(AniBmp1,
                               'Загрузка данных. Подождите, пожалуйста...', True, nil);
    DM1.IBQuery1.Close;
    DM1.IBQuery1.SQL.Clear;
    DM1.IBQuery1.SQL.Add('select document.date_op,doc_id from document');
    DM1.IBQuery1.SQL.Add(' where document.date_op<=' + '''' + s_dat1 + '''');
    DM1.IBQuery1.SQL.Add(' and tip_op_id=119');
    DM1.IBQuery1.SQL.Add(' and document.klient_id=' + inttostr(s_kodp));
    DM1.IBQuery1.SQL.Add(' order by date_op');
    DM1.IBQuery1.Open;
    if (not DM1.IBQuery1.Eof) then
    begin
// из Normn
      DM1.IBQuery1.Last;
      vDocNorm_id := DM1.IBQuery1.FieldByName('doc_id').AsInteger;
      s_dat_rashif := datetostr(DM1.IBQuery1.FieldByName('date_op').AsdateTime);
      if (not dm1.PfNorm.Eof) then
        dm1.PfNorm.Close;
      dm1.PfNorm.ParamByName('doc').AsInteger := vdocnorm_id;
      dm1.PfNorm.Open;
      if (not dm1.PfNorm.Eof) then
// расчет расшифровки
      begin
        if (StrToDate(s_dat_rashif) < StrToDate('01.11.2009')) then
          Pr_ARX := 1
        else
          Pr_Arx := 0;
// Pr_Arx - признок архива: 1-данные берутся из ARXNORM, 0-из NORMn
        DM1.RaschRashif;
      end;
    end;
    Splash.Free;
    dm1.IBQuery1.Close;
  end;
  ProsmRashif;
end;

procedure TFRashif.showRashifColsBtnClick(Sender: TObject);
begin
  FRashifCols.grid := @DBGridEh3;
  FRashifCols.Show;
end;

procedure TFRashif.ToolButton4Click(Sender: TObject);
begin
  if (vDocument_id <> 0) then
  begin
    dm1.kursPrint := false;
    dm1.r_sprod.Active := False;
    dm1.r_sprod.MacroByName('usl').AsString := ' spprod.ksm_id=' + inttostr(s_kodp)
                                               + ' and spprod.struk_id=' + inttostr(struk);
    dm1.r_sprod.MacroByName('ut_tek_plan').AsString := '';
    dm1.r_sprod.ParamByName('mes').AsInteger := mes;
    dm1.r_sprod.ParamByName('god').AsInteger := god;
    dm1.r_sprod.Active := true;
    if (dm1.ITOGI.Active) then
      dm1.ITOGI.Active := false;
    dm1.ITOGI.MacroByName('usl').AsString := ' itogi.mes=' + inttostr(mes)
                                             + ' and itogi.god='
                                             + inttostr(god)+ ' and itogi.kodp='
                                             + inttostr(s_kodp)
                                             + ' and itogi.datec=' + '''' + s_dat_cen
                                             + '''' + ' and itogi.pr=' + ''''
                                             + pr_itogi + '''';
    dm1.ITOGI.Active := true;
    if (dm1.p_rashif.Active) then
      dm1.p_rashif.Close;
    dm1.p_rashif.EmptyTable;
    dm1.p_rashif.LoadFromDataSet(DM1.rashif, [mtcpoAppend]);
    dm1.p_rashif.Active := True;
    dm1.p_rashif.First;
    if (RadioGroup2.ItemIndex = 0) then
      s_prras := 'p'
    else
      s_prras := 'k';
    DM1.p_rashif.First;
    while (not DM1.p_rashif.Eof) do
    begin
      DM1.p_rashif.Edit;
      DM1.p_rashifPrras.AsString := s_prras;
      DM1.p_rashif.Post;
      DM1.p_rashif.Next;
    end;
    s_kodp_s := 0;
    struks := 0;
    DM1.FrxReport1.LoadFromFile(reportPath + 'P_rashg.fr3');
    DM1.FrxReport1.ShowReport(true);
//DM1.FrReport1.LoadFromFile(reportPath + 'P_rashg.fr3');
// DM1.FrReport1.ShowReport;
  end;
end;

procedure TFRashif.ToolButton5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  s_kodp_spr := s_kodp;
end;

procedure TFRashif.ToolButton6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  s_ksm_spr := DM1.rashifKsm_id.asinteger;
end;

function TFRashif.findLastNorm(kodPrep : integer; normDate : string) : boolean;
var
  year, month, day : word;
  monthStr : string;
begin
  result := false;
  DM1.IBQuery1.Active := False;
  DM1.IBQuery1.SQL.Clear;
  DM1.IBQuery1.SQL.Text := 'select document.date_op, doc_id from document'
                           + ' where document.date_op <= ' + '''' + normDate + ''''
                           + ' and tip_op_id = 119'
                           + ' and document.klient_id = ' + inttostr(kodPrep)
                           + ' order by date_op desc';
  DM1.IBQuery1.Open;

  DecodeDate(StrToDate(normDate), year, month, day);
  if (month = 1) then
  begin
    month := 12;
    year := year - 1;
  end
  else
    month := month - 1;
  if (month < 10) then
    monthStr := '0';
  normDate := '01.' + monthStr + IntToStr(month) + '.' + IntToStr(year);

  if (not dm1.IBQuery1.Eof) then
  begin
    dm1.findNorm.Close;
    dm1.findNorm.ParamByName('doc_id').AsInteger := dm1.IBQuery1.FieldByName('doc_id').AsInteger;
    dm1.findNorm.Open;
    if (dm1.findNorm.Eof) and (year > 2009) then
      findLastNorm(kodPrep, normDate)
    else
      result := true;
  end
  else
    if (year > 2009) then
      findLastNorm(kodPrep, normDate);
end;

procedure TFRashif.ProsmRashif;
begin
  if (s_kodp <> 0) then
  begin
    if (S_dat_cen = '') then
    begin
      MessageDlg('Задайте дату цены!', mtWarning, [mbOK], 0);
      Abort;
    end;                         
    if (dm1.IBT_Read.Active) then
      dm1.IBT_Read.Active := false;
    if (dm1.IBT_WRITE.Active) then
      dm1.IBT_WRITE.Active:=false;
    dm1.startRWTranss;
    dm1.Datcen.Active := False;
    dm1.Datcen.ParamByName('DATN1').AsDate := StrToDate(s_dat_cen1);
    dm1.Datcen.ParamByName('DATN2').AsDate := StrToDate(s_dat_cen2);
    dm1.Datcen.Active := True;
    Splash := ShowSplashWindow(AniBmp1,
                               'Загрузка данных. Подождите, пожалуйста...', True, nil);
    vDocument_id := 0;
    findLastNorm(s_kodp, s_dat1);
    if (not DM1.IBQuery1.Eof) then
    begin
// из Normn
      vDocument_id := DM1.IBQuery1.FieldByName('doc_id').AsInteger;
      vDocNorm_id := DM1.IBQuery1.FieldByName('doc_id').AsInteger;
      s_dat_rashif := datetostr(DM1.IBQuery1.FieldByName('date_op').AsdateTime);
      if (pr_itogi = 'p') then
      begin
        if (DM1.DOCUMENT.active) then
          DM1.DOCUMENT.Close;
        DM1.DOcUMENT.MacroByName('USL').AsString := 'WHERE DOcUMENT.STRUK_ID='
                                                    + INTTOSTR(VsTRUK_ID)
                                                    + ' AND (DOCUMENT.TIP_OP_ID=120)'
                                                    + ' and document.klient_id='
                                                    + inttostr(s_kodp)
                                                    + ' AND Document.Date_op='
                                                    + '''' + s_dat_rashif + '''';
        DM1.DOCUMENT.OPEN;
        if (not DM1.DOCUMENT.Eof) then
          vdocument_id := DM1.DOCUMENT.FieldByName('doc_id').AsInteger
        else
        begin
          if (not dm1.PfNorm.Eof) then
            dm1.PfNorm.Close;
          dm1.PfNorm.ParamByName('doc').AsInteger := vdocnorm_id;
          dm1.PfNorm.Open;
          if (not dm1.PfNorm.Eof) then
// расчет расшифровки
          begin
            vTip_Op_Id := 120;
            v_Tip_Dok := 103;
            if (StrToDate(s_dat_rashif) < StrToDate('01.11.2009')) then
              Pr_ARX := 1
            else
              Pr_Arx := 0;
// Pr_Arx - признок архива: 1-данные берутся из ARXNORM, 0-из NORMn
            DM1.RaschRashif;
          end;
        end;
      end;
      label17.Caption := DM1.MesName_1(Monthof(strtodate(s_dat_rashif)))
                         + ' ' + IntToStr(Yearof(strtodate(s_dat_rashif))) + ' г.';
      if (dm1.SumRash_Razd.Active) then
        dm1.SumRash_Razd.Close;
      dm1.SumRash_Razd.ParamByName('datcen').AsDateTime := strtodate(s_dat_cen);
      dm1.SumRash_Razd.ParamByName('doc').AsInteger := vdocument_id;
      dm1.SumRash_Razd.Open;
      dm1.sumRash_Razd.First;
      if (dm1.ITOGI.Active) then
        dm1.ITOGI.Active := false;
      dm1.ITOGI.MacroByName('usl').AsString := ' itogi.mes=' + inttostr(mes)
                                               + ' and itogi.god=' + inttostr(god)
                                               + ' and itogi.kodp=' + inttostr(s_kodp)
                                               + ' and itogi.datec=' + ''''
                                               + s_dat_cen + '''' + ' and itogi.pr='
                                               + '''' + pr_itogi + '''';
      dm1.ITOGI.Active := true;
      if (not dm1.ITOGI.Eof) then
        while (not dm1.ITOGI.Eof) do
          dm1.ITOGI.Delete;
      while (not dm1.SumRash_Razd.Eof) do
      begin
        DM1.ITOGI.Insert;
        DM1.ITOGI.FieldByName('Kodp').AsInteger := s_kodp;
        DM1.ITOGI.FieldByName('sprod_id').AsInteger := s_sprod;
        DM1.ITOGI.FieldByName('SUM_it').AsFloat := dm1.sumRash_Razd.FieldByName('Sumcennorm').AsFloat;
        DM1.ITOGI.FieldByName('struk_id').AsInteger := struk;
        DM1.ITOGI.FieldByName('SUMNDS').AsFloat := dm1.sumRash_Razd.FieldByName('Sumcennorm_nds').AsFloat;
        DM1.ITOGI.FieldByName('doc_id').AsInteger := vdocument_id;
        DM1.ITOGI.FieldByName('datec').AsDateTime := strtodate(s_dat_cen);
        DM1.ITOGI.FieldByName('datei').AsDateTime := date();
        DM1.ITOGI.FieldByName('kraz').AsInteger := dm1.sumRash_Razd.FieldByName('kodraz').AsInteger;
        DM1.ITOGI.FieldByName('mes').AsInteger := Mes;
        DM1.ITOGI.FieldByName('god').AsInteger := god;
        DM1.ITOGI.FieldByName('pr').AsString := pr_itogi;
        DM1.ITOGI.Post;
        dm1.SumRash_Razd.Next;
      end;
      dm1.startRWTranss;
      try
        if (DM1.Itogi.UpdatesPending) then
          DM1.Itogi.ApplyUpdates;
        DM1.IBT_WRITE.Commit;
        DM1.IBT_READ.CommitRetaining;
      except
        On E: Exception do
        begin
          MessageDlg('Произошла ошибка при записи данных!' + E.Message, mtWarning, [mbOK], 0);
          DM1.IBT_WRITE.RollbackRetaining;
        end;
      end;
      DM1.itogi.Close;
      dm1.IBT_WRITE.Active := false;
      dm1.IBT_Read.Active := false;
      dm1.IBT_Read.Active := true;
      dm1.IBT_WRITE.Active := true;
      if (dm1.rashif.Active) then
        dm1.rashif.Close;
      dm1.rashif.ParamByName('datcen').AsDateTime := strtodate(s_dat_cen);
      dm1.rashif.ParamByName('doc').AsInteger := vdocument_id;
      dm1.rashif.Open;
      if (dm1.PfNorm.Active) then
        dm1.PfNorm.Close;
      dm1.PfNorm.ParamByName('doc').AsInteger := vdocnorm_id;
      dm1.PfNorm.Open;
      if (dm1.Datcen.Active) then
        dm1.Datcen.Close;
      dm1.Datcen.ParamByName('DATN1').AsDate := StrToDate(s_dat_cen1);
      dm1.Datcen.ParamByName('DATN2').AsDate := StrToDate(s_dat_cen2);
      dm1.Datcen.Active := True;
      if (not dm1.SumRash_Razd.Active) then
      begin
        dm1.SumRash_Razd.ParamByName('datcen').AsDateTime := strtodate(s_dat_cen);
        dm1.SumRash_Razd.ParamByName('doc').AsInteger := vdocument_id;
        dm1.SumRash_Razd.Open;
      end;
      Splash.Free;
    end
    else
    begin
// из архива  *********************************************************************************************//
      IF (DM1.NORMArx.Active = true) then
        DM1.NormArx.Close;
      DM1.NormArx.ParamByName('kod').AsInteger := s_kodp;
      DM1.NormArx.ParamByName('god').AsInteger := god;
      DM1.NormArx.ParamByName('mes').AsInteger := mes;
      DM1.NormArx.Open;
      DM1.NORMArx.First;
      if (not DM1.NORMArx.Eof) then
      begin
        if (DM1.DOCUMENT.active) then
          DM1.DOCUMENT.Close;
        DM1.DOcUMENT.MacroByName('USL').AsString := 'WHERE DOcUMENT.STRUK_ID='
                                                    + INTTOSTR(VsTRUK_ID)
                                                    + ' AND (DOCUMENT.TIP_OP_ID=119)'
                                                    + ' and document.klient_id='
                                                    + inttostr(s_kodp)
                                                    + ' AND Document.Date_op='
                                                    + '''' + s_dat1 + '''';
        DM1.DOCUMENT.OPEN;
        dm1.Document.First;
        if (dm1.Document.Locate('Tip_op_id', 119, [])) then
          vDocument_id := dm1.DocumentDoc_id.AsInteger
        else
        begin
          vNDoc := 'Нор' + inttostr(S_Kodp) + '-' + inttostr(mes) + '.' + inttostr(god);
          vDat_op := strtodate(s_dat1);
          vTip_Op_Id := 119;
          v_Tip_Dok := 102;
          dm1.Document.Insert;
          dm1.Document.Post;
        end;
        dm1.openNorm(s_kodp, god, mes, 119);
        while (not DM1.NORMArx.Eof) do
        begin
          dm1.Norm.Insert;
          dm1.setNormRec(-32000, s_kodp, dm1.NormArx.FieldByName('Kraz').Asinteger,
                         dm1.NormArx.FieldByName('Ksm_id').Asinteger, dm1.NormArx.FieldByName('Struk_ID').AsInteger,
                         dm1.NormArx.FieldByName('Kei_id').Asinteger, dm1.NormArx.FieldByName('Razdel_id').AsInteger,
                         dm1.NormArx.FieldByName('Prpf').AsInteger, dm1.NormArx.FieldByName('Pr_Ov').AsInteger,
                         Mes, God, 119, dm1.NormArx.FieldByName('Plnorm').AsFloat,
                         dm1.NormArx.FieldByName('Nazprpf').AsString, dm1.NormArx.FieldByName('Nmat').AsString,
                         dm1.NormArx.FieldByName('Neis').AsString, dm1.NormArx.FieldByName('Gost').AsString,
                         dm1.NormArx.FieldByName('Xarkt').AsString, dm1.NormArx.FieldByName('Kod_Prod').AsString,
                         s_dat1, '-32000', '-32000');
          dm1.Norm.Post;
          dM1.NormArx.next;
        end;
        DM1.ApplyUpdatesNorm;
        dm1.norm.Close;
        dm1.document.Close;
        dm1.IBT_WRITE.Active := FALSE;
        dm1.IBT_READ.Active := FALSE;
        ProsmRashif;
      end
      else
      begin
        Splash.Free;
        abort;
      end;
    end;
//  ^^^^ из архива          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
  end;

  if (dm1.kurs) then
    calcKurs;
end;

end.
