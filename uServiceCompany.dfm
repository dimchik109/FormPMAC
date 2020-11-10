object fmServiceCompany: TfmServiceCompany
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1057#1082#1083#1072#1076#1099' '#1080' '#1082#1083#1080#1077#1085#1090#1099
  ClientHeight = 766
  ClientWidth = 1296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TPanel
    Left = 706
    Top = 0
    Width = 590
    Height = 766
    Align = alRight
    TabOrder = 0
    object grdCompanySeller: TDBGridEh
      Left = 1
      Top = 443
      Width = 588
      Height = 322
      Align = alBottom
      DataSource = dsCompanySeller
      DynProps = <>
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      PopupMenu = pmCompanySeller
      SearchPanel.Enabled = True
      TabOrder = 0
      VertScrollBar.VisibleMode = sbNeverShowEh
      OnKeyDown = grdCompanySellerKeyDown
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1048#1084#1103' '#1087#1088#1086#1076#1072#1074#1094#1072
          Width = 260
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          EditMask = '0000 0000 0000 0000'
          FieldName = 'CARD_NUM'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
          Width = 261
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object grdCompanyGroup: TDBGridEh
      Left = 1
      Top = 1
      Width = 588
      Height = 432
      Align = alTop
      DataSource = dsCompanyGroup
      DynProps = <>
      EditActions = [geaCopyEh]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = pmCompanyGroup
      SearchPanel.Enabled = True
      TabOrder = 1
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnKeyDown = grdCompanyGroupKeyDown
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'GROUP_NAME'
          Footers = <>
          Title.Caption = #1041#1088#1077#1085#1076
          Width = 144
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PRICE'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
          Width = 110
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DISCOUNT'
          Footers = <>
          Title.Caption = #1057#1082#1080#1076#1082#1072
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STIMUL'
          Footers = <>
          Title.Caption = #1057#1090#1080#1084#1091#1083#1103#1094#1080#1103
          Width = 78
        end
        item
          CellButtons = <>
          Checkboxes = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'STIMUL_TYPE'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          PickList.Strings = (
            #1055#1088#1086#1076#1072#1074#1094#1091
            #1050#1083#1080#1077#1085#1090#1091)
          Title.Caption = #1058#1080#1087' '#1089#1090#1080#1084#1091#1083#1103#1094#1080#1080
          Width = 89
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'LIMIT_STIM'
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnCompany: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 766
    Align = alClient
    Caption = 'pnCompany'
    ShowCaption = False
    TabOrder = 1
    object grdCompany: TDBGridEh
      Left = 1
      Top = 1
      Width = 704
      Height = 764
      Align = alClient
      DataSource = dsCompany
      DynProps = <>
      EditActions = [geaCopyEh]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = pmCompany
      SearchPanel.Enabled = True
      TabOrder = 0
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDrawColumnCell = grdCompanyDrawColumnCell
      OnKeyDown = grdCompanyKeyDown
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME_COMPANY'
          Footers = <>
          Title.Caption = #1048#1084#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
          Width = 142
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME_TYPE'
          Footers = <>
          Title.Caption = #1058#1080#1087
          Width = 84
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ID_MAIN_COMPANY'
          Footers = <>
          LookupParams.KeyFieldNames = 'ID_MAIN_COMPANY'
          LookupParams.LookupDataSet = odsMainCompany
          LookupParams.LookupDisplayFieldName = 'NAME_COMPANY'
          LookupParams.LookupKeyFieldNames = 'ID_COMPANY'
          Width = 93
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME_USER'
          Footers = <>
          Title.Caption = #1052#1077#1085#1077#1076#1078#1077#1088
          Width = 100
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DEBT'
          Footers = <>
          Title.Caption = #1044#1086#1083#1075
          Width = 65
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CURRENCY'
          Footers = <>
          KeyList.Strings = (
            '0'
            '1')
          PickList.Strings = (
            '$'
            #8372)
          Width = 42
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NO_ACTUAL_DATE'
          Footers = <>
          Width = 127
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object dsCompanyGroup: TDataSource
    DataSet = odsCompanyGroup
    OnUpdateData = dsCompanyGroupUpdateData
    Left = 742
    Top = 273
  end
  object dsCompanySeller: TDataSource
    DataSet = odsCompanySeller
    OnUpdateData = dsCompanySellerUpdateData
    Left = 534
    Top = 689
  end
  object odsCompanyGroup: TOracleDataSet
    SQL.Strings = (
      'SELECT TCG.ID_TAB_COMPANY,'
      '       TGM.MAIN_NAME,'
      '       TCG.ID_TAB_PRICE,'
      '       TCG.ID_TAB_GROUP_MAIN,'
      '       TCG.DISCOUNT,'
      '       TCG.STIMUL,'
      '       TCG.STIMUL_TYPE,'
      '       TCG.LIMIT_STIM,'
      '       TCG.ROWID'
      '  FROM PMAC.TAB_COMPANY_GROUP TCG'
      '    JOIN PMAC.TAB_GROUP TG'
      '      ON TCG.ID_TAB_GROUP_MAIN = TG.ID_GROUP_MAIN'
      '    JOIN PMAC.TAB_GROUP_MAIN TGM'
      '      ON TCG.ID_TAB_GROUP_MAIN = TGM.ID_GROUP_MAIN'
      '  WHERE TG.SHOW = 1'
      '    AND TCG.ID_TAB_COMPANY = :VAR_ID_TAB_COMPANY'
      '  GROUP BY  TCG.ID_TAB_COMPANY,'
      '       TGM.MAIN_NAME,'
      '       TCG.ID_TAB_PRICE,'
      '       TCG.ID_TAB_GROUP_MAIN,'
      '       TCG.DISCOUNT,'
      '       TCG.STIMUL,'
      '       TCG.STIMUL_TYPE,'
      '       TCG.LIMIT_STIM,TGM.SORT,'
      '       TCG.ROWID'
      '  ORDER BY TGM.SORT'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000260000003A005600410052005F00490044005F0054004100
      42005F0043004F004D00500041004E005900030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000001000000044004900530043004F0055004E00540001000000
      00000C0000005300540049004D0055004C000100000000001600000053005400
      49004D0055004C005F0054005900500045000100000000001800000049004400
      5F005400410042005F00500052004900430045000100000000001C0000004900
      44005F005400410042005F0043004F004D00500041004E005900010000000000
      22000000490044005F005400410042005F00470052004F00550050005F004D00
      410049004E00010000000000120000004D00410049004E005F004E0041004D00
      4500010000000000140000004C0049004D00490054005F005300540049004D00
      010000000000}
    Session = DM.OS
    BeforeInsert = odsCompanyGroupBeforeInsert
    BeforePost = odsCompanyGroupBeforePost
    AfterPost = odsCompanyGroupAfterPost
    AfterDelete = odsCompanyGroupAfterDelete
    OnPostError = odsCompanyGroupPostError
    Left = 744
    Top = 320
    object odsCompanyGroupID_TAB_COMPANY: TFloatField
      FieldName = 'ID_TAB_COMPANY'
      Required = True
    end
    object odsCompanyGroupMAIN_NAME: TWideStringField
      FieldName = 'MAIN_NAME'
      OnChange = odsCompanyGroupMAIN_NAMEChange
      Size = 101
    end
    object odsCompanyGroupID_TAB_PRICE: TFloatField
      FieldName = 'ID_TAB_PRICE'
    end
    object odsCompanyGroupID_TAB_GROUP_MAIN: TFloatField
      FieldName = 'ID_TAB_GROUP_MAIN'
    end
    object odsCompanyGroupDISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
      Required = True
    end
    object odsCompanyGroupSTIMUL: TFloatField
      FieldName = 'STIMUL'
    end
    object odsCompanyGroupSTIMUL_TYPE: TFloatField
      FieldName = 'STIMUL_TYPE'
    end
    object odsCompanyGroupPRICE: TStringField
      FieldKind = fkLookup
      FieldName = 'PRICE'
      LookupDataSet = DM.odsPrice
      LookupKeyFields = 'ID_PRICE'
      LookupResultField = 'NAME_PRICE'
      KeyFields = 'ID_TAB_PRICE'
      OnChange = odsCompanyGroupPRICEChange
      Lookup = True
    end
    object odsCompanyGroupGROUP_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GROUP_NAME'
      LookupDataSet = odsCompanyGroupLookup
      LookupKeyFields = 'ID_GROUP_MAIN'
      LookupResultField = 'MAIN_NAME'
      KeyFields = 'ID_TAB_GROUP_MAIN'
      Lookup = True
    end
    object odsCompanyGroupLIMIT_STIM: TFloatField
      DisplayLabel = #1051#1080#1084#1080#1090' '#1089#1090#1080#1084
      FieldName = 'LIMIT_STIM'
    end
  end
  object odsCompanySeller: TOracleDataSet
    SQL.Strings = (
      'SELECT TCS.ID_SELLER,'
      '       TCS.ID_TAB_COMPANY,'
      '       TCS.NAME,'
      '       TCS.CARD_NUM,'
      '       TCS.ROWID'
      '  FROM PMAC.TAB_COMPANY_SELLER TCS  '
      '  WHERE ID_TAB_COMPANY = :VAR_ID_TAB_COMPANY  ')
    Optimize = False
    Variables.Data = {
      0400000001000000260000003A005600410052005F00490044005F0054004100
      42005F0043004F004D00500041004E005900050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000400000012000000490044005F00530045004C004C00450052000100
      000000001C000000490044005F005400410042005F0043004F004D0050004100
      4E005900010000000000080000004E0041004D00450001000000000010000000
      43004100520044005F004E0055004D00010000000000}
    Session = DM.OS
    BeforeInsert = odsCompanySellerBeforeInsert
    BeforePost = odsCompanySellerBeforePost
    AfterPost = odsCompanySellerAfterPost
    OnPostError = odsCompanySellerPostError
    Left = 584
    Top = 688
    object odsCompanySellerID_SELLER: TFloatField
      FieldName = 'ID_SELLER'
      ReadOnly = True
      Required = True
    end
    object odsCompanySellerID_TAB_COMPANY: TFloatField
      FieldName = 'ID_TAB_COMPANY'
      Required = True
    end
    object odsCompanySellerNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object odsCompanySellerCARD_NUM: TStringField
      FieldName = 'CARD_NUM'
      Size = 50
    end
  end
  object odsCompany: TOracleDataSet
    SQL.Strings = (
      'SELECT TC.ID_COMPANY,'
      '       TC.NAME_COMPANY,'
      '       TC.ID_TAB_TYPE,'
      '       TC.ID_TAB_USER,'
      '       TC.DEBT,'
      '       TC.CURRENCY, '
      '       TC.ID_MAIN_COMPANY,'
      
        '       TO_NCHAR(nvl2(TC.NO_ACTUAL_DATE,'#39#1053#1077' '#1088#1072#1073#1086#1090#1072#1077#1090' '#1089' '#39' || TC.NO' +
        '_ACTUAL_DATE,'#39#1056#1072#1073#1086#1090#1072#1077#1090#39')) NO_ACTUAL_DATE,'
      '       TC.ROWID'
      '  FROM PMAC.TAB_COMPANY TC'
      'ORDER BY TC.NAME_COMPANY, NO_ACTUAL_DATE DESC')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000800000014000000490044005F0043004F004D00500041004E005900
      010000000000180000004E0041004D0045005F0043004F004D00500041004E00
      5900010000000000080000004400450042005400010000000000160000004900
      44005F005400410042005F005400590050004500010000000000160000004900
      44005F005400410042005F005500530045005200010000000000100000004300
      55005200520045004E00430059000100000000001E000000490044005F004D00
      410049004E005F0043004F004D00500041004E0059000100000000001C000000
      4E004F005F00410043005400550041004C005F00440041005400450001000000
      0000}
    Session = DM.OS
    BeforePost = odsCompanyBeforePost
    AfterPost = odsCompanyAfterPost
    AfterScroll = odsCompanyAfterScroll
    OnPostError = odsCompanyPostError
    Left = 384
    Top = 176
    object odsCompanyID_COMPANY: TFloatField
      FieldName = 'ID_COMPANY'
      ReadOnly = True
      Required = True
    end
    object odsCompanyNAME_COMPANY: TWideStringField
      FieldName = 'NAME_COMPANY'
      Required = True
      Size = 101
    end
    object odsCompanyDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object odsCompanyID_TAB_TYPE: TFloatField
      FieldName = 'ID_TAB_TYPE'
    end
    object odsCompanyNAME_USER: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_USER'
      LookupDataSet = DM.odsUser
      LookupKeyFields = 'ID_USER'
      LookupResultField = 'NAME'
      KeyFields = 'ID_TAB_USER'
      OnChange = odsCompanyNAME_USERChange
      Lookup = True
    end
    object odsCompanyID_TAB_USER: TFloatField
      FieldName = 'ID_TAB_USER'
    end
    object odsCompanyNAME_TYPE: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_TYPE'
      LookupDataSet = DM.odsType
      LookupKeyFields = 'ID_TYPE'
      LookupResultField = 'NAME_TYPE'
      KeyFields = 'ID_TAB_TYPE'
      OnChange = odsCompanyNAME_TYPEChange
      Lookup = True
    end
    object odsCompanyCURRENCY: TFloatField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCY'
    end
    object odsCompanyID_MAIN_COMPANY: TFloatField
      DisplayLabel = #1043#1083#1072#1074#1085#1099#1081' '#1082#1083#1080#1077#1085#1090
      FieldName = 'ID_MAIN_COMPANY'
    end
    object odsCompanyNO_ACTUAL_DATE: TWideStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'NO_ACTUAL_DATE'
      Size = 101
    end
  end
  object dsCompany: TDataSource
    DataSet = odsCompany
    OnUpdateData = dsCompanyUpdateData
    Left = 320
    Top = 176
  end
  object odsCompanyGroupLookup: TOracleDataSet
    SQL.Strings = (
      'SELECT VGMOS.MAIN_NAME,'
      '       VGMOS.ID_GROUP_MAIN,'
      '       TSD.STIMUL_DEF'
      '  FROM PMAC.VIE_GROUP_MAIN_ONLY_SHOW VGMOS'
      '    LEFT JOIN PMAC.TAB_STIMUL_DEF TSD'
      '      ON VGMOS.ID_GROUP_MAIN = TSD.ID_TAB_GROUP_MAIN'
      '    LEFT JOIN PMAC.TAB_COMPANY_GROUP TCG'
      '      ON VGMOS.ID_GROUP_MAIN = TCG.ID_TAB_GROUP_MAIN'
      '      AND TCG.ID_TAB_COMPANY = :VAR_ID_TAB_COMPANY'
      ''
      '  WHERE TCG.ID_TAB_GROUP_MAIN IS NULL'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000260000003A005600410052005F00490044005F0054004100
      42005F0043004F004D00500041004E0059000300000004000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0500000003000000120000004D00410049004E005F004E0041004D0045000100
      000000001A000000490044005F00470052004F00550050005F004D0041004900
      4E00010000000000140000005300540049004D0055004C005F00440045004600
      010000000000}
    Session = DM.OS
    AfterScroll = odsCompanyGroupLookupAfterScroll
    Left = 820
    Top = 320
    object odsCompanyGroupLookupMAIN_NAME: TWideStringField
      FieldName = 'MAIN_NAME'
      Size = 101
    end
    object odsCompanyGroupLookupID_GROUP_MAIN: TFloatField
      FieldName = 'ID_GROUP_MAIN'
    end
    object odsCompanyGroupLookupSTIMUL_DEF: TFloatField
      FieldName = 'STIMUL_DEF'
    end
  end
  object pmCompany: TPopupMenu
    Left = 296
    Top = 504
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
      OnClick = N1Click
    end
    object nNoActual: TMenuItem
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1085#1077' '#1072#1082#1090#1091#1072#1083#1100#1085#1099#1084
      OnClick = nNoActualClick
    end
  end
  object pmCompanyGroup: TPopupMenu
    Left = 741
    Top = 376
    object N2: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1073#1088#1077#1085#1076
      OnClick = N2Click
    end
    object nHistory: TMenuItem
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      OnClick = nHistoryClick
    end
  end
  object pmCompanySeller: TPopupMenu
    Left = 765
    Top = 608
    object N3: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1076#1072#1074#1094#1072
      OnClick = N3Click
    end
  end
  object odsMainCompany: TOracleDataSet
    SQL.Strings = (
      'SELECT TC.ID_COMPANY,'
      '       TC.NAME_COMPANY'
      ' FROM PMAC.TAB_COMPANY TC WHERE ID_TAB_TYPE = 5')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000200000014000000490044005F0043004F004D00500041004E005900
      010000000000180000004E0041004D0045005F0043004F004D00500041004E00
      5900010000000000}
    Session = DM.OS
    Left = 376
    Top = 296
    object odsMainCompanyID_COMPANY: TFloatField
      FieldName = 'ID_COMPANY'
      Required = True
    end
    object odsMainCompanyNAME_COMPANY: TWideStringField
      FieldName = 'NAME_COMPANY'
      Required = True
      Size = 101
    end
  end
end
