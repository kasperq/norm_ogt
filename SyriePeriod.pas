unit SyriePeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ToolEdit, FindDlgEh, ImgList, Grids, DBGridEh, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ToolWin, DB, RxMemDS,RxStrUtils,DateUtils,
  SplshWnd,UtilRIB, TeEngine, Series, TeeProcs, Chart, DbChart, DBGrids,
  Placemnt, PrnDbgeh, DBTables;

type
  TFSyrie_Period = class(TForm)
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton4: TToolButton;
    Label2: TLabel;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label19: TLabel;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label27: TLabel;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    SpeedButton6: TSpeedButton;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    DBGridEh1: TDBGridEh;
    ImageList1: TImageList;
    FindDlgEh1: TFindDlgEh;
    DateEdit1: TDateEdit;
    Label1: TLabel;
    DateEdit2: TDateEdit;
    Panel2: TPanel;
    DSyr_Period: TDataSource;
    Syr_Period: TRxMemoryData;
    Syr_PeriodKraz: TIntegerField;
    Syr_Periodstruk_id: TIntegerField;
    Syr_Periodkod_Prod: TStringField;
    Syr_Periodkodp: TIntegerField;
    Syr_PeriodNmat: TStringField;
    Syr_PeriodNeis: TStringField;
    Syr_PeriodNorm_1: TFloatField;
    Syr_PeriodNorm_2: TFloatField;
    Syr_PeriodNorm_3: TFloatField;
    Syr_PeriodNorm_4: TFloatField;
    Syr_PeriodNorm_5: TFloatField;
    Syr_PeriodNorm_6: TFloatField;
    Syr_PeriodNorm_7: TFloatField;
    Syr_PeriodNorm_8: TFloatField;
    Syr_PeriodNorm_9: TFloatField;
    Syr_PeriodNorm_10: TFloatField;
    Syr_PeriodNorm_11: TFloatField;
    Syr_PeriodNorm_12: TFloatField;
    Syr_Periodplnorm: TFloatField;
    DBChart1: TDBChart;
    Grafik_Prep: TRxMemoryData;
    DSGrafik_Prep: TDataSource;
    Syr_PeriodStname: TStringField;
    Syr_Periodmes_begin: TIntegerField;
    Syr_Periodmes_end: TIntegerField;
    Syr_Periodgod_end: TIntegerField;
    Syr_Periodgod_begin: TIntegerField;
    Series1: TLineSeries;
    Grafik_Prepkod_prod: TStringField;
    Grafik_Prepplnorm: TFloatField;
    Grafik_Prepmes: TIntegerField;
    Grafik_PrepNmat: TStringField;
    Grafik_Prepmes_god: TStringField;
    Grafik_PrepDat_Period: TDateTimeField;
    FormStorage1: TFormStorage;
    Splitter1: TSplitter;
    PrintDBGridEh1: TPrintDBGridEh;
    procedure SyriePeriodSost;
    procedure Edit4Click(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit10Click(Sender: TObject);
    procedure Edit10KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure DateEdit2Change(Sender: TObject);
    procedure Syr_PeriodAfterScroll(DataSet: TDataSet);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSyrie_Period: TFSyrie_Period;
  Splash: TForm;
  AniBmp1: TBitmap;
  s_dat1_period: tdate;
  s_dat2_period: tdate;
  mes_begin: integer;
  mes_end: integer;
  god_begin: integer;
  god_end: integer;
  dmes: integer;
  dgod: integer;
  i: integer;
  j: integer;
  mes_C: integer;
  god_c: integer;
implementation
 uses dm,Razdel,Find_Struk,Find_Matrop;
{$R *.dfm}

procedure TFSyrie_Period.DateEdit1Change(Sender: TObject);
begin
 if (DateEdit1.text<>'' ) then
  begin
   s_dat1_period:=strtodate(dateEdit1.Text);
   if (DateEdit1.text<=datetostr(s_dat2_period)) and (edit1.text<>'') then
    SyriePeriodSost
  end;
end;

procedure TFSyrie_Period.DateEdit2Change(Sender: TObject);
begin
 if (DateEdit2.text<>'' )  then
  begin
   s_dat2_period:=strtodate(dateEdit2.Text);
   if (DateEdit2.text>=datetostr(s_dat1_period)) and (edit1.text<>'') then
      fSyrie_Period.SyriePeriodSost
  end;
end;

procedure TFSyrie_Period.Edit10Click(Sender: TObject);
begin
 Edit10.Text:='';
 Edit11.Text:='';
 usl:='0=0'
end;

procedure TFSyrie_Period.Edit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   if edit10.text<>''  then
   begin
    if FRazdel=nil then FRazdel:=TFRazdel.Create(Application);
    FRazdel.razdel.Active:=true;
    if FRazdel.Razdel.Locate('kraz',strtoint(edit10.Text),[]) then
    begin
     raz:=FRazdel.RazdelRazdel_id.AsInteger;
     Edit11.Text:=FRazdel.RazdelNamraz.AsString;
     Edit10.Text:=inttostr(FRazdel.RazdelKraz.AsInteger);
     usl:=' norm.kraz='+inttostr(FRazdel.RazdelKraz.AsInteger);
    end
    else
     showMessage('Нет такого кода! Воспользуйтесь справочником!');
   end
   else usl:='0=0';
   if edit1.Text<>'' then SyriePeriodSost;
 end;
end;

procedure TFSyrie_Period.Edit1Click(Sender: TObject);
begin
 LABEL4.Caption:='';
 LABEL5.Caption:='';
 LABEL7.Caption:='';
 LABEL11.Caption:='';
 LABEL19.Caption:='';
 edit1.text:='';
end;

procedure TFSyrie_Period.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   if edit1.text<>''  then
   begin
    dM1.Matrop.Active:=false;
    dM1.Matrop.ParamByName('ksm').AsInteger:=strtoint(edit1.text);
    dM1.Matrop.Active:=TRUE;
    if not dm1.Matrop.eof then
    begin
     s_ksm:=strtoint(edit1.text);
     s_nmat:=dm1.Matrop.FieldByName('Nmat').AsString;
     s_kei :=dm1.Matrop.FieldByName('Kei_id').AsInteger;
     s_Xarkt :=dm1.Matrop.FieldByName('Xarkt').AsString;
     Label4.Caption :=dm1.Matrop.FieldByName('Xarkt').AsString;
     Label5.Caption :=dm1.Matrop.FieldByName('Gost').AsString;
     Label7.Caption :=dm1.MatropNamspsr.AsString;
     Label11.Caption :=dm1.MatropNam.AsString;
     Label19.Caption:=dm1.Matrop.FieldByName('Nmat').AsString;
     if edit4.Text<>'' then Sort := ' ' else Sort := ' order by norm.struk_id,norm.kodp';
     SyriePeriodSost;
    end
    else
     showMessage('Нет такого кода! Воспользуйтесь справочником!');
   end;
 end;
end;

procedure TFSyrie_Period.Edit4Click(Sender: TObject);
begin
 Edit4.Text:='';
 Edit5.Text:='';
 struk:=0;
end;

procedure TFSyrie_Period.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
  if (Edit4.Text<>'') then
  begin
    Edit4.Text:=replacestr(edit4.text,',','.');
    kod:=SelectToVarIB('SELECT  struk.stname FROM  struk WHERE struk.kod_struk='+''+Edit4.Text+'',dm1.BELMED, dm1.BELMED.DefaultTransaction);
    If kod=Null then
    begin
      MessageDlg('Неправильно введен код подразделения!', mtInformation,[mbOk], 0);
      Edit4.Text:='';
    end
    else
    begin
      Edit5.Text:=kod;
      struk:=SelectToVarIB('SELECT  struk.struk_id FROM  struk WHERE struk.kod_struk='+''+Edit4.Text+'',dm1.BELMED, dm1.BELMED.DefaultTransaction);
    end;
  end;
  sort:=' ';
  if edit1.Text<>'' then
    SyriePeriodSost
 end;
end;

procedure TFSyrie_Period.FormShow(Sender: TObject);
var
  i : integer;
begin
 LABEL4.Caption:='';
 LABEL5.Caption:='';
 LABEL7.Caption:='';
 LABEL11.Caption:='';
 LABEL19.Caption:='';
 edit1.text:='';
 IF MES<10 THEN S_MES:='0'+INTTOSTR(MES) ELSE S_MES:=INTTOSTR(MES);
 S_DAT1:='01.'+S_MES+'.'+copy(INTTOSTR(GOD),3,2);
 S_DAT2:=datetostr(IncMonth(strtodate(s_dat1),1)-1);
 s_dat1_period:=strtodate(s_dat1);
 s_dat2_period:=strtodate(s_dat2);
 DateEdit1.text:=datetostr(s_dat1_period);
 DateEdit2.text:=datetostr(s_dat2_period);
 for I := 5 to 16 do  DBGridEh1.Columns[i].Visible:=false;
end;

procedure TFSyrie_Period.SpeedButton2Click(Sender: TObject);
begin
 if FindMatrop=nil then FindMatrop:=TfindMatrop.Create(Application);
 FindMatrop.DataBaseName:=dm1.BELMED;
 FindMatrop.ReadOnly:=true;
 FindMatrop.ShowModal;
 if FindMatrop.ModalResult > 50 then
 begin
  s_ksm:=FindMatrop.ModalResult-50;
  s_kei :=FindMatrop.IBMatropKei_id.AsInteger;
  edit1.Text:=inttostr(FindMatrop.ModalResult-50);
  Label4.Caption :=FindMatrop.IBMatropXARKT.AsString;
  Label5.Caption :=FindMatrop.IBMatropGOST.AsString;
  Label7.Caption :=FindMatrop.IBMatropNamspsr.AsString;
  Label11.Caption :=FindMatrop.IBMatropNam.AsString;
  Label19.Caption :=FindMatrop.IBMatropNMAT.AsString;
  if edit4.Text<>'' then Sort := ' ' else Sort := ' order by norm.struk_id,norm.kodp';
  SyriePeriodSost;
 end;
end;

procedure TFSyrie_Period.SpeedButton3Click(Sender: TObject);
begin
 if FindStruk=nil then FindStruk:=TfindStruk.Create(Application);
 FindStruk.WindowState:=wsNormal;
 FindStruk.DataBaseName:=dm1.BELMED;
 FindStruk.Vibor:=False;
 FindStruk.ReadOnly:=False;
 FindStruk.ShowModal;
 If FindStruk.ModalResult > 50 then
 begin
  sort:=' ';
  STRUK :=FindStruk.ModalResult-50;
  Edit5.Text:=FindStruk.name;
  Edit4.Text:=FindStruk.kod;
  if edit1.Text<>'' then SyriePeriodSost;
 end;
end;

procedure TFSyrie_Period.SpeedButton6Click(Sender: TObject);
begin
 if FRazdel=nil then FRazdel:=TFRazdel.Create(Application);
   FRazdel.ShowModal;
 if FRazdel.ModalResult>50 then
 begin
  raz:=FRazdel.ModalResult-50;
  Edit11.Text:=FRazdel.RazdelNamraz.AsString;
  Edit10.Text:=inttostr(FRazdel.RazdelKraz.AsInteger);
  usl:=' norm.kraz='+inttostr(FRazdel.RazdelKraz.AsInteger);
  if edit1.Text<>'' then SyriePeriodSost;
 end
 else usl:='0=0';
end;

procedure TfSyrie_Period.SyriePeriodSost;
var
  i : integer;
begin
 god_begin:=yearof(s_dat1_period);
 god_end:=yearof(s_dat2_period);
 dgod:=god_end-god_begin;
 if (dgod<=1)or(dgod>=0) then
 begin
  mes_begin:=monthof(s_dat1_period);
  mes_end:=monthof(s_dat2_period);
  if (dgod=0) then
   dmes:=mes_end-mes_begin+1
  else
   dmes:=mes_end+(13-mes_begin);
  if (dmes<=12)and(dmes>=0) then
  begin
   Syr_Period.AfterScroll:=nil;
   Splash := ShowSplashWindow(AniBmp1,
  'Загрузка данных. Подождите, пожалуйста...', True, nil);
   fSyrie_Period.Syr_Period.EmptyTable;
   fSyrie_Period.Syr_Period.Active:=true;
   fSyrie_Period.Syr_Period.DisableControls;
   mes_c:=mes_begin;
   god_c:=god_begin;
   j:=5;
   for I := 1 to dmes do
   begin
    DBGridEh1.Columns[j].FieldName:='Norm_'+IntToStr(i);
    DBGridEh1.Columns[j].Title.Caption:=DM1.MesName_1(mes_c)+ ' '+IntToStr(god_c)+' г.';
    DBGridEh1.Columns[j].Visible:=true;
    if dm1.NormSyr.Active then dm1.NormSyr.Close;
    DM1.NormSyr.ParamByName('KSM_ID').AsInteger:=S_Ksm;
    DM1.NormSyr.ParamByName('GOD').AsInteger:=god_c;
    DM1.NormSyr.ParamByName('MES').AsInteger:=mes_c;
    DM1.NormSyr.ParamByName('STRUK').AsInteger:=Struk;
    DM1.NormSyr.MacroByName('SORT').AsString:=Sort;
    DM1.NormSyr.MacroByName('usl').AsString:=usl;
    DM1.NormSyr.Open;
    DM1.NormSyr.First;
//    if i=1 then Syr_Period.LoadFromDataSet(DM1.NormSyr,0,lmAppend);
    While not DM1.NormSyr.Eof do
    begin
     Syr_Period.First;
     if not Syr_Period.Locate('kodp;kraz',VarArrayOf([dm1.NormSyr.FieldByName('Kodp').AsInteger,dm1.NormSyr.FieldByName('KRAZ').AsInteger]),[]) then
     begin
      Syr_Period.Insert;
      Syr_Period.FieldByName('mes_begin').AsInteger:=mes_begin;
      Syr_Period.FieldByName('mes_end').AsInteger:=mes_end;
      Syr_Period.FieldByName('god_begin').AsInteger:=god_begin;
      Syr_Period.FieldByName('god_end').AsInteger:=god_end;
      Syr_Period.FieldByName('kraz').AsInteger:=DM1.NormSyr.FieldByName('Kraz').AsInteger;
      Syr_Period.FieldByName('struk_id').AsInteger:=DM1.NormSyr.FieldByName('Struk_id').AsInteger;
      Syr_Period.FieldByName('kodp').AsInteger:=DM1.NormSyr.FieldByName('Kodp').AsInteger;
      Syr_Period.FieldByName('kod_prod').AsString:=DM1.NormSyr.FieldByName('Kod_prod').AsString;
      Syr_Period.FieldByName('Nmat').AsString:=DM1.NormSyr.FieldByName('Nmat').AsString;
      Syr_Period.FieldByName('Neis').AsString:=DM1.NormSyr.FieldByName('Neis').AsString;
      Syr_Period.FieldByName('stname').AsString:=DM1.NormSyr.FieldByName('Stname').AsString;
     end
     else
      fSyrie_Period.Syr_Period.Edit;
//     i1:=Syr_Period.FieldByName('mes').Asinteger-mes_begin+1;
     case i of
       1: fSyrie_Period.Syr_Period.FieldByName('Norm_1').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       2: fSyrie_Period.Syr_Period.FieldByName('Norm_2').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       3: fSyrie_Period.Syr_Period.FieldByName('Norm_3').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       4: fSyrie_Period.Syr_Period.FieldByName('Norm_4').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       5: fSyrie_Period.Syr_Period.FieldByName('Norm_5').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       6: fSyrie_Period.Syr_Period.FieldByName('Norm_6').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       7: fSyrie_Period.Syr_Period.FieldByName('Norm_7').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       8: fSyrie_Period.Syr_Period.FieldByName('Norm_8').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       9: fSyrie_Period.Syr_Period.FieldByName('Norm_9').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       10: fSyrie_Period.Syr_Period.FieldByName('Norm_10').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       11: fSyrie_Period.Syr_Period.FieldByName('Norm_11').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
       12: fSyrie_Period.Syr_Period.FieldByName('Norm_12').asFloat := DM1.NormSyr.FieldByName('Plnorm').asFloat;
     end;
     fSyrie_Period.Syr_Period.Post;
     DM1.NormSyr.Next;
    end;
    mes_c:=mes_c+1;
    if mes_c=13 then
    begin
     mes_c:=1;
     god_c:=god_c+1;
    end;
    j:=j+1;
   end;
   if j<=16 then
    for I := j to 16 do  DBGridEh1.Columns[i].Visible:=false;
   fSyrie_Period.Syr_Period.EnableControls;
   Splash.free;
   Syr_Period.First;
   Syr_Period.AfterScroll:=Syr_PeriodAfterScroll;
   if Syr_Period.Eof then Syr_Period.Prior else Syr_Period.Next;
  end
  else
   MessageDlg('Задайте период меньше 12 месяцев!', mtError, [mbOK], 0);
 end;
end;


procedure TFSyrie_Period.Syr_PeriodAfterScroll(DataSet: TDataSet);
var
  i : integer;
begin
 if Grafik_Prep.Active then Grafik_Prep.Close;
 Grafik_Prep.EmptyTable;
 Grafik_Prep.Active:=true;
 for I := 1 to dmes do
 begin
  Grafik_Prep.Insert;
  if mes_begin+i-1>12 then
  begin
   Grafik_PrepMes.AsInteger:=mes_begin+i-13;
   Grafik_PrepMes_god.AsString:=DM1.MesName_1(mes_begin+i-13);
   Grafik_PrepDat_Period.AsDateTime:=strtodate('01.'+inttostr(mes_begin+i-13)+'.'+inttostr(god_end));
  end
  else
  begin
   Grafik_PrepMes.AsInteger:=mes_begin+i-1;
   Grafik_PrepMes_god.AsString:=DM1.MesName_1(mes_begin+i-1);
   Grafik_PrepDat_Period.AsDateTime:=strtodate('01.'+inttostr(mes_begin+i-1)+'.'+inttostr(god_begin));
  end;
  Grafik_PrepKod_Prod.AsString:=Syr_Period.FieldByName('Kod_Prod').AsString;
  Grafik_PrepNmat.AsString:=Syr_Period.FieldByName('Nmat').AsString;
  case i of
     1: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_1').asFloat;
     2: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_2').asFloat;
     3: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_3').asFloat;
     4: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_4').asFloat;
     5: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_5').asFloat;
     6: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_6').asFloat;
     7: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_7').asFloat;
     8: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_8').asFloat;
     9: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_9').asFloat;
     10: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_10').asFloat;
     11: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_11').asFloat;
     12: Grafik_Prep.FieldByName('Plnorm').asFloat:=fSyrie_Period.Syr_Period.FieldByName('Norm_12').asFloat;
  end;
  Grafik_Prep.Post;
 end;
end;

procedure TFSyrie_Period.ToolButton4Click(Sender: TObject);
 var
nm: string;
F_column: string;
begin
 nm:=dm1.MesName_1(mes);
 F_column:=FindDlgEh1.VerbalUsl.Text;
 printdbgrideh1.Title.Text:='Таблица изменения норм расхода сырья '+Edit1.Text+' '+label19.Caption+#13+#10+' за период с '
 +datetostr(s_dat1_period)+' по '+datetostr(s_dat2_period)+#13+#10+' Условие выборки: '+F_column;
 Syr_period.DisableControls;
 printdbgrideh1.Preview;
 Syr_period.EnableControls;

end;

end.
