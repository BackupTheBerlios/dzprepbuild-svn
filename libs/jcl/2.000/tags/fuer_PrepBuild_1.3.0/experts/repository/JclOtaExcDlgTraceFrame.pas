{**************************************************************************************************}
{                                                                                                  }
{ Project JEDI Code Library (JCL)                                                                  }
{                                                                                                  }
{ The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); }
{ you may not use this file except in compliance with the License. You may obtain a copy of the    }
{ License at http://www.mozilla.org/MPL/                                                           }
{                                                                                                  }
{ Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF   }
{ ANY KIND, either express or implied. See the License for the specific language governing rights  }
{ and limitations under the License.                                                               }
{                                                                                                  }
{ The Original Code is JclOtaExcDlgTraceFrame.pas.                                                 }
{                                                                                                  }
{ The Initial Developer of the Original Code is Florent Ouchet                                     }
{         <outchy att users dott sourceforge dott net>                                             }
{ Portions created by Florent Ouchet are Copyright (C) of Florent Ouchet. All rights reserved.     }
{                                                                                                  }
{ Contributors:                                                                                    }
{                                                                                                  }
{**************************************************************************************************}
{                                                                                                  }
{ Last modified: $Date:: 2009-07-30 13:23:44 +0200 (jeu., 30 juil. 2009)                         $ }
{ Revision:      $Rev:: 122                                                                      $ }
{ Author:        $Author:: outch                                                                 $ }
{                                                                                                  }
{**************************************************************************************************}

unit JclOtaExcDlgTraceFrame;

interface

{$I jcl.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JclDebug,
  {$IFDEF UNITVERSIONING}
  JclUnitVersioning,
  {$ENDIF UNITVERSIONING}
  JclOtaExcDlgRepository, JclOtaWizardFrame;

type
  TJclOtaExcDlgTracePage = class(TJclWizardFrame)
    CheckBoxRawData: TCheckBox;
    CheckBoxModuleName: TCheckBox;
    CheckBoxCodeDetails: TCheckBox;
    CheckBoxVirtualAddress: TCheckBox;
    CheckBoxModuleOffset: TCheckBox;
    MemoStack: TMemo;
    LabelPreview: TLabel;
    CheckBoxStackList: TCheckBox;
    procedure CheckBoxClick(Sender: TObject);
    procedure CheckBoxStackListClick(Sender: TObject);
  private
    FParams: TJclOtaExcDlgParams;
    procedure UpdatePreview;
    procedure UpdateCheckBoxes;
  public
    constructor Create(AOwner: TComponent; AParams: TJclOtaExcDlgParams); reintroduce;

    procedure PageActivated(Direction: TJclWizardDirection); override;
    procedure PageDesactivated(Direction: TJclWizardDirection); override;

    property Params: TJclOtaExcDlgParams read FParams write FParams;
  end;

{$IFDEF UNITVERSIONING}
const
  UnitVersioning: TUnitVersionInfo = (
    RCSfile: '$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/trunk/jcl/experts/repository/JclOtaExcDlgTraceFrame.pas $';
    Revision: '$Revision: 122 $';
    Date: '$Date: 2009-07-30 13:23:44 +0200 (jeu., 30 juil. 2009) $';
    LogPath: 'JCL\experts\repository';
    Extra: '';
    Data: nil
    );
{$ENDIF UNITVERSIONING}

implementation

{$R *.dfm}

uses
  JclOtaResources;

//=== { TJclOtaExcDlgTracePage } =============================================

procedure TJclOtaExcDlgTracePage.CheckBoxClick(Sender: TObject);
begin
  UpdatePreview;
end;

procedure TJclOtaExcDlgTracePage.CheckBoxStackListClick(Sender: TObject);
begin
  UpdateCheckBoxes;
end;

constructor TJclOtaExcDlgTracePage.Create(AOwner: TComponent;
  AParams: TJclOtaExcDlgParams);
begin
  FParams := AParams;
  inherited Create(AOwner);

  Caption := RsExcDlgTraceOptions;
  CheckBoxStackList.Caption := RsStackList;
  CheckBoxRawData.Caption := RsRawData;
  CheckBoxModuleName.Caption := RsModuleName;
//  CheckBoxAddressOffset.Caption := RsAddressOffset;
  CheckBoxCodeDetails.Caption := RsCodeDetails;
  CheckBoxVirtualAddress.Caption := RsVirtualAddress;
  CheckBoxModuleOffset.Caption := RsModuleOffset;
  LabelPreview.Caption := RsPreview;
end;

procedure TJclOtaExcDlgTracePage.PageActivated(Direction: TJclWizardDirection);
begin
  inherited PageActivated(Direction);

  CheckBoxStackList.Checked := Params.StackList;
  CheckBoxRawData.Checked := Params.RawData;
  CheckBoxModuleName.Checked := Params.ModuleName;
//  CheckBoxAddressOffset.Checked := Params.AddressOffset;
  CheckBoxCodeDetails.Checked := Params.CodeDetails;
  CheckBoxVirtualAddress.Checked := Params.VirtualAddress;
  CheckBoxModuleOffset.Checked := Params.ModuleOffset;

  UpdateCheckBoxes;
end;

procedure TJclOtaExcDlgTracePage.PageDesactivated(
  Direction: TJclWizardDirection);
begin
  inherited PageDesactivated(Direction);

  Params.StackList := CheckBoxStackList.Checked;
  Params.RawData := CheckBoxRawData.Checked;
  Params.ModuleName := CheckBoxModuleName.Checked;
//  Params.AddressOffset := CheckBoxAddressOffset.Checked;
  Params.CodeDetails := CheckBoxCodeDetails.Checked;
  Params.VirtualAddress := CheckBoxVirtualAddress.Checked;
  Params.ModuleOffset := CheckBoxModuleOffset.Checked;
end;

procedure TJclOtaExcDlgTracePage.UpdateCheckBoxes;
var
  AEnabled: Boolean;
begin
  AEnabled := CheckBoxStackList.Enabled;

  CheckBoxRawData.Enabled := AEnabled;
  CheckBoxModuleName.Enabled := AEnabled;
  CheckBoxCodeDetails.Enabled := AEnabled;
  CheckBoxVirtualAddress.Enabled := AEnabled;
  CheckBoxModuleOffset.Enabled := AEnabled;
end;

procedure TJclOtaExcDlgTracePage.UpdatePreview;
var
  AStack: TJclStackInfoList;
begin
  MemoStack.Lines.Clear;
  
  AStack := TJclStackInfoList.Create(CheckBoxRawData.Checked, 0, nil, False);
  try
    AStack.AddToStrings(MemoStack.Lines, CheckBoxModuleName.Checked,
      CheckBoxModuleOffset.Checked, CheckBoxCodeDetails.Checked, CheckBoxVirtualAddress.Checked);
  finally
    AStack.Free;
  end;
end;

{$IFDEF UNITVERSIONING}
initialization
  RegisterUnitVersion(HInstance, UnitVersioning);

finalization
  UnregisterUnitVersion(HInstance);
{$ENDIF UNITVERSIONING}

end.
