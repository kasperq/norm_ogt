program Pro_Norm;

uses
  ExceptionLog,
  Forms,
  dm in 'dm.pas' {DM1: TDataModule},
  GlMenu_Ogt in 'GlMenu_Ogt.pas' {FGlmenu_ogt},
  PerNorm in 'PerNorm.pas' {FPerNorm},
  Decode_Matrop in 'X:\PublicForms\Decode_Matrop.pas' {DecodeMatrop},
  Decode_Spprod in 'X:\PublicForms\Decode_Spprod.pas' {DecodeSpprod},
  Find_Account in 'X:\PublicForms\Find_Account.pas' {FindAccount},
  Find_LekGroup in 'X:\PublicForms\Find_LekGroup.pas' {FindLekGroup},
  Find_Matrop in 'X:\PublicForms\Find_Matrop.pas' {FindMatrop},
  Find_Spprod in 'X:\PublicForms\Find_Spprod.pas' {FindSpprod},
  Find_Sprorg in 'X:\PublicForms\Find_Sprorg.pas' {FindSprorg},
  Find_Struk in 'X:\PublicForms\Find_Struk.pas' {FindStruk},
  Vibor_Spr in 'X:\PublicForms\Vibor_Spr.pas' {ViborSpr},
  Find_BS in 'X:\PublicForms\Find_BS.pas' {FindBS},
  Update_Sprorg in 'X:\PublicForms\Update_Sprorg.pas' {UpdateSprorg},
  Vibor_Spr_Tree in 'X:\PublicForms\Vibor_Spr_Tree.pas' {ViborSprTree},
  Reg_F in 'X:\PublicForms\Reg_F.pas' {RegF},
  Update_Spprod in 'X:\PublicForms\Update_Spprod.pas' {UpdateSpprod},
  Find_Ean in 'X:\PublicForms\Find_Ean.pas' {FindEan},
  Update_Matrop in 'X:\PublicForms\Update_Matrop.pas' {UpdateMatrop},
  Inf_Klient in 'X:\PublicForms\Inf_Klient.pas' {InfKlient},
  Splach_norm in 'Splach_norm.pas' {FSplash_norm},
  Razdel in 'X:\PublicForms\Razdel.pas' {frazdel},
  ediz in 'X:\PublicForms\ediz.pas' {Find_Ediz},
  PerNovMes in 'PerNovMes.pas' {FPerNovMes},
  Syrie in 'Syrie.pas' {FSyrie},
  Norm in 'Norm.pas' {FNorm},
  Rashif in 'Rashif.pas' {FRashif},
  SyriePeriod in 'SyriePeriod.pas' {FSyrie_Period},
  Podpis in 'Podpis.pas' {FPodpis},
  ViborGrPrep in 'ViborGrPrep.pas' {FViborGrPrep},
  Razdel_vvod in 'Razdel_vvod.pas' {FRazdel_vvod},
  Ediz_vvod in 'Ediz_vvod.pas' {FEdiz_vvod},
  koefpr_vvod in 'koefpr_vvod.pas' {Fkoefpr_vvod},
  BasSyr_vvod in 'BasSyr_vvod.pas' {FBasSyr_vvod},
  otxSpirt_vvod in 'otxSpirt_vvod.pas' {FOtxSpirt_vvod},
  Update_Bank in 'X:\PublicForms\Update_Bank.pas' {UpdateBank},
  Find_Bank in 'X:\PublicForms\Find_Bank.pas' {FindBank},
  VibEan in 'X:\PublicForms\VibEan.pas' {FVibEan},
  RashifCols in 'RashifCols.pas' {FRashifCols};

{$R *.res}
{$R X:\publicForms\anitanec.res}

begin
  Application.Initialize;                     
  Application.Title := 'Нормы';
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TFGlmenu_ogt, FGlmenu_ogt);
  Application.CreateForm(TFSplash_norm, FSplash_norm);
  Application.CreateForm(Tfrazdel, frazdel);
  Application.CreateForm(TFind_Ediz, Find_Ediz);
  Application.CreateForm(TFPerNovMes, FPerNovMes);
  Application.CreateForm(TFSyrie, FSyrie);
  Application.CreateForm(TFNorm, FNorm);
  Application.CreateForm(TFRashif, FRashif);
  Application.CreateForm(TFSyrie_Period, FSyrie_Period);
  Application.CreateForm(TFPodpis, FPodpis);
  Application.CreateForm(TFViborGrPrep, FViborGrPrep);
  Application.CreateForm(TFRazdel_vvod, FRazdel_vvod);
  Application.CreateForm(TFEdiz_vvod, FEdiz_vvod);
  Application.CreateForm(TFkoefpr_vvod, Fkoefpr_vvod);
  Application.CreateForm(TFBasSyr_vvod, FBasSyr_vvod);
  Application.CreateForm(TFOtxSpirt_vvod, FOtxSpirt_vvod);
  Application.CreateForm(TUpdateBank, UpdateBank);
  Application.CreateForm(TFindBank, FindBank);
  Application.CreateForm(TFVibEan, FVibEan);
  if (FRashifCols = nil) then
    Application.CreateForm(TFRashifCols, FRashifCols);
  FSPlash_Norm.SetBar(290,10);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TFPerNorm, FPerNorm);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TFNorm, FNorm);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TDecodeMatrop, DecodeMatrop);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TDecodeSpprod, DecodeSpprod);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TFindAccount, FindAccount);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TFindLekGroup, FindLekGroup);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TFindMatrop, FindMatrop);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TFindSpprod, FindSpprod);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TFindSprorg, FindSprorg);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TFindStruk, FindStruk);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TViborSpr, ViborSpr);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TFindBS, FindBS);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TUpdateSprorg, UpdateSprorg);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TInfKlient, InfKlient);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TViborSprTree, ViborSprTree);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TRegF, RegF);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TUpdateSpprod, UpdateSpprod);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TFindEan, FindEan);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.CreateForm(TUpdateMatrop, UpdateMatrop);
  FSPlash_Norm.ProgressBar1.StepIt;
  Application.Run;
end.
