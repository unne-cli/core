; =========================================
; Unne — Inno Setup Script
; Builds a Windows installer (.exe)
; =========================================
; Usage:
;   1. Build binaries: scripts/build.ps1
;   2. Place unne-windows-amd64.exe and unns-windows-amd64.exe in dist/
;   3. Compile this .iss with Inno Setup Compiler
; =========================================

#define MyAppName "Unne"
#define MyAppVersion "2.0.0"
#define MyAppPublisher "Unne"
#define MyAppURL "https://github.com/unne-cli/core"

[Setup]
AppId={{B5E2F8A1-7C3D-4E9A-B6F1-2A8D5C7E9F3B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=installer-output
OutputBaseFilename=unne-setup-{#MyAppVersion}
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
ChangesEnvironment=yes
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Types]
Name: "full"; Description: "Full installation (CLI + Server)"
Name: "cli"; Description: "CLI only"
Name: "server"; Description: "Server only"
Name: "custom"; Description: "Custom"; Flags: iscustom

[Components]
Name: "cli"; Description: "Unne CLI (unne.exe)"; Types: full cli custom; Flags: fixed
Name: "server"; Description: "Unne Server (unns.exe)"; Types: full server custom

[Files]
; CLI binary — adjust source path to where your built binaries are
Source: "..\dist\unne-windows-amd64.exe"; DestDir: "{app}"; DestName: "unne.exe"; Components: cli; Flags: ignoreversion
; Server binary
Source: "..\server-dist\unns-windows-amd64.exe"; DestDir: "{app}"; DestName: "unns.exe"; Components: server; Flags: ignoreversion

[Icons]
Name: "{group}\Unne CLI"; Filename: "cmd.exe"; Parameters: "/k ""{app}\unne.exe"" help"; Components: cli
Name: "{group}\Unne Server Setup"; Filename: "cmd.exe"; Parameters: "/k ""{app}\unns.exe"" setup"; Components: server
Name: "{group}\Uninstall Unne"; Filename: "{uninstallexe}"

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}"; \
    Check: NeedsAddPath('{app}')

[Code]
function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKLM,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end;

[Run]
Filename: "{app}\unne.exe"; Parameters: "version"; \
    Description: "Verify CLI installation"; Flags: postinstall nowait skipifsilent runhidden; Components: cli
Filename: "{app}\unns.exe"; Parameters: "setup"; \
    Description: "Run server setup"; Flags: postinstall nowait skipifsilent; Components: server
