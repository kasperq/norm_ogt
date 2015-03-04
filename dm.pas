unit dm;

interface

uses
  Windows,SysUtils, Classes, IBCustomDataSet, IBUpdateSQL, RxMemDS, IBTable,
  FR_DSet, FR_DBSet, FR_Class, IBSQL, DB, RxIBQuery, IBQuery, IBStoredProc,
  IBDatabase, IBUpdSQLW,Dialogs,Controls,Variants,IB,Forms,FindDlgEh, Menus, ImgList, Grids, DBGridEh, ComCtrls,
  StdCtrls, Mask, DBCtrls, DBCtrlsEh,ToolWin,Graphics, Messages,ExtCtrls, DBGrids, 
  DBLookupEh, BDEUtils, UtilR, UtilRIB,SplshWnd,IniFiles,Math, frxClass,
  frxDMPExport, frxDBSet, DBTables, frOLEExl, FR_E_TXT, FR_E_RTF, frRtfExp,
  frXMLExl,RxStrUtils, frxExportXLS, frxExportRTF, frxExportHTML, frxExportXML,
  frxExportPDF, frxDCtrl, FR_E_HTML2, frexpimg, kbmMemTable;
type
  TDM1 = class(TDataModule)
    BELMED: TIBDatabase;
    IBT_Read: TIBTransaction;
    IBT_Write: TIBTransaction;
    DS_ConfigUMC: TDataSource;
    ConfigUMC: TRxIBQuery;
    ConfigUMCMES: TSmallintField;
    ConfigUMCGOD: TSmallintField;
    ConfigUMCSTNAME: TIBStringField;
    ConfigUMCSTRUK_ID: TSmallintField;
    ConfigUMCTIP_SKLAD_ID: TSmallintField;
    ConfigUMCOTTISK: TIBStringField;
    ConfigUMCOTP_PROIZV: TIBStringField;
    ConfigUMCPUNKT_POGR: TIBStringField;
    ConfigUMCUpdate: TIBUpdateSQLW;
    norm: TRxIBQuery;
    IBUpdateSQLNorm: TIBUpdateSQLW;
    DSNORM: TDataSource;
    Rashif_s: TRxIBQuery;
    IBUpdateSQLRashif_s: TIBUpdateSQLW;
    DSRashif_s: TDataSource;
    ITOGI: TRxIBQuery;
    IBUpdateSQLITOGI: TIBUpdateSQLW;
    DSITOGI: TDataSource;
    ITOGIKODP: TIntegerField;
    ITOGISTRUK_ID: TSmallintField;
    ITOGIDATEC: TDateField;
    ITOGIKRAZ: TSmallintField;
    ITOGIMES: TSmallintField;
    ITOGIGOD: TSmallintField;
    ITOGIDATEI: TDateField;
    ITOGIITOGI_ID: TIntegerField;
    ITOGIPR: TIBStringField;
    ITOGINAMRAZ: TIBStringField;
    ITOGINAMEPR: TIBStringField;
    IBQuery1: TIBQuery;
    frDBDataSet1: TfrDBDataSet;
    frReport2: TfrReport;
    frDBDataSet2: TfrDBDataSet;
    DSDocument: TDataSource;
    Document: TRxIBQuery;
    IBUpdateDoc: TIBUpdateSQLW;
    ADD_NormDok: TIBStoredProc;
    DocumentTIP_DOK_ID: TSmallintField;
    DocumentNDOK: TIBStringField;
    DocumentDOC_ID: TIntegerField;
    DocumentDATE_OP: TDateField;
    DocumentDATE_DOK: TDateField;
    DocumentKLIENT_ID: TIntegerField;
    DocumentTIP_OP_ID: TSmallintField;
    DocumentDATE_VVOD: TDateTimeField;
    DocumentSTRUK_ID: TSmallintField;
    DocumentZADACHA_ID: TIBStringField;
    IBRabNorm: TIBQuery;
    New_Mes: TIBStoredProc;
    RxIBRaschetRashif: TRxIBQuery;
    IBRabNormKRAZ: TSmallintField;
    IBRabNormPRPF: TSmallintField;
    IBRabNormKODP: TIntegerField;
    IBRabNormKSM_ID: TIntegerField;
    IBRabNormSTRUK_ID: TSmallintField;
    IBRabNormKEI_ID: TSmallintField;
    IBRabNormPLNORM: TFMTBCDField;
    IBRabNormMES: TSmallintField;
    IBRabNormGOD: TSmallintField;
    IBRabNormNAZPRPF: TIBStringField;
    IBRabNormNORM_ID: TIntegerField;
    IBRabNormDOC_ID: TIntegerField;
    IBRabNormPR_OV: TSmallintField;
    IBRabNormXARKT: TIBStringField;
    IBRabNormRAZDEL_ID: TSmallintField;
    IBRabNormTIP_OP_ID: TSmallintField;
    IBRabNormNEIS: TIBStringField;
    Matrop: TIBQuery;
    MatropNMAT: TIBStringField;
    MatropXARKT: TIBStringField;
    MatropKEI_ID: TSmallintField;
    MatropKSM_ID: TIntegerField;
    MatropNEIS: TIBStringField;
    MatropPRMAT: TIBStringField;
    MatropNAM: TIBStringField;
    MatropNAMSPSR: TIBStringField;
    NormSyr: TRxIBQuery;
    IBUpdateNormSyr: TIBUpdateSQLW;
    DSNormSyr: TDataSource;
    Rashif: TIBQuery;
    DSRashif: TDataSource;
    CENNIK: TRxIBQuery;
    IBUpdateCENNIK: TIBUpdateSQLW;
    DSCennik: TDataSource;
    CENNIKKSM_ID: TIntegerField;
    CENNIKACCOUNT: TIBStringField;
    CENNIKCENA: TIBBCDField;
    CENNIKKEI_ID: TSmallintField;
    CENNIKDATCEN: TDateField;
    CENNIKPRIZ: TIBStringField;
    CENNIKSTRUK_ID: TSmallintField;
    CENNIKKORR: TIBStringField;
    CENNIKUSERNET: TIBStringField;
    CENNIKDAT_KOR: TDateField;
    CENNIKCEN_NDS: TIBBCDField;
    CENNIKCEN_ID: TIntegerField;
    CENNIKDATE_TIME_UPDATE: TDateTimeField;
    sumRash_Razd: TIBQuery;
    DSsumRash_Razd: TDataSource;
    PFNorm: TIBQuery;
    DSPfnorm: TDataSource;
    PFNormKSM_ID: TIntegerField;
    PFNormKEI_ID: TSmallintField;
    PFNormKRAZ: TSmallintField;
    PFNormNMAT: TIBStringField;
    PFNormNEIS: TIBStringField;
    PFNormKOD_PROD: TIBStringField;
    PFNormSTNAME: TIBStringField;
    PFNormPLNORM: TFloatField;
    IBRabNormDATANORM: TDateField;
    frReport1: TfrReport;
    frDBDataSet3: TfrDBDataSet;
    R_sprod: TRxIBQuery;
    IBUpdater_Sprod: TIBUpdateSQLW;
    R_sprodLEKKOD: TIBStringField;
    R_sprodKSM_ID: TIntegerField;
    R_sprodNMAT: TIBStringField;
    R_sprodSPPRN: TSmallintField;
    R_sprodSPVIS: TSmallintField;
    R_sprodXARKT: TIBStringField;
    R_sprodSPKSM: TIBStringField;
    R_sprodNEIS_PR: TIBStringField;
    R_sprodNAMEGR: TIBStringField;
    Podpis: TRxIBQuery;
    IBUpdatePodpis: TIBUpdateSQLW;
    PodpisPODPIS_ID: TIntegerField;
    PodpisPOLOG: TSmallintField;
    PodpisFIO: TIBStringField;
    PodpisTIP_OP_ID: TSmallintField;
    PodpisSTRUK_ID: TSmallintField;
    PodpisTIP_DOK_ID: TSmallintField;
    frxReport1: TfrxReport;
    R_sprodSTNAME: TIBStringField;
    P_Rashif: TRxMemoryData;
    P_Rashifkodp: TFloatField;
    P_RashifNMATP: TStringField;
    P_RashifXARKTP: TStringField;
    P_Rashifneis: TStringField;
    P_RashifKSM_ID: TIntegerField;
    P_RashifSTRUK_ID: TIntegerField;
    P_Rashifnamreg: TStringField;
    P_RashifPlnorm: TFloatField;
    P_RashifKraz: TIntegerField;
    P_Rashifcena: TFloatField;
    P_Rashifcena_nds: TFloatField;
    P_Rashifcennorm: TFloatField;
    P_Rashifcennorm_nds: TFloatField;
    P_Rashifnds: TFloatField;
    P_RashifPrras: TStringField;
    P_RashifGostP: TStringField;
    P_Rashifneisp: TStringField;
    P_Rashifstname: TStringField;
    P_Rashifnmat: TStringField;
    P_Rashifkodraz: TStringField;
    P_Rashifnamraz: TStringField;
    P_Rashifdoc_id: TIntegerField;
    DSpodpis: TDataSource;
    Rashif_sKODP: TIntegerField;
    Rashif_sKSM_ID: TIntegerField;
    Rashif_sKRAZ: TSmallintField;
    Rashif_sNAMRAZ: TIBStringField;
    Rashif_sKODRAZ: TIBStringField;
    Rashif_sNMAT: TIBStringField;
    Rashif_sNEIS: TIBStringField;
    Rashif_sCENA: TFloatField;
    Rashif_sCEN_NDS: TFloatField;
    Rashif_sCENNORM: TFloatField;
    Rashif_sCENNORM_NDS: TFloatField;
    Rashif_sNDS: TFloatField;
    R_sprodSTRUK_ID: TSmallintField;
    R_sprodKEI_ID: TSmallintField;
    ITOGIDOC_ID: TIntegerField;
    RxIBRaschetRashifKODP: TIntegerField;
    RxIBRaschetRashifKSM_ID: TIntegerField;
    RxIBRaschetRashifKEI_ID: TSmallintField;
    RxIBRaschetRashifKODRAZ: TIBStringField;
    RxIBRaschetRashifPLNORM: TFMTBCDField;
    P_Rashifgost: TStringField;
    P_Rashifxarkt: TStringField;
    P_Rashifnazprpf: TStringField;
    DSR_SPROD: TDataSource;
    datcen: TIBQuery;
    datcenDATCEN: TDateField;
    DSdatcen: TDataSource;
    R_sprodLEK_ID: TSmallintField;
    R_sprodVIB: TIntegerField;
    R_sprodMES: TIntegerField;
    R_sprodGOD: TIntegerField;
    R_sprodVID: TIntegerField;
    IBRabNormNMAT: TIBStringField;
    IBRabNormKODRAZ: TIBStringField;
    IBRabNormNAMRAZ: TIBStringField;
    Rashif_sPRRAS: TIBStringField;
    sumRash_RazdKODRAZ: TLargeintField;
    sumRash_RazdNAMRAZ: TIBStringField;
    sumRash_RazdSUMCENNORM: TFloatField;
    sumRash_RazdSUMCENNORM_NDS: TFloatField;
    normKRAZ: TSmallintField;
    normPRPF: TIntegerField;
    normKODP: TIntegerField;
    normKSM_ID: TIntegerField;
    normSTRUK_ID: TSmallintField;
    normKEI_ID: TSmallintField;
    normPLNORM: TFloatField;
    normMES: TSmallintField;
    normGOD: TSmallintField;
    normNAZPRPF: TIBStringField;
    normNORM_ID: TIntegerField;
    normDOC_ID: TIntegerField;
    normTIP_OP_ID: TSmallintField;
    normDATANORM: TDateField;
    normPR_OV: TIntegerField;
    normXARKT: TIBStringField;
    normNMAT: TIBStringField;
    normNEIS: TIBStringField;
    normRAZDEL_ID: TSmallintField;
    normKODRAZ: TIBStringField;
    normNAMRAZ: TIBStringField;
    NormArx: TIBQuery;
    DNormArx: TDataSource;
    NormArxKRAZ: TSmallintField;
    NormArxPRPF: TIntegerField;
    NormArxKODP: TIntegerField;
    NormArxKSM_ID: TIntegerField;
    NormArxSTRUK_ID: TIntegerField;
    NormArxKEI_ID: TIntegerField;
    NormArxPLNORM: TFloatField;
    NormArxMES: TSmallintField;
    NormArxGOD: TSmallintField;
    NormArxNAZPRPF: TIBStringField;
    NormArxNORM_ID: TIntegerField;
    NormArxPR_OV: TIntegerField;
    NormArxXARKT: TIBStringField;
    NormArxNMAT: TIBStringField;
    NormArxNEIS: TIBStringField;
    NormArxRAZDEL_ID: TSmallintField;
    NormArxKODRAZ: TIBStringField;
    NormArxNAMRAZ: TIBStringField;
    RashifArx: TIBQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    FloatField1: TFloatField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    IBStringField1: TIBStringField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    SmallintField4: TSmallintField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    DSRashifArx: TDataSource;
    RxIBRaschetArxRashi: TRxIBQuery;
    RxIBRaschetArxRashiKODP: TIntegerField;
    RxIBRaschetArxRashiKSM_ID: TIntegerField;
    RxIBRaschetArxRashiKEI_ID: TSmallintField;
    RxIBRaschetArxRashiKODRAZ: TIBStringField;
    RxIBRaschetArxRashiPLNORM: TFMTBCDField;
    razdel_st: TTable;
    razdel_stKODRAZ: TStringField;
    razdel_stNAMRAZ: TStringField;
    razdel_stKRAZ: TSmallintField;
    koefpr_st: TTable;
    koefpr_stKEI_ID: TSmallintField;
    koefpr_stKEIR: TSmallintField;
    koefpr_stKOEF: TFloatField;
    koefpr_stKSM_ID: TFloatField;
    Ediz_st: TTable;
    Ediz_stKEI_ID: TSmallintField;
    Ediz_stNEIS: TStringField;
    Otxody_st: TTable;
    Ediz_asy: TIBQuery;
    Koefpr_asy: TIBQuery;
    Razdel_asy: TIBQuery;
    Otxody_asy: TIBQuery;
    Ediz_asyKEI_ID: TSmallintField;
    Ediz_asyNEIS: TIBStringField;
    Ediz_asyDECZNAK: TSmallintField;
    Koefpr_asyKEIR: TSmallintField;
    Koefpr_asyKOEF: TFMTBCDField;
    Koefpr_asyKSM_ID: TIntegerField;
    Koefpr_asyKEI_ID: TSmallintField;
    Razdel_asyRAZDEL_ID: TSmallintField;
    Razdel_asyKODRAZ: TIBStringField;
    Razdel_asyNAMRAZ: TIBStringField;
    Razdel_asyKRAZ: TSmallintField;
    Otxody_stKCEH: TStringField;
    Otxody_stKODO: TStringField;
    Otxody_stKODOS: TStringField;
    Otxody_stNAME: TStringField;
    Otxody_stRAZO: TStringField;
    Otxody_stRAZOS: TStringField;
    Otxody_stKSMO: TStringField;
    Otxody_stKSMOS: TStringField;
    Otxody_stKEIO: TStringField;
    Otxody_stKEIOS: TStringField;
    Otxody_stDAT: TDateField;
    Otxody_stKSM_ID: TFloatField;
    Otxody_stKODOS_S: TStringField;
    Otxody_stKSM_ID1: TFloatField;
    Otxody_stKODO_S: TStringField;
    Otxody_asyBAS_ID: TIntegerField;
    Otxody_asyDATEVV: TDateField;
    Otxody_asyKEI_IDO: TSmallintField;
    Otxody_asyKEI_IDOS: TSmallintField;
    Otxody_asyKODP_O: TIntegerField;
    Otxody_asyKODP_OS: TIntegerField;
    Otxody_asyKODST_O: TIBStringField;
    Otxody_asyKODST_OS: TIBStringField;
    Otxody_asyKSM_IDO: TIntegerField;
    Otxody_asyKSM_IDOS: TIntegerField;
    Otxody_asyRAZDEL_IDO: TSmallintField;
    Otxody_asyRAZDEL_IDOS: TSmallintField;
    Otxody_asySTKOD: TIBStringField;
    Otxody_asyRAZO: TSmallintField;
    Otxody_asySTRUK_ID: TIntegerField;
    Otxody_asyRAZOS: TSmallintField;
    Otxody_asyNMAT: TIBStringField;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    frXMLExcelExport1: TfrXMLExcelExport;
    frRtfAdvExport1: TfrRtfAdvExport;
    normSPROD_ID: TIntegerField;
    ITOGISPROD_ID: TIntegerField;
    R_sprodSPROD_ID: TIntegerField;
    NormSyrKODP: TIntegerField;
    NormSyrDOC_ID: TIntegerField;
    NormSyrTIP_OP_ID: TSmallintField;
    NormSyrKSM_ID: TIntegerField;
    NormSyrSTRUK_ID: TSmallintField;
    NormSyrKEI_ID: TSmallintField;
    NormSyrKRAZ: TSmallintField;
    NormSyrMES: TSmallintField;
    NormSyrGOD: TSmallintField;
    NormSyrPRPF: TSmallintField;
    NormSyrNORM_ID: TIntegerField;
    NormSyrRAZDEL_ID: TSmallintField;
    NormSyrPR_OV: TSmallintField;
    NormSyrNMAT_KSM: TIBStringField;
    NormSyrKOD_PROD_KSM: TIBStringField;
    NormSyrNEIS: TIBStringField;
    NormSyrDATANORM: TDateField;
    NormSyrPLNORM: TFMTBCDField;
    NormSyrXARKT: TIBStringField;
    NormSyrNAZPRPF: TIBStringField;
    NormSyrSTNAME: TIBStringField;
    NormSyrNAM: TIBStringField;
    NormSyrNAMSPSR: TIBStringField;
    NormSyrNAMORG: TIBStringField;
    NormSyrNMAT: TIBStringField;
    NormSyrKOD_PROD: TIBStringField;
    NormSyrSPROD_ID: TIntegerField;
    NormSyrVIB: TIntegerField;
    NormSyrVPF: TIntegerField;
    normKOD_PROD_KSM: TIBStringField;
    IBRabNormKOD_PROD_KSM: TIBStringField;
    NormArxKOD_PROD: TIBStringField;
    Table1: TTable;
    SmallintField5: TSmallintField;
    StringField1: TStringField;
    ITOGISUM_IT: TIBBCDField;
    ITOGISUMNDS: TIBBCDField;
    P_RashifKOD_PROD_ksm: TStringField;
    Rashif_sDOC_ID: TIntegerField;
    NormSyrNEIS_PROD: TIBStringField;
    frxDBDataset1: TfrxDBDataset;
    DataSource1: TDataSource;
    Ediz_stKEI: TStringField;
    ConfigUMCOTP_RAZR: TIBStringField;
    ConfigUMCACTIVE_SKLAD: TSmallintField;
    ConfigUMCSTKOD: TIBStringField;
    ConfigUMCPRECISION: TSmallintField;
    frxXLSExport1: TfrxXLSExport;
    PodpisDOLG: TIBStringField;
    normZNACH: TSmallintField;
    normGOST: TIBStringField;
    R_sprodGOST: TIBStringField;
    MatropGOST: TIBStringField;
    NormArxGOST: TIBStringField;
    IBRabNormGOST: TIBStringField;
    frxXMLExport1: TfrxXMLExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxRTFExport1: TfrxRTFExport;
    RashifUpd: TIBUpdateSQLW;
    P_RashifZNAK: TIntegerField;
    Rashif_sZNAK: TIntegerField;
    frxPDFExport1: TfrxPDFExport;
    frxDialogControls1: TfrxDialogControls;
    frRTFExport1: TfrRTFExport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frJPEGExport1: TfrJPEGExport;
    frHTML2Export1: TfrHTML2Export;
    Rashif_sPLNORM: TFMTBCDField;
    NormSy1: TRxMemoryData;
    NormSy1KODP: TIntegerField;
    NormSy1DOC_ID: TIntegerField;
    NormSy1TIP_OP_ID: TSmallintField;
    NormSy1KSM_ID: TIntegerField;
    NormSy1STRUK_ID: TSmallintField;
    NormSy1KEI_ID: TSmallintField;
    NormSy1KRAZ: TSmallintField;
    NormSy1MES: TSmallintField;
    NormSy1GOD: TSmallintField;
    NormSy1PRPF: TSmallintField;
    NormSy1NORM_ID: TIntegerField;
    NormSy1RAZDEL_ID: TSmallintField;
    NormSy1PR_OV: TSmallintField;
    NormSy1DATANORM: TDateField;
    NormSy1SPROD_ID: TIntegerField;
    NormSy1VIB: TIntegerField;
    NormSy1VPF: TIntegerField;
    NormSy1NMAT_KSM: TStringField;
    NormSy1KOD_PROD_KSM: TStringField;
    NormSy1NEIS: TStringField;
    NormSy1PLNORM: TFloatField;
    NormSy1XARKT: TStringField;
    NormSy1NAZPRPF: TStringField;
    NormSy1STNAME: TStringField;
    NormSy1NAM: TStringField;
    NormSy1NAMSPSR: TStringField;
    NormSy1NAMORG: TStringField;
    NormSy1NMAT: TStringField;
    NormSy1KOD_PROD: TStringField;
    NormSy1NEIS_PROD: TStringField;
    NormSy1VIB1: TIntegerField;
    findNorm: TIBQuery;
    findNormTIP_OP_ID: TSmallintField;
    findNormKODP: TIntegerField;
    findNormKSM_ID: TIntegerField;
    findNormSTRUK_ID: TSmallintField;
    findNormKEI_ID: TSmallintField;
    findNormPLNORM: TFloatField;
    findNormKRAZ: TSmallintField;
    findNormMES: TSmallintField;
    findNormGOD: TSmallintField;
    findNormPRPF: TSmallintField;
    findNormNAZPRPF: TIBStringField;
    findNormNORM_ID: TIntegerField;
    findNormPR_OV: TSmallintField;
    findNormRAZDEL_ID: TSmallintField;
    findNormDATE_TIME_UPDATE: TDateTimeField;
    findNormUSER_NAME: TIBStringField;
    findNormDOC_ID: TIntegerField;
    findNormDATANORM: TDateField;
    findNormSPROD_ID: TIntegerField;
    findNormZNACH: TSmallintField;
    NormSy1PLAN: TFloatField;
    NormSy1POTREB: TFloatField;
    frxDBDataset2: TfrxDBDataset;
    P_RashifDateField: TDateField;
    P_RashifIntegerField: TIntegerField;
    P_RashifIntegerField2: TIntegerField;
    P_RashifIntegerField3: TIntegerField;
    P_RashifVALUTA: TStringField;
    P_RashifCENA_VAL: TFloatField;
    P_RashifPRIX_REG: TStringField;
    P_RashifNAM_VAL: TStringField;
    P_RashifCENA_VAL_KURS: TFloatField;
    sumRash_RazdSUM_KURS: TFMTBCDField;
    sumRash_RazdSUM_KURS_NDS: TFMTBCDField;
    mem_sumRashRazd: TRxMemoryData;
    mem_sumRashRazdKODRAZ: TLargeintField;
    mem_sumRashRazdSUMCENNORM: TFloatField;
    mem_sumRashRazdSUMCENNORM_NDS: TFloatField;
    mem_sumRashRazdNAMRAZ: TStringField;
    mem_sumRashRazdKODRAZ2: TStringField;
    P_RashifPRIX_KEIID: TIntegerField;
    P_RashifNDS_VAL: TFloatField;
    P_RashifCENA_VAL_S_NDS: TFloatField;
    P_RashifSUM_KURS: TFloatField;
    P_RashifSUM_KURS_S_NDS: TFloatField;
    P_RashifSUM_KURS_NDS: TFloatField;
    query1: TRxIBQuery;
    q_prix: TRxIBQuery;
    NormSy: TkbmMemTable;
    NormSyKODP: TIntegerField;
    NormSyDOC_ID: TIntegerField;
    NormSyTIP_OP_ID: TSmallintField;
    NormSyKSM_ID: TIntegerField;
    NormSySTRUK_ID: TSmallintField;
    NormSyKEI_ID: TSmallintField;
    NormSyKRAZ: TSmallintField;
    NormSyMES: TSmallintField;
    NormSyGOD: TSmallintField;
    NormSyPRPF: TSmallintField;
    NormSyNORM_ID: TIntegerField;
    NormSyRAZDEL_ID: TSmallintField;
    NormSyPR_OV: TSmallintField;
    NormSyDATANORM: TDateField;
    NormSySPROD_ID: TIntegerField;
    NormSyVIB: TIntegerField;
    NormSyVPF: TIntegerField;
    NormSyNMAT_KSM: TStringField;
    NormSyKOD_PROD_KSM: TStringField;
    NormSyNEIS: TStringField;
    NormSyPLNORM: TFloatField;
    NormSyXARKT: TStringField;
    NormSyNAZPRPF: TStringField;
    NormSySTNAME: TStringField;
    NormSyNAM: TStringField;
    NormSyNAMSPSR: TStringField;
    NormSyNAMORG: TStringField;
    NormSyNMAT: TStringField;
    NormSyKOD_PROD: TStringField;
    NormSyNEIS_PROD: TStringField;
    NormSyVIB1: TIntegerField;
    NormSyPLAN: TFloatField;
    NormSyPOTREB: TFloatField;
    q_prixDATA_PR: TDateField;
    q_prixKSM_ID: TIntegerField;
    q_prixVC: TSmallintField;
    q_prixNAM: TIBStringField;
    q_prixKNAM: TIBStringField;
    q_prixSTRANA: TIBStringField;
    q_prixPR_REG: TSmallintField;
    q_prixKEI_ID: TSmallintField;
    RashifSTRUK_ID: TSmallintField;
    RashifDATANORM: TDateField;
    RashifDOC_ID: TIntegerField;
    RashifKODP: TIntegerField;
    RashifKSM_ID: TIntegerField;
    RashifKEI_ID: TSmallintField;
    RashifPLNORM: TFMTBCDField;
    RashifKRAZ: TSmallintField;
    RashifMES: TSmallintField;
    RashifGOD: TSmallintField;
    RashifNAMRAZ: TIBStringField;
    RashifKODRAZ: TIBStringField;
    RashifRAZDEL_ID: TSmallintField;
    RashifNORM_ID: TIntegerField;
    RashifNMAT: TIBStringField;
    RashifNEIS: TIBStringField;
    RashifCENA: TFloatField;
    RashifCEN_NDS: TFloatField;
    RashifDATCEN: TDateField;
    RashifCENNORM: TFloatField;
    RashifCENNORM_NDS: TFloatField;
    RashifNDS: TFloatField;
    RashifPRRAS: TIBStringField;
    RashifPRIX_REG: TIBStringField;
    RashifVC: TIntegerField;
    RashifPR_REG: TIntegerField;
    RashifSNG: TIntegerField;
    RashifPRIX_KEIID: TIntegerField;
    RashifZNAK: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure normNewRecord(DataSet: TDataSet);
    procedure normBeforePost(DataSet: TDataSet);
    procedure ITOGIBeforeInsert(DataSet: TDataSet);
    procedure CancelUpdatesNorm;
    procedure ApplyUpdatesNorm;
    procedure VoprosWriteNorm;
    procedure RaschRashif;
    procedure Copy_Ediz;
    procedure Copy_Otxody;
    procedure Copy_Razdel;
    procedure Copy_Koefpr;
    procedure frReport2GetValue(const ParName: string; var ParValue: Variant);
    procedure DocumentNewRecord(DataSet: TDataSet);
    procedure DocumentBeforeInsert(DataSet: TDataSet);
    procedure CENNIKBeforeInsert(DataSet: TDataSet);
    procedure CENNIKNewRecord(DataSet: TDataSet);
    function MesName_1(Mes: integer): string;
    procedure frReport1GetValue(const ParName: string; var ParValue: Variant);
    procedure PodpisNewRecord(DataSet: TDataSet);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure normKSM_IDValidate(Sender: TField);
    procedure NormSyrKOD_PRODValidate(Sender: TField);
    procedure FormToObject(PopupForm : TForm; ControlObject : TControl; HTop:Integer=0; YesWidth:Integer=1);
    procedure normAfterScroll(DataSet: TDataSet);
    procedure RashifAfterScroll(DataSet: TDataSet);
    procedure normKEI_IDValidate(Sender: TField);
    function KolZnakovPosleZap(value : variant) : integer;
    procedure RashifAfterOpen(DataSet: TDataSet);
    procedure RashifCalcFields(DataSet: TDataSet);
    procedure Rashif_sCalcFields(DataSet: TDataSet);
    procedure NormSyrAfterOpen(DataSet: TDataSet);
    procedure sumRash_RazdAfterOpen(DataSet: TDataSet);

  private
         //
  public
    kurs, kursPrint, forceCalc : boolean;
    percents : integer;

    procedure openNorm(kodp, god, mes, oper : integer);
    procedure startRWTranss;
    procedure startReadTrans;
    procedure startWriteTrans;
    procedure setNormRec(docId, kodp, kraz, ksmId, strukId, keiId, razdelId, prpf,
                         prOv, mes, god, tipOpId : integer; plnorm : double; nazprpf,
                         nmat, neis, gost, xarkt, kodProdKsm, dataNorm, kodRaz,
                         namRaz : string);
    procedure openNormSyr(ksmId, year, month, strukId : integer; usl, sort : string);
    procedure calcKursRashifRecord;

  end;

var
  DM1: TDM1;
  OldCursor: TCursor;
  AniBmp1: TBitmap;
  Splash: TForm;
  UserName : string;
  vZadacha_Id : String;
  vStruk_Id : Integer;
  MODE: INTEGER;
  MatrPr:string;
//  YesSeria: boolEan;
  mes: integer;
  god: integer;
  vNORM_Id: INTEGER;
  vRASHIF_Id: INTEGER;
  s_nameprn:string;
  s_namevis:string;
  s_namorg:string;
  s_namspsr:string;
  s_Neiz:string;
  s_kodProd:string;
  s_zag: string;
  s_ksm: integer;
  s_nmat: string;
  s_xarkt: string;
  s_gost: string;
  s_kei: integer;
  s_nmats: string;
  s_xarkts: string;
  s_gosts: string;
  s_keis: integer;
  s_Namspsrs: string;
  s_namorgs :string;
  s_Nams:string;
  s_Neizs:string;
  s_kodp:integer;
  s_KORG:integer;
  s_raz:integer;
  s_pr_nazn: string;
  s_vid_isp: string;
  s_pr_syr: string;
  s_reg: string;
  Usl_norm : String;
  skod: string;
  s_stname: string;
  nammes: string;
  sort_n: string;
  vDocument_Id: integer;
  vTip_op_id: integer;
  vNdoc: string;
  vDat_op: tdate;
  s_dat1: String;
  s_dat2: String;
  s_mes: String;
  s_god: String;
  sort: string;
  Struk: integer;
  struks: integer;
  usl: string;
  s_kodp_spr:integer;
  s_ksm_spr:integer;
  s_datanorm:tdate;
  kod: Variant;
  raz:integer;
  s_dat_cen: string;
  s_dat_rashif: string;
  s_prras: string;
  pr_itogi:string;
  s_dolgv:string;
  s_fiov:string;
  s_dolgn1:string;
  s_fion1:string;
  s_dolgn2:string;
  s_fion2:string;
  s_fion31:string;
  s_dolgn31:string;
  s_fion41:string;
  s_dolgn41:string;
  s_fion42:string;
  s_dolgn42:string;
  s_dolgn32:string;
  s_fion32:string;
  s_dolgn3:string;
  s_fion3:string;
  s_dolgn4:string;
  s_fion4:string;
  s_dolgn5:string;
  s_fion5:string;
  s_dolgn6:string;
  s_fion6:string;
  s_fio:string;
  s_raz1: integer;
  s_raz2: integer;
  s_sumv: double;
  s_sumvnds:double;
  s_sumv1: double;
  s_sumv2: double;
  s_sumvnds1:double;
  s_sumvnds2:double;
  v_Tip_dok:integer;
  s_kodp_s: integer;
  s_dat_cen1: string;
  s_dat_cen2: string;
  mes_c: integer;
  god_c: integer;
  s_mes12: string;
  s_god12: string;
  s_dat_cens: string;
  S_VID_DOK: STRING;
  Pr_Arx:integer;
  s_sprod: integer;
  s_norm_id: integer;
  reportPath : string;
  programPath : string;

implementation
  uses Razdel,SYRIE;
{$R *.dfm}
function TDM1.MesName_1(Mes: integer): string;
begin
  case Mes of
    1: Result:='Январь';
    2: Result:='Февраль';
    3: Result:='Март';
    4: Result:='Апрель';
    5: Result:='Май';
    6: Result:='Июнь';
    7: Result:='Июль';
    8: Result:='Август';
    9: Result:='Сентябрь';
    10: Result:='Октябрь';
    11: Result:='Ноябрь';
    12: Result:='Декабрь';
  end;
end;
procedure TDM1.DataModuleCreate(Sender: TObject);
 var
  IniOGT: TIniFile;
begin
  kurs := false;
  kursPrint := false;
  IniOGT := TIniFile.Create('OGT.Ini');
  VStruk_ID := IniOGT.ReadInteger('Config', 'Struk_Id', 0);
//  MatrPr := IniOGT.ReadString('Config', 'MatrPr', '02');
//  YesSeria := IniOGT.ReadBool('Config', 'YesSeria', True);
  MODE:=0;
  UserName := AnsiUpperCase(GetCurrentUserName);
  vZadacha_Id := 'OGT_NORM';
  DM1.BELMED.Close;
  DM1.BELMED.Params.Clear;
  DM1.BELMED.Params.Add('lc_ctype=WIN1251');
  DM1.BELMED.Params.Add('user_name=' + UserName);
  DM1.BELMED.Params.Add('password=' + AnsiLowerCase(UserName));
  DM1.BELMED.Params.Add('sql_role_name=' + ParamStr(1));
  try
    DM1.BELMED.Open;
    startReadTrans;
  except
    if (DM1.BELMED.DatabaseName = 'DATAMEDIC:D:\IBDATA\REST.GDB') then
    begin
      DM1.BELMED.Params.Add('user_name=SYSDBA');
      DM1.BELMED.Params.Add('password=masterkey');
      UserName := DM1.BELMED.Params[2];
    end
    else
      DM1.BELMED.LoginPrompt:=True;
    try
 //   DM1.BELMED.Params[3]:='';
      DM1.BELMED.Open;
      startReadTrans;
    except
      Delete(UserName,1,10);
      ShowMessage('У пользователя ' + UserName + ' нет доступа к базе данных');
      Application.Terminate;
    end;
  end;
  BELMED.Connected := True;
  if (AnsiUpperCase(ParamStr(2)) = 'KURS') then
  begin
    kurs := true;
  end;
  {$IFDEF RELEASE}
  reportPath := 'f:\Norm_OGT\';
  try
  if (DirectoryExists('c:\work\')) then
    if (ForceDirectories('c:\work\' + AnsiLowerCase(UserName) + '\Norm_Ogt\')) then
      programPath := 'c:\work\' + AnsiLowerCase(UserName) + '\Norm_Ogt\';
  except
    on e : exception do
      programPath := 'f:\norm_ogt\';
  end;  
  {$ENDIF}
  {$IFDEF DEBUG}
  reportPath := 'C:\MyProg\Norm_OGT\';
  {$ENDIF}
end;

procedure TDM1.DocumentBeforeInsert(DataSet: TDataSet);
begin
 DM1.Add_NormDok.StoredProcName := 'ADD_DOCUMENT';
 DM1.Add_NormDok.ExecProc;
 vDocument_Id := DM1.Add_NormDok.Params.Items[0].AsInteger;
end;

procedure TDM1.DocumentNewRecord(DataSet: TDataSet);
begin
	DM1.Document.FieldByName('Doc_Id').AsInteger := vDocument_Id;
	DM1.Document.FieldByName('Tip_Op_Id').AsInteger := vTip_Op_Id;
 DM1.Document.FieldByName('Struk_Id').AsInteger := vStruk_Id;
 DM1.Document.FieldByName('Tip_Dok_Id').AsInteger := v_Tip_Dok;
 DM1.Document.FieldByName('NDok').AsString := vNDoc;
 DM1.Document.FieldByName('Klient_Id').AsInteger := s_Kodp;
 DM1.Document.FieldByName('Date_Dok').AsDateTime :=Date;
 DM1.Document.FieldByName('Date_Op').AsDateTime :=vDat_op;
 DM1.Document.FieldByName('Zadacha_Id').AsString := vZadacha_Id;
end;

procedure TDM1.frReport1GetValue(const ParName: string; var ParValue: Variant);
var
  d_cehpf : string;
  per : boolean;
begin                      
  if (dm1.p_rashif.Active) then
  begin
    If (dm1.p_rashifKodp.AsInteger <> s_kodp_s) THEN
    begin
      dm1.r_sprod.Locate('ksm_id', VarArrayOf([dm1.p_rashifKodp.AsInteger]),[]);
      s_kodp_s := dm1.p_rashifKodp.AsInteger;
    end;
    IF (not DM1.Podpis.Active) or (dm1.r_sprodStruk_id.AsInteger <> struks) THEN
    begin
      v_Tip_Dok := 102;
      if (dm1.p_rashifPrras.AsString = 'p') then
        v_Tip_Dok := 103;
      if (dm1.p_rashifPrras.AsString = 'k') then
        v_Tip_Dok := 104;
      IF (DM1.Podpis.Active) then
        DM1.Podpis.Close;
      DM1.Podpis.ParamByName('Struk').AsInteger := DM1.r_sprodStruk_id.AsInteger;
      DM1.Podpis.ParamByName('Tip_Dok').AsInteger := v_Tip_Dok;
      DM1.Podpis.Open;
      struks := DM1.r_sprod.FieldByName('Struk_id').AsInteger;
    end;
  end;
  nammes := DM1.MesName_1(mes);
  s_god := inttostr(god);
  if (ParName = 'stkod') then ParValue:=DM1.r_sprodspksm.AsString;
  if (ParName = 'lekkod') then ParValue:=DM1.r_sprodLekkod.AsString;
  if (ParName = 'nmatp') then ParValue:=DM1.r_sprodNmat.AsString;
  if (ParName = 'vid') then
    if (dm1.r_sprodVid.AsInteger = 1) then
      ParValue := 'Временные'
    else
      ParValue := 'Плановые';
  if (ParName = 'ceh') then
    ParValue := DM1.R_sprodStname.AsString;
  if (ParName = 'newkod') then
    ParValue := '(' + DM1.R_sprodKsm_id.AsString + ')';
  if (ParName = 'Reg') then
    ParValue := DM1.R_sprodnamegr.AsString;
  if (ParName = 'cdat') then
    ParValue := S_DAT_cen;
  if (ParName = 'ceh_rashif') then
  begin
    if (dm1.r_sprod.Locate('ksm_id', dm1.p_rashifKodp.AsInteger, [])) then
    begin
      d_cehpf := DM1.r_sprodStname.AsString;
      if (DM1.p_rashifprras.asstring = 'p') then
      begin
        DM1.IBQuery1.Active := False;
        DM1.IBQuery1.SQL.Clear;
        DM1.IBQuery1.SQL.Add(' SELECT distinct rashif.ksm_id,struk.stname ');
        DM1.IBQuery1.SQL.Add(' FROM norm_view(119,' + inttostr(god) + ','
                             + inttostr(mes) + ',' + inttostr(dm1.P_rashifKodp.AsInteger)
                             + ',0,0) rashif ');
        DM1.IBQuery1.SQL.Add(' Left Join spprod on (rashif.ksm_id=spprod.ksm_id) ');
        DM1.IBQuery1.SQL.Add(' Left Join struk on (spprod.struk_id=struk.struk_id) ');
        DM1.IBQuery1.SQL.Add(' Where z(rashif.prpf)=1 ');
        DM1.IBQuery1.Active := true;
        per := true;
        while (not DM1.IBQuery1.Eof) do
        begin
          if (per) then
          begin
            d_cehpf := d_cehpf + ' (';
            per := false;
          end;
          d_cehpf := d_cehpf + trim(DM1.IBQuery1.FieldByName('stname').asstring);
          DM1.IBQuery1.Next;
          if (DM1.IBQuery1.Eof) then
            d_cehpf := d_cehpf + ')'
          else
            d_cehpf := d_cehpf + ',';
        end;
        ParValue := d_cehpf;
      end
      else
        ParValue := d_cehpf;
    end
    else
      ParValue := '';
  end;
  if (ParName = 'vsego') then
  begin
    ParValue := '';
    s_sumv := 0;
    s_sumvnds := 0;
    s_raz2 := round( (DM1.p_rashifkraz.asInteger - 4) / 10 ) * 10;
    if (dm1.P_RashifKraz.AsInteger = 55) then
      s_raz2 := 40;
    IF (S_RAZ2 = 30) OR (S_RAZ2 = 50) OR (S_RAZ2 = 60) OR (S_RAZ2 = 70) THEN
    BEGIN
      case (s_raz2) of
        50 : s_raz1 := 40;
        60 : s_raz1 := 51;
        70 : s_raz1 := 52;
        30 : s_raz1 := 20;
      end;
      if (kursPrint) then
      begin
        mem_sumRashRazd.First;
        if (not mem_SumRashRazd.Eof) then
        begin
          s_sumv2 := 0;
          s_sumvnds2 := 0;
          s_sumv1 := 0;
          s_sumvnds1 := 0;
          s_sumv := s_sumv1 - s_sumv2;
          s_sumvnds := s_sumvnds1 - s_sumvnds2;
        end;
      end
      else
      begin
        if (dm1.SumRash_Razd.Active) then
          dm1.SumRash_Razd.Active := false;
        dm1.SumRash_Razd.ParamByName('datcen').AsDateTime := strtodate(s_dat_cen);
        dm1.SumRash_Razd.ParamByName('doc').AsInteger := dm1.p_rashifDoc_id.AsInteger;
        dm1.SumRash_Razd.Open;
        sumRash_Razd.First;
        if (not dm1.SumRash_Razd.Eof) then
        begin
          if (dm1.SumRash_Razd.Locate(('kodraz'), s_raz2, [])) then
          begin
            s_sumv2 := round(dm1.SumRash_Razd.FieldByName('sumcennorm').AsFloat);
            s_sumvnds2 := round(dm1.SumRash_Razd.FieldByName('sumcennorm_nds').AsFloat);
          end
          else
          begin
            s_sumv2 := 0;
            s_sumvnds2 := 0;
          end;
          if (dm1.SumRash_Razd.Locate(('kodraz'), s_raz1, []))then
          begin
            s_sumv1 := round(dm1.SumRash_Razd.FieldByName('sumcennorm').AsFloat);
            s_sumvnds1 := round(dm1.SumRash_Razd.FieldByName('sumcennorm_nds').AsFloat);
          end
          else
          begin
            s_sumv1 := 0;
            s_sumvnds1 := 0;
          end;
          s_sumv := s_sumv1 - s_sumv2;
          s_sumvnds := s_sumvnds1 - s_sumvnds2;
        end;
      end;
      if (DM1.p_rashifkraz.asInteger <> 51) and (DM1.p_rashifkraz.asInteger <> 52) then
        ParValue := 'Всего:                           '
                    + floattostrF(s_sumv, ffNumber, 12, 0)
                    + '                              '
                    + floattostrF(s_sumvnds, ffNumber, 12, 0)
      else
        ParValue := '';
    END
    else
    begin
      DM1.p_rashif.Next;
      if (not DM1.p_rashif.Eof) then
      begin
        s_raz1 := (round( (DM1.p_rashifkraz.asInteger - 4) / 10) ) * 10;
        if (dm1.P_RashifKraz.AsInteger = 55) then
          s_raz1 := 40;
        DM1.p_rashif.Prior;
      end
      else
        s_raz1 := 50;
      IF (S_RAZ2 = 40) and (s_raz1 <> s_raz2) THEN
      BEGIN
        IBQuery1.Close;
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Add('SELECT itogi.SUM_it,itogi.sumnds ');
        IBQuery1.SQL.Add(' FROM norm_itogi itogi ');
        IBQuery1.SQL.Add(' WHERE itogi.god=' + INTTOSTR(god) + ' and itogi.mes='
                         + iNTTOSTR(mes));
        IBQuery1.SQL.Add(' and itogi.pr=' + '''' + DM1.p_rashifprras.asstring
                         + '''' + ' and itogi.kodp=' + inttoSTR(dm1.P_rashifKodp.AsInteger));
        IBQuery1.SQL.Add(' and itogi.kraz=' + INTTOSTR(S_raz2) + ' and itogi.datec='
                         + '''' + s_dat_cen + '''');
        IBQuery1.Open;
        IBQuery1.First;
        if (IBQuery1.RecordCount > 0)
           or ((kursPrint) and (mem_sumRashRazd.Locate('kraz', s_raz2, []))) then
        begin
          s_sumv2 := round(IBQuery1.FieldByName('sum_it').AsFloat);
          s_sumvnds2 := round(IBQuery1.FieldByName('sumnds').AsFloat);
          ParValue := 'Итого по всп.cырью:     '
                      + floattostrf(s_sumv2, ffNumber, 12, 0)
                      + '                                     '
                      + floattostrF(s_sumvnds2, ffNumber, 12, 0);
        end
        else
        begin
          s_sumv2 := 0;
          s_sumvnds2 := 0;
          ParValue := '';
        end;
      END;
    end;
  end;
  if (ParName = 'vidrashif') then
    if (DM1.p_rashifprras.asstring = 'p') then
      ParValue := '(полная)'
    else
      ParValue := '(короткая)';
  if (ParName = 'gostp') then
    ParValue := DM1.R_sprodgost.AsString;
  if (ParName = 'xarktp') then
    ParValue := DM1.R_sprodxarkt.AsString;
  if (ParName = 'neisp') then
    ParValue := DM1.R_sprodneis_pr.AsString;
  if (ParName = 'dolgverx') then
  BEGIN
    s_dolgv := '';
    s_fiov := '';
    s_dolgn1 := '';
    s_fion1 := '';
    s_dolgn2 := '';
    s_fion2 := '';
    s_dolgn3 := '';
    s_fion3 := '';
    s_dolgn4 := '';
    s_fion4 := '';
    s_dolgn5 := '';
    s_fion5 := '';
    s_dolgn6 := '';
    s_fion6 := '';
    DM1.Podpis.First;
    While (not DM1.Podpis.Eof) do
    begin
      case (DM1.PodpisPolog.AsInteger) of
        1 : begin
              if (v_Tip_Dok = 102) then
              begin
                s_dolgv := Trim(DM1.PodpisDolg.AsString);
                s_fiov := Trim(DM1.PodpisFio.AsString)
              end
              else
              begin
                s_dolgv := '';
                s_fiov := '';
              end;
            end;
       2 : begin
             s_dolgn1 := Trim(DM1.PodpisDolg.AsString);
             s_fion1 := '__________________' + Trim(DM1.PodpisFio.AsString);
           end;
       3 : begin
             s_dolgn2 := Trim(DM1.PodpisDolg.AsString);
             s_fion2 := '__________________' + Trim(DM1.PodpisFio.AsString);
           end;
       4 : begin
             s_dolgn3 := Trim(DM1.PodpisDolg.AsString);
             s_fion3 := '__________________' + Trim(DM1.PodpisFio.AsString);
           end;
       5 : begin
             s_dolgn4 := Trim(DM1.PodpisDolg.AsString);
             s_fion4 := '__________________' + Trim(DM1.PodpisFio.AsString);
           end;
       6 : begin
             s_dolgn5 := Trim(DM1.PodpisDolg.AsString);
             s_fion5 := '__________________' + Trim(DM1.PodpisFio.AsString);
           end;
       7 : begin
             s_dolgn6 := Trim(DM1.PodpisDolg.AsString);
             s_fion6 := '__________________' + Trim(DM1.PodpisFio.AsString);
           end;
      end;
      DM1.Podpis.Next;
    end;
    ParValue := s_dolgv;
  END;
  if (ParName = 'fioverx') then
    ParValue := s_fiov;
  if (ParName = 'dolgniz1') then
    ParValue := s_dolgn1;
  if (ParName = 'fioniz1') then
     ParValue := s_fion1;
  if (ParName = 'dolgniz2') then
     ParValue := s_dolgn2;
  if (ParName = 'fioniz2') then
     ParValue := s_fion2;
  if (ParName = 'dolgniz3') then
     ParValue := s_dolgn3;
  if (ParName = 'fioniz3') then
     ParValue := s_fion3;
  if (ParName = 'dolgniz4') then
  	ParValue := s_dolgn4;
  if (ParName = 'fioniz4') then
     ParValue := s_fion4;
  if (ParName = 'dolgniz5') then
     ParValue := s_dolgn5;
  if (ParName = 'fioniz5') then
     ParValue := s_fion5;
  if (ParName = 'dolgniz6') then
     ParValue := s_dolgn6;
  if (ParName = 'fioniz6') then
     ParValue := s_fion6;
  if (ParName = 'nammes') then
  	ParValue := nammes;
  if (ParName = 'vgod') then ParValue := s_god;
  if (ParName = 'nams') then  ParValue := s_nmats;
  if (ParName = 'gosts') then  ParValue := s_gosts;
  if (ParName = 'xarkts') then  ParValue := s_xarkts;
  if (ParName = 'namorgs') then  ParValue := s_namorgs;
  if (ParName = 'namsyrs') then  ParValue := s_namspsrs;
end;

procedure TDM1.frReport2GetValue(const ParName: string; var ParValue: Variant);
begin
{if ParName = 'sum_vip' then ParValue := Naz_sum;
if ParName = 'neis_vip' then ParValue := vNeis_vip;
if ParName='nammes' then ParValue:=nammes;
if ParName='lekkod' then ParValue:=FNormCex.Edit1.Text;
if ParName='gostp' then ParValue:=FNormCex.Label22.Caption;
if ParName='neisp' then ParValue:=FNormCex.Label21.Caption;
if ParName='nams' then ParValue:=FNormCex.DBText1.Caption;
if ParName='ksm_id' then ParValue:=FNormCex.DBText6.Caption;
if ParName='gosts' then ParValue:=FNormCex.DBText8.Caption;
if ParName='xarkts' then ParValue:=FNormCex.DBText7.Caption;
if ParName='neiss' then ParValue:=FNormCex.DBText2.Caption;
if FGlMenu.Active=true then
begin
  if FPech_Vibor.PechVipusk.Locate('ksm_id',PechTexGurKodp.AsInteger,[]) then
  begin
   s_kodprod:=FPech_Vibor.PechVipuskKod_Prod.AsString;
   s_gost:=FPech_Vibor.PechVipuskGost.AsString;
   s_nmat:=FPech_Vibor.PechVipuskNmat.AsString;
   s_neiz:=FPech_Vibor.PechVipuskNeis.AsString;
   s_xarkt:=FPech_Vibor.PechVipuskXarkt.AsString;
   s_namorg:=FPech_Vibor.PechVipuskNamorg.AsString;
   s_namreg:=FPech_Vibor.PechVipuskNamreg.AsString;
  end
  else
  begin
   s_kodprod:='';
   s_gost:='';
   s_nmat:='';
   s_neiz:='';
   s_xarkt:='';
   s_namorg:='';
   s_namreg:='';
  end;
end;
if ParName='Kod_prod' then
begin
 if prov then
   if FPech_Vibor.PechVipusk.Locate('ksm_id',PechTexGurKodp.AsInteger,[]) then
     s_kodprod:=FPech_Vibor.PechVipuskKod_Prod.AsString else s_kodprod:='';
 ParValue:=s_kodprod;
end;
if ParName='gost' then
begin
 if prov then
   if FPech_Vibor.PechVipusk.Locate('ksm_id',PechTexGurKodp.AsInteger,[]) then
     s_gost:=FPech_Vibor.PechVipuskGost.AsString else s_Gost:='';
 ParValue:=s_gost;
end;
if ParName='nmat' then
begin
 if prov then
   if FPech_Vibor.PechVipusk.Locate('ksm_id',PechTexGurKodp.AsInteger,[]) then
     s_nmat:=FPech_Vibor.PechVipuskNmat.AsString else s_Nmat:='';
 ParValue:=s_nmat;
end;
if ParName='neis' then
begin
 if prov then
  if FPech_Vibor.PechVipusk.Locate('ksm_id',PechTexGurKodp.AsInteger,[]) then
     s_neiz:=FPech_Vibor.PechVipuskNeis.AsString else s_Neiz:='';
 ParValue:=s_neiz;
end;
 if ParName='xarkt' then
 begin
  if prov then
   if FPech_Vibor.PechVipusk.Locate('ksm_id',PechTexGurKodp.AsInteger,[]) then
     s_xarkt:=FPech_Vibor.PechVipuskXarkt.AsString else s_xarkt:='';
 ParValue:=s_xarkt;
 end;
 if ParName='namorg' then
 begin
 if prov then
  if FPech_Vibor.PechVipusk.Locate('ksm_id',PechTexGurKodp.AsInteger,[]) then
     s_namorg:=FPech_Vibor.PechVipuskNamorg.AsString else s_Namorg:='';
  ParValue:=s_namorg;
 end;
 if ParName='namreg' then
 begin
 if prov then
  if FPech_Vibor.PechVipusk.Locate('ksm_id',PechTexGurKodp.AsInteger,[]) then
     s_namreg:=FPech_Vibor.PechVipuskNamreg.AsString else s_Namreg:='';
  ParValue:=s_namreg;
 end;
 if ParName='namcex' then ParValue:=s_namcex;}
end;

procedure TDM1.frxReport1GetValue(const VarName: string; var Value: Variant);
begin
 nammes:=DM1.MesName_1(mes);
 if VarName='nammes' then Value:=nammes;

end;

procedure TDM1.openNorm(kodp, god, mes, oper : integer);
begin
  Norm.Close;
  Norm.ParamByName('kod').AsInteger := kodp;
  Norm.ParamByName('god').AsInteger := god;
  Norm.ParamByName('mes').AsInteger := mes;
  Norm.ParamByName('oper').AsInteger := oper;
  Norm.Open;
  NORM.First;
end;

procedure TDM1.setNormRec(docId, kodp, kraz, ksmId, strukId, keiId, razdelId, prpf,
                          prOv, mes, god, tipOpId : integer; plnorm : double; nazprpf,
                          nmat, neis, gost, xarkt, kodProdKsm, dataNorm, kodRaz,
                          namRaz : string);
begin
  if (docId <> -32000) then  
    dm1.Norm.FieldByName('doc_id').value := docId;
  dm1.Norm.FieldByName('Kodp').value := kodp;
  dm1.Norm.FieldByName('KRaz').value := kraz;
  dm1.Norm.FieldByName('KSM_ID').value := ksmId;
  dm1.Norm.FieldByName('Struk_ID').value := strukId;
  dm1.Norm.FieldByName('Kei_id').value := keiId;
  dm1.Norm.FieldByName('Razdel_id').value := razdelId;
  dm1.Norm.FieldByName('Prpf').value := prpf;
  dm1.Norm.FieldByName('Plnorm').value := plnorm;
  dm1.Norm.FieldByName('Nazprpf').value := nazprpf;
  dm1.Norm.FieldByName('Nmat').value := nmat;
  dm1.Norm.FieldByName('Neis').value := neis;
  dm1.Norm.FieldByName('Gost').value := gost;
  dm1.Norm.FieldByName('Xarkt').value := xarkt;
  dm1.Norm.FieldByName('Kod_Prod_ksm').value := kodProdKsm;
  dm1.Norm.FieldByName('Mes').value := mes;
  dm1.Norm.FieldByName('God').value := god;
  dm1.Norm.FieldByName('Pr_Ov').value := prOv;
  dm1.Norm.FieldByName('Tip_Op_id').value := tipOpId;
  dm1.Norm.FieldByName('datanorm').value := dataNorm;
  if (kodRaz <> '-32000') then
    dm1.Norm.FieldByName('kodraz').AsString := kodRaz;
  if (namRaz <> '-32000') then  
    dm1.Norm.FieldByName('namraz').AsString := namRaz;
end;

procedure TDM1.openNormSyr(ksmId, year, month, strukId : integer; usl, sort : string);
begin
  DM1.NormSyr.Close;
  DM1.NormSyr.ParamByName('KSM_ID').AsInteger := ksmId;
  DM1.NormSyr.ParamByName('GOD').AsInteger := year;
  DM1.NormSyr.ParamByName('MES').AsInteger := month;
  DM1.NormSyr.ParamByName('STRUK').AsInteger := strukId;
  DM1.NormSyr.MacroByName('usl').AsString := usl;
  DM1.NormSyr.MacroByName('SORT').AsString := sort;
  DM1.NormSyr.Open;
end;

procedure TDM1.RaschRashif;
var
  god_r: integer;
  mes_r : integer;
begin
  vTip_Op_Id := 120;
  v_Tip_Dok := 103;
  vDocument_id := 0;
  god_r := year(strtodate(s_dat_rashif));
  mes_r := month(strtodate(s_dat_rashif));
//   mes_r:=strtoint(copy(s_dat_rashif,4,2));
//   if dm1.IBT_Read.Active then dm1.IBT_Read.Active:=false;
//   if dm1.IBT_WRITE.Active then dm1.IBT_WRITE.Active:=false;
//   startRWTranss;
  openNorm(s_kodp, god_r, mes_r, 120);
  IF (not DM1.NORM.eof) THEN
  begin
    vDocument_id := dm1.NormDoc_id.AsInteger;
    while (not dm1.norm.eof) do
      dm1.norm.Delete
  end;
  if (vDocument_Id = 0) then
  begin
    DM1.DOCUMENT.Close;
    DM1.DOcUMENT.MacroByName('USL').AsString := 'WHERE DOcUMENT.STRUK_ID = '
                                                + INTTOSTR(VsTRUK_ID)
                                                + ' AND (DOCUMENT.TIP_OP_ID = 120)'
                                                + ' and document.klient_id = '
                                                + inttostr(s_kodp)
                                                + ' AND Document.Date_op = '
                                                + '''' + s_dat_rashif + '''';
    DM1.DOCUMENT.OPEN;
    dm1.Document.First;
    if (not dm1.Document.eof) then
      vDocument_id := dm1.DocumentDoc_id.AsInteger
    else
    begin
      vNDoc := 'Рас' + inttostr(S_Kodp) + '-' + inttostr(mes_r) + '.' + inttostr(god_r);
      vDat_op := strtodate(s_dat_rashif);
      dm1.Document.Insert;
      dm1.Document.Post;
    end;
  end;
  if (not FRazdel.Razdel.Active) then
    FRazdel.Razdel.Active := true;
  if (Pr_Arx = 0) then
  begin
    dm1.RxIBRaschetRashif.Active:=false;
    dm1.RxIBRaschetRashif.ParamByName('god').AsInteger := god_r;
    dm1.RxIBRaschetRashif.ParamByName('mes').AsInteger := mes_r;
    dm1.RxIBRaschetRashif.ParamByName('kodp').AsInteger := s_kodp;
    dm1.RxIBRaschetRashif.Open;
    while (not dm1.RxIBRaschetRashif.Eof) do
    begin
      dm1.Norm.Insert;
      dm1.Norm.FieldByName('KRaz').value := strtoint(dm1.RxIBRaschetRashif.FieldByName('Kodraz').AsString);
      dm1.Norm.FieldByName('KSM_ID').value := dm1.RxIBRaschetRashif.FieldByName('Ksm_id').Asinteger;
      dm1.Norm.FieldByName('Struk_ID').value := struk;
      dm1.Norm.FieldByName('Kei_id').value := dm1.RxIBRaschetRashif.FieldByName('Kei_id').Asinteger;
      dm1.Norm.FieldByName('Plnorm').AsFloat := dm1.RxIBRaschetRashif.FieldByName('Plnorm').AsFloat;
      dm1.Norm.FieldByName('Mes').value := Mes_r;
      dm1.Norm.FieldByName('God').value := God_r;
      dm1.Norm.FieldByName('datanorm').value := s_dat_rashif;
      dm1.Norm.FieldByName('Tip_op_ID').value := 120;
      FRazdel.Razdel.First;
      if (FRazdel.Razdel.locate('kodraz',
                               dm1.RxIBRaschetRashif.FieldByName('kodraz').AsInteger,
                               [])) then
        DM1.norm.FieldByName('razdel_id').AsInteger := FRazdel.Razdel.FieldByName('razdel_id').AsInteger
      else
        DM1.norm.FieldByName('razdel_id').AsInteger := 0;
      try
        dm1.Norm.Post;
      except
        on e : exception do
          MessageDlg('Произошла ошибка при записи !' + E.Message, mtWarning, [mbOK], 0);
      end;
      DM1.RxIBRaschetRashif.next;
    end;
  end
  else
  begin
    dm1.RxIBRaschetArxRashi.Active := false;
    dm1.RxIBRaschetArxRashi.ParamByName('god').AsInteger := god_r;
    dm1.RxIBRaschetArxRashi.ParamByName('mes').AsInteger := mes_r;
    dm1.RxIBRaschetArxRashi.ParamByName('kodp').AsInteger := s_kodp;
    dm1.RxIBRaschetArxRashi.Open;
    while (not dm1.RxIBRaschetArxRashi.Eof) do
    begin
      dm1.Norm.Insert;
      dm1.Norm.FieldByName('KRaz').value := strtoint(dm1.RxIBRaschetArxRashi.FieldByName('Kodraz').AsString);
      dm1.Norm.FieldByName('KSM_ID').value := dm1.RxIBRaschetArxRashi.FieldByName('Ksm_id').Asinteger;
      dm1.Norm.FieldByName('Struk_ID').value := struk;
      dm1.Norm.FieldByName('Kei_id').value := dm1.RxIBRaschetArxRashi.FieldByName('Kei_id').Asinteger;
      dm1.Norm.FieldByName('Plnorm').AsFloat := dm1.RxIBRaschetArxRashi.FieldByName('Plnorm').AsFloat;
      dm1.Norm.FieldByName('Mes').value := Mes_r;
      dm1.Norm.FieldByName('God').value := God_r;
      dm1.Norm.FieldByName('datanorm').value := s_dat_rashif;
      dm1.Norm.FieldByName('Tip_op_ID').value := 120;
      FRazdel.Razdel.First;
      if (FRazdel.Razdel.locate('kodraz',
                               dm1.RxIBRaschetArxRashi.FieldByName('kodraz').AsInteger,
                               [])) then
        DM1.norm.FieldByName('razdel_id').AsInteger := FRazdel.Razdel.FieldByName('razdel_id').AsInteger
      else
        DM1.norm.FieldByName('razdel_id').AsInteger := 0;
      dm1.Norm.Post;
      DM1.RxIBRaschetArxRashi.next;
    end;
  end;
  DM1.ApplyUpdatesNorm;
end;

procedure TDM1.RashifAfterOpen(DataSet: TDataSet);
begin
  if (not Rashif.Eof) then
  begin
    Rashif.First;
    while not Rashif.Eof do
    begin
      if (KolZnakovPosleZap(RashifPLNORM.AsVariant) > 6) then
      begin
        RashifPLNORM.AsFloat := SimpleRoundTo(RashifPLNORM.AsFloat, -6);
      end;
      RashifZNAK.AsInteger := KolZnakovPosleZap(RashifPLNORM.AsVariant);
      Rashif.Next;
    end;
  end;
end;

procedure TDM1.RashifAfterScroll(DataSet: TDataSet);
begin
  s_ksm_spr := dm1.RashifKsm_id.AsInteger;
end;

procedure TDM1.calcKursRashifRecord;
begin
  q_prix.Close;
  q_prix.ParamByName('ksm_id').AsInteger := dm1.RashifKSM_ID.AsInteger;
  q_prix.ParamByName('doc_id').AsInteger := dm1.RashifDOC_ID.AsInteger;
  q_prix.Open;

  dm1.Rashif.Edit;
  if ((q_prixVC.AsInteger <= 1) or (q_prix.Eof) or (q_prix.RecordCount = 0)
      or (q_prixPR_REG.AsInteger = 1)) and (not forceCalc) then
  begin
    dm1.RashifVC.AsInteger := 1;
  end
  else
  begin
    dm1.RashifVC.AsInteger := q_prixVC.AsInteger;
  end;

  dm1.RashifPRIX_REG.AsString := q_prixSTRANA.AsString;
  dm1.RashifPR_REG.AsInteger := q_prixPR_REG.AsInteger;
  dm1.RashifPRIX_KEIID.AsInteger := q_prixKEI_ID.AsInteger;
  dm1.Rashif.Post;
end;

procedure TDM1.RashifCalcFields(DataSet: TDataSet);
begin
  RashifZNAK.AsInteger := KolZnakovPosleZap(RashifPLNORM.AsVariant);
end;

procedure TDM1.Rashif_sCalcFields(DataSet: TDataSet);
begin
  Rashif_sZNAK.AsInteger := KolZnakovPosleZap(Rashif_SPLNORM.AsVariant);
end;

procedure TDM1.ITOGIBeforeInsert(DataSet: TDataSet);
begin
{DM1.Add_NORMDok.StoredProcName := 'ADD_ITOGI';
 DM1.Add_nORMDok.ExecProc;
 vITOGI_Id := DM1.Add_NORMDok.Params.Items[0].AsInteger;}
end;

procedure TDM1.normAfterScroll(DataSet: TDataSet);
begin
  s_ksm_spr := dm1.normKsm_id.AsInteger;
end;

procedure TDM1.normBeforePost(DataSet: TDataSet);
begin
  If DM1.NORM.FieldByName('Ksm_id').AsInteger = 0 then
  begin
    MessageDlg('Введите код сырья!', mtWarning, [mbOK], 0);
    Abort;
  end;
  If (DM1.NORM.FieldByName('Kei_id').AsInteger = 0)
      and (DM1.NORM.FieldByName('PLNORM').AsFloat <> 0) then
  begin
    MessageDlg('Введите единицу измерения!', mtWarning, [mbOK], 0);
    Abort;
  end;
  If (DM1.NORM.FieldByName('KRAZ').AsInteger = 0)  then
  begin
    MessageDlg('Введите раздел!', mtWarning, [mbOK], 0);
    Abort;
  end;
  if normPrpf.AsInteger = 1 then
    DM1.NORM.FieldByName('NAZPRPF').AsString := 'п/ф'
  else
    DM1.NORM.FieldByName('NAZPRPF').AsString := '';
  if (DM1.NORM.FieldByName('doc_Id').AsVariant = null) then
    DM1.NORM.FieldByName('doc_Id').AsInteger := vDocument_Id;
  DM1.NORM.FieldByName('znach').AsInteger := KolZnakovPosleZap(DM1.NORM.FieldByName('plnorm').asfloat);
end;

procedure TDM1.normKEI_IDValidate(Sender: TField);
begin
 if not dM1.Ediz_asy.Active then dm1.Ediz_asy.Active:=true;
 if dm1.Ediz_ASY.Locate('kei_id',dm1.NormKei_id.AsInteger,[]) then
   dm1.NormNeis.AsString:=dm1.Ediz_asyNeis.AsString
  else
  showMessage('Нет такого кода! Воспользуйтесь справочником!');
end;

procedure TDM1.normKSM_IDValidate(Sender: TField);
begin
 dM1.Matrop.Active:=false;
 dM1.Matrop.ParamByName('ksm').AsInteger:=NORM.FieldByName('Ksm_Id').AsInteger;
 dM1.Matrop.Active:=TRUE;
 if not dm1.Matrop.eof then
 begin
  NORM.FieldByName('Gost').AsString :=dm1.MatropGOST.AsString;
  NORM.FieldByName('Nmat').AsString :=dm1.Matrop.FieldByName('Nmat').AsString;;
  NORM.FieldByName('Kei_Id').AsInteger :=dm1.Matrop.FieldByName('Kei_id').AsInteger;;
  NORM.FieldByName('Xarkt').AsString :=dm1.Matrop.FieldByName('Xarkt').AsString;
 end
 else
  showMessage('Нет такого кода! Воспользуйтесь справочником!');
end;

procedure TDM1.normNewRecord(DataSet: TDataSet);
begin
  DM1.NORM.FieldByName('Kodp').AsInteger := s_kodp;
  DM1.NORM.FieldByName('Pr_Ov').AsInteger := 0;
  DM1.NORM.FieldByName('PrPf').AsInteger := 0;
  DM1.NORM.FieldByName('mes').AsInteger := mes;
  DM1.NORM.FieldByName('god').AsInteger := god;
  DM1.NORM.FieldByName('Datanorm').AsDateTime := strtodate(s_dat1);
  dm1.Norm.FieldByName('Tip_op_ID').value := vTip_op_id;
  dm1.Norm.FieldByName('struk_ID').value := struk;
end;

procedure TDM1.NormSyrAfterOpen(DataSet: TDataSet);
begin
//	NormSy.Close;
  NormSy.DisableControls;
  NormSy.EmptyTable;
  NormSy.Open;
  NormSy.LoadFromDataSet(NormSyr, [mtcpoAppend]);
  NormSy.EnableControls;
//  NormSy.Open;
end;

procedure TDM1.NormSyrKOD_PRODValidate(Sender: TField);
begin
 DM1.IBQuery1.Active := False;
 DM1.IBQuery1.SQL.Clear;
 DM1.IBQuery1.SQL.Add('SELECT SPPROD.STRUK_ID,SPPROD.NMAT, SPPROD.KOD_PROD, SPPROD.KEI_ID,SPPROD.KSM_ID,');
 DM1.IBQuery1.SQL.Add('spprod.sprod_id,STRUK.STNAME, REGION.NAM');
 DM1.IBQuery1.SQL.Add(' FROM SPPROD');
 DM1.IBQuery1.SQL.Add(' left JOIN REGION ON (SPPROD.Reg = REGION.reg)');
 DM1.IBQuery1.SQL.Add(' INNER JOIN STRUK ON (SPPROD.STRUK_ID = STRUK.STRUK_ID)');
 DM1.IBQuery1.SQL.Add(' WHERE SPPROD.Ksm_id='+inttostr(s_kodp));
 DM1.IBQuery1.Active := True;
 if NOT DM1.IBQuery1.Eof then
  begin
   dm1.NormSyr.FieldByName('kod_prod').AsString:=DM1.IBQuery1.FieldByName('KOD_PROD').Asstring;
   dm1.NormSyrKodp.AsInteger:=DM1.IBQuery1.FieldByName('KSM_ID').AsInteger;
   dm1.NormSyrNmat.AsString:=DM1.IBQuery1.FieldByName('NMAT').AsString;
   dm1.NormSyrStruk_id.AsInteger:=DM1.IBQuery1.FieldByName('Struk_id').AsInteger;
   dm1.NormSyrSprod_id.AsInteger:=DM1.IBQuery1.FieldByName('Sprod_id').AsInteger;
   dm1.NormSyrNam.AsString:=DM1.IBQuery1.FieldByName('NaM').AsString;
   dm1.NormSyrKraz.AsInteger:=strtoint(FSYRIE.edit6.text);
   dm1.NormSyrRazdel_id.AsInteger:=s_raz;
   dm1.NormSyrksm_id.AsInteger:=s_ksmz;
   dm1.NormSyrNeis.AsString:=FSYRIE.edit9.text;
   dm1.NormSyrKei_id.AsInteger:=s_keiz;
   dm1.NormSyrPrpf.AsInteger:=s_prpf;
   dm1.NormSyrVib.AsInteger:=1;
   if FSYRIE.edit3.text='' then dm1.NormSyrPlnorm.AsFloat:=0
   else
    dm1.NormSyrPlnorm.AsFloat:=strtoFloat(replacestr(FSYRIE.edit3.text,'.',','));
   dm1.NormSyrStname.AsString:=DM1.IBQuery1.FieldByName('STNAME').AsString;
   dm1.NormSyr.Post;
  end;
end;

procedure TDM1.PodpisNewRecord(DataSet: TDataSet);
begin

 DM1.Podpis.FieldByName('Tip_op_Id').AsInteger :=vTip_op_id;
 DM1.Podpis.FieldByName('Tip_dok_Id').AsInteger :=v_Tip_dok;
 DM1.Podpis.FieldByName('Struk_Id').AsInteger :=Struk;
end;

procedure TDM1.CancelUpdatesNorm;
begin
  DM1.Norm.CancelUpdates;
  DM1.IBT_Read.RollbackRetaining;
end;

procedure TDM1.CENNIKBeforeInsert(DataSet: TDataSet);
begin
{DM1.Add_NormDok.StoredProcName := 'ADD_CENNIK';
 DM1.Add_NormDok.ExecProc;
 vCEN_Id := DM1.Add_NormDok.Params.Items[0].AsInteger;}
end;

procedure TDM1.CENNIKNewRecord(DataSet: TDataSet);
begin
// DM1.CENNIK.FieldByName('CEN_Id').AsInteger := vCEN_Id;
end;

procedure TDM1.startReadTrans;
begin
  if (not dm1.IBT_Read.Active) then
    dm1.IBT_Read.StartTransaction;
end;

procedure TDM1.startWriteTrans;
begin
  if (not dm1.IBT_WRITE.Active) then
    dm1.IBT_WRITE.StartTransaction;
end;

procedure TDM1.sumRash_RazdAfterOpen(DataSet: TDataSet);
begin
  mem_sumRashRazd.DisableControls;
  mem_sumRashRazd.Close;
  mem_sumRashRazd.EmptyTable;
  mem_sumRashRazd.Open;
  mem_sumRashRazd.LoadFromDataSet(sumRash_Razd, 0, lmAppend);
  mem_sumRashRazd.First;
  while (not mem_sumRashRazd.Eof) do
  begin
    mem_sumRashRazd.Edit;
    mem_sumRashRazdKODRAZ2.AsString := mem_sumRashRazdKODRAZ.AsString;
    mem_sumRashRazd.Post;
    mem_sumRashRazd.Next;
  end;
  sumRash_Razd.First;
  mem_sumRashRazd.EnableControls;
end;

procedure TDM1.startRWTranss;
begin
  startReadTrans;
  startWriteTrans;
end;

procedure TDM1.ApplyUpdatesNorm;
begin
  startRWTranss;
  try
    if (DM1.Document.UpdatesPending) then
      DM1.Document.ApplyUpdates;
    if (DM1.Norm.UpdatesPending) then
      DM1.Norm.ApplyUpdates;
    DM1.IBT_WRITE.Commit;
    DM1.IBT_READ.CommitRetaining;
  except
    On E : Exception do
    begin
      MessageDlg('Произошла ошибка при записи данных!' + E.Message, mtWarning, [mbOK], 0);
      DM1.IBT_WRITE.RollbackRetaining;
    end;
  end;
end;

procedure TDM1.VoprosWriteNorm;
begin
  if (DM1.Norm.Modified) or (dm1.norm.State =dsEdit)
     or (dm1.norm.State =dsInsert)then
  BEGIN
    DM1.Norm.Post;
    if (DM1.Norm.UpdatesPending) then
    begin
      if (MessageDlg('Записать изменения?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        ApplyUpdatesNorm
      else
        CancelUpdatesNorm;
    end;
  END;
end;

procedure TDM1.Copy_Ediz;
begin
// Ediz_st.EmptyTable;
 Ediz_ST.Active :=true;
 if not Ediz_st.Eof then
 begin
   Ediz_st.First;
   while not Ediz_ST.Eof do Ediz_st.Delete;
 end;
 Ediz_ASY.Active :=false;
 Ediz_ASY.Active :=true;
 Ediz_ASY.First;
 if not Ediz_ASY.Eof then
 begin
  Splash := ShowSplashWindow (AniBmp1,
  'Переносятся данные справочника единиц измерения Ediz. Подождите, пожалуйста...',True, nil);
  While not Ediz_ASY.Eof do
  begin
   Ediz_st.Append;
   Ediz_st.FieldByName('Kei_id').AsInteger:=Ediz_ASY.FieldByName('Kei_id').AsInteger;
   Ediz_ST.FieldByName('Neis').AsString:=Ediz_ASY.FieldByName('Neis').AsString;
   if length(trim(inttostr(Ediz_ASY.FieldByName('Kei_id').AsInteger)))=1 then
     Ediz_ST.FieldByName('kei').AsString:='00'+TRIM(inttostr(EDIZ_asy.FieldByName('kei_id').AsInteger))+' ';
   if length(trim(inttostr(Ediz_ASY.FieldByName('Kei_id').AsInteger)))=2 then
     Ediz_ST.FieldByName('kei').AsString:='0'+TRIM(inttostr(EDIZ_asy.FieldByName('kei_id').AsInteger))+' ';
   if length(trim(inttostr(Ediz_ASY.FieldByName('Kei_id').AsInteger)))=3 then
     Ediz_ST.FieldByName('kei').AsString:=TRIM(inttostr(EDIZ_asy.FieldByName('kei_id').AsInteger))+' ';
   Ediz_st.Post;
   Ediz_ASY.Next;
  end;
  Splash.Free;
  MessageDlg('Данные перенесены!', mtWarning, [mbOK], 0);
 end;
end;

procedure TDM1.Copy_Koefpr;
begin
// Koefpr_st.EmptyTable;
 Koefpr_ST.Active :=true;
 if not Koefpr_st.Eof then
 begin
   while not Koefpr_ST.Eof do Koefpr_st.Delete;
 end;
 if Koefpr_ASY.Active then Koefpr_ASY.Active :=false;
 Koefpr_ASY.Active :=true;
 Koefpr_ASY.First;
 if not Koefpr_ASY.Eof then
 begin
  Splash := ShowSplashWindow(AniBmp1,
 'Переносятся данные справочника несоизмеримых единиц измерения (Koefpr). Подождите, пожалуйста...', True, nil);
  While not Koefpr_ASY.Eof do
  begin
   Koefpr_st.Append;
   Koefpr_st.FieldByName('Kei_id').AsInteger:=Koefpr_ASY.FieldByName('Kei_id').AsInteger;
   Koefpr_ST.FieldByName('Koef').AsFloat:=Koefpr_ASY.FieldByName('Koef').AsFloat;
   Koefpr_st.FieldByName('Ksm_id').AsInteger:=Koefpr_ASY.FieldByName('Ksm_id').AsInteger;
   Koefpr_st.Post;
   Koefpr_ASY.Next;
  end;
  Splash.Free;
  MessageDlg('Данные перенесены!', mtWarning, [mbOK], 0);
 end;
end;

procedure TDM1.Copy_Razdel;
begin
 Razdel_st.EmptyTable;
 Razdel_ST.Active :=true;
{ if not Razdel_st.Eof then
 begin
   Razdel_st.First;
   while not Razdel_ST.Eof do Razdel_st.Delete;
 end; }
 if Razdel_ASY.Active then Razdel_ASY.Active :=false;
 Razdel_ASY.Active :=true;
 Razdel_ASY.First;
 if not Razdel_ASY.Eof then
 begin
  Splash := ShowSplashWindow(AniBmp1,
 'Переносятся данные справочника разделов (Razdel). Подождите, пожалуйста...', True, nil);
  While not Razdel_ASY.Eof do
  begin
   Razdel_st.Append;
   Razdel_st.FieldByName('Kraz').AsInteger:=Razdel_ASY.FieldByName('Kraz').AsInteger;
   Razdel_ST.FieldByName('Namraz').AsString:=Razdel_ASY.FieldByName('Namraz').AsString;
   Razdel_st.FieldByName('Kodraz').AsString:=Razdel_ASY.FieldByName('Kodraz').AsString;
   Razdel_st.Post;
   Razdel_ASY.Next;
  end;
  Splash.Free;
  MessageDlg('Данные перенесены!', mtWarning, [mbOK], 0);
 end;
end;

procedure TDM1.Copy_Otxody;
begin
 Otxody_st.EmptyTable;
 Otxody_ST.Active :=true;
{ Otxody_st.First;
 if not Otxody_st.Eof then
   while not Otxody_ST.Eof do
    Otxody_st.Delete;}
 if Otxody_ASY.Active then Otxody_ASY.Active :=false;
 Otxody_ASY.Active :=true;
 Otxody_ASY.First;
 if not Otxody_ASY.Eof then
 begin
  Splash := ShowSplashWindow(AniBmp1,
 'Переносятся данные справочника отходов (Otxody). Подождите, пожалуйста...', True, nil);
  While not Otxody_ASY.Eof do
  begin
   Otxody_st.Append;
   Otxody_st.FieldByName('Ksm_id').AsInteger:=otxody_asy.FieldByName('Kodp_o').AsInteger;
   Otxody_st.FieldByName('name').AsString:=otxody_asy.FieldByName('nmat').AsString;
   Otxody_st.FieldByName('Ksm_id1').AsInteger:=otxody_asy.FieldByName('Kodp_os').AsInteger;
   Otxody_st.FieldByName('Kceh').AsString:=otxody_asy.FieldByName('stkod').asstring;
   Otxody_st.FieldByName('razo').AsString:=inttostr(otxody_ASY.FieldByName('razo').AsInteger);
   Otxody_st.FieldByName('razos').AsString:=inttostr(otxody_ASY.FieldByName('razos').AsInteger);
   Otxody_st.FieldByName('dat').AsDateTime:=otxody_asy.FieldByName('datevv').AsDateTime;
   Otxody_st.FieldByName('Kodos_s').AsString:=otxody_asy.FieldByName('Kodst_os').AsString;
   Otxody_st.FieldByName('Kodo_s').AsString:=otxody_asy.FieldByName('Kodst_o').AsString;
   if length(trim(inttostr(otxody_asy.FieldByName('Kei_ido').AsInteger)))=1 then
     Otxody_ST.FieldByName('keio').AsString:='00'+trim(inttostr(otxody_asy.FieldByName('kei_ido').AsInteger))+' ';
   if length(trim(inttostr(otxody_asy.FieldByName('Kei_ido').AsInteger)))=2 then
     Otxody_ST.FieldByName('keio').AsString:='0'+trim(inttostr(otxody_asy.FieldByName('kei_ido').AsInteger))+' ';
   if length(trim(inttostr(otxody_asy.FieldByName('Kei_ido').AsInteger)))=3 then
     Otxody_ST.FieldByName('keio').AsString:=trim(inttostr(otxody_asy.FieldByName('kei_ido').AsInteger))+' ';

  if length(trim(inttostr(otxody_asy.FieldByName('Kei_idos').AsInteger)))=1 then
     Otxody_ST.FieldByName('keios').AsString:='00'+trim(inttostr(otxody_asy.FieldByName('kei_idos').AsInteger))+' ';
   if length(trim(inttostr(otxody_asy.FieldByName('Kei_idos').AsInteger)))=2 then
     Otxody_ST.FieldByName('keios').AsString:='0'+trim(inttostr(otxody_asy.FieldByName('kei_idos').AsInteger))+' ';
   if length(trim(inttostr(otxody_asy.FieldByName('Kei_idos').AsInteger)))=3 then
     Otxody_ST.FieldByName('keios').AsString:=trim(inttostr(otxody_asy.FieldByName('kei_idos').AsInteger))+' ';

   if length(trim(inttostr(otxody_asy.FieldByName('Ksm_ido').AsInteger)))=1 then
     Otxody_ST.FieldByName('ksmo').AsString:='0000'+inttostr(otxody_asy.FieldByName('ksm_ido').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Ksm_ido').AsInteger)))=2 then
     Otxody_ST.FieldByName('ksmo').AsString:='000'+inttostr(otxody_asy.FieldByName('ksm_ido').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Ksm_ido').AsInteger)))=3 then
     Otxody_ST.FieldByName('ksmo').AsString:='00'+inttostr(otxody_asy.FieldByName('ksm_ido').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Ksm_ido').AsInteger)))=4 then
     Otxody_ST.FieldByName('ksmo').AsString:='0'+inttostr(otxody_asy.FieldByName('ksm_ido').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Ksm_ido').AsInteger)))=5 then
     Otxody_ST.FieldByName('ksmo').AsString:=inttostr(otxody_asy.FieldByName('ksm_ido').AsInteger);

   if length(trim(inttostr(otxody_asy.FieldByName('Ksm_idos').AsInteger)))=1 then
     Otxody_ST.FieldByName('ksmos').AsString:='0000'+inttostr(otxody_asy.FieldByName('ksm_idos').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Ksm_idos').AsInteger)))=2 then
     Otxody_ST.FieldByName('ksmos').AsString:='000'+inttostr(otxody_asy.FieldByName('ksm_idos').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Ksm_idos').AsInteger)))=3 then
     Otxody_ST.FieldByName('ksmos').AsString:='00'+inttostr(otxody_asy.FieldByName('ksm_idos').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Ksm_idos').AsInteger)))=4 then
     Otxody_ST.FieldByName('ksmos').AsString:='0'+inttostr(otxody_asy.FieldByName('ksm_idos').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Ksm_idos').AsInteger)))=5 then
     Otxody_ST.FieldByName('ksmos').AsString:=inttostr(otxody_asy.FieldByName('ksm_idos').AsInteger);

   if length(trim(inttostr(otxody_asy.FieldByName('Kodp_o').AsInteger)))=1 then
     Otxody_ST.FieldByName('kodo').AsString:='00000'+inttostr(otxody_asy.FieldByName('kodp_o').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Kodp_o').AsInteger)))=2 then
     Otxody_ST.FieldByName('kodo').AsString:='0000'+inttostr(otxody_asy.FieldByName('kodp_o').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Kodp_o').AsInteger)))=3 then
     Otxody_ST.FieldByName('kodo').AsString:='000'+inttostr(otxody_asy.FieldByName('kodp_o').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Kodp_o').AsInteger)))=4 then
     Otxody_ST.FieldByName('kodo').AsString:='00'+inttostr(otxody_asy.FieldByName('kodp_o').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Kodp_o').AsInteger)))=5 then
     Otxody_ST.FieldByName('kodo').AsString:='0'+inttostr(otxody_asy.FieldByName('kodp_o').AsInteger);
     if length(trim(inttostr(otxody_asy.FieldByName('Kodp_o').AsInteger)))=6 then
     Otxody_ST.FieldByName('kodo').AsString:=inttostr(otxody_asy.FieldByName('kodp_o').AsInteger);

   if length(trim(inttostr(otxody_asy.FieldByName('Kodp_os').AsInteger)))=1 then
     Otxody_ST.FieldByName('kodos').AsString:='00000'+inttostr(otxody_asy.FieldByName('kodp_os').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Kodp_os').AsInteger)))=2 then
     Otxody_ST.FieldByName('kodos').AsString:='0000'+inttostr(otxody_asy.FieldByName('kodp_os').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Kodp_os').AsInteger)))=3 then
     Otxody_ST.FieldByName('kodos').AsString:='000'+inttostr(otxody_asy.FieldByName('kodp_os').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Kodp_os').AsInteger)))=4 then
     Otxody_ST.FieldByName('kodos').AsString:='00'+inttostr(otxody_asy.FieldByName('kodp_os').AsInteger);
   if length(trim(inttostr(otxody_asy.FieldByName('Kodp_os').AsInteger)))=5 then
     Otxody_ST.FieldByName('kodos').AsString:='0'+inttostr(otxody_asy.FieldByName('kodp_os').AsInteger);
     if length(trim(inttostr(otxody_asy.FieldByName('Kodp_os').AsInteger)))=6 then
     Otxody_ST.FieldByName('kodos').AsString:=inttostr(otxody_asy.FieldByName('kodp_os').AsInteger);
   Otxody_st.Post;
   Otxody_ASY.Next;
  end;
  Splash.Free;
  MessageDlg('Данные перенесены!', mtWarning, [mbOK], 0);
 end;
end;
//Процедура располагает форму  (PopUpForm) приближенно
//к заданному объекту управления  (ControlObject)
procedure TDM1.FormToObject(PopupForm : TForm; ControlObject : TControl; HTop:Integer=0; YesWidth:Integer=1);
var
  xy : TPoint;
begin
  xy.Y := 0;
  xy.X := 0;
  xy:= ControlObject.ClientToScreen(xy);
  PopupForm.Position := poDesigned;
  PopupForm.BorderStyle := bsNone;
  PopupForm.Top := xy.Y+ControlObject.Height;
  if PopupForm.Top+PopupForm.Height > Screen.Height then
    PopupForm.Top := PopupForm.Top-PopupForm.Height-ControlObject.Height;
  if PopupForm.Top < 0 then
  begin
    PopupForm.Height := PopupForm.Height+PopupForm.Top-HTop;
    PopupForm.Top := HTop;
  end;
  PopupForm.Left := xy.X;
  if YesWidth = 1 then
    PopupForm.Width := ControlObject.Width;
end;

function TDM1.KolZnakovPosleZap(value : variant) : integer;
var
  s : string;
  i : Integer;
  kolZn : integer;
begin
  kolZn := 0;
//  s := floattostr(value);
  s := value;
  for i := length(s) downto 0 do
  begin
    if s[i] = ',' then
      break;
    if i > 0 then
    begin
      if s[i] = '0' then
      begin
        if kolZn > 0 then
          kolZn := kolZn + 1;
      end
      else
        kolZn := kolZn + 1;
    end
    else
      kolZn := 0;
  end;
  result := kolZn;
end;

end.
