Library JclUsesExpertDLL;
{
-----------------------------------------------------------------------------
     DO NOT EDIT THIS FILE, IT IS GENERATED BY THE PACKAGE GENERATOR
            ALWAYS EDIT THE RELATED XML FILE (JclUsesExpertDLL-L.xml)

     Last generated: 14-03-2009  14:35:13 UTC
-----------------------------------------------------------------------------
}

{$R *.res}
{$ALIGN 8}
{$ASSERTIONS ON}
{$BOOLEVAL OFF}
{$DEBUGINFO OFF}
{$EXTENDEDSYNTAX ON}
{$IMPORTEDDATA ON}
{$IOCHECKS ON}
{$LOCALSYMBOLS ON}
{$LONGSTRINGS ON}
{$OPENSTRINGS ON}
{$OPTIMIZATION ON}
{$OVERFLOWCHECKS OFF}
{$RANGECHECKS OFF}
{$REFERENCEINFO ON}
{$SAFEDIVIDE OFF}
{$STACKFRAMES OFF}
{$TYPEDADDRESS OFF}
{$VARSTRINGCHECKS ON}
{$WRITEABLECONST OFF}
{$MINENUMSIZE 1}
{$IMAGEBASE $580C0000}
{$DESCRIPTION 'JCL Uses Wizard'}
{$LIBSUFFIX 'D60'}
{$IMPLICITBUILD OFF}

{$DEFINE RELEASE}

uses
  ToolsAPI,
  JCLUsesWizard in '..\..\experts\useswizard\JCLUsesWizard.pas' ,
  JCLOptionsFrame in '..\..\experts\useswizard\JCLOptionsFrame.pas' {FrameJclOptions: TFrame},
  JclUsesDialog in '..\..\experts\useswizard\JclUsesDialog.pas' {FormUsesConfirm},
  JclParseUses in '..\..\experts\useswizard\JclParseUses.pas' 
  ;

exports
  JCLWizardInit name WizardEntryPoint;

end.
