unit PerNorm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, ImgList, ComCtrls, ToolWin, DBTables,
  IBUpdateSQL, IBUpdSQLW, RxIBQuery,Math, StdCtrls, Spin, rxSplshWnd, Menus, Grids,
  DBGrids;

type
  TFPerNorm = class(TForm)
    Norm_ST: TTable;
    Norm_STKODP: TFloatField;
    Norm_STKSM_ID: TFloatField;
    Norm_STSTRUK_ID: TSmallintField;
    Norm_STKEI_ID: TSmallintField;
    Norm_STPLNORM: TFloatField;
    Norm_STDATAV: TDateField;
    Norm_STKRAZ: TSmallintField;
    Norm_STMES: TSmallintField;
    Norm_STGOD: TSmallintField;
    Norm_STPRPF: TBooleanField;
    Norm_STNAZPRPF: TStringField;
    Norm_STPRKOR: TStringField;
    Norm_STTIMEV: TStringField;
    Norm_STNORM_ID: TFloatField;
    Norm_STPR_OV: TBooleanField;
    Rashif_st: TTable;
    Rashif_stKODP: TFloatField;
    Rashif_stKSM_ID: TFloatField;
    Rashif_stSTRUK_ID: TSmallintField;
    Rashif_stKEI_ID: TSmallintField;
    Rashif_stPLNORM: TFloatField;
    Rashif_stDATEI: TDateField;
    Rashif_stKRAZ: TSmallintField;
    Rashif_stMES: TSmallintField;
    Rashif_stGOD: TSmallintField;
    ITOGI_ST: TTable;
    ITOGI_STKODP: TFloatField;
    ITOGI_STKRAZ: TSmallintField;
    ITOGI_STSUM: TFloatField;
    ITOGI_STSTRUK_ID: TSmallintField;
    ITOGI_STKEI_ID: TSmallintField;
    ITOGI_STSUMNDS: TFloatField;
    ITOGI_STDATEI: TDateField;
    ITOGI_STMES: TSmallintField;
    ITOGI_STGOD: TSmallintField;
    ITOGI_STPR: TStringField;
    ITOGI_STDATEC: TDateField;
    Cen_dbf: TTable;
    Cen_dbfKSM: TStringField;
    Cen_dbfKSM_ID: TFloatField;
    Cen_dbfACCOUNT: TStringField;
    Cen_dbfCENA: TFloatField;
    Cen_dbfCEN_NDS: TFloatField;
    Cen_dbfKEI: TStringField;
    Cen_dbfKEI_ID: TSmallintField;
    Cen_dbfDATCEN: TDateField;
    Cen_dbfPRIZ: TStringField;
    Cen_dbfMES: TSmallintField;
    Cen_dbfSKLAD: TStringField;
    Cen_dbfSTRUK_ID: TSmallintField;
    Cen_dbfKORR: TStringField;
    Cen_dbfUSERNET: TStringField;
    Cen_dbfDAT_KOR: TDateField;
    TPodpis: TTable;
    TPodpisPOLOG: TStringField;
    TPodpisDOLG: TStringField;
    TPodpisFIO: TStringField;
    TPodpisREG_ID: TSmallintField;
    TPodpisSTRUK_ID: TSmallintField;
    MainMenu1: TMainMenu;
    INTARBASE1: TMenuItem;
    INTERBASE1: TMenuItem;
    NORMdbf1: TMenuItem;
    ITOGIdbf1: TMenuItem;
    CENNIKdbf1: TMenuItem;
    NORMN1: TMenuItem;
    PODPISIdbf1: TMenuItem;
    normn: TRxIBQuery;
    IBUpdateSQLNormn: TIBUpdateSQLW;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Normn_asy: TIBQuery;
    N2: TMenuItem;
    Otxody1: TMenuItem;
    Otx_imp: TRxIBQuery;
    IBOtx_imp: TIBUpdateSQLW;
    DSotxody: TDataSource;
    ARXNORMdbf1: TMenuItem;
    ARXRASHIFdbf1: TMenuItem;
    Arxnorm: TTable;
    ArhRashi: TTable;
    ArxnormKODP: TFloatField;
    ArxnormKSM_ID: TFloatField;
    ArxnormSTRUK_ID: TSmallintField;
    ArxnormKEI_ID: TSmallintField;
    ArxnormPLNORM: TFloatField;
    ArxnormDATAV: TDateField;
    ArxnormKRAZ: TSmallintField;
    ArxnormMES: TSmallintField;
    ArxnormGOD: TSmallintField;
    ArxnormPRPF: TBooleanField;
    ArxnormNAZPRPF: TStringField;
    ArxnormPRKOR: TStringField;
    ArxnormTIMEV: TStringField;
    ArxnormNORM_ID: TFloatField;
    ArxnormPR_OV: TBooleanField;
    ArhRashiKODP: TFloatField;
    ArhRashiKSM_ID: TFloatField;
    ArhRashiSTRUK_ID: TSmallintField;
    ArhRashiKEI_ID: TSmallintField;
    ArhRashiPLNORM: TFloatField;
    ArhRashiDATEI: TDateField;
    ArhRashiKRAZ: TSmallintField;
    ArhRashiMES: TSmallintField;
    ArhRashiGOD: TSmallintField;
    IBArxNorm: TRxIBQuery;
    IBUpdateArxnorm: TIBUpdateSQLW;
    IBArhRashi: TRxIBQuery;
    IBUpdateArhrashi: TIBUpdateSQLW;
    IBArhRashiKODP: TIntegerField;
    IBArhRashiKSM_ID: TIntegerField;
    IBArhRashiSTRUK_ID: TIntegerField;
    IBArhRashiKEI_ID: TIntegerField;
    IBArhRashiPLNORM: TFloatField;
    IBArhRashiDATEI: TDateField;
    IBArhRashiKRAZ: TSmallintField;
    IBArhRashiMES: TSmallintField;
    IBArhRashiGOD: TSmallintField;
    IBArhRashiNORM_ID: TIntegerField;
    IBArxNormKODP: TIntegerField;
    IBArxNormKSM_ID: TIntegerField;
    IBArxNormSTRUK_ID: TIntegerField;
    IBArxNormKEI_ID: TIntegerField;
    IBArxNormPLNORM: TFloatField;
    IBArxNormDATAV: TDateField;
    IBArxNormKRAZ: TSmallintField;
    IBArxNormMES: TSmallintField;
    IBArxNormGOD: TSmallintField;
    IBArxNormPRPF: TSmallintField;
    IBArxNormNAZPRPF: TIBStringField;
    IBArxNormPRKOR: TIBStringField;
    IBArxNormTIMEV: TIBStringField;
    IBArxNormNORM_ID: TIntegerField;
    IBArxNormPR_OV: TSmallintField;
    normnTIP_OP_ID: TSmallintField;
    normnKODP: TIntegerField;
    normnKSM_ID: TIntegerField;
    normnSTRUK_ID: TSmallintField;
    normnKEI_ID: TSmallintField;
    normnPLNORM: TFloatField;
    normnKRAZ: TSmallintField;
    normnMES: TSmallintField;
    normnGOD: TSmallintField;
    normnPRPF: TSmallintField;
    normnNAZPRPF: TIBStringField;
    normnNORM_ID: TIntegerField;
    normnPR_OV: TSmallintField;
    normnRAZDEL_ID: TSmallintField;
    normnDATE_TIME_UPDATE: TDateTimeField;
    normnUSER_NAME: TIBStringField;
    normnDOC_ID: TIntegerField;
    normnDATANORM: TDateField;
    normnSPROD_ID: TIntegerField;
    IBQuery1: TIBQuery;
    Otx_impBAS_ID: TIntegerField;
    Otx_impSTRUK_ID: TIntegerField;
    Otx_impKSM_IDO: TIntegerField;
    Otx_impRAZDEL_IDO: TSmallintField;
    Otx_impRAZDEL_IDOS: TSmallintField;
    Otx_impKSM_IDOS: TIntegerField;
    Otx_impKEI_IDO: TSmallintField;
    Otx_impKEI_IDOS: TSmallintField;
    Otx_impDATEVV: TDateField;
    Otx_impKODP_O: TIntegerField;
    Otx_impKODP_OS: TIntegerField;
    Otx_impKODST_O: TIBStringField;
    Otx_impKODST_OS: TIBStringField;
    Otx_impSPROD_IDO: TIntegerField;
    Otx_impSPROD_IDOS: TIntegerField;
    Normn_asyKODP: TIntegerField;
    Normn_asyDOC_ID: TIntegerField;
    Normn_asyTIP_OP_ID: TSmallintField;
    Normn_asyKSM_ID: TIntegerField;
    Normn_asySTRUK_ID: TSmallintField;
    Normn_asyKEI_ID: TSmallintField;
    Normn_asyKRAZ: TSmallintField;
    Normn_asyMES: TSmallintField;
    Normn_asyGOD: TSmallintField;
    Normn_asyPRPF: TSmallintField;
    Normn_asyNORM_ID: TIntegerField;
    Normn_asyRAZDEL_ID: TSmallintField;
    Normn_asyPR_OV: TSmallintField;
    Normn_asyNMAT_KSM: TIBStringField;
    Normn_asyKOD_PROD: TIBStringField;
    Normn_asyNEIS: TIBStringField;
    Normn_asyDATANORM: TDateField;
    Normn_asyPLNORM: TFMTBCDField;
    Normn_asyXARKT: TIBStringField;
    Normn_asyNAZPRPF: TIBStringField;
    IBPodpis: TIBQuery;
    IBPodpisPODPIS_ID: TIntegerField;
    IBPodpisPOLOG: TSmallintField;
    IBPodpisDOLG: TIBStringField;
    IBPodpisFIO: TIBStringField;
    IBPodpisTIP_OP_ID: TSmallintField;
    IBPodpisSTRUK_ID: TSmallintField;
    IBPodpisTIP_DOK_ID: TSmallintField;
    Normn_asyKOD_PROD_KSM: TIBStringField;
    Normn_asySTNAME: TIBStringField;
    Normn_asyNAM: TIBStringField;
    Normn_asyNAMSPSR: TIBStringField;
    Normn_asyNAMORG: TIBStringField;
    Normn_asyNMAT: TIBStringField;
    Normn_asySPROD_ID: TIntegerField;
    Normn_asyNEIS_PROD: TIBStringField;
    Normn_asyGOST: TIBStringField;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NORMN1Click(Sender: TObject);
    procedure ediz1Click(Sender: TObject);
    procedure Otxody1Click(Sender: TObject);
    procedure Otx_impBeforeInsert(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure ARXNORMdbf1Click(Sender: TObject);
    procedure ARXRASHIFdbf1Click(Sender: TObject);
    procedure IBArhRashiBeforeInsert(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPerNorm: TFPerNorm;
  AniBmp1: TBitmap;

implementation
 uses dm, Razdel;
{$R *.dfm}

procedure TFPerNorm.ARXNORMdbf1Click(Sender: TObject);
//VAR
// pp: integer;
begin
{  Splash := ShowSplashWindow(AniBmp1,
 'Переносятся данные ARXNORM. Подождите, пожалуйста...', True, nil);
  IBArxNorm.Active :=true;
  if not IBArxNorm.Eof then
  begin
   IBArxNorm.First;
   while not IBArxNorm.Eof do IBArxNorm.Delete;
   dm1.startRWTranss;
   try
    if IBArxNorm.UpdatesPending then
       IBArxNorm.ApplyUpdates;
       DM1.IBT_WRITE.Commit;
       DM1.IBT_READ.CommitRetaining;
   except
    On E: Exception do
    begin
     MessageDlg('Произошла ошибка при записи данных!'+E.Message, mtWarning, [mbOK], 0);
     DM1.IBT_WRITE.RollbackRetaining;
    end;
   end;
   if dm1.IBT_Read.Active then dm1.IBT_Read.Active:=false;
   if dm1.IBT_WRITE.Active then dm1.IBT_WRITE.Active:=false;
   IBArxNorm.Close;
  end;
  ArxNorm.Active :=true;
  while not ArxNorm.Eof do
  begin
   pp:=0;
   while (PP<10000) AND (not ArxNorm.Eof) do
   begin
    if (ArxNorm.FieldByName('god').AsInteger>2007) then
    begin
     IBArxNorm.Append;
     IBArxNorm.FieldByName('Kodp').AsVariant:=ArxNorm.FieldByName('Kodp').AsVariant;
     IBArxNorm.FieldByName('ksm_id').AsVariant:=ArxNorm.FieldByName('ksm_id').AsVariant;
     IBArxNorm.FieldByName('struk_id').AsVariant:=ArxNorm.FieldByName('struk_id').AsVariant;
     IBArxNorm.FieldByName('kei_id').AsVariant:=ArxNorm.FieldByName('kei_id').AsVariant;
     IBArxNorm.FieldByName('plnorm').AsVariant:=ArxNorm.FieldByName('plnorm').AsVariant;
     IBArxNorm.FieldByName('kraz').AsVariant:=ArxNorm.FieldByName('kraz').AsVariant;
     IBArxNorm.FieldByName('mes').AsVariant:=ArxNorm.FieldByName('mes').AsVariant;
     IBArxNorm.FieldByName('god').AsVariant:=ArxNorm.FieldByName('god').AsVariant;
     IBArxNorm.FieldByName('norm_id').AsVariant:=ArxNorm.FieldByName('norm_id').AsVariant;
     IBArxNorm.FieldByName('Datav').AsVariant:=ArxNorm.FieldByName('datav').AsVariant;
     IBArxNorm.FieldByName('Timev').AsVariant:=ArxNorm.FieldByName('TimeV').AsVariant;
     If ArxNorm.FieldByName('pr_ov').AsVariant=true then IBArxNorm.FieldByName('pr_ov').AsVariant:=1
     else IBArxNorm.FieldByName('pr_ov').AsVariant:=0;
     If ArxNorm.FieldByName('prpf').AsVariant=true then IBArxNorm.FieldByName('prpf').AsVariant:=1
     else IBArxNorm.FieldByName('prpf').AsVariant:=0;
     IBArxNorm.FieldByName('nazprpf').AsVariant:=ArxNorm.FieldByName('nazprpf').AsVariant;
     IBArxNorm.FieldByName('prkor').AsVariant:=ArxNorm.FieldByName('prkor').AsVariant;
     IBArxNorm.Post;
     pp:=pp+1;
    end;
    ArxNorm.Next;
   end;
   dm1.startRWTranss;
   try
    if IBArxNorm.UpdatesPending then
     IBArxNorm.ApplyUpdates;
    DM1.IBT_WRITE.Commit;
    DM1.IBT_READ.CommitRetaining;
   except
    On E: Exception do
    begin
     MessageDlg('Произошла ошибка при записи данных!'+E.Message, mtWarning, [mbOK], 0);
     DM1.IBT_WRITE.RollbackRetaining;
    end;
   end;
  end;
  Splash.Free; }
end;

procedure TFPerNorm.ARXRASHIFdbf1Click(Sender: TObject);
//VAR
// pp: integer;
begin
{ Splash := ShowSplashWindow(AniBmp1,
 'Переносятся данные ARHRASHI. Подождите, пожалуйста...', True, nil);
 IBArhRashi.Active :=true;
  if not IBArhRashi.Eof then
  begin
   IBArhRashi.First;
   while not IBArhRashi.Eof do IBArhRashi.Delete;
   dm1.startRWTranss;
   try
    if IBArhRashi.UpdatesPending then
       IBArhRashi.ApplyUpdates;
       DM1.IBT_WRITE.Commit;
       DM1.IBT_READ.CommitRetaining;
   except
    On E: Exception do
    begin
     MessageDlg('Произошла ошибка при записи данных!'+E.Message, mtWarning, [mbOK], 0);
     DM1.IBT_WRITE.RollbackRetaining;
    end;
   end;
   if dm1.IBT_Read.Active then dm1.IBT_Read.Active:=false;
   if dm1.IBT_WRITE.Active then dm1.IBT_WRITE.Active:=false;
   IBArhRashi.Close;
  end;
  ArhRashi.Active :=true;
  while not ArhRashi.Eof do
  begin
  pp:=0;
   while (PP<10000) AND (not ArhRashi.Eof) do
   begin
    if (ArHRASHI.FieldByName('god').AsInteger>2004) then
    begin
     IBArhRashi.Append;
     IBArhRashi.FieldByName('Kodp').AsInteger:=ArhRashi.FieldByName('Kodp').AsInteger;
     IBArhRashi.FieldByName('ksm_id').AsInteger:=ArhRashi.FieldByName('ksm_id').AsInteger;
     IBArhRashi.FieldByName('struk_id').AsInteger:=ArhRashi.FieldByName('struk_id').AsInteger;
     IBArhRashi.FieldByName('kei_id').AsInteger:=ArhRashi.FieldByName('kei_id').AsInteger;
     IBArhRashi.FieldByName('plnorm').AsFloat:=ArhRashi.FieldByName('plnorm').AsFloat;
     IBArhRashi.FieldByName('kraz').AsInteger:=ArhRashi.FieldByName('kraz').AsInteger;
     IBArhRashi.FieldByName('mes').AsInteger:=ArhRashi.FieldByName('mes').AsInteger;;
     IBArhRashi.FieldByName('god').AsInteger:=ArhRashi.FieldByName('god').AsInteger;;
     IBArhRashi.FieldByName('Datei').AsDateTime:=ArhRashi.FieldByName('datEI').AsDateTime;
     IBArHRASHI.FieldByName('norm_id').AsVariant:=VNORM_ID;
     IBArhRashi.Post;
     pp:=pp+1;
    end;
    ArhRashi.Next;
   end;
   dm1.startRWTranss;
   try
    if IBArhRashi.UpdatesPending then
     IBArhRashi.ApplyUpdates;
    DM1.IBT_WRITE.Commit;
    DM1.IBT_READ.CommitRetaining;
   except
    On E: Exception do
    begin
     MessageDlg('Произошла ошибка при записи данных!'+E.Message, mtWarning, [mbOK], 0);
     DM1.IBT_WRITE.RollbackRetaining;
    end;
   end;
  end;
  Splash.Free;}
end;

procedure TFPerNorm.ediz1Click(Sender: TObject);
begin
  if (FRazdel = nil) then
    FRazdel := TFRazdel.Create(Application);
 FRazdel.Razdel.Active:=true;
 dm1.ITOGI.Active:=true;
   ITOGI_ST.Active:=true;
   ITOGI_ST.First;
   while not ITOGI_ST.Eof do
   begin
    if (ITOGI_st.FieldByName('Kodp').AsVariant<>0) and (ITOGI_st.FieldByName('Kodp').AsVariant<>null) then
    begin
     DM1.ITOGI.Insert;
     DM1.ITOGI.FieldByName('Kodp').AsInteger:=ITOGI_ST.FieldByName('Kodp').AsInteger;
     DM1.ITOGI.FieldByName('SUM_it').AsFloat:=ITOGI_ST.FieldByName('Sum').AsFloat;
     DM1.ITOGI.FieldByName('struk_id').AsInteger:=ITOGI_ST.FieldByName('struk_id').AsInteger;
     DM1.ITOGI.FieldByName('SUMNDS').AsFloat:=ITOGI_ST.FieldByName('Sumnds').AsFloat;
     DM1.ITOGI.FieldByName('datei').AsDateTime:=ITOGI_ST.FieldByName('datei').AsDateTime;
     DM1.ITOGI.FieldByName('datec').AsDateTime:=ITOGI_ST.FieldByName('datec').AsDateTime;
     DM1.ITOGI.FieldByName('kraz').AsInteger:=ITOGI_ST.FieldByName('kraz').AsInteger;
     DM1.ITOGI.FieldByName('mes').AsInteger:=ITOGI_ST.FieldByName('mes').AsInteger;;
     DM1.ITOGI.FieldByName('god').AsInteger:=ITOGI_ST.FieldByName('god').AsInteger;
     DM1.ITOGI.FieldByName('pr').AsString:=ITOGI_ST.FieldByName('pr').AsString;
     DM1.ITOGI.Post;
    end;
    ITOGI_ST.Next;
   end;
   dm1.startRWTranss;
   DM1.ITOGI.ApplyUpdates;
   DM1.IBT_WRITE.Commit;
end;

procedure TFPerNorm.FormShow(Sender: TObject);
begin
 SpinEdit1.OnChange:=nil;
 SpinEdit2.OnChange:=nil;
 SpinEdit1.Value:=mes;
 SpinEdit2.Value:=god;
 SpinEdit1.OnChange:=SpinEdit1Change;
 SpinEdit2.OnChange:=SpinEdit2Change;
 IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
 S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
 S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
end;

procedure TFPerNorm.IBArhRashiBeforeInsert(DataSet: TDataSet);
begin
{ DM1.Add_NORMDok.StoredProcName := 'ADD_ARHRASHI';
 DM1.Add_nORMDok.ExecProc;
 vNORM_Id := DM1.Add_NORMDok.Params.Items[0].AsInteger;}
end;

procedure TFPerNorm.N1Click(Sender: TObject);
begin
{ Norm_ST.Active :=true;
 if not Norm_st.Eof then
 begin
   Norm_st.First;
   while not Norm_ST.Eof do Norm_st.Delete;
 end;
 Normn_ASY.Active :=false;
 Normn_ASY.ParamByName('mes').AsInteger:=mes;
 Normn_ASY.ParamByName('god').AsInteger:=god;
 Normn_ASY.Active :=true;
 Normn_ASY.First;
 if not Normn_ASY.Eof then
 begin
  Splash := ShowSplashWindow(AniBmp1,
 'Переносятся данные. Подождите, пожалуйста...', True, nil);
  While not Normn_ASY.Eof do
  begin
   Norm_st.Append;
   Norm_st.FieldByName('Kodp').AsInteger:=Normn_ASY.FieldByName('Kodp').AsInteger;
   Norm_st.FieldByName('ksm_id').AsInteger:=Normn_ASY.FieldByName('ksm_id').AsInteger;
   Norm_st.FieldByName('struk_id').AsInteger:=Normn_ASY.FieldByName('struk_id').AsInteger;
   Norm_st.FieldByName('kei_id').AsInteger:=Normn_ASY.FieldByName('kei_id').AsInteger;
   Norm_st.FieldByName('plnorm').AsFloat:=Normn_ASY.FieldByName('plnorm').AsFloat;
   norm_st.FieldByName('kraz').AsInteger:=normn_ASY.FieldByName('kraz').AsInteger;
   Norm_st.FieldByName('mes').AsInteger:=mes;
   norm_st.FieldByName('god').AsInteger:=god;
   Norm_st.FieldByName('norm_id').AsInteger:=Normn_ASY.FieldByName('norm_id').AsInteger;
   Norm_ST.FieldByName('Datav').AsDateTime:=date;
   Norm_ST.FieldByName('Timev').AsString:=TimeToStr(time);
   If NORMn_ASY.FieldByName('pr_ov').AsInteger=1 then NORM_ST.FieldByName('pr_ov').AsBoolean:=true
   else NORM_ST.FieldByName('pr_ov').AsBoolean:=false;
   If NORMn_ASY.FieldByName('prpf').AsInteger=1 then NORM_ST.FieldByName('prpf').AsBoolean:=true
   else NORM_ST.FieldByName('prpf').AsBoolean:=false;
   NORM_ST.FieldByName('nazprpf').AsString:=NORMn_ASY.FieldByName('nazprpf').AsString;
   Norm_st.Post;
   Normn_ASY.Next;
  end;
  Splash.Free;
  MessageDlg('Данные перенесены!', mtWarning, [mbOK], 0);
 end;  }
end;

procedure TFPerNorm.N2Click(Sender: TObject);
begin
 dm1.Copy_Razdel;
 dm1.Copy_Ediz;
 dm1.Copy_Koefpr;
 dm1.Copy_Otxody;
end;

procedure TFPerNorm.NORMN1Click(Sender: TObject);
//var
//NumMin: integer;
begin
{ Norm_ST.Active :=true;
 if not Norm_st.Eof then
 begin
   Norm_st.First;
   while not Norm_ST.Eof do Norm_st.Delete;
 end;
 if dm1.IBQuery1.Active then dm1.IBQuery1.Close;
 DM1.IBQuery1.SQL.Clear;
 DM1.IBQuery1.SQL.Add('select min(norm_id) norm_id from norm');
 DM1.IBQuery1.SQL.Add(' where norm.mes='+inttostr(mes));
 DM1.IBQuery1.SQL.Add(' and norm.god='+inttostr(god));
 dm1.IBQuery1.Open;
 NumMin:=dm1.IBQuery1.FieldByName('norm_id').AsInteger;
 Normn_ASY.Active :=false;
 Normn_ASY.ParamByName('mes').AsInteger:=mes;
 Normn_ASY.ParamByName('god').AsInteger:=god;
 Normn_ASY.Active :=true;
 Normn_ASY.First;
 if not Normn_ASY.Eof then
 begin
  Splash := ShowSplashWindow(AniBmp1,
 'Переносятся данные. Подождите, пожалуйста...', True, nil);
  While not Normn_ASY.Eof do
  begin
   NumMin:=NumMin+1;
   Norm_st.Append;
   Norm_st.FieldByName('Kodp').AsInteger:=Normn_ASY.FieldByName('Kodp').AsInteger;
   Norm_st.FieldByName('ksm_id').AsInteger:=Normn_ASY.FieldByName('ksm_id').AsInteger;
   Norm_st.FieldByName('struk_id').AsInteger:=Normn_ASY.FieldByName('struk_id').AsInteger;
   Norm_st.FieldByName('kei_id').AsInteger:=Normn_ASY.FieldByName('kei_id').AsInteger;
   Norm_st.FieldByName('plnorm').AsFloat:=Normn_ASY.FieldByName('plnorm').AsFloat;
   norm_st.FieldByName('kraz').AsInteger:=normn_ASY.FieldByName('kraz').AsInteger;
   Norm_st.FieldByName('mes').AsInteger:=mes;
   norm_st.FieldByName('god').AsInteger:=god;
   Norm_st.FieldByName('norm_id').AsInteger:=NumMin;
   Norm_ST.FieldByName('Datav').AsDateTime:=date;
   Norm_ST.FieldByName('Timev').AsString:=TimeToStr(time);
   If NORMn_ASY.FieldByName('pr_ov').AsInteger=1 then NORM_ST.FieldByName('pr_ov').AsBoolean:=true
   else NORM_ST.FieldByName('pr_ov').AsBoolean:=false;
   If NORMn_ASY.FieldByName('prpf').AsInteger=1 then NORM_ST.FieldByName('prpf').AsBoolean:=true
   else NORM_ST.FieldByName('prpf').AsBoolean:=false;
   NORM_ST.FieldByName('nazprpf').AsString:=NORMn_ASY.FieldByName('nazprpf').AsString;
   Norm_st.Post;
   Normn_ASY.Next;
  end;
  Splash.Free;
  MessageDlg('Данные перенесены!', mtWarning, [mbOK], 0);
 end;}
end;

procedure TFPerNorm.Otxody1Click(Sender: TObject);
begin
 {DM1.IBQuery1.Active := False;
 DM1.IBQuery1.SQL.Clear;
 DM1.IBQuery1.SQL.Add('select struk_id,stkod from struk');
 DM1.IBQuery1.Open;
 FRazdel.Razdel.Active:=true;
 if not otx_imp.Active then otx_imp.Open;
 dm1.otxody_ST.Active :=true;
 Splash := ShowSplashWindow(AniBmp1,
 'Переносятся данные. Подождите, пожалуйста...', True, nil);
 if not dm1.otxody_st.Eof then
 begin
   dm1.Otxody_st.First;
   while not dm1.Otxody_ST.Eof do
   begin
    if (dm1.Otxody_st.FieldByName('Ksm_id').AsVariant<>0) and (dm1.Otxody_st.FieldByName('Ksm_id1').AsVariant<>null) then
    begin
     otx_imp.Insert;
     IBQuery1.Active := False;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select sprod_id from spprod where ksm_id='+inttostr(dm1.Otxody_st.FieldByName('Ksm_id').AsInteger));
     IBQuery1.Open;
     otx_imp.FieldByName('Sprod_ido').AsInteger:=IBQuery1.FieldByName('sprod_id').AsInteger;
     IBQuery1.Active := False;
     IBQuery1.SQL.Clear;
     IBQuery1.SQL.Add('select sprod_id from spprod where ksm_id='+inttostr(dm1.Otxody_st.FieldByName('Ksm_id1').AsInteger));
     IBQuery1.Open;
     otx_imp.FieldByName('Sprod_idos').AsInteger:=IBQuery1.FieldByName('sprod_id').AsInteger;
     otx_imp.FieldByName('Kodp_o').AsInteger:=dm1.Otxody_st.FieldByName('Ksm_id').AsInteger;
     otx_imp.FieldByName('Kodp_os').AsInteger:=dm1.Otxody_st.FieldByName('Ksm_id1').AsInteger;
     otx_imp.FieldByName('Ksm_ido').AsInteger:=strtoint(dm1.Otxody_st.FieldByName('Ksmo').AsString);
     otx_imp.FieldByName('Ksm_idos').AsInteger:=strtoint(dm1.Otxody_st.FieldByName('Ksmos').AsString);
     otx_imp.FieldByName('datevv').AsDateTime:=date;
     otx_imp.FieldByName('Kei_ido').AsInteger:=strtoint(dm1.Otxody_st.FieldByName('Keio').AsString);
     otx_imp.FieldByName('Kei_idos').AsInteger:=strtoint(dm1.Otxody_st.FieldByName('Keios').AsString);
     otx_imp.FieldByName('Kodst_o').AsString:=dm1.Otxody_st.FieldByName('Kodo_s').AsString;
     otx_imp.FieldByName('Kodst_os').AsString:=dm1.Otxody_st.FieldByName('Kodos_s').AsString;
     if DM1.IBQuery1.locate('stkod',dm1.Otxody_st.FieldByName('kceh').AsInteger,[]) then
      otx_imp.FieldByName('struk_id').AsInteger:=DM1.IBQuery1.FieldByName('struk_id').AsInteger;
     if FRazdel.Razdel.locate('kraz',dm1.Otxody_st.FieldByName('razo').AsInteger,[]) then
      otx_imp.FieldByName('razdel_ido').AsInteger:=FRazdel.RazdelRazdel_id.AsInteger;
     if FRazdel.Razdel.locate('kraz',dm1.Otxody_st.FieldByName('razos').AsInteger,[]) then
      otx_imp.FieldByName('razdel_idos').AsInteger:=FRazdel.RazdelRazdel_id.AsInteger;
     otx_imp.Post;
    end;
    dm1.otxody_ST.Next;
   end;
   dm1.startRWTranss;
   Otx_imp.ApplyUpdates;
   DM1.IBT_WRITE.Commit;
 end;
 Splash.Free;
 MessageDlg('Данные перенесены!', mtWarning, [mbOK], 0);
 FRazdel.Razdel.Active:=false;
 Otx_imp.Close;}
end;

procedure TFPerNorm.SpinEdit1Change(Sender: TObject);
begin
 mes:=SpinEdit1.Value;
 IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
 S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
 S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
end;

procedure TFPerNorm.SpinEdit2Change(Sender: TObject);
begin
 god:=SpinEdit2.Value;
 IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
 S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
 S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
end;

procedure TFPerNorm.ToolButton1Click(Sender: TObject);
begin
{  Normn.Active :=true;
  if not Normn.Eof then
  begin
   Normn.First;
   while not Normn.Eof do Normn.Delete;
   dm1.startRWTranss;
   try
    if Normn.UpdatesPending then
       Normn.ApplyUpdates;
       DM1.IBT_WRITE.Commit;
       DM1.IBT_READ.CommitRetaining;
   except
    On E: Exception do
    begin
     MessageDlg('Произошла ошибка при записи данных!'+E.Message, mtWarning, [mbOK], 0);
     DM1.IBT_WRITE.RollbackRetaining;
    end;
   end;
   if dm1.IBT_Read.Active then dm1.IBT_Read.Active:=false;
   if dm1.IBT_WRITE.Active then dm1.IBT_WRITE.Active:=false;
   normn.Close;
  end;
   FRazdel.Razdel.Active:=true;
   normn.Active:=true;
   if DM1.DOCUMENT.active then DM1.DOCUMENT.Close;
   DM1.DOcUMENT.MacroByName('USL').AsString:='WHERE DOcUMENT.STRUK_ID='+INTTOSTR(VsTRUK_ID)
   + ' AND (DOCUMENT.TIP_OP_ID=119)'
   + ' AND Document.Date_op='+''''+s_dat1+'''';
   DM1.DOCUMENT.OPEN;
   // нормы
   norm_ST.Active:=true;
   norm_ST.First;
   s_kodp:=0;
   Splash := ShowSplashWindow(AniBmp1,
   'Переносятся нормы. Подождите, пожалуйста...', True, nil);
   while not Norm_ST.Eof do
   begin
    DM1.IBQuery1.Active := False;
    DM1.IBQuery1.SQL.Clear;
    DM1.IBQuery1.SQL.Add('select SPROD_id from SPPROD WHERE KSM_ID='+INTTOSTR(Norm_ST.FieldByName('kodp').AsInteger));
    DM1.IBQuery1.Open;
    If (not DM1.IBQuery1.Eof) and (Norm_st.FieldByName('Kodp').AsInteger<>0)and(NORM_st.FieldByName('Ksm_id').AsInteger<>0)and (NORM_st.FieldByName('Kei_id').AsInteger <>0)
    and (NORM_st.FieldByName('KRAZ').AsInteger<>0)and (NORM_st.FieldByName('KRAZ').AsInteger<>99) then
    begin
     if Norm_ST.FieldByName('Kodp').AsInteger<>s_kodp then
     begin
      s_kodp:=Norm_ST.FieldByName('Kodp').AsInteger;
      s_sprod:=DM1.IBQuery1.FieldByName('sprod_id').AsInteger;
      dm1.Document.First;
      if dm1.Document.Locate('Tip_op_id;klient_id',VarArrayOf([119,s_kodp]),[]) then
       vDocument_id:=dm1.DocumentDoc_id.AsInteger
      else
      begin
       vTip_Op_Id:=119;
       v_Tip_Dok:=102;
       vNDoc:='Нор'+inttostr(S_Kodp)+'-'+inttostr(mes)+'.'+inttostr(god);
       vDat_op:=strtodate(s_dat1);
       dm1.Document.Insert;
       dm1.Document.Post;
       dm1.Document.ApplyUpdates;
      end;
     end;
     DM1.IBQuery1.Active := False;
     DM1.IBQuery1.SQL.Clear;
     DM1.IBQuery1.SQL.Add('select KSM_id from MATROP WHERE KSM_ID='+INTTOSTR(Norm_ST.FieldByName('ksm_id').AsInteger));
     DM1.IBQuery1.Open;
     IF NOT DM1.IBQuery1.Eof THEN
     BEGIN
      Normn.Insert;
      Normn.FieldByName('Kodp').AsInteger:=Norm_ST.FieldByName('Kodp').AsInteger;
      Normn.FieldByName('norm_id').AsInteger:=Norm_ST.FieldByName('Norm_id').AsInteger;
      Normn.FieldByName('sprod_id').AsInteger:=s_sprod;
      Normn.FieldByName('doc_id').AsInteger:=vdocument_id;
      Normn.FieldByName('ksm_id').AsInteger:=Norm_ST.FieldByName('ksm_id').AsInteger;
      Normn.FieldByName('struk_id').AsInteger:=Norm_ST.FieldByName('struk_id').AsInteger;
      Normn.FieldByName('kei_id').AsInteger:=Norm_ST.FieldByName('kei_id').AsInteger;
      Normn.FieldByName('plnorm').AsFloat:=Norm_ST.FieldByName('plnorm').AsFloat;
      normn.FieldByName('kraz').AsInteger:=norm_ST.FieldByName('kraz').AsInteger;
      Normn.FieldByName('mes').AsInteger:=norm_ST.FieldByName('mes').AsInteger;;
      normn.FieldByName('god').AsInteger:=norm_ST.FieldByName('god').AsInteger;
      if norm_ST.FieldByName('prpf').AsVariant='True' then normn.FieldByName('prpf').AsInteger:=1;
      normn.FieldByName('nazprpf').AsString:=norm_ST.FieldByName('nazprpf').AsString;
//      normn.FieldByName('norm_id').AsInteger:=vNorm_id;
      if norm_ST.FieldByName('pr_ov').AsVariant='True' then NORMn.FieldByName('pr_ov').AsInteger:=1;
      FRazdel.Razdel.First;
      if FRazdel.Razdel.locate('kraz',norm_ST.FieldByName('kraz').AsInteger,[]) then
       normn.FieldByName('razdel_id').AsInteger:=FRazdel.Razdel.FieldByName('razdel_id').AsInteger;
//     else
//      normn.FieldByName('razdel_id').AsInteger:=0;
      Normn.FieldByName('Tip_op_id').AsInteger:=119;
      Normn.FieldByName('Datanorm').AsDateTime:=strtodate(s_dat1);
      Normn.Post;
     end;
    end;
    Norm_ST.Next;
   end;
   Splash.Free;}
// расшифровки
{   Splash := ShowSplashWindow(AniBmp1,
   'Переносятся расшифровки. Подождите, пожалуйста...', True, nil);
   rashif_ST.Active:=true;
   rashif_ST.First;
   s_kodp:=0;
   while not Rashif_ST.Eof do
   begin
    DM1.IBQuery1.Active := False;
    DM1.IBQuery1.SQL.Clear;
    DM1.IBQuery1.SQL.Add('select SPROD_id from SPPROD WHERE KSM_ID='+INTTOSTR(Rashif_ST.FieldByName('kodp').AsInteger));
    DM1.IBQuery1.Open;
    If (not DM1.IBQuery1.Eof) and (Rashif_st.FieldByName('Kodp').AsInteger<>0) and (Rashif_st.FieldByName('Ksm_id').AsInteger<>0)and (Rashif_st.FieldByName('Kei_id').AsInteger<> 0)
    and (Rashif_st.FieldByName('KRAZ').AsInteger<>0) then
    begin
     if Rashif_ST.FieldByName('Kodp').AsInteger<>s_kodp then
     begin
      s_kodp:=Rashif_ST.FieldByName('Kodp').AsInteger;
      s_sprod:=DM1.IBQuery1.FieldByName('sprod_id').AsInteger;
       dm1.Document.First;
      if dm1.Document.Locate('Tip_op_id;klient_id',VarArrayOf([120,s_kodp]),[]) then
       vDocument_id:=dm1.DocumentDoc_id.AsInteger
      else
      begin
       vTip_Op_Id:=120;
       v_Tip_Dok:=103;
       vNDoc:='Рас'+inttostr(S_Kodp)+'-'+inttostr(mes)+'.'+inttostr(god);
       vDat_op:=strtodate(s_dat1);
       dm1.Document.Insert;
       dm1.Document.Post;
      end;
     end;
     DM1.IBQuery1.Active := False;
     DM1.IBQuery1.SQL.Clear;
     DM1.IBQuery1.SQL.Add('select KSM_id from MATROP WHERE KSM_ID='+INTTOSTR(Rashif_ST.FieldByName('ksm_id').AsInteger));
     DM1.IBQuery1.Open;
     IF NOT DM1.IBQuery1.Eof THEN
     BEGIN
      Normn.Insert;
      Normn.FieldByName('Kodp').AsInteger:=Rashif_ST.FieldByName('Kodp').AsInteger;
      Normn.FieldByName('sprod_id').AsInteger:=s_sprod;
      Normn.FieldByName('doc_id').AsInteger:=vdocument_id;
      Normn.FieldByName('ksm_id').AsInteger:=Rashif_ST.FieldByName('ksm_id').AsInteger;
      Normn.FieldByName('struk_id').AsInteger:=Rashif_ST.FieldByName('struk_id').AsInteger;
      Normn.FieldByName('kei_id').AsInteger:=Rashif_ST.FieldByName('kei_id').AsInteger;
      Normn.FieldByName('plnorm').AsFloat:=Rashif_ST.FieldByName('plnorm').AsFloat;
      normn.FieldByName('kraz').AsInteger:=Rashif_ST.FieldByName('kraz').AsInteger;
      Normn.FieldByName('mes').AsInteger:=Rashif_ST.FieldByName('mes').AsInteger;;
      normn.FieldByName('god').AsInteger:=Rashif_ST.FieldByName('god').AsInteger;
      normn.FieldByName('prpf').AsInteger:=0;
      normn.FieldByName('nazprpf').AsString:='';
//      normn.FieldByName('norm_id').AsInteger:=vNorm_id;
      NORMn.FieldByName('pr_ov').AsInteger:=0;
      FRazdel.Razdel.First;
      if FRazdel.Razdel.locate('kraz',Rashif_ST.FieldByName('kraz').AsInteger,[]) then
       normn.FieldByName('razdel_id').AsInteger:=FRazdel.Razdel.FieldByName('razdel_id').AsInteger;
//     else
//      normn.FieldByName('razdel_id').AsInteger:=0;
      Normn.FieldByName('Tip_op_id').AsInteger:=120;
      Normn.FieldByName('Datanorm').AsDateTime:=strtodate(s_dat1);
      Normn.Post;
     END;
    end;
    Rashif_ST.Next;
   end;}
{   dm1.startRWTranss;
   try
    if dm1.Document.UpdatesPending then
       dm1.Document.ApplyUpdates;
    if Normn.UpdatesPending then
       Normn.ApplyUpdates;
       DM1.IBT_WRITE.Commit;
       DM1.IBT_READ.CommitRetaining;
   except
    On E: Exception do
    begin
     MessageDlg('Произошла ошибка при записи данных!'+E.Message, mtWarning, [mbOK], 0);
     DM1.IBT_WRITE.RollbackRetaining;
    end;
   end;
   Splash.Free;}
end;

procedure TFPerNorm.ToolButton2Click(Sender: TObject);
begin
 Normn.Active :=true;
 Normn.First;
 while not Normn.Eof do Normn.Delete;
end;

procedure TFPerNorm.ToolButton4Click(Sender: TObject);
begin
{   Splash := ShowSplashWindow(AniBmp1,
   'Переносятся итоги. Подождите, пожалуйста...', True, nil);
   FRazdel.Razdel.Active:=true;
   dm1.ITOGI.Active:=true;
   ITOGI_ST.Active:=true;
   ITOGI_ST.First;
   while not ITOGI_ST.Eof do
   begin
    DM1.IBQuery1.Active := False;
    DM1.IBQuery1.SQL.Clear;
    DM1.IBQuery1.SQL.Add('select SPPROD.SPROD_id ');
    DM1.IBQuery1.SQL.Add(' from SPPROD');
    DM1.IBQuery1.SQL.Add(' WHERE SPPROD.KSM_ID='+INTTOSTR(ITOGI_ST.FieldByName('kodp').AsInteger));
    DM1.IBQuery1.Open;
    If (not DM1.IBQuery1.Eof) and (ITOGI_st.FieldByName('Kodp').AsVariant<>0) and (ITOGI_st.FieldByName('Kodp').AsVariant<>null) then
    begin
     DM1.ITOGI.Insert;
     DM1.ITOGI.FieldByName('Kodp').AsInteger:=ITOGI_ST.FieldByName('Kodp').AsInteger;
     DM1.ITOGI.FieldByName('sprod_id').AsInteger:=DM1.IBQuery1.FieldByName('SPROD_ID').AsInteger;
     DM1.ITOGI.FieldByName('SUM_it').AsFloat:=ITOGI_ST.FieldByName('Sum').AsFloat;
     DM1.ITOGI.FieldByName('struk_id').AsInteger:=ITOGI_ST.FieldByName('struk_id').AsInteger;
     DM1.ITOGI.FieldByName('SUMNDS').AsFloat:=ITOGI_ST.FieldByName('Sumnds').AsFloat;
     DM1.ITOGI.FieldByName('datei').AsDateTime:=ITOGI_ST.FieldByName('datei').AsDateTime;
     DM1.ITOGI.FieldByName('datec').AsDateTime:=ITOGI_ST.FieldByName('datec').AsDateTime;
     DM1.ITOGI.FieldByName('kraz').AsInteger:=ITOGI_ST.FieldByName('kraz').AsInteger;
     DM1.ITOGI.FieldByName('mes').AsInteger:=ITOGI_ST.FieldByName('mes').AsInteger;;
     DM1.ITOGI.FieldByName('god').AsInteger:=ITOGI_ST.FieldByName('god').AsInteger;
     DM1.ITOGI.FieldByName('pr').AsString:=ITOGI_ST.FieldByName('pr').AsString;
     DM1.ITOGI.Post;
    end;
    ITOGI_ST.Next;
   end;
   dm1.startRWTranss;
   DM1.ITOGI.ApplyUpdates;
   DM1.IBT_WRITE.Commit;
   Splash.Free; }
end;

procedure TFPerNorm.ToolButton5Click(Sender: TObject);
begin
{ Splash := ShowSplashWindow(AniBmp1,
 'Переносятся данные. Подождите, пожалуйста...', True, nil);
 dm1.CENNIK.Active:=true;
 CEN_DBF.Active:=true;
 CEN_DBF.First;
 while not CEN_DBF.Eof do
 begin
  DM1.IBQuery1.Active := False;
  DM1.IBQuery1.SQL.Clear;
  DM1.IBQuery1.SQL.Add('select KSM_id from MATROP WHERE KSM_ID='+INTTOSTR(CEN_DBF.FieldByName('ksm_id').AsInteger));
  DM1.IBQuery1.Open;
  IF (NOT DM1.IBQuery1.Eof)and(CEN_DBF.FieldByName('datcen').AsDateTime>strtodate('01.01.2008'))
   and(CEN_DBF.FieldByName('KSM_ID').AsVariant<>0) and (CEN_DBF.FieldByName('KSM_ID').AsVariant<>null) then
  begin
     DM1.CENNIK.Insert;
     DM1.CENNIK.FieldByName('KSM_ID').AsInteger:=CEN_DBF.FieldByName('KSM_ID').AsInteger;
     DM1.CENNIK.FieldByName('ACCOUNT').AsString:=CEN_DBF.FieldByName('ACCOUNT').AsString;
     DM1.CENNIK.FieldByName('struk_id').AsInteger:=CEN_DBF.FieldByName('struk_id').AsInteger;
     DM1.CENNIK.FieldByName('kei_id').AsInteger:=CEN_DBF.FieldByName('kei_id').AsInteger;
     DM1.CENNIK.FieldByName('CENA').AsFloat:=CEN_DBF.FieldByName('CENA').AsFloat;
     DM1.CENNIK.FieldByName('datCEN').AsDateTime:=CEN_DBF.FieldByName('datCEN').AsDateTime;
     DM1.CENNIK.FieldByName('PRIZ').AsString:=CEN_DBF.FieldByName('PRIZ').AsString;
     DM1.CENNIK.FieldByName('KORR').AsString:=CEN_DBF.FieldByName('kORR').AsString;
     DM1.CENNIK.FieldByName('USERNET').AsString:=CEN_DBF.FieldByName('USERNET').AsString;
     DM1.CENNIK.FieldByName('CEN_NDS').AsFloat:=CEN_DBF.FieldByName('CEN_NDS').AsFloat;
     DM1.CENNIK.Post;
    end;
    CEN_DBF.Next;
   end;
   dm1.startRWTranss;
   DM1.CENNIK.ApplyUpdates;
   DM1.IBT_WRITE.Commit;
   Splash.Free; }
end;

procedure TFPerNorm.ToolButton6Click(Sender: TObject);
begin
 {IBPodpis.Active:=true;
 DM1.Podpis.Active:=true;
 while not DM1.Podpis.Eof do DM1.Podpis.delete;
 IBPodpis.First;
 while not IBPodpis.Eof do
 begin
     DM1.Podpis.Insert;
     DM1.Podpis.FieldByName('Dolg').Asstring:=IBPodpis.FieldByName('Dolg').AsString;
     DM1.Podpis.FieldByName('Fio').AsString:=IBPodpis.FieldByName('Fio').asstring;
     DM1.Podpis.FieldByName('Polog').AsInteger:=IBPodpis.FieldByName('Polog').AsInteger;
     DM1.Podpis.FieldByName('Struk_id').AsInteger:=IBPodpis.FieldByName('Struk_id').AsInteger;
     DM1.Podpis.FieldByName('Tip_op_id').AsInteger:=IBPodpis.FieldByName('Tip_op_id').AsInteger;
     DM1.Podpis.FieldByName('Tip_dok_id').AsInteger:=IBPodpis.FieldByName('Tip_dok_id').AsInteger;
     DM1.Podpis.Post;
     IBPodpis.Next;
   end;}
{ while not DM1.Podpis.Eof do DM1.Podpis.delete;
 TPodpis.First;
 while not TPodpis.Eof do
 begin
     DM1.Podpis.Insert;
     if TPodpis.FieldByName('Polog').AsString='верх' then
      DM1.Podpis.FieldByName('Polog').AsInteger:=1
     else DM1.Podpis.FieldByName('Polog').AsInteger:=2;
     DM1.Podpis.FieldByName('struk_id').AsInteger:=TPodpis.FieldByName('struk_id').AsInteger;
     If (TPodpis.FieldByName('Reg_id').AsInteger=1)or(TPodpis.FieldByName('Reg_id').AsInteger=2) then
     begin
      DM1.Podpis.FieldByName('Tip_op_id').AsInteger:=119;
      DM1.Podpis.FieldByName('Tip_dok_id').AsInteger:=102
     end
     else
     begin
      DM1.Podpis.FieldByName('Tip_op_id').AsInteger:=120;
      if (TPodpis.FieldByName('Reg_id').AsInteger=3) then
       DM1.Podpis.FieldByName('Tip_dok_id').AsInteger:=104
      else
       DM1.Podpis.FieldByName('Tip_dok_id').AsInteger:=103
     end;
     DM1.Podpis.FieldByName('Dolg').Asstring:=TPodpis.FieldByName('Dolg').AsString;
     DM1.Podpis.FieldByName('Fio').AsString:=TPodpis.FieldByName('Fio').asstring;
     DM1.Podpis.Post;
     TPodpis.Next;
   end; }
{   dm1.startRWTranss;
   DM1.Podpis.ApplyUpdates;
   DM1.IBT_WRITE.Commit;}
end;

procedure TFPerNorm.Otx_impBeforeInsert(DataSet: TDataSet);
begin
{ DM1.Add_NORMDok.StoredProcName := 'ADD_OTXODY';
 DM1.Add_nORMDok.ExecProc;
 vbas_Id := DM1.Add_NORMDok.Params.Items[0].AsInteger;}
end;

end.
