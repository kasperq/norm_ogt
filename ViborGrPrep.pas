unit ViborGrPrep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DBCtrls, ComCtrls, StdCtrls, ExtCtrls, Spin,
  ImgList, ToolWin, RxMemDS, rxSplshWnd, DateUtils, IBCustomDataSet, IBUpdateSQL,
  IBUpdSQLW, DB, IBQuery, RxIBQuery,Utilr, DBGrids, rxFileUtil, kbmmemTable,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, System.UITypes;

type
  TFViborGrPrep = class(TForm)
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    Label1: TLabel;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    Label4: TLabel;
    R_pf: TRxIBQuery;
    R_pfLEKKOD: TIBStringField;
    R_pfKSM_ID: TIntegerField;
    R_pfNMAT: TIBStringField;
    R_pfSPPRN: TSmallintField;
    R_pfSPVIS: TSmallintField;
    R_pfXARKT: TIBStringField;
    R_pfSPKSM: TIBStringField;
    R_pfNEIS_PR: TIBStringField;
    R_pfNAMEGR: TIBStringField;
    R_pfSTNAME: TIBStringField;
    R_pfSTRUK_ID: TSmallintField;
    R_pfKEI_ID: TSmallintField;
    R_pfLEK_ID: TSmallintField;
    R_pfVIB: TIntegerField;
    R_pfMES: TIntegerField;
    R_pfGOD: TIntegerField;
    R_pfVID: TIntegerField;
    IBUpdater_pf: TIBUpdateSQLW;
    R_SPPF: TIBQuery;
    R_SPPFLEKKOD: TIBStringField;
    R_SPPFKSM_ID: TIntegerField;
    R_SPPFNMAT: TIBStringField;
    R_SPPFSPPRN: TSmallintField;
    R_SPPFSPVIS: TSmallintField;
    R_SPPFXARKT: TIBStringField;
    R_SPPFSPKSM: TIBStringField;
    R_SPPFLEK_ID: TSmallintField;
    R_SPPFKEI_ID: TSmallintField;
    R_SPPFNEIS_PR: TIBStringField;
    R_SPPFNAMEGR: TIBStringField;
    R_SPPFSTNAME: TIBStringField;
    R_SPPFSTRUK_ID: TSmallintField;
    R_SPPFVIB: TIntegerField;
    R_SPPFVID: TIntegerField;
    R_SPPFGOD: TIntegerField;
    R_SPPFMES: TIntegerField;
    ComboBox1: TComboBox;
    R_SPPFDOC_ID: TIntegerField;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    RadioGroup7: TRadioGroup;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    SpinEdit3: TSpinEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    Panel4: TPanel;
    Label24: TLabel;
    Label23: TLabel;
    Label18: TLabel;
    dataBox: TDBLookupListBox;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    RadioGroup3: TRadioGroup;
    RadioGroup6: TRadioGroup;
    R_pfGOST: TIBStringField;
    R_SPPFGOST: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit6Change(Sender: TObject);
    procedure SpinEdit7Change(Sender: TObject);
    procedure DATABoxClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioGroup7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure DBGridEh1EditButtonClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FViborGrPrep: TFViborGrPrep;
  AniBmp1: TBitmap;
  usl_sp: string;
  s_ut_tek: string;
  s_mes_god: string;
  dat1: tdate;
  dat2: tdate;
implementation
 USES DM,Find_Struk,Decode_Spprod,GlMenu_ogt,Find_Spprod;
{$R *.dfm}

procedure TFViborGrPrep.ComboBox1Change(Sender: TObject);
begin
 god:=SpinEdit2.Value;
 mes:=ComboBox1.ItemIndex+1;
 IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
 S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
 S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
end;

procedure TFViborGrPrep.DATABoxClick(Sender: TObject);
begin
 if (dm1.Datcen.Active) then
     s_dat_cen:=datetostr(dm1.DatcenDatcen.AsDateTime);
end;

procedure TFViborGrPrep.DBGridEh1EditButtonClick(Sender: TObject);
begin
 if dbgrideh1.SelectedField.FieldName='LEKKOD' then
 begin
  if FindSpprod=nil then FindSpprod:=TfindSpprod.Create(Application);
  FindSpprod.DataBaseName:=dm1.BELMED;
  FindSpprod.ReadOnly:=true;
  if struk<>0 then FindSpprod.Usl_Struk :='spprod.struk_id='+inttostr(Struk);
  FindSpprod.ShowModal;
  if FindSpprod.ModalResult > 50 then
  begin
   DM1.R_sprod.Edit;
   DM1.R_sprod.FieldByName('LEKKOD').value:=FindSpprod.IBSpprodKod_Prod.Asstring;;
   DM1.R_sprod.FieldByName('Nmat').value:=FindSpprod.IBSpprodNmat.Asstring;
   dm1.R_sprodKsm_id.AsInteger:=FindSpprod.ModalResult-50;
   dm1.R_sprodGost.AsString:=FindSpprod.IBSpprodGost.AsString;
   DM1.R_sprod.FieldByName('SPROD_id').value:=FindSpprod.IBSpprodSprod_id.AsInteger;
   dm1.R_sprodStruk_id.AsInteger:=FindSpprod.IBSpprodStruk_id.AsInteger;
   dm1.R_sprodKei_id.AsInteger:=FindSpprod.IBSpprodKei_id.AsInteger;
   dm1.R_sprodSpprn.AsInteger:=FindSpprod.IBSpprodSpprn.AsInteger;
   dm1.R_sprodSpvis.AsInteger:=FindSpprod.IBSpprodSpvis.AsInteger;
   dm1.R_sprodXarkt.AsString:=FindSpprod.IBSpprodXarkt.asstring;
   dm1.R_sprodSpksm.AsString:=FindSpprod.IBSpprodSpksm.asstring;
   dm1.R_sprodNamegr.AsString:=FindSpprod.IBSpprodName_reg.asstring;
   dm1.R_sprodStname.AsString:=FindSpprod.IBSpprodStname.asstring;
   dm1.R_sprodNeis_pr.AsString:=FindSpprod.IBSpprodNeis.asstring;
   dm1.R_sprodVib.AsInteger:=1;
   dm1.R_sprodMes.AsInteger:=mes;
   dm1.R_SprodGod.AsInteger:=god;
   DM1.R_sprod.POST;
  end;
 end;
end;

procedure TFViborGrPrep.FormCreate(Sender: TObject);
begin
LABEL7.Caption:='';
s_mes_god:=',cast(0 as integer) as mes,cast(0 as integer) as god';
usl_sp:=' 0=0 ';
s_ut_tek:='';
DateTimePicker1.DateTime:=date;
DateTimePicker2.DateTime:=date;
dat1:=DateTimePicker1.date;
dat2:=DateTimePicker2.date;
RadioGroup4.Enabled:=true;
RadioGroup2.Enabled:=false;
RadioGroup6.Enabled:=false;
DateTimePicker1.Enabled:=false;
DateTimePicker2.Enabled:=false;
SpinEdit3.Visible:=false;
end;

procedure TFViborGrPrep.FormShow(Sender: TObject);
begin
  if (not dm1.R_sprod.Active) then
  begin
    SpinEdit2.OnChange := nil;
    SpinEdit2.Value := god;
    SpinEdit2.OnChange := SpinEdit2Change;
    ComboBox1.OnChange := nil;
    ComboBox1.ItemIndex := mes-1;
    ComboBox1.OnChange := ComboBox1Change;
    IF (MES < 10) THEN
      S_MES := '0' + INTTOSTR(MES)
    ELSE
      S_MES := INTTOSTR(MES);
    S_DAT1 := '01.' + S_MES + '.' + copy(INTTOSTR(GOD), 3, 2);
    S_DAT2 := datetostr(IncMonth(strtodate(s_dat1), 1) - 1);
  end;
  if (S_VID_DOK = 'Плановые нормы') then
  begin
    vtip_op_id := 119;
    RadioGroup5.Visible := false;
    Panel4.Visible := false;
    label24.Visible := false;
    label23.Visible := false;
    label18.Visible := false;
    dataBox.Visible := false;
    SpinEdit6.Visible := false;
    SpinEdit7.Visible := false;
    dbgrideh1.Columns[6].Visible := true;
  end;
  if (S_VID_DOK = 'Расшифровки') then
  begin
    vtip_op_id := 120;
    RadioGroup5.Visible := true;
    Panel4.Visible := true;
    label24.Visible := true;
    label23.Visible := true;
    label18.Visible := true;
    dataBox.Visible := true;
    SpinEdit6.Visible := true;
    SpinEdit7.Visible := true;
    dbgrideh1.Columns[6].Visible := False;
    if (mes <> 1) then
    begin
      mes_c := mes - 1;
      god_c := god;
    end
    else
    begin
      mes_c := 12;
      god_c := god - 1;
    end;
    SpinEdit6.OnChange := nil;
    SpinEdit7.OnChange := nil;
    SpinEdit6.Value := mes_c;
    SpinEdit7.Value := god_c;
    SpinEdit6.OnChange := SpinEdit6Change;
    SpinEdit7.OnChange := SpinEdit7Change;
    s_dat_cen1 := '01.' + inttostr(MES_c) + '.' + INTTOSTR(GOD_c);
    s_dat_cen2 := datetostr(IncMonth(strtodate(s_dat_cen1), 1) - 1);
    dm1.Datcen.Active := False;
    dm1.Datcen.ParamByName('DATN1').AsDate := StrToDate(s_dat_cen1);
    dm1.Datcen.ParamByName('DATN2').AsDate := StrToDate(s_dat_cen2);
    dm1.Datcen.Active := True;
    If (not dm1.Datcen.Eof) then
      s_dat_cen := datetostr(dm1.DatcenDatcen.AsDateTime)
    else
      databox.SetFocus;
  end;
  if not dm1.r_sprod.Active then
  begin
    dm1.r_sprod.MacroByName('usl').AsString:=usl_sp;
    dm1.r_sprod.MacroByName('ut_tek_plan').AsString:=s_ut_tek;
    dm1.r_sprod.ParamByName('mes').AsInteger:=mes;
    dm1.r_sprod.ParamByName('god').AsInteger:=god;
    dm1.r_sprod.Active :=true;
    dm1.r_sprod.First;
//  while not dm1.r_sprod.Eof do
//  dm1.r_sprod.Delete;
  end;
end;

procedure TFViborGrPrep.RadioGroup1Click(Sender: TObject);
begin
 if RadioGroup1.ItemIndex=0 then
 begin
  RadioGroup4.Enabled:=true;
  RadioGroup2.Enabled:=true;
  RadioGroup6.Enabled:=true;
  DateTimePicker1.Enabled:=false;
  DateTimePicker2.Enabled:=false;
 end;
 if RadioGroup1.ItemIndex=1 then
 begin
  RadioGroup4.Enabled:=true;
  RadioGroup2.Enabled:=false;
  RadioGroup6.Enabled:=false;
  DateTimePicker1.Enabled:=false;
  DateTimePicker2.Enabled:=false;
  SpinEdit3.Visible:=false;
 end;
 if RadioGroup1.ItemIndex=2 then
 begin
  RadioGroup4.Enabled:=false;
  RadioGroup2.Enabled:=false;
  RadioGroup6.Enabled:=false;
  DateTimePicker1.Enabled:=true;
  DateTimePicker2.Enabled:=true;
  SpinEdit3.Visible:=false;
 end;
end;

procedure TFViborGrPrep.RadioGroup2Click(Sender: TObject);
begin
 if RadioGroup2.ItemIndex=0 then RadioGroup6.ItemIndex:=0
 else RadioGroup6.ItemIndex:=1;
 if RadioGroup2.ItemIndex=1 then
   SpinEdit3.Visible:=true
  else SpinEdit3.Visible:=False;
end;

procedure TFViborGrPrep.RadioGroup3Click(Sender: TObject);
begin
 if radioGroup3.ItemIndex=1 then
 begin
  label7.Caption:='';
  struk:=0;
 end
 else
 begin
  if FindStruk=nil then FindStruk:=TfindStruk.Create(Application);
  FindStruk.WindowState:=wsNormal;
  FindStruk.DataBaseName:=dm1.BELMED;
  FindStruk.Vibor:=False;
  FindStruk.ReadOnly:=False;
  FindStruk.ShowModal;
  If FindStruk.ModalResult > 50 then
  begin
   STRUK :=FindStruk.ModalResult-50;
   FViborGrPrep.label7.Caption:=FindStruk.name;
  end;
 end;
end;

procedure TFViborGrPrep.RadioGroup7Click(Sender: TObject);
begin
 dm1.r_sprod.DisableControls;
 if RadioGroup7.ItemIndex=1 then
 begin
  dm1.r_sprod.First;
  While not dm1.r_sprod.Eof do
  begin
   dm1.r_sprod.Edit;
   dm1.r_sprod.FieldByName('Vib').AsInteger := 1;
   dm1.r_sprod.Post;
   dm1.r_sprod.Next;
  end;
 end
 else
 begin
  dm1.r_sprod.First;
  While not dm1.r_sprod.Eof do
  begin
   dm1.r_sprod.Edit;
   dm1.r_sprod.FieldByName('Vib').AsInteger := 0;
   dm1.r_sprod.Post;
   dm1.r_sprod.Next;
  end;
 end;
 dm1.r_sprod.First;
 dm1.r_sprod.EnableControls;
end;

procedure TFViborGrPrep.SpinEdit2Change(Sender: TObject);
begin
god:=SpinEdit2.Value;
 IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
 S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
 S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
end;

procedure TFViborGrPrep.SpinEdit6Change(Sender: TObject);
begin
 s_god12:=inttostr(SpinEdit7.Value);
 s_mes12:=inttostr(SpinEdit6.Value);
 IF SpinEdit6.Value<10 THEN S_MES12:='0'+INTTOSTR(SpinEdit6.Value) ELSE S_MES12:=INTTOSTR(SpinEdit6.Value);
 S_DAT_cen1:='01.'+S_MES12+'.'+copy(s_GOD12,3,2);
 S_DAT_cen2:=datetostr(IncMonth(strtodate(s_dat_cen1),1)-1);
 dm1.Datcen.Active :=False;
 dm1.Datcen.ParamByName('DATN1').AsDate :=StrToDate(s_dat_cen1);
 dm1.Datcen.ParamByName('DATN2').AsDate :=StrToDate(s_dat_cen2);
 dm1.Datcen.Active :=True;
end;

procedure TFViborGrPrep.SpinEdit7Change(Sender: TObject);
begin
 s_god12:=inttostr(SpinEdit7.Value);
 s_mes12:=inttostr(SpinEdit6.Value);
 IF SpinEdit6.Value<10 THEN S_MES12:='0'+INTTOSTR(SpinEdit6.Value) ELSE S_MES12:=INTTOSTR(SpinEdit6.Value);
 S_DAT_cen1:='01.'+S_MES12+'.'+copy(s_GOD12,3,2);
 S_DAT_cen2:=datetostr(IncMonth(strtodate(s_dat_cen1),1)-1);
 dm1.Datcen.Active :=False;
 dm1.Datcen.ParamByName('DATN1').AsDate :=StrToDate(s_dat_cen1);
 dm1.Datcen.ParamByName('DATN2').AsDate :=StrToDate(s_dat_cen2);
 dm1.Datcen.Active :=True;
end;

procedure TFViborGrPrep.ToolButton1Click(Sender: TObject);
var
  pr_rashif : integer;
  pr_norm : integer;
begin
  if (dm1.R_sprod.Active) then
  begin
    if (S_VID_DOK = 'Расшифровки') and (S_dat_cen = '')  then
    begin
      MessageDlg('Задайте дату цены!', mtWarning, [mbOK], 0);
      Abort;
    end;
    Splash := ShowSplashWindow(AniBmp1,
                               'Загрузка данных. Подождите, пожалуйста...',
                               True, nil);
    dm1.p_rashif.Close;
    dm1.p_rashif.EmptyTable;
    dm1.p_rashif.Open;
    dm1.R_sprod.First;
    while (not dm1.R_sprod.Eof) do
    begin
      if (dm1.R_sprodVib.AsInteger = 1) then
      begin
        s_kodp := dm1.R_sprodKsm_id.AsInteger;
        s_dat1 := '01.' + inttostr(dm1.R_sprod.FieldByName('mes').AsInteger)
                  + '.' + inttostr(dm1.R_sprod.FieldByName('god').AsInteger);
        if (S_VID_DOK = 'Расшифровки') then
        begin
// расшифровки
          pr_rashif := 0;
          pr_norm := 0;
          if (RadioGroup5.ItemIndex = 0) or ( RadioGroup5.ItemIndex = 2) then
          begin
            DM1.IBQuery1.Active := False;
            DM1.IBQuery1.SQL.Clear;
            DM1.IBQuery1.SQL.Add('select max(document.date_op) date_op, doc_id from document');
            DM1.IBQuery1.SQL.Add(' where document.date_op<=' + '''' + s_dat1 + '''');
            DM1.IBQuery1.SQL.Add(' and tip_op_id = 119');
            DM1.IBQuery1.SQL.Add(' and document.klient_id = ' + inttostr(dm1.R_sprodKsm_id.AsInteger));
            DM1.IBQuery1.SQL.Add(' group by doc_id  order by date_op');
            DM1.IBQuery1.Open;
            if (not DM1.IBQuery1.Eof) then
            begin
              DM1.IBQuery1.Last;
              s_dat_rashif := datetostr(DM1.IBQuery1.FieldByName('date_op').AsdateTime);
              vDocument_id := DM1.IBQuery1.FieldByName('doc_id').AsInteger;
              pr_norm := 1;
            end;
  // прроверка на п/ф
     // полные
            s_prras := 'p';
            DM1.IBQuery1.Active := False;
            DM1.IBQuery1.SQL.Clear;
            DM1.IBQuery1.SQL.Add('select max(document.date_op) date_op, doc_id from document');
            DM1.IBQuery1.SQL.Add(' where document.date_op=' + '''' + s_dat_rashif + '''');
            DM1.IBQuery1.SQL.Add(' and tip_op_id = 120');
            DM1.IBQuery1.SQL.Add(' and document.klient_id = ' + inttostr(dm1.R_sprodKsm_id.AsInteger));
            DM1.IBQuery1.SQL.Add(' group by doc_id order by date_op');
            DM1.IBQuery1.Open;
            if (not DM1.IBQuery1.Eof) then
            begin
              DM1.IBQuery1.Last;
              s_dat_rashif := datetostr(DM1.IBQuery1.FieldByName('date_op').AsdateTime);
              vDocument_id := DM1.IBQuery1.FieldByName('doc_id').AsInteger;
              dm1.rashif_s.Active := False;
              dm1.rashif_s.ParamByName('doc').AsInteger := vDocument_id;
              dm1.rashif_s.ParamByName('datcen').AsDateTime := strtodateTime(S_dat_cen);
              dm1.rashif_s.Active := true;
              if (not DM1.rashif_s.Eof) then
              begin
                while (not DM1.rashif_s.Eof) do
                begin
                  DM1.rashif_s.Edit;
                  DM1.rashif_sPrras.AsString := s_prras;
                  DM1.rashif_s.Post;
                  DM1.rashif_s.Next;
                end;
                dm1.p_rashif.LoadFromDataSet(DM1.rashif_s, [mtcpoAppend]);
                dm1.p_rashif.Active := True;
              end
            end
            else
            begin
              pr_rashif := 1;
              // прроверка на п/ф
              if (pr_norm = 1) then
              begin
                r_sppf.Close;
                r_sppf.ParamByName('god').AsInteger := year(strtodate(s_dat_rashif));
                r_sppf.ParamByName('mes').AsInteger := month(strtodate(s_dat_rashif));
                r_sppf.ParamByName('kod').AsInteger := dm1.R_sprodKsm_id.AsInteger;
                r_sppf.ParamByName('struk').AsInteger := dm1.R_sprodStruk_id.AsInteger;
                r_sppf.Open;
                if (not r_sppf.Eof) then
                begin
                  if (StrToDate(s_dat_rashif) < StrToDate('01.11.2009')) then
                    Pr_ARX := 1
                  else
                    Pr_Arx := 0;
                    // Pr_Arx - признок архива: 1-данные берутся из ARXNORM, 0-из NORMn
                  DM1.RaschRashif;
                end;
                dm1.rashif_s.Active := False;
                dm1.rashif_s.ParamByName('doc').AsInteger := vDocument_id;
                dm1.rashif_s.ParamByName('datcen').AsDateTime := strtodateTime(S_dat_cen);
                dm1.rashif_s.Active := true;
                while (not DM1.rashif_s.Eof) do
                begin
                  DM1.rashif_s.Edit;
                  DM1.rashif_sPrras.AsString := s_prras;
                  DM1.rashif_s.Post;
                  DM1.rashif_s.Next;
                end;
                dm1.p_rashif.LoadFromDataSet(DM1.rashif_s, [mtcpoAppend]);
                dm1.p_rashif.Active := True;
              end;
            end;
          end;
          if ((RadioGroup5.ItemIndex = 1) or (RadioGroup5.ItemIndex = 2))
              and (pr_rashif = 0) then
          begin
          // короткие
            s_prras := 'k';
            DM1.IBQuery1.Active := False;
            DM1.IBQuery1.SQL.Clear;
            DM1.IBQuery1.SQL.Add('select max(document.date_op) date_op, doc_id from document');
            DM1.IBQuery1.SQL.Add(' where document.date_op<=' + '''' + s_dat1 + '''');
            DM1.IBQuery1.SQL.Add(' and tip_op_id=119');
            DM1.IBQuery1.SQL.Add(' and document.klient_id=' + inttostr(dm1.R_sprodKsm_id.AsInteger));
            DM1.IBQuery1.SQL.Add(' group by doc_id order by date_op');
            DM1.IBQuery1.Open;
            if (not DM1.IBQuery1.Eof) then
            begin
              DM1.IBQuery1.Last;
              vDocument_id := DM1.IBQuery1.FieldByName('doc_id').AsInteger;
              s_dat_rashif := datetostr(DM1.IBQuery1.FieldByName('date_op').AsdateTime);
              dm1.rashif_s.Active := False;
              dm1.rashif_s.ParamByName('doc').AsInteger := vDocument_id;
              dm1.rashif_s.ParamByName('datcen').AsDateTime := strtodateTime(S_dat_cen);
              dm1.rashif_s.Active := true;
              while (not DM1.rashif_s.Eof) do
              begin
                DM1.rashif_s.Edit;
                DM1.rashif_sPrras.AsString := s_prras;
                DM1.rashif_s.Post;
                DM1.rashif_s.Next;
              end;
              dm1.p_rashif.LoadFromDataSet(DM1.rashif_s, [mtcpoAppend]);
              dm1.p_rashif.Active := True;
            end;
          end;
  // расчет итогов
          dm1.SumRash_Razd.Close;
          dm1.SumRash_Razd.ParamByName('datcen').AsDateTime := strtodate(s_dat_cen);
          dm1.SumRash_Razd.ParamByName('doc').AsInteger := vdocument_id;
          dm1.SumRash_Razd.Open;
          dm1.SumRash_Razd.First;
          dm1.ITOGI.Close;
          dm1.ITOGI.MacroByName('usl').AsString := ' itogi.mes=' + inttostr(mes)
                                                   + ' and itogi.god=' + inttostr(god)
                                                   + ' and itogi.kodp=' + inttostr(dm1.R_sprodKsm_id.AsInteger)
                                                   + ' and itogi.datec=' + ''''
                                                   + s_dat_cen + '''' + ' and itogi.pr='
                                                   + '''' + s_prras + '''';
          dm1.ITOGI.Active := true;
          if (not dm1.ITOGI.Eof) then
            while (not dm1.ITOGI.Eof) do
              dm1.ITOGI.Delete;
          while (not dm1.SumRash_Razd.Eof) do
          begin
            DM1.ITOGI.Insert;
            DM1.ITOGI.FieldByName('Kodp').AsInteger := dm1.R_sprodKsm_id.AsInteger;
            DM1.ITOGI.FieldByName('sprod_id').AsInteger := dm1.R_sprodSprod_id.AsInteger;
            DM1.ITOGI.FieldByName('SUM_it').AsFloat := dm1.sumRash_Razd.FieldByName('Sumcennorm').AsFloat;
            DM1.ITOGI.FieldByName('struk_id').AsInteger := dm1.R_sprodStruk_id.AsInteger;
            DM1.ITOGI.FieldByName('SUMNDS').AsFloat := dm1.sumRash_Razd.FieldByName('Sumcennorm_nds').AsFloat;
            DM1.ITOGI.FieldByName('doc_id').AsInteger := vdocument_id;
            DM1.ITOGI.FieldByName('datec').AsDateTime := strtodate(s_dat_cen);
            DM1.ITOGI.FieldByName('datei').AsDateTime := date();
            DM1.ITOGI.FieldByName('kraz').AsInteger := dm1.sumRash_Razd.FieldByName('kodraz').AsInteger;
            DM1.ITOGI.FieldByName('mes').AsInteger := Mes;
            DM1.ITOGI.FieldByName('god').AsInteger := god;
            DM1.ITOGI.FieldByName('pr').AsString := s_prras;
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
  // нормы
        end
        else
        begin
          DM1.IBRabNorm.Close;
          DM1.IBRabNorm.ParamByName('kod').AsInteger := dm1.R_sprodKsm_id.AsInteger;
          DM1.IBRabNorm.ParamByName('god').AsInteger := god;
          DM1.IBRabNorm.ParamByName('mes').AsInteger := mes;
          DM1.IBRabNorm.ParamByName('oper').AsInteger := 119;
          DM1.IBRabNorm.Open;
          DM1.IBRabNORM.First;
          IF (not DM1.IBRabNORM.eof) THEN
          begin
            dm1.p_rashif.LoadFromDataSet(DM1.IBRabnorm, [mtcpoAppend]);
            dm1.p_rashif.Active := True;
          end;
        end;
        s_kodp := 0;
      end;
      dm1.R_sprod.Next;
    end;
    dm1.ITOGI.Close;
    DM1.r_sprod.First;
    Splash.Free;
  end;
end;

procedure TFViborGrPrep.ToolButton2Click(Sender: TObject);
begin
 while not dm1.r_sprod.Eof do
  dm1.r_sprod.Delete;
end;

procedure TFViborGrPrep.ToolButton3Click(Sender: TObject);
var
 s_mes1:integer;
 s_mes2:integer;
 povt: integer;
begin
// цех
usl_sp:='0=0';
if RadioGroup3.ItemIndex=0 then
begin
 if struk<>0 then
   usl_sp:=usl_sp+' and spprod.struk_id='+inttostr(struk)
 else
 begin
  MessageDlg('Введите цех!', mtWarning, [mbOK], 0);
  Abort;
 end;
end;
if RadioGroup1.ItemIndex<>1 then
begin
 s_mes_god:=',cast(0 as integer) as mes,cast(0 as integer) as god';
 s_ut_tek:='';

// по плану
 if RadioGroup1.ItemIndex=0 then
 begin

  if RadioGroup6.ItemIndex=0 then
  begin
   s_ut_tek:='left join plan_pr on (spprod.sprod_id=plan_pr.sprod_id)';
   usl_sp:=usl_sp+' and kol<>0 and type_pl=2'
  end
  else
  begin
   s_ut_tek:='left join plan_pr on (spprod.sprod_id=plan_pr.sprod_id)';
   usl_sp:=usl_sp+' and kol<>0 and type_pl=1 ';
  end;
  case RadioGroup2.ItemIndex of
   0:begin
     usl_sp:=usl_sp+' and god='+inttostr(god)+' and mes='+inttostr(mes)
   end;
   1:begin
     s_mes1:=(SpinEdit3.value-1)*3+1;
     s_mes2:=s_mes1+2;
     usl_sp:=usl_sp+' and god='+inttostr(god)+' and mes between '+inttostr(s_mes1)+' and '+inttostr(s_mes2)
    end;
   2:begin
     usl_sp:=usl_sp+' and god='+inttostr(god)
   end;
  end;
 end;
 // по дате корректировки
 if RadioGroup1.ItemIndex=2 then
 begin
  dat1:=DateTimePicker1.date;
  dat2:=DateTimePicker2.date;
  s_ut_tek:=s_ut_tek+' INNER join normn on (spprod.ksm_id=normn.kodp)';
  usl_sp:=usl_sp+' and normn.date_Time_update between '+''''+datetostr(dat1)+''''+' and '+''''+datetostr(dat2)+'''';
 end;
 dm1.r_sprod.Active :=False;
 dm1.r_sprod.MacroByName('usl').AsString:=usl_sp;
 dm1.r_sprod.MacroByName('ut_tek_plan').AsString:=s_ut_tek;
 dm1.r_sprod.ParamByName('mes').AsInteger:=mes;
 dm1.r_sprod.ParamByName('god').AsInteger:=god;
 dm1.r_sprod.Active :=true;
 dm1.R_sprod.DisableControls;
 dm1.r_sprod.First;
 while not DM1.r_sprod.Eof do
 begin
  if dm1.r_sprod.FieldByName('mes').AsInteger=0 then
  begin
   DM1.r_sprod.Edit;
   DM1.r_sprod.FieldByName('mes').AsInteger:=mes;
   DM1.r_sprod.FieldByName('god').AsInteger:=god;
   DM1.r_sprod.Post;
  end;
  DM1.r_sprod.Next;
 end;
end
else
begin
 if RadioGroup4.ItemIndex<>0 then
 begin
  dm1.r_sprod.Active :=False;
  dm1.r_sprod.MacroByName('usl').AsString:=usl_sp;
  dm1.r_sprod.MacroByName('ut_tek_plan').AsString:=s_ut_tek;
  dm1.r_sprod.ParamByName('mes').AsInteger:=mes;
  dm1.r_sprod.ParamByName('god').AsInteger:=god;
  dm1.r_sprod.Active :=true;
  dm1.R_sprod.DisableControls;
  dm1.r_sprod.First;
  while not DM1.r_sprod.Eof do
  begin
   if dm1.r_sprod.FieldByName('mes').AsInteger=0 then
   begin
    DM1.r_sprod.Edit;
    DM1.r_sprod.FieldByName('mes').AsInteger:=mes;
    DM1.r_sprod.FieldByName('god').AsInteger:=god;
    DM1.r_sprod.Post;
   end;
   DM1.r_sprod.Next;
  end;
 end
 else
 begin
// добавление п/ф
 povt:=0;
 dm1.R_sprod.DisableControls;
 while povt<5 do
 begin
  dm1.R_sprod.First;
  if not r_pf.Active then
  r_pf.ParamByName('god').AsInteger:=god;
  r_pf.ParamByName('mes').AsInteger:=mes;
  r_pf.ParamByName('kod').AsInteger:=dm1.R_sprodKsm_id.AsInteger;
  r_pf.ParamByName('struk').AsInteger:=dm1.R_sprodStruk_id.AsInteger;
  r_pf.Active:=true;
  while not R_pf.eof do R_pf.Delete;
  while not dm1.R_sprod.Eof do
  begin
   if r_sppf.Active then r_sppf.Active:=false;
   r_sppf.ParamByName('god').AsInteger:=god;
   r_sppf.ParamByName('mes').AsInteger:=mes;
   r_sppf.ParamByName('kod').AsInteger:=dm1.R_sprodKsm_id.AsInteger;
   r_sppf.ParamByName('struk').AsInteger:=dm1.R_sprodStruk_id.AsInteger;
   r_sppf.Open;
   while not r_sppf.Eof do
   begin
    R_pf.Insert;
    R_pf.FieldByName('Ksm_id').AsInteger:=r_sppfKsm_id.AsInteger;
    R_pf.FieldByName('Lekkod').AsString:=r_sppf.FieldByName('Lekkod').AsString;
    R_pf.FieldByName('Nmat').AsString:=r_sppf.FieldByName('Nmat').AsString;
    R_pf.FieldByName('mes').AsInteger:=r_sppf.FieldByName('mes').AsInteger;
    R_pf.FieldByName('god').AsInteger:=r_sppf.FieldByName('god').AsInteger;
    R_pf.FieldByName('gost').AsString:=r_sppf.FieldByName('gost').AsString;
    R_pf.FieldByName('xarkt').AsString:=r_sppf.FieldByName('Xarkt').AsString;
    R_pf.FieldByName('struk_id').AsInteger:=r_sppf.FieldByName('struk_id').AsInteger;
    R_pf.FieldByName('kei_id').AsInteger:=r_sppf.FieldByName('kei_id').AsInteger;
    R_pf.FieldByName('vib').AsInteger:=1;
    R_pf.FieldByName('Stname').AsString:=r_sppf.FieldByName('Stname').AsString;
    R_pf.FieldByName('Neis_pr').AsString:=r_sppf.FieldByName('Neis_pr').AsString;
    R_pf.FieldByName('vid').AsInteger:=0;
    R_pf.FieldByName('spvis').AsInteger:=r_sppf.FieldByName('spvis').AsInteger;
    R_pf.FieldByName('namegr').AsString:=r_sppf.FieldByName('namegr').AsString;
    R_pf.FieldByName('Spksm').AsString:=r_sppf.FieldByName('Spksm').AsString;
    R_pf.FieldByName('lek_id').AsInteger:=r_sppf.FieldByName('Lek_id').AsInteger;
    R_pf.FieldByName('spprn').AsInteger:=r_sppf.FieldByName('spprn').AsInteger;
    R_pf.Post;
    R_sppf.Next;
   end;
   dm1.R_sprod.Next;
  end;
  R_pf.First;
  while not R_pf.Eof do
  begin
   dm1.R_sprod.First;
   if not dm1.R_sprod.Locate('ksm_id',r_pfKsm_id.AsInteger,[]) then
   begin
    dm1.R_sprod.Insert;
    DM1.r_sprod.FieldByName('Ksm_id').AsInteger:=r_pfKsm_id.AsInteger;
    DM1.r_sprod.FieldByName('Lekkod').AsString:=r_pf.FieldByName('Lekkod').AsString;
    DM1.r_sprod.FieldByName('Nmat').AsString:=r_pf.FieldByName('Nmat').AsString;
    DM1.r_sprod.FieldByName('mes').AsInteger:=r_pf.FieldByName('mes').AsInteger;
    DM1.r_sprod.FieldByName('god').AsInteger:=r_pf.FieldByName('god').AsInteger;
    DM1.r_sprod.FieldByName('gost').AsString:=r_pf.FieldByName('gost').AsString;
    DM1.r_sprod.FieldByName('xarkt').AsString:=r_pf.FieldByName('Xarkt').AsString;
    DM1.r_sprod.FieldByName('struk_id').AsInteger:=r_pf.FieldByName('struk_id').AsInteger;
    DM1.r_sprod.FieldByName('kei_id').AsInteger:=r_pf.FieldByName('kei_id').AsInteger;
    DM1.r_sprod.FieldByName('vib').AsInteger:=1;
    DM1.r_sprod.FieldByName('Stname').AsString:=r_pf.FieldByName('Stname').AsString;
    DM1.r_sprod.FieldByName('Neis_pr').AsString:=r_pf.FieldByName('Neis_pr').AsString;
    DM1.r_sprod.FieldByName('vid').AsInteger:=0;
    DM1.r_sprod.FieldByName('spvis').AsInteger:=r_pf.FieldByName('spvis').AsInteger;
    DM1.r_sprod.FieldByName('namegr').AsString:=r_pf.FieldByName('namegr').AsString;
    DM1.r_sprod.FieldByName('Spksm').AsString:=r_pf.FieldByName('Spksm').AsString;
    DM1.r_sprod.FieldByName('lek_id').AsInteger:=r_pf.FieldByName('Lek_id').AsInteger;
    DM1.r_sprod.FieldByName('spprn').AsInteger:=r_pf.FieldByName('spprn').AsInteger;
    dm1.R_sprod.Post;
   end;
   R_pf.Next;
  end;
  povt:=povt+1;
 end;
 end;
end;
dm1.r_sprod.First;
dm1.R_sprod.EnableControls;
end;

procedure TFViborGrPrep.ToolButton4Click(Sender: TObject);
begin
  if (dm1.p_rashif.Active) then
  begin
    dm1.p_rashif.First;
    if (not dm1.p_rashif.Eof) then
    begin
      s_kodp_s := 0;
      struks := 0;
      if (S_VID_DOK = 'Расшифровки') then
      begin
      // расшифровки
        DM1.FrxReport1.LoadFromFile(reportPath + 'P_rashg.fr3');
        DM1.FrxReport1.ShowReport(true);
      end
      else
      begin// нормы
        dm1.frxReport1.LoadFromFile(reportPath + 'P_normg.fr3');
        dm1.frxReport1.ShowReport;
      end;
    end else begin
      MessageDlg('Нет данных для печати!', mtWarning, [mbOK], 0);
      Abort;
    end;
  end else begin
    MessageDlg('Сначала сформируйте данные для печати!', mtWarning, [mbOK], 0);
    Abort;
  end;
end;

end.
