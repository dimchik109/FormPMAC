unit uServiceCompany;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Data.DB,
  OracleData, Vcl.Menus;

type
  TfmServiceCompany = class(TForm)
    pnCompany: TPanel;
    grdCompanySeller: TDBGridEh;
    dsCompanyGroup: TDataSource;
    dsCompanySeller: TDataSource;
    odsCompanyGroup: TOracleDataSet;
    odsCompanySeller: TOracleDataSet;
    grdCompany: TDBGridEh;
    odsCompany: TOracleDataSet;
    odsCompanyID_COMPANY: TFloatField;
    odsCompanyNAME_COMPANY: TWideStringField;
    odsCompanyDEBT: TFloatField;
    odsCompanyID_TAB_TYPE: TFloatField;
    odsCompanyNAME_USER: TStringField;
    odsCompanyID_TAB_USER: TFloatField;
    odsCompanyNAME_TYPE: TStringField;
    dsCompany: TDataSource;
    odsCompanyGroupLookup: TOracleDataSet;
    odsCompanyGroupLookupMAIN_NAME: TWideStringField;
    odsCompanyGroupLookupID_GROUP_MAIN: TFloatField;
    grdCompanyGroup: TDBGridEh;
    odsCompanyGroupID_TAB_COMPANY: TFloatField;
    odsCompanyGroupMAIN_NAME: TWideStringField;
    odsCompanyGroupID_TAB_PRICE: TFloatField;
    odsCompanyGroupID_TAB_GROUP_MAIN: TFloatField;
    odsCompanyGroupDISCOUNT: TFloatField;
    odsCompanyGroupSTIMUL: TFloatField;
    odsCompanyGroupSTIMUL_TYPE: TFloatField;
    odsCompanyGroupPRICE: TStringField;
    odsCompanyGroupGROUP_NAME: TStringField;
    odsCompanySellerID_SELLER: TFloatField;
    odsCompanySellerID_TAB_COMPANY: TFloatField;
    odsCompanySellerNAME: TStringField;
    odsCompanySellerCARD_NUM: TStringField;
    odsCompanyGroupLookupSTIMUL_DEF: TFloatField;
    odsCompanyCURRENCY: TFloatField;
    pmCompany: TPopupMenu;
    pmCompanyGroup: TPopupMenu;
    pmCompanySeller: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    odsCompanyGroupLIMIT_STIM: TFloatField;
    odsCompanyID_MAIN_COMPANY: TFloatField;
    odsMainCompany: TOracleDataSet;
    odsMainCompanyID_COMPANY: TFloatField;
    odsMainCompanyNAME_COMPANY: TWideStringField;
    nNoActual: TMenuItem;
    odsCompanyNO_ACTUAL_DATE: TWideStringField;
    nHistory: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdCompanyGroupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdCompanyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odsCompanyGroupAfterDelete(DataSet: TDataSet);
    procedure odsCompanyGroupAfterPost(DataSet: TDataSet);
    procedure odsCompanyGroupBeforePost(DataSet: TDataSet);
    procedure odsCompanyGroupBeforeInsert(DataSet: TDataSet);
    procedure dsCompanyGroupUpdateData(Sender: TObject);
    procedure dsCompanyUpdateData(Sender: TObject);
    procedure odsCompanyGroupSTIMUL_TYPEChange(Sender: TField);
    procedure odsCompanyBeforePost(DataSet: TDataSet);
    procedure odsCompanyAfterPost(DataSet: TDataSet);
    procedure odsCompanyAfterScroll(DataSet: TDataSet);
    procedure odsCompanyNAME_TYPEChange(Sender: TField);
    procedure odsCompanyNAME_USERChange(Sender: TField);
    procedure odsCompanyGroupMAIN_NAMEChange(Sender: TField);
    procedure odsCompanyGroupPRICEChange(Sender: TField);
    procedure odsCompanySellerBeforePost(DataSet: TDataSet);
    procedure odsCompanySellerAfterPost(DataSet: TDataSet);
    procedure dsCompanySellerUpdateData(Sender: TObject);
    procedure grdCompanySellerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odsCompanySellerBeforeInsert(DataSet: TDataSet);
    procedure odsCompanyPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure odsCompanyGroupPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure odsCompanySellerPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure odsCompanyGroupLookupAfterScroll(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure nNoActualClick(Sender: TObject);
    procedure grdCompanyDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure nHistoryClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmServiceCompany: TfmServiceCompany;
  varRecNoF, varRecNoS: Integer;

implementation

uses uDM, uServiceRightsAccess, uStimulationBrand, uServiceCompanyHistory;
{$R *.dfm}

// -------------------- DATA SOURCE COMPANY GROUP ----------------------------
procedure TfmServiceCompany.dsCompanyGroupUpdateData(Sender: TObject);
begin
  if odsCompanyGroupID_TAB_GROUP_MAIN.IsNull then
  begin
    showmessage('Выберите бренд');
    grdCompanyGroup.SetFocus;
    grdCompanyGroup.Fields[grdCompanyGroup.FieldColumns['GROUP_NAME'].Index]
      .FocusControl;
    grdCompanyGroup.FieldColumns['GROUP_NAME'].DropDown;
    abort;
  end;
  if odsCompanyGroupID_TAB_PRICE.IsNull then
  begin
    showmessage('Выберите цену');
    grdCompanyGroup.SetFocus;
    grdCompanyGroup.Fields[grdCompanyGroup.FieldColumns['PRICE'].Index]
      .FocusControl;
    grdCompanyGroup.FieldColumns['PRICE'].DropDown;
    abort;
  end;
  if odsCompanyGroupDISCOUNT.IsNull then
  begin
    showmessage('Укажите скидку');
    grdCompanyGroup.SetFocus;
    grdCompanyGroup.Fields[grdCompanyGroup.FieldColumns['DISCOUNT'].Index]
      .FocusControl;
    abort;
  end;
  if ((odsCompanyGroupSTIMUL.IsNull = false) and
    (odsCompanyGroupSTIMUL_TYPE.IsNull)) then
  begin
    showmessage('Укажите тип стимуляцию');
    grdCompanyGroup.SetFocus;
    grdCompanyGroup.Fields[grdCompanyGroup.FieldColumns['STIMUL_TYPE'].Index]
      .FocusControl;
    grdCompanyGroup.FieldColumns['STIMUL_TYPE'].DropDown;
    abort;
  end;

end;

// -------------------- DATA SOURCE COMPANY ----------------------------------
procedure TfmServiceCompany.dsCompanySellerUpdateData(Sender: TObject);
begin
  if odsCompanySellerNAME.IsNull then
  begin
    showmessage('Введите имя');
    grdCompanySeller.SetFocus;
    grdCompanySeller.Fields[grdCompanySeller.FieldColumns['NAME'].Index]
      .FocusControl;
    abort;
  end;

  if not((length(StringReplace(odsCompanySellerCARD_NUM.asstring, ' ', '',
    [rfReplaceAll, rfIgnoreCase]))) in [0, 16]) then
  begin
    showmessage('Номер карты указан неккоректно');
    grdCompanySeller.SetFocus;
    grdCompanySeller.Fields[grdCompanySeller.FieldColumns['CARD_NUM'].Index]
      .FocusControl;
    abort;
  end;
end;

procedure TfmServiceCompany.dsCompanyUpdateData(Sender: TObject);
begin
  if odsCompanyNAME_COMPANY.IsNull then
  begin
    showmessage('Введите имя');
    grdCompany.SetFocus;
    grdCompany.Fields[grdCompany.FieldColumns['NAME_COMPANY'].Index]
      .FocusControl;
    abort;
  end;
  if odsCompanyID_TAB_TYPE.IsNull then
  begin
    showmessage('Выберите тип');
    grdCompany.SetFocus;
    grdCompany.Fields[grdCompany.FieldColumns['NAME_TYPE'].Index].FocusControl;
    grdCompany.FieldColumns['NAME_TYPE'].DropDown;
    abort;
  end;
  if odsCompanyID_TAB_USER.IsNull then
  begin
    showmessage('Выберите  менеджера');
    grdCompany.SetFocus;
    grdCompany.Fields[grdCompany.FieldColumns['NAME_USER'].Index].FocusControl;
    grdCompany.FieldColumns['NAME_USER'].DropDown;
    abort;
  end;
end;

// ------------------------ FORM -----------------------------------------
procedure TfmServiceCompany.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  odsCompany.Close;
  odsCompanyGroup.Close;
  odsCompanyGroupLookup.Close;

end;

procedure TfmServiceCompany.FormShow(Sender: TObject);
begin
  odsMainCompany.Open;
  DM.odsType.Refresh;
  fmStimulationBrand.odsStimulationBrand.Open;
  odsCompanySeller.Open;
  odsCompanyGroupLookup.SetVariable('VAR_ID_TAB_COMPANY', 0);
  odsCompanyGroupLookup.Open;
  odsCompanyGroup.Open;
  odsCompany.Open;
end;

// ---------------------------- GRID COMPANY GROUP --------------------------------------
procedure TfmServiceCompany.grdCompanyDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

  if not(odsCompanyNO_ACTUAL_DATE.asstring = 'Работает') then
  begin
    with grdCompany do
    begin
      with Canvas do
      begin
        font.Color := clMedGray;
      end;
      Canvas.FillRect(Rect);
    end;
    grdCompany.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TfmServiceCompany.grdCompanyGroupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 46) and (ssCtrl in Shift) then
  begin
    showmessage('Удаление данной позиции запрещено');
    abort;
  end;
  if (Key = 13) and (odsCompanyGroup.State in [dsEdit, dsInsert]) then
    odsCompanyGroup.Post;

  if (Key = 107) and (ssCtrl in Shift) then
    odsCompanyGroup.Insert;
end;

// --------------------------- GRID COMPANY ------------------------------------------------
procedure TfmServiceCompany.grdCompanyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 107) and (ssCtrl in Shift) then
    odsCompany.Insert;

  if (Key = 46) and (ssCtrl in Shift) then
  begin
    showmessage('Удаление данной позиции запрещено');
    abort;
  end;
  if (Key = 13) and (odsCompany.State in [dsInsert, dsEdit]) then
  begin
    odsCompany.Post;
  end;
end;

procedure TfmServiceCompany.grdCompanySellerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 107) and (ssCtrl in Shift) then
    odsCompanySeller.Insert;
  if (Key = 46) and (ssCtrl in Shift) then
  begin
    showmessage('Удаление данной позиции запрещено');
    abort;
  end;
  if (Key = 13) and (odsCompanySeller.State in [dsInsert, dsEdit]) then
  begin
    odsCompanySeller.Post;
  end;
end;

procedure TfmServiceCompany.N1Click(Sender: TObject);
begin
  odsCompany.Insert;
end;

procedure TfmServiceCompany.N2Click(Sender: TObject);
begin
  odsCompanyGroup.Insert;
end;

procedure TfmServiceCompany.N3Click(Sender: TObject);
begin
  odsCompanySeller.Insert;
end;

procedure TfmServiceCompany.nHistoryClick(Sender: TObject);
begin
    fmServiceCompanyHistory.Show;
end;

procedure TfmServiceCompany.nNoActualClick(Sender: TObject);
begin
  odsCompany.Edit;
  odsCompanyNO_ACTUAL_DATE.AsDateTime := DATE;
  nNoActual.Checked := true;
  if nNoActual.Checked then
    nNoActual.Checked := false;
  odsCompany.Refresh;
end;

// ---------------------------- DATA SET COMPANY ----------------------------------------
procedure TfmServiceCompany.odsCompanyAfterPost(DataSet: TDataSet);
begin
  odsCompany.RefreshRecord;    //переделать рефреш (не рефрешиться при инсерте)
  grdCompany.SetFocus;
end;

procedure TfmServiceCompany.odsCompanyAfterScroll(DataSet: TDataSet);
begin

  if (odsCompanyID_TAB_TYPE.Value = 3) or (odsCompanyID_TAB_TYPE.Value = 6) then
    grdCompanyGroup.Columns[3].TextEditing := true
  else
    grdCompanyGroup.Columns[3].TextEditing := false;

 { if odsCompanyNO_ACTUAL_DATE.asstring = 'Работает' then
  begin
    odsCompany.ReadOnly := false;
    // ДИМА ИЗ ПРОШЛОГО ГООВОРИТ:" odsCompany.ReadOnly := false - ЗНАЧИТ МОЖНО РЕДАКТИРВАТЬ". ЗАПОМНИ УЖЕ АУТИСТ!
    nNoActual.Visible := true;
  end
  else
  begin
    odsCompany.ReadOnly := true;
    nNoActual.Visible := false;
  end; }

  if odsCompanyID_MAIN_COMPANY.IsNull then
  begin
    odsCompanyGroupLookup.SetVariable('VAR_ID_TAB_COMPANY',
      odsCompanyID_COMPANY.Value);
    odsCompanySeller.SetVariable('VAR_ID_TAB_COMPANY',
      odsCompanyID_COMPANY.Value);
  end
  else
  begin
    odsCompanyGroupLookup.SetVariable('VAR_ID_TAB_COMPANY',
      odsCompanyID_MAIN_COMPANY.Value);
    odsCompanySeller.SetVariable('VAR_ID_TAB_COMPANY',
      odsCompanyID_MAIN_COMPANY.Value);
  end;
  odsCompanyGroup.SetVariable('VAR_ID_TAB_COMPANY', odsCompanyID_COMPANY.Value);
  odsCompanyGroupLookup.Refresh;
  odsCompanySeller.Refresh;
  odsCompanyGroup.Refresh;
  grdCompany.SetFocus;
end;

procedure TfmServiceCompany.odsCompanyBeforePost(DataSet: TDataSet);
begin
  case odsCompany.State of
    dsEdit:
      if MessageDlg('Записать изменения ?', mtConfirmation, [mbOK, mbCancel], 0)
        <> mrOK then
        odsCompany.Cancel;

    dsInsert:
      if MessageDlg('Добавить позицию ?', mtConfirmation, [mbOK, mbCancel], 0)
        <> mrOK then
        odsCompany.Cancel;
  end;
end;

// ----------------------- DATA SET COMPANY GROUP -------------------------------
procedure TfmServiceCompany.odsCompanyGroupAfterDelete(DataSet: TDataSet);
begin
  odsCompanyGroupLookup.Refresh;
end;

procedure TfmServiceCompany.odsCompanyGroupAfterPost(DataSet: TDataSet);
begin
  odsCompanyGroup.RefreshRecord;
  odsCompanyGroupLookup.Refresh;
  grdCompanyGroup.SetFocus;
end;

procedure TfmServiceCompany.odsCompanyGroupBeforeInsert(DataSet: TDataSet);
begin
  if odsCompanyGroupLookupMAIN_NAME.IsNull then
    abort;

  if odsCompanyID_COMPANY.IsNull then
  begin
    showmessage('Подтвердите ваши действия(ENTER) или нажмите ESC');
    grdCompany.Fields[grdCompany.FieldColumns['NAME_COMPANY'].Index]
      .FocusControl;
    abort;
  end;
end;

procedure TfmServiceCompany.odsCompanyGroupBeforePost(DataSet: TDataSet);
begin
  case dsCompanyGroup.State of
    dsEdit:
      if MessageDlg('Записать изменения ?', mtConfirmation, [mbOK, mbCancel], 0)
        <> mrOK then
        odsCompanyGroup.Cancel;
    dsInsert:
      if MessageDlg('Добавить позицию ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOK
      then
      begin
        odsCompanyGroupID_TAB_COMPANY.Value := odsCompanyID_COMPANY.Value;
      end
      else
        odsCompanyGroup.Cancel;
  end;
end;

procedure TfmServiceCompany.odsCompanyGroupLookupAfterScroll(DataSet: TDataSet);
begin
  if (odsCompanyID_TAB_TYPE.Value = 3) or (odsCompanyID_TAB_TYPE.Value = 6) then
    odsCompanyGroupSTIMUL.Value := odsCompanyGroupLookupSTIMUL_DEF.Value
  else
    odsCompanyGroupSTIMUL.Value := 0;
end;

procedure TfmServiceCompany.odsCompanyGroupMAIN_NAMEChange(Sender: TField);
begin
  if odsCompanyGroup.State = dsEdit then
    odsCompanyGroup.Post;
end;

procedure TfmServiceCompany.odsCompanyGroupPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  DM.prcPostError(DataSet, E, Action);
end;

procedure TfmServiceCompany.odsCompanyGroupPRICEChange(Sender: TField);
begin
  if odsCompanyGroup.State = dsEdit then
    odsCompanyGroup.Post;
end;

procedure TfmServiceCompany.odsCompanyGroupSTIMUL_TYPEChange(Sender: TField);
begin
  if dsCompanyGroup.State = dsEdit then
    odsCompanyGroup.Post;
end;

procedure TfmServiceCompany.odsCompanyNAME_TYPEChange(Sender: TField);
begin
  if dsCompany.State = dsEdit then
    odsCompany.Post;
end;

procedure TfmServiceCompany.odsCompanyNAME_USERChange(Sender: TField);
begin
  if odsCompany.State = dsEdit then
    odsCompany.Post;
end;

procedure TfmServiceCompany.odsCompanyPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  DM.prcPostError(DataSet, E, Action);
end;

procedure TfmServiceCompany.odsCompanySellerAfterPost(DataSet: TDataSet);
begin
  odsCompanySeller.RefreshRecord;
end;

procedure TfmServiceCompany.odsCompanySellerBeforeInsert(DataSet: TDataSet);
begin
  if odsCompanyID_COMPANY.IsNull then
  begin
    showmessage('Подтвердите ваши действия(ENTER) или нажмите ESC');
    grdCompany.Fields[grdCompany.FieldColumns['NAME_COMPANY'].Index]
      .FocusControl;
    abort;
  end;
end;

procedure TfmServiceCompany.odsCompanySellerBeforePost(DataSet: TDataSet);
begin
  case dsCompanySeller.State of
    dsEdit:
      if MessageDlg('Записать изменения ?', mtConfirmation, [mbOK, mbCancel], 0)
        <> mrOK then
        odsCompanySeller.Cancel;
    dsInsert:
      if MessageDlg('Добавить позицию ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOK
      then
      begin
        odsCompanySellerID_TAB_COMPANY.Value := odsCompanyID_COMPANY.Value;
      end
      else
        odsCompanySeller.Cancel;
  end;
end;

procedure TfmServiceCompany.odsCompanySellerPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  DM.prcPostError(DataSet, E, Action);
end;

end.
