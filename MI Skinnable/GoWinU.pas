//////////////////////////////////////////////////////////////////////
//
//  Program      : Multi Install Skinnable (Go.exe)
//  Version      : 2.4.5
//
//  Created      : 1999-11-01
//  Last updated : 2007-05-12
//
//  Author       : Nikolaj Lynge Olsson (admin@nikse.dk)
//
//  Description
//  -----------
//  Multi Install Skinnable (Go.exe) is an installer for
//  Win9x/WinNT/WinME/Win2000/WinXP.
//  It lists information about compressed files and can install
//  to a chosen drive and path. It can also create shortcuts etc.
//
//  The following compression types are supported: Zip, RAR2+3, ACE1+2.
//  Self extracting .exe files can also be used.
//
//  The information about compressed archieves is read from an XML file or
//  an encrypted file.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.4.5 - 5th december 2007 - changes
//
//  Updated: WMV movie clips are now allowed.
//  Updated: Disc not ready now avoids xp/vista messagebox - only MI
//           messagebox.
//  Changed: Media playing code changed to some units from
//           "Lord Dr. Sagura II von Orechov" (MP.PAS etc).
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.4.4 - 8th April 2006 - changes
//
//  New: "Screenshot show full size in new window on click" option added.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.4.3 - 26th February 2006 - changes
//
//  Bugfix: Sometimes screenshots disappeared after a click on the 'More'.
//          button.
//  Bugfix: Password input box now works correctly with the 'Enter' key.
//  Bugfix: Sometimes duration i seconds was missing for music trac title.
//  Minor bugfix: Music play random now allows a music-play-first-file.
//  Improved: GetID3v1ArtistTitle now removes '.mp3' if it is the last
//            of a string (stupid - but seen several times).
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.4.2 - 4th February 2006 - changes
//
//  Bugfix: Added a missing Free of ZipMaster so Go.exe does not leave
//          dll in temp folder.
//  Changed: When running with multicd.*/multidvd.* the music folder
//           will be copied to the temp folder (for multiple dics).
//  Changed: Password input box now displays stars (*) instead characters.
//  Upgraded: Zip component upgraded to ZM179Setup0203.exe (4th feb 2006).
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.4.1 - 19th January 2006 - changes
//
//  Script bugfix: A few details fixed in CopyArchive file.
//                 {destdir} will now work without first unpacking.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.4 - 25th December 2005 - changes
//
//  Bugfix: Quickinfo fields are now allways displayed properly (and not
//          wrong left position).
//  Skin settings are now loaded from seperate xml (also new format).
//  Skin file can now be a seperate zip file.
//  ChkFile timer now started on FormActivate (not at startup). This seems to
//  prevent runtime error on rare occations (when closing Go.exe fast).
//  It's now possible to change skin at runtime.
//  Allow Copy To Clipboard option added.
//  Show treeview lines option removed (not very usefull).
//  Treeview: Sort by "title" added to popup menu.
//  Music Play: play random file added.
//  Music play dll now included into Go.exe (simpler for user).
//  Components upgraded to:
//  - Bass 2.2.
//  - Virtual Treeview 4.4.2
//  - VirtualShellTools Version 1.4.0
//  - Delphi zip 1.79 - zip dll (now one instead of two) is included
//                      as ressource. Dll now fully re-entrant.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.3.1 - 20th August 2005 - changes
//
//  Minor bugfix: Install hint is now shown.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.3 - 30th July 2005 - changes
//
//  A simple scroller added.
//  Description/notes can now have script in text via:
//     <script name="title">my-script</script>
//  Description/notes/msgbox does now have simplified support for these
//  html tags: <h1>, <h2>, <hr/>, <b>, <u>, <i>
//  Description/notes/msgbox does now have image support for these
//  smilies: :), :-), :(, :-(, :D, :-D, :o, :-O, :|, :-|.
//  Script is now EscapeDecoded when read from xml file.
//  Bugfix: Nfo viewer font size... must now be 6 again... strange.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.2.5 - 12th May 2005 - changes
//
//  'Play filename' script command now have a 'flags: "Fullscreen"'.
//  Screenshot images are now correct size when not using stretch.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.2.4 - 22nd February 2005 - changes
//
//  Bugfix: Using MultiCD / MultiDVD now works again (have a file or volume
//   label called MultiCD.* or MultiDVD.*). Thx Blade.
//  Components upgraded:
//   - Bass 2.1 (21st January 2005)
//   - Virtual Treeview 4.3.1
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.2.3 - 6th February 2005 - changes
//
//  Updated version number... + removed a few Application.ProcessMessages.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.2.2 - 26th January 2005 - changes
//
//  EX functions for RAR processing is now used, which allows for file sizes
//  larger than 4,2 GB to be displayed correctly.
//  Components upgraded:
//   - Bass 2.1
//   - Virtual Treeview 4.3.0
//   - Virtual Shell Tools 1.2.0
//   - RarEx function is now used in order to get large file sizes.
//  Scaling via PixelsPerInch disabled... perhaps delphi code has changed???
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.2.1 - 14th December 2004 - changes
//
//  Bugfix: Can now move main form again...
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.2 - 13th December 2004 - changes
//
//  Layout (xml/dat) can now be included as a resource into the Go.exe file.
//  Optional MainAni.gif added for animation on Main form.
//  Skin buttons can now use animated gifs for MouseOver. Also, Skin
//  buttons do now use the TSkinButton type.
//  Horizontal autoscroll in treeview now disabled via
//  toDisableAutoscrollOnFocus in VSTree.TreeOptions.AutoOptions.
//  Unzdll.dll now included (in Go.exe).
//  Music title will now scroll if too wide to fit (like winamp).
//  Misc. optimizations (const keyword for not-modified parameters).
//  Bugfix: Music sub folders works if folder is readonly/hidden.
//  Treeview text color is now customizable.
//  Treeview show/hide tree lines option added.
//  ZipMaster upgraded to version 1.78, which means that zip unpacking
//  of files larger than 2.1 GB (up to 4 GB) now works. Dlls are also smaller.
//  Improved: Video player component changed (WMP 6.4 ActiveX control).
//  New: Title font size (other than main) can now be customized.
//  Minor bug: Pressing Esc in MsgBox did sometimes not close MsgBox.
//  Script variable {pwd} added. {pwd} = current archive password .
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.1.7 - 13th June 2004 - changes
//
//  Bugfix: Create shortcut on desktop - is now only done if 'Create
//          icon on desktop' is checked.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.1.6 - 10th June 2004 - changes
//
//  Bass.dll, unrar.dll, and unacev2.dll will be taken from resouce file
//  if available - so the 3 dll files will not be visible to the user.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.1.5 - 30th April 2004
//
//  Bugfix: Sometimes error occured on exit - fixed now.
//  Bugfix: Install/search window shortcuts gone - back again.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.1.4 - 28th April 2004
//
//  New: Install window explorer-treeview is now transparent.
//  New: Search window searchtext edit is now transparent.
//  Changed: Transparent booleans removed - now controls are always transparent.
//  Changed: Rar extraction can now be stopped in the middle of a single file
//           (good for large files).
//  Improved: Estimated time left is a bit more stable now.
//  New: Installation now display progress % in the taskbar.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.1.3 - 5th April 2004
//
//  Bugfix: Unpacking of files larger than 2.1 GB now works (use rar/ace).
//  Bugfix: {category}, {programname}, {archivefilenoext}, and {archivefile}
//          does now also works if not in the beginning of a string.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.1.2 - 31th March 2004
//
//  New: Installscript: Shortcuts can now have an external icon.
//  Improved: Install progress GB string now includes 1 decimal (like "1,2 GB").
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.1.1 - 12th March 2004
//
//  Bugfix: Startup script now works.
//  Bugfix/improvement: Music loop-single-file now also works for mods.
//  New: Button transparent color is now customizable.
//  New: PNG image support added.
//  New: Script Shortcuts: Can now also make 'folder shortcuts'
//  New: Script can now create registry keys (strings only).
//  Improved: XML Multi line improved: ReadMulti Line routine added to avoid
//            duplicate code.
//  Improved: Description/installation notes: Copy to clipboard now works
//            with both Ctrl+c and right-click-copy.
//  Improved: Latest version of UnRar included (Ex functions declared,
//            but not used).
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.0.4 - 28th November 2003
//
//  Bugfix: Only first line of exitscript/startup script was read.
//  Upgraded soundsystem to BASS 2.0 from BASS 1.8a.
//  Now compiled with Delphi 7 (Delphi7 XPManifest instead of
//  ThemeManager).
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.0.3 - 19th September 2003
//
//  Go.exe/Setup.exe/MIEdit.exe: The script command "execute file" now has
//  the WorkingDir parameter built in. Also all files are default executed
//  in the folder the program was unpacked to.
//  Bugfix: Search window label color is now correct - again (tested too).
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.0.2 - 5th September 2003
//
//  Bugfix: Search window label color is now correct.
//  Bugfix: {pf} -> "start menu programs". Fixed to "Program Files" as
//          in version 1.x.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.0.1 - 18th August 2003
//
//  Bugfix: Search window background did not resize to match background
//          image. Fixed by setting
//          Autosize = True.
//  Bugfix: Changed state for main window buttons when showing
//          NFO window. Fixed.
//  Bugfix: When changing program in the treeview, button states were
//          remembered (e.g. 'install' btn down). Fixed.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 2.0 - 12th July 2003
//
//  Set current path to same dir as this executable at startup.
//  <PASSWORDERR>  and <EMPTYFILEERR> removed as they were not used.
//  Exit button removed.
//  RAR archives with 'encrypt file names' can now be opened if password
//  is entered before choosing archive. Error message improved if archive
//  with 'encrypt file names' are opened without password.
//  Pic 1, 2, 3 strings changed to StringList ScreenShots. Max # raised
//  from 3 to 2000000.
//  'Post Install Command' replaced by 'Post Install Script'. Current
//  possible actions are: Run, Copy, Delete, StatusText, ToClipboard,
//                        Shortcut, Uninstall, FinishText.
//  Install window can now be customized.
//  NFO window  can now be customized.
//  Gfx buttons added for Main form: Nfo, More, Install, Prev image,
//                                   Next image.
//  Gfx buttons added for Install form: Finish, Cancel.
//  Gfx buttons added for NFO form: OK (can also be used for close).
//  Install path: Variable {desktop} can now also be used.
//  Urlhighlighting now also works for 'www.' (as well as http:// and ftp://)
//  Install button is now user chosen. 'Install', 'Play', 'Run', and
//  'View' are the possible choices.
//  Does now support Alpha blended XP icons - when using WinXP or newer.
//  Quick Info fields (custom fields): Urls are now highlighted.
//  Center normal size on mouse over option added for screenshots.
//  Bugfix: All skin transparency was off a pixel to the right (fixed).
//  Url jumps should now also start MS IE on winNT/Win98.
//  Bugfix: Custom font. Could hang on load. Fixed.
//  Search for program added. Also a 'titles only' option.
//  Bass.dll (music) upgraded to latest version 1.8a.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.4.2a - 3rd November 2002
//
//  Removed: Install path can also translate {desktop} and {mypics} to the
//           windows defined path.
//           This did not work with Win9x :(
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.4.2 - 1st November 2002
//
//  Bass upgraded to version 1.7.
//  Treview upgraded to version 3.4.13 (no changes neccesary).
//  Delphi Zip updraded to 1.7.1.0 (no changes neccesary).
//  MIRichView updated - does now support mouse wheel scroll.
//  Bugfix: in MakeTransparent8bit. Sometimes 256 color images have
//          the same color twice... strange. Photoshop 6 does it on
//          occation.
//  Install window upgraded to xp look - finally the old win 3.x look
//  is gone!
//  Bugfix: NFO screen allways called MakeTransparent - even though
//          no transparent color available (resulted in runtime error).
//  Install path can also translate {desktop} and {mypics} to the
//  windows defined path.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.4.1 - 1st June 2002
//
//  Bugfix: Error when exiting with bass.dll present and no music
//          files/music directory.
//  Bugfix: Running from cd with multicd.* file.
//  Bugfix: Now ignores uninst.xml.
//  Bugfix: FileToTemp routine now also overwrites files if they are
//          Readonly.
//  Bugfix: RAR password now correctly passed to unrar.dll.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.4 - 10th March 2002 - changes
//
//  Added optional transparent treeview using Mike Lische's
//  Virtual Treeview!!!
//  Treeview can now handle sub categories.
//  Added option to make msg/quick info window transparent.
//  Title and Handle are now anti-aliased.
//  Title and Handle can now have an anti-aliased shadow.
//  Uninstall that delete installed files and folders (works with
//  both .rar, .zip, and .ace).
//  Optimized description/notes code a lot! Much faster now and do use
//  less memory. Now use a single string instead of an array of lines.
//  Added a few shortcut keys (Install form: Esc/Enter,
//  Msgbox form: Esc, NFO form: Esc).
//  MAX_PATH constant now used instead of 255.
//  Variables of string types are now all of the type 'string' (not
//  fixed length like string[27]).
//  Archives can now also be http:<something> or ftp:<something>.
//  Can now decrypt very large layouts (10 MB+).
//  Close/Minimize images with 3 status: Normal, Mouse over, Mouse down.
//  Misc. language bugs fixed.
//  New option to empty the temp folder on exit added.
//  Treeview Url/Hottrack Color added.
//  TRichview now used to create transparent text boxes for "Description"
//  and "Installation notes" in main window, NFO, and MsgBox. Cool!
//  Now using BASS for mp3 playing: http://www.un4seen.co.uk/music
//  Music files supported: Mp3, wav, Ogg-Vorbis, mod, xm, it, mo3, s3m,
//  and mtm!
//  Support for the new RAR 3.x files added.
//  NFO font can now be customized.
//  Music folder name can now be customized.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.3.3 - 24th October 2001 - changes
//
//  Bugfix: Execute file via the 'command' field now works more than 3
//          times (bug introduced in version 1.3.0).
//  Bugfix: MakeTransparent now also works if skin does not fit exactly.
//  Bugfix: Ace readonly files are now overwridden.
//  Bugfix: Pic 1, 2 and 3 buttons are no longer 'flashed' (shown) at
//          startup.
//  Bugfix: Unrar code now correctly converts 0-terminated string to
//          pascal string via StrPas().
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.3.2 - 7th July 2001 - changes
//
//  Font charset added.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.3.1 - 7th June 2001 - changes
//
//  Pic1, pic2, and pic3 length raised from 43 to 90.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.3 - 9th May 2001 - changes
//
//  Scrollbars on main form are now hidden if not needed.
//  Removed option to resize non custom shaped windows as it did not
//  work very well.
//  Mp3 loop option added, Mp3 startup file added.
//  Bugfix: "Install Path" now can handle environment variables from
//  the windows special folders. E.g. {pf} = %ProgramFiles% is
//  now translated via the environment vairable (as it should be).
//  Mp3: Click on mp3 song now also works when compiled with Delphi 5.
//  UnAce 1.x code replaced by UnAce2 code! Can now handle overwriting.
//  New: Different languages can now be used!
//  Bugfix in UrlHighLight: When an url was the last string in a text
//  it sometimes left the blue link color. Fixed by appending a ' '.
//  Can now load a non standard font - both from ttf file or resource
//  file.
//  Loading time minimized when loading 8 or 24 bit color skins!
//  Command field: Files executed in a subfolder (e.g. setup\setup.bat)
//  are now executed with working directory as the subfolder.
//  Mp3 looping now also works if only one mp3 file is included.
//  Max number of programs/categories is now only limited by memory!
//  Treeview can now show icons for all programs and categories.
//  Bugfix: Url clicks now work in "Installation notes".
//  Bugfix: "ExecuteFile" could max handle 80 characters long path
//  name - can now handle up to 256 characters.
//  The 'Picture n' buttons now change text to 'Movie n' if a movie file
//  is behind the button.
//  Serial is now also pasted into clipboard when installing .exe files
//  (no longer only .zip, .rar, and .ace files).
//  Bugfix: Changing mp3 files while extracting (ace) files no longer
//  stops the extracting (SetCurrentDir removed from mp3 routine).
//  Resource file added: Resource file should contain screen shots
//  (only bmp, gif, jpg), NFO files, font file, and skin (except splash). The
//  resouce file is a zip compressed file.
//  Unpack screen: Elapsed/estimated time is now right aligned
//  with the progress bars.
//  When looking for *.dat files at startup Go.exe will now
//  ignore all files starting with 'unins' (e.g. unins00.dat).
//  NFO screen added via the 'More' field.
//  Bugfix: Descr. and Inst. notes are now RightTrimmed instead
//  of Trimmed from both sides (from blanks).
//  Archive files with extensions other than zip, rar, or ace are
//  now executed in the path the exists in - this way a setup.exe
//  file with data files can be executed in it's own sub folder -
//  setup programs with more than one file require this.
//  Bugfix: {pf} in routine SetInstallPath now works in NT. Not longer
//  double backslashes (c:\\Program Files\x).
//  Bug fixed in SetInstallPath: {regkey=xxx:yyy} will now return
//  the correct drive letter (and not always 'C:').
//  Password for encrypted layouts can now be saved in windows registry
//  first time entered - and automatically retrieved later.
//  Loading time minimized due to optimization (initializing variables
//  in FormCreate).
//  StrMid function replaced be native "Copy".
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.2.2 - 27th September 2000 - changes
//
//  Bugfix: When installing 'exe' files an endless loop executing the
//  exe file was created. Fixed.
//  'More' button now changes text to 'NFO' and the file is showed in
//  notepad if the more file is a .nfo file.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.2.1 - 21th September 2000 - changes
//
//  Ups: Just removed the 'Beta' from the task bar name...
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.2 - 21th September 2000 - changes
//
//  Bug fix: Ace unpacking no longer stops mp3 play.
//  Do not load multiple copies of Go.exe.
//  Clean up from temp after windows restart.
//  If running on cd and a file called 'MultiCD.*' exists then
//  Go.exe and dlls are copied to the temp dir and executed from
//  there. This is to avoid win blue screen when changing discs.
//  Dll files are now loaded dynamically. This means that it is no
//  longer nessary to include all 3 unpack dlls - only include the
//  unpack dlls you use.
//  Bugfix: Can now also decrypt read-only files - it actually works now!
//  Bugfix: "Install path": {pf} now works on NT and a bug in the {win}
//                          routine fixed.
//  Bugfix: "Installation notes" only showed the first line. Fixed.
//  Bugfix: "StrLeft" routine rewritten due to unknonw error (in Delphi).
//  Pic 1, 2, and 3 can now show movie clips!
//  ArchiveDir is now variable (no longer limited to 'Data').
//  MoreDir is now variable (no longer limited to 'More').
//  Title/Handle can now handle the '&' character.
//  Urls in "Description" and "Installation Notes" are now
//  clickable hotspots!
//  Can now handle scrambled archive names with the
//  extension ".DAT" (as well as ".MI" for zip/rar/ace files).
//  New settings: Translucenty, Treeview hottrack, mp3 autostart and more.
//  Bugfix: Controls now adjust to displays using "Large fonts"!
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.1 - 7th of June 2000 - changes
//
//  "Tools -> MI Skinable properties" improved: Positions/sizes
//  of controls can now be configured. Also new: Control text color,
//  control background color, and... transparent color!
//  Screenshots can now be gif images.
//  The No Image picture can now be a "noimage.gif" file.
//  Bug fix: Hide Pic1, pic2, pic3, and more now works.
//  "Description" and "Installation Notes" now have
//  better control of line shift - tries to determine
//  if or if not to insert a line break after the current
//  line if it is wrapped.
//  Skins can now be in a folder called 'Skin'.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 1.0 - 19th of May 2000 - changes
//
//  Can now handle scrambled archive names with the
//  extension ".MI" (zip/rar/ace files).
//  Validation improved (wrong password, empty xml/dat file).
//  Install path:
//   - {pf}  = Program files
//   - {tmp} = Windows\Temp
//   - {sys} = Windows\System
//   - {win} = Windows
//   - {regkey=xxx:yyy} xxx = registry path, yyy = key name
//  Added option to resize to fit 1024x768..
//  Offline browsing. If no 'Data' folder it will
//  ask for user to insert disc. Searches cd/dvd drives.
//  Mp3 song looping.
//  Disable mp3 menu if no sound card (or mp3 player
//  failed for other reason).
//  Bugfix: Did not show 'Rating' - fixed.
//  Bugfixes: Misc. smaller bugs.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 0.97.2 - 21th March 2000 - changes
//
//  Small bug in decryption fixed.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 0.97.1 - 18th March 2000 - changes
//
//  Bug in Load/save fixed.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 0.97 - 12th March 2000 - changes
//
//  MP3 Play added.
//  Resizing of main screen to work with 640x480.
//  Unpacking zip, rar, and ace with password.
//  Decryption added to XML file (simple algorithm).
//
////////////////////////////////////////////////////////////////////////
//
//  Version 0.96 - 04th February 2000 - changes
//
//  24 new fields added! 11 globals and 13 program fields.
//  Window size changed.
//  Can now show JPG/BMP picture directly in the menu.
//  Splash screen added.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 0.95 - 25th January 2000 - changes
//
//  Bug fixed: Forgot to color to labels on frmInstall.
//  Bug fixed: cmd works (again).
//  Now show archive file as hint for the Install button.
//  If 'Uninst.exe' allready exists in the target directory then
//  create 'Uninst0.exe'. If 'Uninst0.exe' also exists then create
//  'Uninst1.exe' and so on...
//  A bit more flexible about font width.
//  Shortcut added to all buttons.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 0.94 - 06th January 2000 - changes
//
//  Bug fixed: Linebreak after Message1 added, Escape chars fixed
//  Copy Uninst.ex_ directly to Uninst.exe directly (no renaming)
//  Font color/name can now be controlled by XML file
//
////////////////////////////////////////////////////////////////////////
//
//  Version 0.93 - 27th December 1999 - changes
//
//  Escape characters accepted:
//   &lt; = <, &gt; = >, &amp; = &, &qout; = ", &apos; = '
//   Ascii codes > 122 can be read like this: &#123;
//
////////////////////////////////////////////////////////////////////////
//
//  Version 0.92 - 18th December 1999 - changes
//
//  The Install button is now disabled if no compressed file chosen.
//  Optimized code (exe file is now 20 kb smaller).
//
////////////////////////////////////////////////////////////////////////
//
//  Version 0.91 - 9th December 1999 - changes
//
//  XML file changed a bit so it more easyly can be applied to XSL.
//  XSL file added.
//  If install.xml is not found, then try to open another XML file. This
//  means that you can call the XML file anything you like as long it
//  has the extension 'xml'.
//  Install.exe can now take the XML file as a parameter.
//
////////////////////////////////////////////////////////////////////////
//
//  Version 0.9 - 1st November 1999
//
//  Initial version.
//
////////////////////////////////////////////////////////////////////////

unit GoWinU;

interface

{$IFDEF FPC}
{$Mode Delphi}
{$R *.lfm}
{$ELSE}
{$R *.DFM}
{$ENDIF}

uses
{$IFDEF FPC}
  LCLType, lresources, LCLIntf, Types, FileUtil,
{$ELSE}
  Windows, GraphicEX, ZipMstr, OleCtrls,
  JPEG, GifImage, ShellApi,
{$ENDIF}
  MediaInterface,
  Messages, SysUtils, Classes,
  Forms, Dialogs, StdCtrls, ExtCtrls,
  ImgList, Controls, Menus,
  VirtualTrees, richview,
  Registry, process,

  FileCtrl, Dynamic_Bass, clipbrd,
  osc_vis, spectrum_vis, CommonTypes, ExtDlgs,
  SkinButton, Graphics;

const
  rvsItalic = 6;
  rvsItalicUnderline = 7;
  rvsItalicBold = 8;
  rvsUnderline = 9;
  rvsUnderlineBold = 10;
  rvsBold = 11;
  rvsItalicUnderlineBold = 12;


type
  // Virtual String Tree data record
  VTreeData = record
    wsText: WideString;
    iIcon: integer;
    iIconEx: integer;
    iAbsoluteIndex: integer;
    bCategory: boolean;
    sCustomField1: string;
    sCustomField2: string;
    sCustomField3: string;
    sCustomField4: string;
    sCustomField5: string;
    sSize: string;
    sScript: string;
    sPgmName: string;
    slScreenShots: TStringList;
    sCDno: string;
    sArchivePwd: string;
    sGoButton: string;
    sDescr: string;
    sNote: string;
    sPath: string;
    sMore: string;
  end;
  PTreeData = ^VTreeData; // Pointer to VTreeData

  VTreeDataSorted = record
    RealNode: PVirtualNode;
  end;
  PTreeDataSorted = ^VTreeDataSorted; // Pointer to VTreeDataSorted

  TID3Tag = record
    ID: string[3]; // Byte 1-3 = ID 'TAG'
    Titel: string[30]; //  Byte 4-33 = Titel / Title
    Artist: string[30]; //  Byte 34-63 = Artist
    Album: string[30]; //  Byte 64-93 = Album
    Year: string[4]; //  Byte 94-97 = Jahr / Year
    Comment: string[30]; //  Byte 98-127 = Kommentar / Comment
    Genre: byte; // Byte 128 = Genre
  end;


  TLanguageMISkinable = record
    bActive: boolean; // save language record or not
    sInstall: string;
    sOK: string;
    sCancel: string;
    sNFO: string;
    sPlay: string;
    sView: string;
    sSearchTitle: string;
    sSearchTitlesOnly: string;
    sUnknownSize: string;
    sYes: string;
    sNo: string;
    sMusicTracks: string;
    sInstallOf1: string;
    sInstallOf2: string;
    sInsertDisc: string;

    sAddIcon: string;
    sAddIcons: string;
    sSpaceAvail: string;
    sSpaceReq: string;
    sFinish: string;
    sUnpacking1: string;
    sUnpacking2: string;
    sCopyTo1: string;
    sCopyTo2: string;
    sCopying1: string;
    sCopying2: string;
    sCurrentFile: string;
    sTotalProgress: string;
    sKB: string;
    sMB: string;
    sGB: string;
    sXOfY: string;
    sElapsed: string;
    sEstimated: string;
    sDiskFreeLow: string;
    sDoneMsg1: string;
    sDoneMsg2: string;
    sCopyDoneMsg1: string;
    sCopyDoneMsg2: string;
    sShortCuts1: string;
    sShortCuts2: string;
    sCancelPrompt: string;
    sCancelMsg: string;
    sInformation: string;
    sConfirmation: string;
    sWarning: string;
    sError: string;

    sSize: string;
    sCustom1: string;
    sCustom2: string;
    sCustom3: string;
    sCustom4: string;
    sCustom5: string;
    sDiscNo: string;
    sMore: string;

    // MI Uninstall
    sUninstTitle: string;
    sUninstSubtitle: string;
    sUninstInfo1: string;
    sUninstInfo2: string;
    sRemove: string;
    sRemoved1: string;
    sRemoved2: string;
    sUninstProgress: string;
    sUninstFiles: string;
    sUninstSC: string;
  end;

  PosAndSizesInst = record
    iTitleX: integer;
    iTitleY: integer;
    iEditPathX: integer;
    iEditPathY: integer;
    iEditPathWidth: integer;
    iEditPathHeight: integer;
    iExpTreeX: integer;
    iExpTreeY: integer;
    iExpTreeWidth: integer;
    iExpTreeHeight: integer;
    iDriveBoxX: integer;
    iDriveBoxY: integer;
    iDriveBoxWidth: integer;
    iDriveBoxHeight: integer;
    iSpaceAvailX: integer;
    iSpaceAvailY: integer;
    iSpaceReqX: integer;
    iSpaceReqY: integer;
    iAddIconX: integer;
    iAddIconY: integer;
    iFinishX: integer;
    iFinishY: integer;
    iCancelX: integer;
    iCancelY: integer;
  end;

  PosAndSizesUnpack = record
    TitleX: integer;
    TitleY: integer;
    Progressbar1TitleX: integer;
    Progressbar1TitleY: integer;
    Progressbar1X: integer;
    Progressbar1Y: integer;
    Progressbar1Width: integer;
    Progressbar1Height: integer;
    Progressbar1StatusX: integer;
    Progressbar1StatusY: integer;
    Progressbar2TitleX: integer;
    Progressbar2TitleY: integer;
    Progressbar2X: integer;
    Progressbar2Y: integer;
    Progressbar2Width: integer;
    Progressbar2Height: integer;
    Progressbar2StatusX: integer;
    Progressbar2StatusY: integer;
    TimeElapsedX: integer;
    TimeElapsedY: integer;
    TimeEstimatedX: integer;
    TimeEstimatedY: integer;
    CancelX: integer;
    CancelY: integer;
  end;

  PosAndSizesMsgBox = record
    TitleX: integer;
    TitleY: integer;
    TextboxX: integer;
    TextboxY: integer;
    TextboxWidth: integer;
    TextboxHeight: integer;
    OKX: integer;
    OKY: integer;
    OCOKX: integer;
    OCOKY: integer;
    OCCancelX: integer;
    OCCancelY: integer;
  end;

  PosAndSizesNfo = record
    iTextboxX: integer;
    iTextboxY: integer;
    iTextboxWidth: integer;
    iTextboxHeight: integer;
    iOKX: integer;
    iOKY: integer;
  end;

  PosAndSizesPlayer = record
    iTitleX: integer;
    iTitleY: integer;
    iTitleWidth: integer;
    iTitleHeight: integer;
    iSpectrumOscX: integer;
    iSpectrumOscY: integer;
    iSpectrumOscWidth: integer;
    iSpectrumOscHeight: integer;
    iOpenX: integer;
    iOpenY: integer;
    iRewX: integer;
    iRewY: integer;
    iStopX: integer;
    iStopY: integer;
    iPauseX: integer;
    iPauseY: integer;
    iPlayX: integer;
    iPlayY: integer;
    iForwardX: integer;
    iForwardY: integer;
  end;

  PosAndSizesSearch = record
    iTitleX        : integer;
    iTitleY        : integer;
    iSearchTextX    : integer;
    iSearchTextY   : integer;
    iSearchTextWidth    : integer;
    iSearchTextHeight   : integer;
    iSearchResultsX    : integer;
    iSearchResultsY   : integer;
    iSearchResultsWidth    : integer;
    iSearchResultsHeight   : integer;
    iTitlesOnlyX             : integer;
    iTitlesOnlyY             : integer;
    iSearchX             : integer;
    iSearchY             : integer;
    iDoneX             : integer;
    iDoneY             : integer;
  end;


  { TfrmMain }

  TfrmMain = class(TForm)
    ChkFile: TTimer;
    imgMain: TImage;
    lblTitle: TLabel;
    lblHandle: TLabel;
    imgPicture: TImage;
    imgEmpty: TImage;
    PopupMenu1: TPopupMenu;
    MusicTimer: TTimer;
    mnuExit: TMenuItem;
    N3: TMenuItem;
    mnuMinimize: TMenuItem;
    PopupMenuScreenshot: TPopupMenu;
    Process: TProcess;
    ScreenshotPLay: TMenuItem;
    ScreenshotPause: TMenuItem;
    ScreenshotStop: TMenuItem;
    n8: TMenuItem;
    LaunchMP: TMenuItem;
    ImageListIcons: TImageList;
    VSTree: TVirtualStringTree;
    lblMsgInfoBack: TLabel;
    lblQIText: TLabel;
    lblMessage: TLabel;
    imgMinimize: TImage;
    imgClose: TImage;
//    RVStyle: TRVStyle;
    RichViewDescr: TRichView;
    RichViewNote: TRichView;
    imgPrev: TImage;
    imgNext: TImage;
    imgInstall: TImage;
    imgMore: TImage;
    imgNFO: TImage;
    TimerRender: TTimer;
    pbMusicVis: TPaintBox;
    imgPlayer: TImage;
    imgPlayerOpen: TImage;
    imgPlayerRew: TImage;
    imgPlayerStop: TImage;
    imgPlayerPause: TImage;
    imgPlayerPlay: TImage;
    imgPlayerForward: TImage;
    pmMusicTracks: TPopupMenu;
    lblScreenshotCounter: TLabel;
    mirvQuickInfo: TRichView;
    imgPlay: TImage;
    imgRun: TImage;
    imgView: TImage;
//    mirvstyleQuickInfo: TRVStyle;
    PopupMenuDescr: TPopupMenu;
    mnuDescrSelectAll: TMenuItem;
    mnuDescrCopy: TMenuItem;
    PopupMenuNote: TPopupMenu;
    mnuNoteSelectAll: TMenuItem;
    mnuNoteCopy: TMenuItem;
    VSTreeSorted: TVirtualStringTree;
    PopupMenuTreeview: TPopupMenu;
    mnuTVSortBy: TMenuItem;
    mnuOrderByCategory: TMenuItem;
    mnuOrderBySize: TMenuItem;
    mnuOrderByCustom1: TMenuItem;
    mnuOrderByCustom2: TMenuItem;
    mnuOrderByCustom3: TMenuItem;
    mnuOrderByCustom4: TMenuItem;
    mnuOrderByCustom5: TMenuItem;
    mnuOrderByDiscNo: TMenuItem;
    N1: TMenuItem;
    mnuMinimize2: TMenuItem;
    N2: TMenuItem;
    mnuExit2: TMenuItem;
    imgSearch: TImage;
//    ZipMaster1: TZipFile;
    TimerMusicTitleScroller: TTimer;
    pbMusicTitle: TPaintBox;
    imgAniGif: TImage;
    imgScrollTemp: TImage;
    PaintBoxScroll: TPaintBox;
    ImageListSmilesLight: TImageList;
    ImageListSmilesDark: TImageList;
    N4: TMenuItem;
    mnuChooseSkin: TMenuItem;
    mnuOrderByTitle: TMenuItem;
    PanelMP1: TPanel;

    procedure SetFonts(const s: string; i: integer);
    function ReadMILine(var MIEof: boolean): string;
    function ReadMILineRT(var MIEof: boolean): string;
    procedure MakeTransparent(frm: TForm; img: TImage);
    procedure MakeTranslucency(hnd: HWND; trlu: byte);
    function WidthInPixels(dc: HDC; const str: string): integer;
    function UnpackFromResToTemp(const Filename: string): boolean;
    procedure UnpackBassDllFromResToTemp(const Filename: string);
    procedure LoadMusicLibrary(autostart: boolean;
      const firstfile: string);
    procedure UnloadMusicLibrary;
    procedure FCopy(const FileName, DestName: TFileName);
    function ExecuteFile(const Operation, FileName, Parameter, Directory: string;
                               AShow: word;
                               bWait: boolean): longint;
    function MakeDir(strDir: string): boolean;
    function ExistsSkinImage(const AName: string): boolean;
    procedure LoadSkinImageGif(var gif: TGifImage; const AName: string);
    procedure LoadSkinButton(var img: TImage; var sbtn: TSkinButton; const AName: string; AVisible: boolean);
    procedure LoadSkinImage(pic: TPicture; const AName: string; btm: boolean);
    procedure LoadIcons(icons: TStringList);
    procedure LoadFont;
    procedure SetDefaultTexts;
    procedure DrawAALabel(bmp: TBitmap;
                          lbl: TLabel;
                          const ShadowDir: string;
                          const ShadowColor: string;
                          ShadowLength: integer);
    procedure CreatePhysicalShortcut(const sShortcut: string;
                                     const sFilename: string;
                                     const sIconfile: string);
    procedure CheckScript(script: string);
    procedure CopyCurrentFile;
    procedure RunScript(script: string);
    function GetMultilineTag(     const ATag: string;
                                  s: string;
                              var fileend: Boolean): string;
    function UnpackResGoData(unpackfolder: string): string;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function MouseOverImage(var sbtn: TSkinButton; var imgToCheck: TImage; x, y: integer): boolean;
    procedure ChkFileTimer(Sender: TObject);
    function ConvertPath(const sPath: string): string;
    function ConvertPathPlusVar(sPath: string;
      var sInsertedPath: string): string;
    procedure SetInstallPath(path: string);
    procedure imgMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure ScaleDownToFit;
    procedure ShowPic(no: integer);
    procedure sbPrevClick(Sender: TObject);
    procedure sbNextClick(Sender: TObject);
    procedure DrawMusicTitle(const sMusicFilename: string; sMusicTitle: string);
    procedure MusicTrackClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MusicDoOpen;
    procedure SetMusicTrackRadioButton(item: TMenuItem; const MusicFilename: string);
    procedure PlayNextTrack;
    procedure PlayPreviousTrack;
    procedure MusicPlayRandom();
    procedure MusicTimerTimer(Sender: TObject);
    procedure mnuMusicPlayStopClick(Sender: TObject);
    procedure mnuMusicPlayStartClick(Sender: TObject);
    procedure mnuMusicPlayPauseClick(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuMinimizeClick(Sender: TObject);
    procedure ScreenshotPLayClick(Sender: TObject);
    procedure ScreenshotPauseClick(Sender: TObject);
    procedure ScreenshotStopClick(Sender: TObject);
    procedure LaunchMPClick(Sender: TObject);
    procedure PopupMenuScreenshotPopup(Sender: TObject);
    procedure UrlHighLight(var RichView: TRichView;
      const AText: string;
      var Urls: TStringList);
    procedure VSTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VSTreeDblClick(Sender: TObject);
    procedure VSTreeKeyPress(Sender: TObject; var Key: char);
    procedure imgMinimizeClick(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure imgMinimizeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgCloseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgMinimizeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgCloseMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure UrlJumpTo(const sUrl: string);
    procedure RichViewDescrJump(Sender: TObject; id: integer);
    procedure VSTreeGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: boolean; var ImageIndex: integer);
    procedure VSTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure VSTreePaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure RichViewNoteJump(Sender: TObject; id: integer);
    procedure FormClose(Sender: TObject; var AAction: TCloseAction);
    procedure VSTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure imgPrevMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgPrevMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgNextMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgNextMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgInstallClick(Sender: TObject);
    procedure imgInstallMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgInstallMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgMoreClick(Sender: TObject);
    procedure imgNFOMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgMoreMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgNFOMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgMoreMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure TimerRenderTimer(Sender: TObject);
    procedure imgPlayerOpenMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgPlayerOpenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgPlayerRewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgPlayerRewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgPlayerStopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgPlayerStopMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgPlayerPauseMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure imgPlayerPauseMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgPlayerPlayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgPlayerPlayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure imgPlayerForwardMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure imgPlayerForwardMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure imgPlayerOpenClick(Sender: TObject);
    procedure imgPlayerStopClick(Sender: TObject);
    procedure imgPlayerPauseClick(Sender: TObject);
    procedure imgPlayerPlayClick(Sender: TObject);
    procedure imgPlayerForwardClick(Sender: TObject);
    procedure imgPlayerRewClick(Sender: TObject);
    procedure ClearMusicVis;
    procedure mirvQuickInfoJump(Sender: TObject; id: integer);
    procedure pbMusicVisMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure mnuDescrSelectAllClick(Sender: TObject);
    procedure mnuDescrCopyClick(Sender: TObject);
    procedure PopupMenuDescrPopup(Sender: TObject);
    procedure PopupMenuNotePopup(Sender: TObject);
    procedure mnuNoteSelectAllClick(Sender: TObject);
    procedure mnuNoteCopyClick(Sender: TObject);
    procedure InitOrderBy(iSortOrder: integer);
    procedure mnuOrderBySizeClick(Sender: TObject);
    procedure mnuOrderByCategoryClick(Sender: TObject);
    procedure VSTreeSortedGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure VSTreeSortedGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: boolean; var ImageIndex: integer);
    procedure VSTreeSortedCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: integer);
    procedure VSTreeSortedPaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure mnuOrderByDiscNoClick(Sender: TObject);
    procedure mnuOrderByCustom1Click(Sender: TObject);
    procedure mnuOrderByCustom2Click(Sender: TObject);
    procedure mnuOrderByCustom3Click(Sender: TObject);
    procedure mnuOrderByCustom4Click(Sender: TObject);
    procedure mnuOrderByCustom5Click(Sender: TObject);
    procedure VSTreeSortedChange(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure VSTreeSortedDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure imgSearchMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSearchMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSearchClick(Sender: TObject);
    procedure RichViewDescrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichViewNoteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function SizeKbToStr(kb: int64) : string;
    procedure TimerMusicTitleScrollerTimer(Sender: TObject);
    function IsMusicPlaying: Boolean;
    procedure imgAniGifMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WMP1PlayStateChange(ASender: TObject; OldState,
      NewState: Integer);
    procedure PaintBoxScrollPaint(Sender: TObject);
    procedure PaintBoxScrollClick(Sender: TObject);
    procedure  MakePlayerImageTransparent24bit;
    procedure  MakePlayerImageTransparent;
    procedure LoadSkin(zipfile: string; skinname: string);
    procedure ListOtherSkins(zipfile: string; var skinname: string);
    procedure ChangeSkinClick(Sender: TObject);
    function GetSkinNames : TStringList;
    procedure mnuOrderByTitleClick(Sender: TObject);
    procedure CopyMusicFolderToTemp;
    procedure imgPictureClick(Sender: TObject);
    procedure StopVideoPlay;
//    procedure ZipMessage(Sender: TObject; ErrCode: Integer; Message: String );
    procedure MyExceptionHandler(Sender : TObject; E : Exception );

  private
    { Private declarations }
    // Skin buttons with normal, mouse over, mouse down
    btnMinimize: TSkinButton;
    btnClose: TSkinButton;
    btnPrev: TSkinButton;
    btnNext: TSkinButton;
    btnInstall: TSkinButton;
    btnPlay: TSkinButton;
    btnRun: TSkinButton;
    btnView: TSkinButton;
    btnMore: TSkinButton;
    btnNfo: TSkinButton;
    btnSearch: TSkinButton;
    btnMPOpen: TSkinButton;
    btnMPRew: TSkinButton;
    btnMPStop: TSkinButton;
    btnMPPause: TSkinButton;
    btnMPPlay: TSkinButton;
    btnMPForward: TSkinButton;

    // Music Title
    picMPTitle: TPicture; // Background with AText
    picMPTitleBG: TPicture; // Background image before AText

    procedure AddMusicDir(const dir: string;
                          DirItem: TMenuItem;
                          autostart: boolean;
                          const firstfile: string);


  public
    { Public declarations }
    InstPosSize: PosAndSizesInst;
    UnpackPosSize: PosAndSizesUnpack;
    MsgBoxPosSize: PosAndSizesMsgBox;
    NfoPosSize: PosAndSizesNfo;
    PlayerPosSize: PosAndSizesPlayer;
    SearchPosSize: PosAndSizesSearch;
    bScreenshotZoomed: boolean; // Zoom/center screenshot on mouse over?
    bScreenshotShowInNewWindowOnClick: boolean; // Show screenshot full size on click in new window
    bStretchToFit: boolean; // stretch screenshots to fit defined size
    sTBName: string;
    bAllowDesktopShortcuts: Boolean;
    othertitlesfontsize: integer;
    GodataStream: TResourceStream;
  end;

var
  frmMain: TfrmMain;
  bLoading: boolean;          // MI Skinable is loading
  bDisableFinishMsg: boolean;
  bDisableUnpackWin: boolean;
  bDisableInstallWin: boolean;
  bDisableDefaultAction: boolean;
  datfile: TextFile;          // XML data file
  bDecrypt: boolean;          // XML data file encrypted

  // Music variables
  bBASSDLLLoaded: boolean;    // Music DLL loaded
  Music_Mod: HMUSIC;          // Handle for music file (MOD)
  Music_Stream: HSTREAM;      // Stream for mp3 files
  dwMusic_Length: DWORD;      // Music Length in Bytes
  bMusic_ModStopped: boolean;
  sMusic_File: string;
  bMusicAutostart: boolean;   // Autostart mp3 at startup
  sMusicFirstFile: string;    // First mp3 file to play (if autostart)
  sMusic_FileExt: string;
  bMusic_Paused: boolean;
  iNoMusicTracks: integer;
  bMusicLoop: boolean;        // Loop mp3 files
  bMusicLoopRandom: boolean;
  sMusicFolder: string;
  iMusicVisualMode: integer;
  iStreamLoopMode: integer;   // Should mp3/ogg/wav file be looped?
  bMusicUseID3: boolean;

  bApdDesc2Note: boolean;     // Append installation notes to description
  sD2NDelimiter: string;      // Delimiter string
  GoWinDir: string;           // Directory for MI Skinable
  sCurPic: string;            // The picture showing now
  iCurPicIdx: integer;        // Index of picture showing now
  transcolor: string;         // transparent color
  vtranslucenty: integer;     // translucenty value
  trlunpack: boolean;         // translucenty is only for unpack
  FontFile: string;           // custom font file to load
  DefFontName: string;        // Default font AName
  DefFontCharset: integer;    // Default font charset
  NFOFontName: string;        // NFO font AName
  NFOFontCharset: integer;    // NFO font charset
  NFOFontSize: integer;       // NFO font size
  runfromtemp: boolean;
  tmpdir: string;             // windows temporary directory
  unpackdllpath: string;
  sStartupScript: string;
  sExitScript: string;

  // Show/hide fields
  bShowCustom1: boolean;
  bShowCustom2: boolean;
  bShowCustom3: boolean;
  bShowCustom4: boolean;
  bShowCustom5: boolean;
  bShowCDno: boolean;
  bShowMore: boolean;
  bShowScreenShots: boolean;

  // scroll variables
  scrollPos        : integer;
  scrollMsgNo      : integer;
  scrollSpeed      : integer;
  msgstr: array[1..7] of string;

  ArchiveDir: string;      // archive file folder
  ArchiveDirB: string;     // archive file folder + '\'
  MoreDir: string;
  MoreDirB: string;
  UrlHottrackColor: integer;
  ButtonsTransparent: boolean;
  atom: word;
  secondinstance: boolean;
  resourcefile: string;
  resourcepwd: string;
  filesToDelete: TStringList;
  foldersToDelete: TStringList;
  LanguageGo: TLanguageMISkinable;
  iTreeviewSortMode: integer; // Sort mode: Treeview
  bUseDarkBgSmilies: boolean; // wheater to use dark or light bg smilies
  bUseSmilies: boolean;

  // Urls in AText fields
  DescrUrls: TStringList;
  NoteUrls: TStringList;
  QuickInfoUrls: TStringList;
  ScreenshotRect: TRECT;

  // Music Title label scroll variables
  bMTScrollingRight: Boolean;
  iMTXCoordinate: integer;
  bMTIsScrollingNeeded: Boolean;
  sMTMusicTitle: string;
  iMTMessageWidth: integer;
  iMTDelay: integer;

//  SkinZipFile: TZipMaster;
  SkinName: string;
  SkinLoadTryCount: integer;

  blnDebugScript: boolean;


implementation

uses
{$IFNDEF FPC}
  Consts, ActiveX, ComObj, ShlObj,
{$ENDIF}
{$IFDEF WINDOWS}
  winceproc,
{$ENDIF}
  InstallU, MsgboxU, SplashU, DecryptU,  NfoU, UnitUnpack,
   SearchU, ScreenshotU;

{$R bass.res} // bass.dll included as bassdll RCDATA
{$R ZMRes.res} // ZipMaster zip dll
//{$R winxp.res} // for delphi 5/6 - use ThemeManager from www.delphi-gems.com

////////////////////////////////////////////////////////////////////////

function GetTagValue(s: string; const ATag: string): string;
  // Return the value between to html/xml tags
  //  GetTagValue('<PROGRAM>My program</PROGRAM>', 'PROGRAM');
  //  will return 'My program'
var
  iStartPos: integer;
  iEndPos: integer;
begin
  iStartPos := Pos('<' + ATag + '>', s);
  iEndPos := Pos('</' + ATag + '>', s);
  if (iStartPos > 0) and (iEndPos > 0) then
  begin
    iStartPos := iStartPos + Length(ATag) +2;
    Result := Copy(s, iStartPos, iEndPos - iStartPos);
  end
  else
    Result := '';

end; // GetTagValue

////////////////////////////////////////////////////////////////////////

function IsTag(      line: string;
               const ATag: string;
               var tagvalue: string): boolean;
var
  iStartPos: integer;
  iEndPos: integer;
begin
  iStartPos := Pos('<' + ATag + '>', line);
  iEndPos := Pos('</' + ATag + '>', line);
  if (iStartPos > 0) and (iEndPos > 0) then
  begin
    iStartPos := iStartPos + Length(ATag) +2; // 2 = '<' and '>'
    tagvalue := Copy(line, iStartPos, iEndPos - iStartPos);
    Result := True
  end
  else
    Result := False
end; // IsTag

////////////////////////////////////////////////////////////////////////

function PathLoadConvert(const s: string): string;
  // should it be slashes or back-slashes
begin
  if (UpperCase(Copy(s, 1,5)) = 'HTTP:') or (UpperCase(Copy(s, 1,4)) = 'FTP:') then
    Result := s
  else
    Result := StringReplace(s, '/', '\', [rfReplaceAll]);
end; // PathLoadConvert

////////////////////////////////////////////////////////////////////////

function EscDecodeStr(const s: string): string;
  // Converts escape codes like &lt; to < or &amp; to &.
  // This is done so browsers will not fail (I hope) due to
  // <, >, or & other special characters which migth be read
  // as markup language codes (or disturb in other ways).
begin
// unoptimized version:
//  s := StringReplace(s, '&lt;', '<', [rfReplaceAll]);
//  s := StringReplace(s, '&gt;', '>', [rfReplaceAll]);
//  s := StringReplace(s, '&quot;', '"', [rfReplaceAll]);
//  s := StringReplace(s, '&apos;', '''', [rfReplaceAll]);
//  Result := StringReplace(s, '&amp;', '&', [rfReplaceAll]);

// Optimized version
  Result := StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(s, '&lt;', '<', [rfReplaceAll]), '&gt;', '>', [rfReplaceAll]), '&quot;', '"', [rfReplaceAll]), '&apos;', '''', [rfReplaceAll]), '&amp;', '&', [rfReplaceAll]);
end; // EscDecodeStr

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.SetFonts(const s: string; i: integer);
begin
  frmMain.Font.Name := s;
  frmMain.Font.Charset := i;
  lblTitle.Font.Name := s;
  lblTitle.Font.Charset := i;
  lblHandle.Font.Name := s;
  lblHandle.Font.Charset := i;
  lblScreenshotCounter.Font.Name := s;
  lblScreenshotCounter.Font.Charset := i;
  VSTree.Font.Name := s;
  VSTree.Font.Charset := i;
{
  RVStyle.Color := VSTree.Color;
  with RVStyle.TextStyles[rvsNormal] do
  begin
    FontName := s;
    Size := 9;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style;
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  with RVStyle.TextStyles[rvsHeading] do
  begin
    FontName := s;
    Size := 9+6;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style;
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  with RVStyle.TextStyles[rvsSubheading] do
  begin
    FontName := s;
    Size := 9+3;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style;
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  with RVStyle.TextStyles[rvsJump1] do
  begin
    FontName := s;
    Size := 9;
    Color := UrlHottrackColor;
    if fsBold in frmMain.Font.Style then
      Style := [fsUnderline, fsBold]
    else
      Style := [fsUnderline];
    CharSet := i; // CharSet was introduced in Delphi3
  end;

  with RVStyle.TextStyles[rvsItalic] do
  begin
    FontName := s;
    Size := 9;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style + [fsItalic];
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  with RVStyle.TextStyles[rvsItalicUnderline] do
  begin
    FontName := s;
    Size := 9;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style + [fsItalic] + [fsUnderline];
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  with RVStyle.TextStyles[rvsItalicBold] do
  begin
    FontName := s;
    Size := 9;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style + [fsItalic] + [fsBold];
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  with RVStyle.TextStyles[rvsUnderline] do
  begin
    FontName := s;
    Size := 9;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style + [fsUnderline];
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  with RVStyle.TextStyles[rvsUnderlineBold] do
  begin
    FontName := s;
    Size := 9;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style + [fsBold] + [fsUnderline];
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  with RVStyle.TextStyles[rvsBold] do
  begin
    FontName := s;
    Size := 9;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style + [fsBold];
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  with RVStyle.TextStyles[rvsItalicUnderlineBold] do
  begin
    FontName := s;
    Size := 9;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style + [fsBold] + [fsUnderline] + [fsItalic];
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  mirvstyleQuickInfo.Color := VSTree.Color;
  with mirvstyleQuickInfo.TextStyles[rvsNormal] do
  begin
    FontName := s;
//    Size := 9;
    Color := lblMessage.Font.Color;
    Style := frmMain.Font.Style;
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  with mirvstyleQuickInfo.TextStyles[rvsJump1] do
  begin
    FontName := s;
//    Size := 9;
    Color := UrlHottrackColor;
    if fsBold in frmMain.Font.Style then
      Style := [fsUnderline, fsBold]
    else
      Style := [fsUnderline];
    CharSet := i; // CharSet was introduced in Delphi3
  end;
  }

  lblMessage.Font.Name := s;
  lblMessage.Font.Charset := i;
  lblQIText.Font.Name := s;
  lblQIText.Font.Charset := i;
end; // SetFonts

////////////////////////////////////////////////////////////////////////

function TfrmMain.ReadMILine(var MIEof: boolean): string;
  // Read a line from the input file - either XML or encrypted
var
  s: string;
begin
  if bDecrypt then
  begin
    s := frmDecrypt.Decrypt; // decrypt a line
    MIEof := frmDecrypt.GetEof;
  end
  else
  begin
    Readln(datfile, s);

    // NOTE: In some cases "eof" fails - therefore the double-check!
    MIEof := SeekEOF(datfile); // and (FilePos(datfile) = FileSize(datfile));
  end;
  Result := Trim(s);
end; // ReadMILine

////////////////////////////////////////////////////////////////////////

function TfrmMain.ReadMILineRT(var MIEof: boolean): string;
  // Read a line from the input file - either XML or encrypted
  // RT = RightTrimmed (only)
var
  s: string;
begin
  if bDecrypt then
  begin
    s := frmDecrypt.Decrypt;
    MIEof := frmDecrypt.GetEof;
  end
  else
  begin
    Readln(datfile, s);

    // NOTE: In some cases "eof" fails - therefore the double-check!
    MIEof := SeekEOF(datfile);// and (FilePos(datfile) = FileSize(datfile));
    //    MIEof:=eof(datfile);
  end;
  Result := TrimRight(s);
end; // ReadMILineRT

////////////////////////////////////////////////////////////////////////

procedure MakeTransparentNonOptimized(frm: TForm; img: TImage);
  //  Create transparent region for window.
  //  First create non transparent intervals for horizontal line.
  //  Add it to the scanline region. When scanline done, add
  //  it to the total non transparent region. Move to next horizontal line.
  //  When all done, set the total non transparent region to the form
  //  window region.
var
  WindowRgn: hrgn;
  SpanRgn: hrgn;
  x, y: integer;
  spanleft: integer;
  trColor: longint;
begin
  trColor := StrToInt(transcolor);
  WindowRgn := CreateRectRgn(0,0,0,0);
  for y := 0 to Pred(img.Height) do
  begin
    spanleft := 0;
    for x := 0 to Pred(img.Width) do
      if img.Canvas.Pixels[x, y] = trColor then
      begin // this pixel shall be invisible
        if spanleft < x then
        begin
          SpanRgn := CreateRectRgn(spanleft, y, x, Succ(y));
          CombineRgn(WindowRgn, WindowRgn, SpanRgn, RGN_OR);
          DeleteObject(SpanRgn);
        end;
        spanleft := Succ(x);
      end;

    // take care of last pixel on line, if AVisible
    if img.Canvas.Pixels[Pred(img.Width), y] <> trColor then
    begin
      SpanRgn := CreateRectRgn(spanleft, y, img.Width, Succ(y));
      CombineRgn(WindowRgn, WindowRgn, SpanRgn, RGN_OR);
      DeleteObject(SpanRgn);
    end;
  end;
  SetWindowRgn(frm.Handle, WindowRgn, True);
end; // MakeTransparentNonOptimized

////////////////////////////////////////////////////////////////////////

procedure MakeTransparent8bit(frm: TForm; img: TImage);
type
  pByteArray = ^TByteArray;
  TByteArray = array[0..32767] of byte;
var
{$IFDEF FPC}
  idx1,
  idx2: TColor;
  Row: Longint;
{$ELSE}
  idx1,
  idx2: longint;
  Row: pByteArray;
{$ENDIF}
  WindowRgn: hrgn;
  SpanRgn: hrgn;
  x, y: integer;
  spanleft: integer;
  trColor: COLORREF;
  LogicalPalette: TMaxLogPalette;
  PaletteEntryCount: cardinal;
  ScanlineDelta: integer;
begin
  PaletteEntryCount := GetPaletteEntries(img.Picture.Bitmap.Palette, 0, 256,
    LogicalPalette.palPalEntry);

  idx1 := -1;
  idx2 := -1;
  trColor := StrToInt(transcolor);
  for x := 0 to Pred(PaletteEntryCount) do
    if RGB(LogicalPalette.palPalEntry[x].peRed,
      LogicalPalette.palPalEntry[x].peGreen,
      LogicalPalette.palPalEntry[x].peBlue) = trColor then
    begin
      if idx1 = -1 then
        idx1 := x
      else
        idx2 := x;
    end;

  {$IFDEF FPC}
  Row := 0;
  {$ELSE}
  Row := img.Picture.Bitmap.ScanLine[0];
  {$ENDIF}
  ScanlineDelta := integer(img.Picture.Bitmap.{$IFDEF FPC}Canvas.Pixels[1,0]{$ELSE}ScanLine[1]{$ENDIF})
                - integer({$IFDEF FPC}img.Picture.Bitmap.Canvas.Pixels[0,0]{$ELSE}Row{$ENDIF} );
  WindowRgn := CreateRectRgn(0,0,0,0);
  for y := 0 to Pred(img.Picture.Bitmap.Height) do
  begin
    spanleft := 0;
    for x := 0 to Pred(img.Picture.Bitmap.Width) do
      if ({$IFDEF FPC}img.Picture.Bitmap.Canvas.Pixels[Row,x]{$ELSE}Row[x]{$ENDIF} = idx1) or ({$IFDEF FPC}img.Picture.Bitmap.Canvas.Pixels[Row,x]{$ELSE}Row[x]{$ENDIF} = idx2) then // trColor then
      begin // this pixel shall be invisible
        if spanleft < x then
        begin
          SpanRgn := CreateRectRgn(spanleft, y, x, Succ(y));
          CombineRgn(WindowRgn, WindowRgn, SpanRgn, RGN_OR);
          DeleteObject(SpanRgn);
        end;
        spanleft := Succ(x);
      end;

    // take care of last pixel on line, if AVisible
    if not (({$IFDEF FPC}img.Picture.Bitmap.Canvas.Pixels[Row,Pred(img.Width)]{$ELSE}Row[Pred(img.Width)]{$ENDIF} = idx1) or ({$IFDEF FPC}img.Picture.Bitmap.Canvas.Pixels[Row,Pred(img.Width)]{$ELSE}Row[Pred(img.Width)]{$ENDIF} = idx2)) then // trColor then
    begin  // add this pixel to current region
      SpanRgn := CreateRectRgn(spanleft, y, img.Picture.Bitmap.Width, Succ(y));
      CombineRgn(WindowRgn, WindowRgn, SpanRgn, RGN_OR);
      DeleteObject(SpanRgn);
    end;
    Inc(integer(Row), ScanlineDelta); // Goto next row/y
  end;
  SetWindowRgn(frm.Handle, WindowRgn, True);
end; // MakeTransparent8bit

////////////////////////////////////////////////////////////////////////

procedure MakeTransparent24bit(frm: TForm; img: TImage);
const
  PIXEL_COUNT_MAX = 32768;
type
  pRGBTripleArray = ^TRGBTripleArray;
  TRGBTripleArray = array[0..PIXEL_COUNT_MAX - 1] of TRGBTriple;
var
{$IFDEF FPC}
  Row: Longint;
  AColor:tagRGBTRIPLE;
{$ELSE}
  Row: pByteArray;
{$ENDIF}
  WindowRgn: hrgn;
  SpanRgn: hrgn;
  x, y: integer;
  spanleft: integer;
  trColor: COLORREF;
  ScanlineDelta: integer;
begin
  trColor := StrToInt(transcolor);
  {$IFDEF FPC}
  Row := 0;
  {$ELSE}
  Row := img.Picture.Bitmap.ScanLine[0];
  {$ENDIF}
  ScanlineDelta := integer(img.Picture.Bitmap.{$IFDEF FPC}Canvas.Pixels[1,0]{$ELSE}ScanLine[1]{$ENDIF})
                - integer({$IFDEF FPC}img.Picture.Bitmap.Canvas.Pixels[0,0]{$ELSE}Row{$ENDIF} );
  WindowRgn := CreateRectRgn(0,0,0,0);
  for y := 0 to Pred(img.Picture.Bitmap.Height) do
  begin
    spanleft := 0;
    for x := 0 to Pred(img.Picture.Bitmap.Width) do
     Begin
       if {$IFDEF FPC}img.Picture.Bitmap.Canvas.Pixels[Row,x]{$ELSE}RGB(Row[x].rgbtRed,
               Row[x].rgbtGreen,
               Row[x].rgbtBlue){$ENDIF} = trColor then
        begin // this pixel shall be invisible
          if spanleft < x then
          begin
            SpanRgn := CreateRectRgn(spanleft, y, x, Succ(y));
            CombineRgn(WindowRgn, WindowRgn, SpanRgn, RGN_OR);
            DeleteObject(SpanRgn);
          end;
          spanleft := Succ(x);
        end;
     end;

    // take care of last pixel on line, if AVisible
    if {$IFDEF FPC}img.Picture.Bitmap.Canvas.Pixels[Row,img.Width]{$ELSE}RGB(Row[Pred(img.Width)].rgbtRed, Row[Pred(img.Width)].rgbtGreen, Row[Pred(img.Width)].rgbtBlue){$ENDIF} <> trColor then
    begin
      SpanRgn := CreateRectRgn(spanleft, y, img.Picture.Bitmap.Width, Succ(y));
      CombineRgn(WindowRgn, WindowRgn, SpanRgn, RGN_OR);
      DeleteObject(SpanRgn);
    end;
    Inc(integer(Row), ScanlineDelta); // Goto next row/y
  end;
  SetWindowRgn(frm.Handle, WindowRgn, True);
end; // MakeTransparent24bit

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.MakeTransparent(frm: TForm; img: TImage);
begin
  if transcolor <> '' then
  begin
    if (img.Picture.Bitmap.PixelFormat = pf8bit) and
      (img.Picture.Bitmap.Palette > 0) then
      MakeTransparent8bit(frm, img)
    else if img.Picture.Bitmap.PixelFormat = pf24bit then
      MakeTransparent24bit(frm, img)
    else
      MakeTransparentNonOptimized(frm, img); // this is slow...
  end;
end; // MakeTransparent

////////////////////////////////////////////////////////////////////////
{
procedure TfrmMain.MakeTranslucency(hnd: HWND; trlu: byte);
  // This procedure does not work with Win9x/WinNT/WinME
const
  WS_EX_LAYERED = $00080000;
  LWA_COLORKEY = $00000001;
  LWA_ALPHA = $00000002;
  ULW_COLORKEY = $00000001;
  ULW_ALPHA = $00000002;
  ULW_OPAQUE = $00000004;
type
//  TSetLayeredWindowAttributesRec = record
//    hWnd: HWND;         // handle to the layered window
//    crKey: COLORREF;     // specifies the color key
//    bAlpha: byte;         // value for the blend function
//    dwFlags: DWORD         // AAction
//  end;

  TSetLayeredWindowAttributes = function(hWnd: HWND;
    // handle to the layered window
    crKey: COLORREF;     // specifies the color key
    bAlpha: byte;         // value for the blend function
    dwFlags: DWORD         // AAction
    ): boolean stdcall;
var
  DllHandle: HDC;
  SetLayeredWindowAttributes: TSetLayeredWindowAttributes;
begin
 // if trlu < 255 then
  begin
    try
      DllHandle := LoadLibrary('User32.dll');
      if DllHandle <> 0 then
      begin @SetLayeredWindowAttributes := GetProcAddress(DllHandle, 'SetLayeredWindowAttributes');
        if @SetLayeredWindowAttributes <> nil then
        begin
          SetWindowLong(hnd, GWL_EXSTYLE, GetWindowLong(hnd, GWL_EXSTYLE) or WS_EX_LAYERED);
          SetLayeredWindowAttributes(hnd, 0, trlu, LWA_ALPHA);

          //      SetLayeredWindowAttributes(Handle, RGB(0,0,255), 90, LWA_COLORKEY);
        end;
        FreeLibrary(DllHandle);
      end;
    except
      vtranslucenty := 255;
    end;
  end;
end; // MakeTranslucency
    }
////////////////////////////////////////////////////////////////////////

function TfrmMain.WidthInPixels(dc: HDC; const str: string): integer;
var
  Size: TSize;
begin
  if (dc <> 0) and (GetTextExtentPoint32(dc, PChar(str), Length(str), Size)) then
    Result := Size.cx
  else
    Result := 0;
end; // WidthInPixels

////////////////////////////////////////////////////////////////////////

procedure DrawAAText(Dest: TBitmap; DX, DY: integer; const AText: string);
  // Draw AntiAliased AText on bitmap (from nn posting by Charles Hacker)
type
  TRGBLine = array[word] of TRGBTriple;
  pRGBLine = ^TRGBLine;
var
  TempBitmap: TBitmap;
  x, y: integer;
  {$IFDEF FPC}
  tot: longint;
  {$ELSE}
  totr, totg, totb: integer;
  {$ENDIF}
  {$IFDEF FPC}
  Line: array of TColor;
  TempLine: array[0..1] of array of TColor;
  {$ENDIF}
begin
  // Creates a temporary bitmap do work with supersampling
  TempBitmap := TBitmap.Create;

  with TempBitmap do
  begin
    PixelFormat := pf24bit;

    // Copy attributes from previous bitmap}
    Canvas.Font.Assign(Dest.Canvas.Font);
    Canvas.Brush.Assign(Dest.Canvas.Brush);
    Canvas.Pen.Assign(Dest.Canvas.Pen);

    Canvas.Font.Size := Canvas.Font.Size * 2;

    // Make it twice larger to apply supersampling later}
    Width := Canvas.TextWidth(AText);
    Height := Canvas.TextHeight(AText);

    // To prevent unexpected junk
    if (Width div 2) + DX > Dest.Width then
      Width := (Dest.Width - DX) * 2;
    if (Height div 2) + DY > Dest.Height then
      Height := (Dest.Height - DY) * 2;


    // If the brush style is clear, then copy the image from the}
    // previous image to create the propher effect}
    if Canvas.Brush.Style = bsClear then
    begin
      Canvas.Draw(-DX, - DY, Dest);
      Canvas.Stretchdraw(Rect(0, 0, Width * 2, Height * 2), TempBitmap);
    end;

    // Draws the AText using double size
    Canvas.TextOut(0, 0, AText);
  end;

  // Draws the antialiased image
  for y := 0 to Pred((TempBitmap.Height) div 2) do
  begin
    // If the y pixel is outside the clipping region, do the proper AAction
    if dy + y < 0 then
      Continue
    else if Dy + y > Dest.Height - 1 then
      Break;

    // Scanline for faster access
    {$IFDEF FPC}
    SetLength(Line,Dest.Width);
    for x := 0 to Dest.Width - 1 do
      Line [x] := Dest.Canvas.Pixels[DY + y,x];
    {$ELSE}
    Line := Dest.ScanLine[DY + y];
    {$ENDIF}

    {$IFDEF FPC}
    for x := 0 to high ( TempLine ) do
      SetLength(TempLine[x],TempBitmap.Width);
    for x := 0 to TempBitmap.Width - 1 do
      TempLine[0,x] := TempBitmap.Canvas.Pixels[2 * y,x];
      TempLine[1,x] := TempBitmap.Canvas.Pixels[(2 * y) + 1,x];
    {$ELSE}
    TempLine[0] := TempBitmap.Scanline[2 * y];
    TempLine[1] := TempBitmap.Scanline[(2 * y) + 1];
    {$ENDIF}

    for x := 0 to ((TempBitmap.Width) div 2) - 1 do
    begin
      // If the x pixel is outside the clipping region, do the proper AAction
      if dx + x < 0 then
        Continue
      else if Dx + x > Dest.Width - 1 then
        Break;

      // Compute the value of the output pixel (x, y)
      {$IFDEF FPC}
      tot:=0;
      Inc(Tot, TempLine[0][2 * x]);
      Inc(Tot, TempLine[0][2 * x + 1]);
      Inc(Tot, TempLine[1][2 * x]);
      Inc(Tot, TempLine[1][2 * x + 1]);

      // Set the pixel values thru scanline
      Line[DX + x ]:= Tot div 4;

      {$ELSE}
      TotR := 0;
      TotG := 0;
      TotB := 0;
      with TempLine[0][2 * x] do
      begin
        Inc(TotR, rgbtRed);
        Inc(TotG, rgbtGreen);
        Inc(TotB, rgbtBlue);
      end;
      with TempLine[0][2 * x + 1] do
      begin
        Inc(TotR, rgbtRed);
        Inc(TotG, rgbtGreen);
        Inc(TotB, rgbtBlue);
      end;
      with TempLine[1][2 * x] do
      begin
        Inc(TotR, rgbtRed);
        Inc(TotG, rgbtGreen);
        Inc(TotB, rgbtBlue);
      end;
      with TempLine[1][2 * x + 1] do
      begin
        Inc(TotR, rgbtRed);
        Inc(TotG, rgbtGreen);
        Inc(TotB, rgbtBlue);
      end;

      // Set the pixel values thru scanline
      with Line[DX + x] do
      begin
        rgbtRed := TotR div 4;
        rgbtGreen := TotG div 4;
        rgbtBlue := TotB div 4;
      end;
      {$ENDIF}
    end;
  end;

  // Free the temporary bitmap
  TempBitmap.Free;
end; // DrawAAText

////////////////////////////////////////////////////////////////////////

function String2Int(const s: string): integer;
var
  I, Code: integer;
begin
  Val(s, I, Code);
  if Code = 0 then
    Result := I
  else
    Result := -1;
end; // String2Int

////////////////////////////////////////////////////////////////////////

function IsMusicMod(const ext: string): boolean;
begin
  Result := (ext = '.MOD') or (ext = '.XM') or
            (ext = '.S3M') or (ext = '.MTM') or
            (ext = '.UMX') or (ext = '.MO3') or
            (ext = '.IT');
end; // IsMusicMod

////////////////////////////////////////////////////////////////////////

function IsMusicStream(const ext: string): boolean;
begin
  Result := (ext = '.MP3') or (ext = '.OGG') or (ext = '.WAV');
end; // IsMusicStream

////////////////////////////////////////////////////////////////////////

function GetID3v1ArtistTitle(const sFilename: string): string;
var
  FS: TFileStream;
  Buffer: array [1..128] of char;
  ID3Tag: TID3Tag;
  sRes: string;
begin
  sRes := '';
  try
    FS := TFileStream.Create(sFilename, fmOpenRead or fmShareDenyWrite);
    try
      FS.Seek(-128, soFromEnd);
      FS.Read(Buffer, 128);
      with ID3Tag do
      begin
        ID := Copy(Buffer, 1, 3);
        Titel := Copy(Buffer, 4, 30);
        Artist := Copy(Buffer, 34, 30);
        Album := Copy(Buffer, 64, 30);
        Year := Copy(Buffer, 94, 4);
        Comment := Copy(Buffer, 98, 30);
        Genre := Ord(Buffer[128]);
      end;
      if ID3Tag.ID = 'ATag' then
      begin
        if (Trim(ID3Tag.Titel) <> '') and (Trim(ID3Tag.Artist) <> '') then
          sRes := Trim(ID3Tag.Artist) + ' - ' + Trim(ID3Tag.Titel);

        if (Length(sRes) > 4) and (Lowercase(Copy(sRes, Length(sRes)-3, 4)) = '.mp3') then
              sRes := Copy(sRes, 1, Length(sRes) -4);
      end;
    finally
      FS.Free;
    end;
  except
  end;
  Result := sRes;
end; // GetID3v1ArtistTitle

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.UnpackBassDllFromResToTemp(const Filename: string);
var
  ResStream: TResourceStream;
  unpackfile: string;
begin
  unpackfile:=tmpdir+'bass.dll';
  if FileExists(unpackfile) then
  begin
    try
      DeleteFile(unpackfile);
    except
    end;
  end;

  if not FileExists(unpackfile) then
  begin
    ResStream := TResourceStream.Create(HInstance, 'bassdll', RT_RCDATA);
    ResStream.SaveToFile(unpackfile);
    ResStream.Free;
    FilesToDelete.Add(unpackfile);
  end;
end;

////////////////////////////////////////////////////////////////////////
{
function TfrmMain.UnpackFromResToTemp(const Filename: string): boolean;
var
  Stream1: TStream;
begin
  if resourcefile <> '' then
  begin
    Stream1 := frmMain.ZipMaster1.ExtractFileToStream(Filename);
    if Stream1 <> nil then
    begin
      frmMain.ZipMaster1.FSpecArgs.AText := Filename;
      frmMain.ZipMaster1.ExtrOptions := [ExtrOverwrite]; //+[ExtrDirNames];
      frmMain.ZipMaster1.ExtrBaseDir := tmpdir;
      try
        frmMain.ZipMaster1.Extract;
      except
      end;
    end;
  end;
  if FileExists(tmpdir + Filename) then
  begin
    Result := True;
    filesToDelete.Add(tmpdir + Filename);
  end
  else
    Result := False;
end;
}
//////////////////////////////////////////////////////////////////////

procedure FileToTemp(const filename: string; const tmpdir: string; addToRegistry: boolean);
var
  reg: TRegistry;
begin
  if FileExists(filename) then
  begin
    if FileExists(tmpdir + ExtractFileName(filename)) then
    begin
      DeleteFile(tmpdir + ExtractFileName(filename));
      if FileExists(tmpdir + ExtractFileName(filename)) then
      begin
//        SetFileAttributes(PChar(tmpdir + ExtractFileName(filename)), 0); // remove readonly attr
        DeleteFile(tmpdir + ExtractFileName(filename));
      end;
    end;
    frmMain.FCopy(filename, tmpdir + ExtractFileName(filename));

    if addToRegistry then
    begin
      try
        reg := TRegistry.Create;
        with reg do
        begin
          RootKey := HKEY_LOCAL_MACHINE;
          OpenKey('Software\Microsoft\Windows\CurrentVersion\RunOnce', False);
          WriteString('Remove ' + filename, 'command.com /c del ' + tmpdir + filename);
        end;
        reg.CloseKey;
        reg.Free;
      except
      end;
    end
    else
      filesToDelete.Add(tmpdir + ExtractFileName(filename));
  end;
end; // FileToTemp

////////////////////////////////////////////////////////////////////////

procedure CopyFolder(destfolder: string; sourcefolder: string);
var
  SRec: TSearchRec;
  ext: string;
begin
  if sourcefolder[Length(sourcefolder)] <> '\' then
    sourcefolder := sourcefolder + '\';
  if FindFirst(sourcefolder + '*.*', $0000003F, SRec) = 0 then // faAnyFile
  begin
    repeat
      ext := UpperCase(ExtractFileExt(SRec.Name));
      if (SRec.Attr and faDirectory) > 0 then
      begin
        if not (SRec.Name[1] = '.') then  // not this or parent
        begin
          frmMain.MakeDir(destfolder + '\' + SRec.Name);
          foldersToDelete.Add(destfolder + '\' + SRec.Name);
          CopyFolder(destfolder + '\' + SRec.Name, sourcefolder + SRec.Name);
        end
      end
      else if IsMusicMod(ext) or IsMusicStream(ext) then
        FileToTemp(sourcefolder + SRec.Name, destfolder + '\', false);
    until not (FindNext(SRec) = 0);
    FindClose(SRec);
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.CopyMusicFolderToTemp;
var
  i: integer;
  newMusicFolder: string;
begin
  i := 0;

  while DirectoryExists(tmpdir+'Music_' + IntToStr(i)) do
    Inc(i);
  newMusicFolder := tmpdir+'Music_' + IntToStr(i);

  MakeDir(newMusicFolder);
  foldersToDelete.Add(newMusicFolder);

  CopyFolder(newMusicFolder, GoWinDir + '\' + sMusicFolder);

  sMusicFolder := newMusicFolder;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.AddMusicDir(const dir: string;
                               DirItem: TMenuItem;
                               autostart: boolean;
                               const firstfile: string);
  // Add music files in 'dir' to the music menu.
var
  NewItem: TMenuItem;
  SRec: TSearchRec;
  ext: string;
  sID3Name: string;
begin
  if FindFirst(sMusicFolder + dir + '*.*', $0000003F, SRec) = 0 then // faAnyFile
  begin
    ext := UpperCase(ExtractFileExt(SRec.Name));
    if IsMusicMod(ext) or IsMusicStream(ext) then
    begin
      NewItem := TMenuItem.Create(Self);
      NewItem.Caption := Copy(SRec.Name, 1, Length(SRec.Name) - Length(ext));
      NewItem.Caption := StringReplace(NewItem.Caption, '_', ' ', [rfReplaceAll]);
      if bMusicUseID3 and (ext = '.MP3') then
      begin
        sID3Name := GetID3v1ArtistTitle(dir + SRec.Name);
        if sID3Name <> '' then
          NewItem.Caption := sID3Name;
      end;
      NewItem.Hint := dir + SRec.Name;
      NewItem.RadioItem := True;
      NewItem.OnClick := MusicTrackClick;
      DirItem.Add(NewItem);
      Inc(iNoMusicTracks);
      if autostart then
      begin
        if UpperCase(firstfile) = UpperCase(dir + SRec.Name) then
          MusicTrackClick(NewItem)
        else if iNoMusicTracks = 1 then
          MusicTrackClick(NewItem);
      end;
    end;
    while FindNext(SRec) = 0 do
    begin
      ext := UpperCase(ExtractFileExt(SRec.Name));
      if IsMusicMod(ext) or IsMusicStream(ext) then
      begin
        NewItem := TMenuItem.Create(Self);
        NewItem.Caption := Copy(SRec.Name, 1, Length(SRec.Name) - Length(ext));
        NewItem.Caption := StringReplace(NewItem.Caption, '_', ' ', [rfReplaceAll]);
        if bMusicUseID3 and (ext = '.MP3') then
        begin
          sID3Name := GetID3v1ArtistTitle(sMusicFolder + dir + SRec.Name);
          if sID3Name <> '' then
            NewItem.Caption := sID3Name;
        end;
        NewItem.Hint := dir + SRec.Name;
        NewItem.RadioItem := True;
        NewItem.OnClick := MusicTrackClick;
        DirItem.Add(NewItem);
        Inc(iNoMusicTracks);

        if autostart then
        begin
          if UpperCase(firstfile) = UpperCase(dir + SRec.Name) then
            MusicTrackClick(NewItem)
          else if iNoMusicTracks = 1 then
            MusicTrackClick(NewItem);
        end;
      end;
    end;
  end;
  FindClose(SRec);
end; // AddMusicDir

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.LoadMusicLibrary(autostart: boolean;
                                    const firstfile: string);
var
  SRec: TSearchRec;
  NewItem: TMenuItem;
  InitRC: longbool;
  sBassFilename: string;
  i: integer;
begin
  UnpackBassDllFromResToTemp('bass.dll');
  if FileExists(tmpdir + '\bass.dll') then
    sBassFilename := tmpdir + '\bass.dll'
  else
    sBassFilename := 'bass.dll';

  sBassFilename := StringReplace(sBassFilename, '\\', '\', [rfReplaceAll]);

  bBASSDLLLoaded := False;
  if Load_BASSDLL then
  begin
    // Don't care about version...    if RT_BASS_GetVersion() = MAKELONG(1,3) then // Check that BASS 1.3 was loaded

    //    Initialize digital sound - default device, 44100hz, stereo, 16 bits
    InitRC := BASS_Init(1, 44100, 0, 0, nil);

    if InitRC then
    begin
      Music_Mod := 0;
      bMusic_ModStopped := False;
      bMusic_Paused := False;
      Music_Stream := 0;
      dwMusic_Length := 0;
      sMusic_File := '';
      sMusic_FileExt := '';

      // Music Tracks initialize
      if FindFirst(sMusicFolder + '*.*', $0000003F, SRec) = 0 then // faAnyFile
      begin
        bBASSDLLLoaded := True;
        BASS_Start;

        if (SRec.Name[1] <> '.') and (SRec.Attr in [16..19]) then
        begin
          NewItem := TMenuItem.Create(Self);
          NewItem.Caption := SRec.Name;
          pmMusicTracks.Items.Add(NewItem);
          AddMusicDir(SRec.Name + '\', NewItem, autostart, firstfile);
        end;
        while FindNext(SRec) = 0 do
        begin
          if (SRec.Name[1] <> '.') and (SRec.Attr in [16..19]) then
          begin
            NewItem := TMenuItem.Create(Self);
            NewItem.Caption := SRec.Name;
            pmMusicTracks.Items.Add(NewItem);
            AddMusicDir(SRec.Name + '\', NewItem, autostart, firstfile);
          end;
        end;
        AddMusicDir('', pmMusicTracks.Items, autostart, firstfile); // The MP3 dir
      end;
      FindClose(SRec);

      if iNoMusicTracks > 0 then
      begin

        // remove empty dirs
        for i := pmMusicTracks.Items.Count-1 downto 0 do
          if (pmMusicTracks.Items[i].Count = 0) and
             (pmMusicTracks.Items[i].Hint = '') then
               pmMusicTracks.Items.Delete(i);

        MusicTimer.Enabled := True;
        TimerRender.Enabled := True;

        if bMusicLoopRandom and autostart and (firstfile = '')then
          MusicPlayRandom;
      end
      else // No music files found - perhaps wrong music dir?
      begin
        UnloadMusicLibrary;
        bBASSDLLLoaded := False;
      end;
    end
  end;

  // if something failed to init/play music then stop timer and hide menus
  if not bBASSDLLLoaded then
    MusicTimer.Enabled := False;
end; // LoadMusicLibrary

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.UnloadMusicLibrary;
begin
  MusicTimer.Enabled := False;
  bBASSDLLLoaded := False;

  //    Stop digital output
  BASS_Stop;

  //    Free the stream
  if IsMusicStream(sMusic_FileExt) then
    BASS_StreamFree(Music_Stream);
  //  It's not actually necessary to free the musics and
  //  samples because they are automatically freed by
  //  BASS_Free

  // Free musics
  if IsMusicMod(sMusic_FileExt) then
    BASS_MusicFree(Music_Mod);

  Unload_BASSDLL;
end; // UnloadMusicLibrary

////////////////////////////////////////////////////////////////////////

function GetDecimalColor(const s: string): string;
var
  tmp: string;
  r, g: word;
  valCode: integer;
  valI: integer;
begin
  valCode := 1;
  if (Length(s) = 7) and (s[1] = '#') then
  begin
    Val('$' + s[2] + s[3], valI, valCode);
    if valCode = 0 then
    begin
      r := valI;
      Val('$' + s[4] + s[5], valI, valCode);
      if valCode = 0 then
      begin
        g := valI;
        Val('$' + s[6] + s[7], valI, valCode);
        if valCode = 0 then
          tmp := IntToStr(RGB(r, g, valI));
      end;
    end;
  end;
  if valCode = 0 then
    Result := tmp
  else
    Result := s;
end; // GetDecimalColor

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.FCopy(const FileName, DestName: TFileName);
begin
  CopyFile(PChar(FileName), PChar(DestName), False);
end; // FCopy

////////////////////////////////////////////////////////////////////////

function TfrmMain.ExecuteFile(const Operation,
                                    FileName,
                                    Parameter,
                                    Directory: string;
                                    AShow: word;
                                    bWait: boolean): longint;
var
  bOK: boolean;
  {$IFNDEF FPC}
  Info: TShellExecuteInfo;
  {$ENDIF}
{
  ****** Parameters ******
  Operation:

  edit  Launches an editor and opens the document for editing.
  explore Explores the folder specified by lpFile.
  find Initiates a search starting from the specified directory.
  open Opens the file, folder specified by the lpFile parameter.
  print Prints the document file specified by lpFile.
  properties Displays the file or folder's properties.

  FileName:

  Specifies the AName of the file or object on which
  ShellExecuteEx will perform the AAction specified by the lpVerb parameter.

  Parameter:

  String that contains the application parameters.
  The parameters must be separated by spaces.

  Directory:

  specifies the AName of the working directory.
  If this member is not specified, the current directory is used as the working directory.

  Show:

  Flags that specify how an application is to be shown when it is opened.
  It can be one of the SW_ values

  bWait:

  If true, the function waits for the process to terminate
}
begin
  if Directory <> '' then
    SetCurrentDir(Directory);

  {$IFDEF FPC}
//  Process.cbSize := SizeOf(Info);
//  Process.fMask := SEE_MASK_NOCLOSEPROCESS;
//  Process.Verb := PChar(Operation);
  Process.CommandLine := Directory+FileName+' ' +Parameter;
  Process.Active := True;
  bOK := Process.Active;
  {$ELSE}
  FillChar(Info, SizeOf(Info), Chr(0));
  Info.cbSize := SizeOf(Info);
  Info.fMask := SEE_MASK_NOCLOSEPROCESS;
  Info.lpVerb := PChar(Operation);
  Info.lpFile := PChar(FileName);
  Info.lpParameters := PChar(Parameter);
  Info.lpDirectory := PChar(Directory);
  Info.nShow := Show;
  bOK := boolean(ShellExecuteEx(@Info));
  {$ENDIF}
  {$IFDEF WINDOWS}
  if bOK then
  begin
    if bWait then
    begin
      while WaitForSingleObject(Info.hProcess, 100) = WAIT_TIMEOUT do
        Sleep(50);

      bOK := GetExitCodeProcess(Info.hProcess, DWORD(Result));
    end
    else
      Result := 0;
  end;
  {$ENDIF}
  if not bOK then Result := -1;
  SetCurrentDir(GoWinDir);
end; // ExecuteFile

////////////////////////////////////////////////////////////////////////

function TfrmMain.MakeDir(strDir: string): boolean;
var
  strCheckPath: string;
  DirOKCreated: boolean;
begin
  DirOKCreated := True;
  if strDir[Length(strDir)] = '\' then
    Delete(strDir, Length(strDir), 1);   // remove last backslash

  strCheckPath := '';
  while (Length(strDir) > 0) and (DirOKCreated) do
  begin
    if strDir[1] = '\' then
    begin
      Delete(strDir, 1,1);
      if not DirectoryExists(strCheckPath) then
        DirOKCreated := CreateDir(strCheckPath); // Path does not exists
      strCheckPath := strCheckPath + '\';
    end
    else
    begin
      strCheckPath := strCheckPath + strDir[1];
      if Length(strDir) > 1 then
        Delete(strDir, 1,1)
      else
        strDir := '';
    end;
  end;
  if DirOKCreated and (not DirectoryExists(strCheckPath)) then
    DirOKCreated := CreateDir(strCheckPath); // Path does not exists

  Result := DirOKCreated;
end; // MakeDir

////////////////////////////////////////////////////////////////////////

function GetLabel(c: char): string;
var
  SerialNum: pdword;
  a, b: dword;
  Buffer: array [0..MAX_PATH] of char;
begin
  {$IFDEF WINDOWS}
  GetVolumeInformation(PChar(c + ':\'), Buffer, SizeOf(Buffer), @SerialNum, a, b, nil, 0);
  Result := StrPas(Buffer);
  {$ENDIF}
end; // GetLabel

////////////////////////////////////////////////////////////////////////

function TfrmMain.ExistsSkinImage(const AName: string): boolean;
var
  findidx: integer;
  dir: string;
begin
  findidx := -1;
  dir := GoWinDir + '\Skin\+ ' + SkinName + '\' + AName + '.';
{
  if SkinZipFile <> nil then
    Result :=
            (SkinZipFile.Find(AName +'.gif', findidx) <> nil) or
            (SkinZipFile.Find('skin\' + SkinName + '\' + AName +'.gif', findidx) <> nil) or
            (SkinZipFile.Find(AName +'.png', findidx) <> nil) or
            (SkinZipFile.Find('skin\' + SkinName + '\' + AName +'.png', findidx) <> nil) or
            (SkinZipFile.Find(AName +'.jpg', findidx) <> nil) or
            (SkinZipFile.Find('skin\' + SkinName + '\' + AName +'.jpg', findidx) <> nil) or
            (SkinZipFile.Find(AName +'.bmp', findidx) <> nil) or
            (SkinZipFile.Find('skin\' + SkinName + '\' + AName +'.bmp', findidx) <> nil) or
            (FileExists(dir + AName +'jpg')) or
            (FileExists(dir + AName +'gif')) or
            (FileExists(dir + AName +'bmp')) or
            (FileExists(dir + AName +'png'))
    else}
      Result :=
            (FileExists(dir + AName +'jpg')) or
            (FileExists(dir + AName +'gif')) or
            (FileExists(dir + AName +'bmp')) or
            (FileExists(dir + AName +'png'))
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.LoadSkinImageGif(var gif: TGifImage; const AName: string);
var
  Stream1: TStream;
begin
  Stream1 := nil;
{
  if SkinZipFile <> nil then
  begin
    Stream1 := SkinZipFile.ExtractFileToStream('Skin\' + Skinname + '\' + AName +'.gif');

    if Stream1 = nil then
      Stream1 := SkinZipFile.ExtractFileToStream(AName +'.gif');

    if Stream1 <> nil then
    begin
      gif := TGIFImage.Create;
      gif.LoadFromStream(Stream1);
      gif.Bitmap.PixelFormat:=pf24bit;
    end;
  end;
 }
  if Stream1 = nil then
  begin
    if FileExists(GoWinDir + '\skin\' + Skinname + '\' + AName +'.gif') then
    begin
      gif := TGIFImage.Create;
      gif.LoadFromFile(AName +'.gif');
//      gif.Bitmap.PixelFormat:=pf24bit;
    end
  end;
end; // LoadSkinImageGif

////////////////////////////////////////////////////////////////////////
{$IFNDEF FPC}
procedure TfrmMain.LoadSkinImage(pic: TPicture; const AName: string; btm: boolean);
var
  jpg: TJPEGImage;
  bmp: TBitmap;
  gif: TGIFImage;
  Stream1: TStream;
  picfile: string;
begin

  if SkinZipFile <> nil then
  begin
    Stream1 := SkinZipFile.ExtractFileToStream(AName +'.jpg');
    if Stream1 = nil then
      Stream1 := SkinZipFile.ExtractFileToStream('Skin\' + SkinName + '\' + AName +'.jpg');
    if Stream1 <> nil then
    begin
      bmp := TBitmap.Create;
      jpg := TJPEGImage.Create;
      jpg.LoadFromStream(Stream1);
      bmp.Assign(jpg);
      bmp.PixelFormat:=pf24bit;
      pic.Assign(bmp);
      jpg.Free;
      bmp.Free;
    end;
    if Stream1 = nil then
    begin
      Stream1 := SkinZipFile.ExtractFileToStream(AName +'.gif');

      if Stream1 = nil then
        Stream1 := SkinZipFile.ExtractFileToStream('Skin\' + SkinName + '\' + AName +'.gif');
      if Stream1 <> nil then
      begin
        gif := TGIFImage.Create;
        gif.LoadFromStream(Stream1);
        gif.Bitmap.PixelFormat:=pf24bit;
        if btm then
          pic.Assign(gif.Bitmap) // load as bitmap
        else
          pic.Assign(gif); // load as gif image
        gif.Free;
      end;
    end;
    if Stream1 = nil then
    begin
      Stream1 := SkinZipFile.ExtractFileToStream(AName +'.png');
      if Stream1 = nil then
        Stream1 := SkinZipFile.ExtractFileToStream('Skin\' + SkinName + '\' + AName +'.png');
      if Stream1 <> nil then
      begin
        pic.Graphic := TPNGGraphic.Create;
        pic.Graphic.LoadFromStream(Stream1);
      end;
    end;
    if Stream1 = nil then
    begin
      Stream1 := SkinZipFile.ExtractFileToStream(AName +'.bmp');

      if Stream1 = nil then
        Stream1 := SkinZipFile.ExtractFileToStream('Skin\' + SkinName + '\' + AName +'.bmp');

      if Stream1 <> nil then
        pic.Bitmap.LoadFromStream(Stream1);

      // to avoid strange gfx bug in win9x
      pic.Bitmap.PixelFormat := pf24bit;
    end;
    if Stream1 = nil then
    begin
      Stream1 := SkinZipFile.ExtractFileToStream(AName +'.png');
      if Stream1 = nil then
        Stream1 := SkinZipFile.ExtractFileToStream('Skin\' + SkinName + '\' + AName +'.png');

      if Stream1 <> nil then
      begin
        pic.Graphic := TPNGGraphic.Create;
        pic.Graphic.LoadFromStream(Stream1);
      end;
    end;
    SetCurrentDir(GoWinDir);
  end
  else
  begin // no resource file
    picfile := GoWinDir + '\skin\' + SkinName + '\' + AName + '.';
    if FileExists(picfile + 'jpg') then
    begin
      bmp := TBitmap.Create;
      jpg := TJPEGImage.Create;
      jpg.LoadFromFile(picfile + 'jpg');
      bmp.Assign(jpg);
      pic.Assign(bmp);
      jpg.Free;
      bmp.Free;
    end
    else if FileExists(picfile + 'gif') then
    begin
      gif := TGIFImage.Create;
      gif.LoadFromFile(picfile + 'gif');
      pic.Assign(gif.Bitmap);
      gif.Free;
    end
    else if FileExists(picfile + 'png') then
    begin
      pic.LoadFromFile(picfile + 'png');
    end
    else if FileExists(picfile + 'bmp') then
      pic.LoadFromFile(picfile + 'bmp');

    // to avoid strange gfx bug in win9x
    pic.Bitmap.PixelFormat := pf24bit;
  end;

end; // LoadSkinImage
{$ENDIF}
////////////////////////////////////////////////////////////////////////

procedure TfrmMain.LoadSkinButton(var img: TImage; var sbtn: TSkinButton; const AName: string; AVisible: boolean);
begin
  LoadSkinImage(sbtn.pic, AName, True);
  LoadSkinImage(sbtn.picMOver, AName + 'Over', True);

  sbtn.gifMOver := nil; // changin skins will require this to be nil (or old gif could be shown)
  LoadSkinImageGif(sbtn.gifMOver, AName + 'Over');

  LoadSkinImage(sbtn.picMDown, AName + 'Down', True);
  img.Picture.Assign(sbtn.pic);
  img.Visible := AVisible;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.LoadIcons(icons: TStringList);
var
  i: integer;
  icon: TIcon;
  Stream1: TStream;
  s: string;
  found: boolean;
begin
  for i := 1 to icons.Count do
  begin
    found := False;
    s := icons.Strings[i - 1];
    {$IFNDEF FPC}
    if resourcefile <> '' then
    begin
      Stream1 := ZipMaster1.ExtractFileToStream(s);
      if Stream1 <> nil then
      begin
        icon := TIcon.Create;
        icon.LoadFromStream(Stream1);
        ImageListIcons.AddIcon(icon);
        icon.Free;
        found := True;
      end;
    end;
    {$ENDIF}
    if (not found) and (FileExists(s)) then
    begin
      icon := TIcon.Create;
      icon.LoadFromFile(s);
      ImageListIcons.AddIcon(icon);
      icon.Free;
    end;
  end;
end; // LoadIcons

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.LoadFont;
var
  Stream1: TStream;
  cResult: cardinal;
begin
  Stream1 := nil;
  {$IFNDEF FPC}
  if SkinZipFile <> nil then
  begin
    Stream1 := SkinZipFile.ExtractFileToStream('Skin\' + Skinname + '\' + FontFile);
    if Stream1 = nil then
      Stream1 := SkinZipFile.ExtractFileToStream(FontFile);
    if Stream1 <> nil then
    begin
      SkinZipFile.FSpecArgs.AText := FontFile;
      SkinZipFile.ExtrOptions := [ExtrOverwrite]; //+[ExtrDirNames];
      SkinZipFile.ExtrBaseDir := tmpdir;
      try
        SkinZipFile.Extract;
      except
      end;
    end;
  end;

  if (Stream1 = nil) and (resourcefile <> '') then
  begin
    Stream1 := ZipMaster1.ExtractFileToStream(FontFile);
    if Stream1 <> nil then
    begin
      ZipMaster1.FSpecArgs.AText := FontFile;
      ZipMaster1.ExtrOptions := [ExtrOverwrite]; //+[ExtrDirNames];
      ZipMaster1.ExtrBaseDir := tmpdir;
      try
        ZipMaster1.Extract;
      except
      end;
    end;
  end;

  if Stream1 <> nil then
  begin
    FontFile := tmpdir + ExtractFileName(FontFile);
    filesToDelete.Add(FontFile); // Delete file later (FormDestroy)
    SetCurrentDir(GoWinDir);
  end;
  if (FileExists(FontFile)) then
  begin
    if AddFontResource(PChar(FontFile)) > 0 then
      SendMessageTimeout(HWND_BROADCAST,
                          WM_FONTCHANGE, // Msg
                          0, // wParam,
                          0, // lParam,
                          SMTO_NORMAL, // fuFlags,
                          200, // uTimeout in miliseconds
                          cResult); // PDWORD_PTR
  end
  else
  {$ENDIF}
    FontFile := '';
end; // LoadFont

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.SetDefaultTexts;
begin
  with LanguageGo do
  begin
    sInstall := '&Install';
    sOK := '&OK';
    sCancel := 'Cancel';
    sNFO := '&NFO';
    sPlay := '&Play';
    sView := '&View';
    sSearchTitle:='Search';
    sSearchTitlesOnly:='Titles only';
    sUnknownSize := 'Unknown size!';
    sYes := 'Yes';
    sNo := 'No';
    sMusicTracks := 'Music Tracks';
    sInstallOf1 := 'Installation of';
    sInstallOf2 := '';
    sInsertDisc := 'Insert disc:';

    sAddIcon := 'Add icon to desktop';
    sAddIcons := 'Add icons to desktop';
    sSpaceAvail := 'Space available';
    sSpaceReq := 'Space requested';
    sFinish := '&Finish';
    sUnpacking1 := 'Unpacking';
    sUnpacking2 := '...';
    sCopyTo1 := 'Copy ';
    sCopyTo2 := ' to';
    sCopying1 := 'Copying ';
    sCopying2 := '...';
    sCurrentFile := 'Current file:';
    sTotalProgress := 'Total progress';
    sKB := 'KB';
    sMB := 'MB';
    sGB := 'GB';
    sXOfY := 'of';
    sElapsed := 'Time elapsed';
    sEstimated := 'Time estimated left';
    sDiskFreeLow := 'Not enough disk free on target drive!';
    sDoneMsg1 := 'Done extracting';
    sDoneMsg2 := '!';
    sCopyDoneMsg1 := 'Done copying';
    sCopyDoneMsg2 := ' to ';
    sShortCuts1 := 'Shortcuts created in the Start Menu.';
    sShortCuts2 := 'Shortcuts created in the Start Menu and on the desktop.';
    sCancelPrompt := 'Abort installation?';
    sCancelMsg := 'Installation aborted by user!';
    sInformation := 'Information';
    sConfirmation := 'Confirm';
    sWarning := 'Warning';
    sError := 'Error';

    sSize := 'Size';
    sCustom1 := 'Custom1';
    sCustom2 := 'Custom2';
    sCustom3 := 'Custom3';
    sCustom4 := 'Custom4';
    sCustom5 := 'Custom5';
    sDiscNo := 'Disc#';
    sMore := '&More...';


    // MI Uninstall
    sUninstTitle := 'Uninstall';
    sUninstSubtitle := 'Remove program';
    sUninstInfo1 := 'This will remove the program';
    sUninstInfo2 := 'from your computer';
    sRemove := 'Remove';
    sRemoved1 := '';
    sRemoved2 := 'successfully removed from your computer';
    sUninstProgress := 'Uninstall progress';
    sUninstFiles := 'Deleting files...';
    sUninstSC := 'Removing shortcuts...';
  end;
end; // SetDefaultTexts

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.DrawAALabel(bmp: TBitmap;
                               lbl: TLabel;
                               const ShadowDir: string;
                               const ShadowColor: string;
                               ShadowLength: integer);

  function GetDirection(var X: integer;
    var Y: integer;
    const dir: string): boolean;
  begin
    Result := True;
    if dir = 'up' then
    begin
      X := 0;
      Y := -1;
    end
    else if dir = 'upleft' then
    begin
      X := -1;
      Y := -1;
    end
    else if dir = 'upright' then
    begin
      X := +1;
      Y := -1;
    end
    else if dir = 'left' then
    begin
      X := -1;
      Y := 0;
    end
    else if dir = 'right' then
    begin
      X := +1;
      Y := 0;
    end
    else if dir = 'downleft' then
    begin
      X := -1;
      Y := +1;
    end
    else if dir = 'downright' then
    begin
      X := +1;
      Y := +1;
    end
    else if dir = 'down' then
    begin
      X := 0;
      Y := +1;
    end
    else
      Result := False;
  end; // GetDirection
var
  ShadowX, ShadowY: integer;
  x, y: integer;
  i: integer;
begin
  lbl.Visible := False;
  if GetDirection(shadowX, shadowY, ShadowDir) then
  begin
    bmp.Canvas.Font := lbl.Font;
    bmp.Canvas.Brush.Style := bsClear;
    bmp.Canvas.Font.Color := StrToInt(ShadowColor);
    x := lbl.Left;
    y := lbl.Top;
    for i := 1 to ShadowLength do
    begin
      Inc(x, ShadowX);
      Inc(y, ShadowY);
      DrawAAText(bmp, x, y, lbl.Caption);
    end;
  end;
  bmp.Canvas.Font := lbl.Font;
  bmp.Canvas.Brush.Style := bsClear;
  DrawAAText(bmp, lbl.Left, lbl.Top, lbl.Caption);
end; // DrawAALabel

////////////////////////////////////////////////////////////////////////

function XpOrNewer: boolean;
{$IFDEF WIN32}
var
  Gv: TOSVersionInfo;
begin
  Result := False;
  gv.dwOSVersionInfoSize := Sizeof(GV);
  if GetVersionEx(GV) then
  begin
    if GV.dwPlatformId > 2 then // 2 = WinNT and newer
      Result := True
    else if GV.dwPlatformId < 2 then
      Result := False
    else if gv.dwMajorVersion > 5 then  // 5 = Win2k + XP
      Result := True
    else if gv.dwMajorVersion < 5 then
      Result := False
    else if gv.dwMinorVersion > 0 then // dwMajorVersion = 5
      Result := True;
  end
{$ELSE}
Begin
  Result := False;
{$ENDIF}
end; // XpOrNewer

////////////////////////////////////////////////////////////////////////

function ImportRegistryKey(      sRegPath: string;
                           const sKeyName: string;
                           const sKeyValue: string): boolean;
var
  s: string;
  reg: TRegistry;
begin
  Result := False;
  try
    reg := TRegistry.Create;

    s := Lowercase(Copy(sRegPath, 1, 5));

    // registry root key
    if s = 'hkcr\' then
    begin
      reg.RootKey := HKEY_CLASSES_ROOT;
      Delete(sRegPath, 1, 5);
    end
    else if s = 'hkcu\' then
    begin
      reg.RootKey := HKEY_CURRENT_USER;
      Delete(sRegPath, 1, 5);
    end
    else if s = 'hklm\' then
    begin
      reg.RootKey := HKEY_LOCAL_MACHINE;
      Delete(sRegPath, 1, 5);
    end
    else if s = 'hku\' then
    begin
      reg.RootKey := HKEY_USERS;
      Delete(sRegPath, 1, 5);
    end
    else if s = 'hkcc\' then
    begin
      reg.RootKey := HKEY_CURRENT_CONFIG;
      Delete(sRegPath, 1, 5);
    end
    else if Uppercase(Copy(sRegPath, 1, 18)) = 'HKEY_CLASSES_ROOT\' then
    begin
      reg.RootKey := HKEY_CLASSES_ROOT;
      Delete(sRegPath, 1, 18);
    end
    else if Uppercase(Copy(sRegPath, 1, 18)) = 'HKEY_CURRENT_USER\' then
    begin
      reg.RootKey := HKEY_CURRENT_USER;
      Delete(sRegPath, 1, 18);
    end
    else if Uppercase(Copy(sRegPath, 1, 19)) = 'HKEY_LOCAL_MACHINE\' then
    begin
      reg.RootKey := HKEY_LOCAL_MACHINE;
      Delete(sRegPath, 1, 19);
    end
    else if Uppercase(Copy(sRegPath, 1, 11)) = 'HKEY_USERS\' then
    begin
      reg.RootKey := HKEY_USERS;
      Delete(sRegPath, 1, 11);
    end
    else if Uppercase(Copy(sRegPath, 1, 20)) = 'HKEY_CURRENT_CONFIG\' then
    begin
      reg.RootKey := HKEY_CURRENT_CONFIG;
      Delete(sRegPath, 1, 20);
    end;

    // Open and write string
    if reg.OpenKey(sRegPath, True) then // create if not exists
    begin
      reg.WriteString(sKeyName, sKeyValue);
      reg.CloseKey;
      reg.Free;
      Result := True; // Value inserted into registry was a success
    end
  except
  end;
end; // ImportRegistryKey

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.CreatePhysicalShortcut(const sShortcut: string;
                                          const sFilename: string;
                                          const sIconfile: string);
{$IFDEF WIN32}
var
  CObject: IUnknown;
  ISLink: IShellLink;
  IPFile: IPersistFile;
  wsFilename: widestring;
  //  bDesktop   : Boolean;
  reg: TRegistry;
  sStartMenuPrograms: string;
  sDesktop: string;
  sShortcutPath: string;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  if reg.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders') then
  begin
    sStartMenuPrograms := reg.ReadString('Programs'); // Start Menu\Programs
    sDesktop := reg.ReadString('Desktop');

    // -- For local_machine --
    //    if reg.KeyExists('Desktop') then
    //      sDesktop:=reg.ReadString('Desktop')
    //    else
    //      sDesktop:=reg.ReadString('Common Desktop'); // WinXP
    reg.CloseKey;
    reg.Free;
  end;

  CObject := CreateComObject(CLSID_ShellLink);
  ISLink := CObject as IShellLink;
  IPFile := CObject as IPersistFile;

  with ISLink do
  begin
    SetArguments('');
    SetPath(PChar(sFilename));
    SetWorkingDirectory(PChar(ExtractFilePath(sFilename)));
    if FileExists(sIconfile) then
      SetIconLocation(PChar(sIconfile),0); // set external icon
  end;
  wsFileName := sShortcut + '.lnk';
  sShortcutPath := ExtractFilePath(wsFilename);
  if sShortcutPath <> '' then
  begin
    if (sDesktop = Copy(sShortcutPath, 1,Length(sDesktop))) and
       (bAllowDesktopShortcuts = False) then
       Sleep(1)
    else
    begin
      frmMain.MakeDir(sShortcutPath);
      IPFile.Save(PWChar(wsFilename), False);

      // Save shortcuts so they can be uninstalled
      if bMakeUninst then
        slInstShortcuts.Add(sShortcut + '.lnk'); // for uninstall

      if sDesktop = Copy(sShortcutPath, 1,Length(sDesktop)) then
        SHChangeNotify(SHCNE_UPDATEDIR, SHCNF_PATH, PChar(sDesktop), nil);
      if sStartMenuPrograms = Copy(sShortcutPath, 1,Length(sStartMenuPrograms)) then
        SHChangeNotify(SHCNE_UPDATEDIR, SHCNF_PATH, PChar(sStartMenuPrograms), nil);

      // TODO: Update sMsgScs to match the actual happening... test if this works!
      if frmInstall <> nil then
      begin
        if sMsgScs = '' then
          sMsgScs := #13 + #10 + #13 + #10 + LanguageGo.sShortCuts1;
        if (iDesktopShortcuts > 0) and bDesktopShortcutChecked and
          frmInstall.lblDekstopIcon.AVisible then
          sMsgScs := #13 + #10 + #13 + #10 + LanguageGo.sShortCuts2;
      end;
    end;
  end;
{$ELSE}
Begin
{$ENDIF}
end; // CreatePhysicalShortcut

////////////////////////////////////////////////////////////////////////


// returns the next string in quotes after the ATag.
// eg. ('filename:', 'filename: "123.exe" xxx: "456"') will return 123.exe

function GetScriptNameValue(const ATag: string; line: string): string;
var
  lineLCase: string;
  StartPos: integer;
  EndPos: integer;
begin
  Result := '';
  lineLCase := LowerCase(line);
  StartPos := Pos(ATag, lineLCase);
  if StartPos > 0 then
  begin
    Delete(line, 1,StartPos + Length(ATag));
    Delete(lineLCase, 1,StartPos + Length(ATag));
    StartPos := Pos('"', lineLCase);
    if StartPos > 0 then
    begin
      Inc(StartPos); // skip first "
      EndPos := Pos('"', Copy(lineLCase, StartPos, Length(lineLCase)));
      if EndPos > 0 then
        Result := Copy(line, StartPos, EndPos - 1); // result, -1 = remove last "
    end;
  end;
end; // GetScriptNameValue

////////////////////////////////////////////////////////////////////////

// This procedure decodes the post install script and
// finds out if short cuts are made on the desktop or
// if uninstall is wanted.

procedure TfrmMain.CheckScript(script: string);
var
  i: integer;
  Line: string;
  LineLCase: string;
  sShortcut: string;
  Uninstalltype: string;
  sDisableWidows: string;
begin
  Line := '';
  script := script + #13; // so the last line get evaluated too
  for i := 1 to Length(script) do
  begin
    if (script[i] in [#13, #10]) then
    begin
      Line := Trim(Line);
      if Line <> '' then
      begin
        // a single line

        LineLCase := LowerCase(Line);

        if Copy(lineLCase, 1,16) = 'create shortcut:' then
        begin
          sShortcut := GetScriptNameValue('shortcut:', Line);
          if Copy(sShortcut, 1, Length('{desktop}')) = '{desktop}' then
            Inc(iDesktopShortcuts);
        end // create shortcut

        else if Copy(lineLCase, 1,14) = 'set uninstall:' then
        begin
          Uninstalltype := LowerCase(GetScriptNameValue('uninstall:', Line));
          bMakeUninst := Pos('full', Uninstalltype) > 0;
        end

        else if Copy(lineLCase, 1,14) = 'disable window:' then
        begin
          sDisableWidows := LowerCase(GetScriptNameValue('window:', Line));
          bDisableFinishMsg := Pos('FinishMsgBox', sDisableWidows) > 0;
          bDisableUnpackWin := Pos('Unpack', sDisableWidows) > 0;
          bDisableInstallWin := Pos('Install', sDisableWidows) > 0;
        end

        else if Copy(lineLCase, 1,21) = 'disable defaultaction' then
          bDisableDefaultAction := True;
      end;
      Line := '';
    end
    else
      Line := Line + script[i];
  end;
end; // CheckScript

////////////////////////////////////////////////////////////////////////

function IsMovieFile(const s: string) : boolean;
begin
  Result := (s = '.AVI') or (s = '.ASF') or (s = '.MPEG') or
            (s = '.MPG') or (s = '.MPE') or (s = '.WMV') or
            (s = '.MP4') or (s = '.MKV') or (s = '.DIVX');
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.CopyCurrentFile;
var
  Node: PVirtualNode;
  NodeData: PTreeData;
begin
  Node := VSTree.GetFirstSelected;
  if Node <> nil then
  begin
    NodeData := VSTree.GetNodeData(Node);
    if NodeData <> nil then
    begin
      SetInstallPath(NodeData.sPath);
      frmInstall.SetCopyData(NodeData);
      frmInstall.lblInstallTitle.Caption := LanguageGo.sCopyTo1 + ' ' + ExtractFilename(NodeData.sPgmName) + LanguageGo.sCopyTo2;
      frmUnpack.lblUnpackTitle.Caption := LanguageGo.sCopying1 + ' ' + ExtractFilename(NodeData.sPgmName) + LanguageGo.sCopying2;
      frmMain.Hide;
      frmInstall.Show;
    end;
  end;
end;

////////////////////////////////////////////////////////////////////////

// This procedure decodes the post install script.
// The following commands are available
// - Copy, Run, Set progresstext, Set finishtext

procedure TfrmMain.RunScript(script: string);
var
  i: integer;
  Line: string;
  LineLCase: string;
  RunFileName: string;
  RunParameters: string;
  RunWorkingDir: string;
  RunFlags: string;
  RunSize: integer; // SW_SHOWNORMAL, SW_SHOWMINIMIZED, SW_SHOWMAXIMIZED
  RunWait: boolean;
  DeleteFileName: string;
  sShortcut: string;
  sShortcutFilename: string;
  sShortcutIconfile: string;
  CopySource: string;
  CopyDest: string;
  CopyFlags: string;
  CopyOverWrite: boolean; // True = do overwrite
  UninstallFilename: string;
  sCopyToClipboard: string; // variable to copy to clipboard
  clbClipboard: TClipboard;
  sMusicPlayFilename: string;
  sMusicTitle: string;
  sFlags: string;
  sRegKey: string;
  sRegPath: string;
  sRegValue: string;
  sExt: string;
  sShowMessage: string;
begin
  blnDebugScript := False;
  Line := '';
  script := script + #13; // so the last line get evaluated too
  for i := 1 to Length(script) do
  begin
    if (script[i] in [#13, #10]) then
    begin
      Line := Trim(Line);
      if Line <> '' then
      begin
        // a single line

        LineLCase := LowerCase(Line);

        if blnDebugScript then
            ShowMessage('Script debugging - processing line: ´' + line);

        if Copy(lineLCase, 1,13) = 'run filename:' then
        begin
          RunFileName := ConvertPath(GetScriptNameValue('filename:', Line));
          RunParameters := ConvertPath(GetScriptNameValue('parameters:', Line));
          RunParameters := StringReplace(RunParameters, '&quote;', '"', [rfReplaceAll]);
          RunWorkingDir := ConvertPath(GetScriptNameValue('workingdir:', Line));
//          if RunWorkingDir = '' then
//            RunWorkingDir := ConvertPath('{destdir}');
          if not DirectoryExists(RunWorkingDir) then
            RunWorkingDir := '';

          RunFlags := LowerCase(GetScriptNameValue('flags:', Line));

          RunSize := SW_SHOWNORMAL;
          RunWait := True;
          if RunFlags <> '' then
          begin
            if Pos('minimized', RunFlags) > 0 then
              RunSize := SW_SHOWMINIMIZED
            else if Pos('maximized', RunFlags) > 0 then
              RunSize := SW_SHOWMAXIMIZED;
            if Pos('nowait', RunFlags) > 0 then
              RunWait := False;
          end;
          if blnDebugScript then
            ShowMessage('Script debugging - ExecuteFile("Open", Filename=' + RunFileName + ' , Parameter=' + RunParameters + ' , WorkingDir=' +  RunWorkingDir + ' , ' +  IntToStr(RunSize) + ' , ' +  BoolToStr(RunWait) + ');');
          SetCurrentDir(GoWinDir);
          ExecuteFile('Open', RunFileName, RunParameters, RunWorkingDir, RunSize, RunWait);
        end // run filename


        else if Copy(lineLCase, 1,16) = 'delete filename:' then
        begin
          DeleteFileName := GetScriptNameValue('filename:', Line);

          DeleteFileName := ConvertPath(DeleteFileName);
          // eg. change "{pf}\123.txt" to "C:\Program Files\123.txt"
          if FileExists(DeleteFileName) then
          begin
            DeleteFile(DeleteFileName);
            if FileExists(DeleteFileName) then
            begin
              {$IFDEF WIN32}
              SetFileAttributes(PChar(DeleteFileName), 0); // remove readonly attr
              {$ENDIF}
              DeleteFile(DeleteFileName);
            end;
          end;
        end // delete filename


        else if Copy(lineLCase, 1,16) = 'create shortcut:' then
        begin
          sShortcut := GetScriptNameValue('shortcut:', Line);
          sShortcut := ConvertPath(sShortcut);

          sShortcutFilename := GetScriptNameValue('filename:', Line);
          if Trim(sShortcutFilename) = '' then // folder
            sShortcutFilename := GetScriptNameValue('foldername:', Line);
          sShortcutFilename := ConvertPath(sShortcutFilename);

          sShortcutIconfile := GetScriptNameValue('iconfile:', Line);
          sShortcutIconfile := ConvertPath(sShortcutIconfile);

          if ((FileExists(sShortcutFilename)) or (DirectoryExists(sShortcutFilename)))and
            (sShortcut <> '') then
            CreatePhysicalShortcut(sShortcut, sShortcutFilename, sShortcutIconfile);
        end // create shortcut


        else if Copy(lineLCase, 1,12) = 'copy source:' then
        begin
          CopySource := ConvertPath(GetScriptNameValue('source:', Line));
          CopyFlags := LowerCase(GetScriptNameValue('flags:', Line));
          if Pos('overwrite', CopyFlags) > 0 then
            CopyOverWrite := True
          else
            CopyOverWrite := False;

          CopyDest := ConvertPath(GetScriptNameValue('destdir:', Line));
          if (Length(CopyDest) > 0) and (CopyDest[Length(CopyDest)] = '\') then
            Delete(CopyDest, Length(CopyDest), 1);

          if FileExists(CopySource) then
          begin
            if Length(CopyDest) > 0 then
            begin
              // eg. change "{pf}\123" to "C:\Program Files\123"
              if not DirectoryExists(CopyDest) then
                frmMain.MakeDir(CopyDest); // make folder if it does not exist
              if DirectoryExists(CopyDest) then
              begin
                CopyDest := CopyDest + '\' + ExtractFilename(CopySource);
                CopyFile(PChar(CopySource), PChar(CopyDest), not CopyOverWrite);
              end;
            end;
          end;
        end


        else if Copy(lineLCase, 1,17) = 'copy toclipboard:' then
        begin
          sCopyToClipboard := GetScriptNameValue('toclipboard:', Line);
          if sCopyToClipboard <> '' then
          begin
            clbClipboard := TClipboard.Create;
            clbClipboard.SetTextBuf(PChar(sCopyToClipboard));
            clbClipboard.Free;
          end;
        end // copy toclipboard


        else if Copy(lineLCase, 1,15) = 'set statustext:' then
          frmUnpack.lblAllFilesLabel.Caption := GetScriptNameValue('statustext:', Line)


        else if Copy(lineLCase, 1,15) = 'set finishtext:' then
          // {newline} = a new line
          sFinishText := StringReplace(GetScriptNameValue('finishtext:', Line),
            '{newline}', #13#10, [rfReplaceAll])

        else if Copy(lineLCase, 1,19) = 'uninstall filename:' then
        begin
          UninstallFilename := GetScriptNameValue('filename:', Line);
          UninstallFilename := ConvertPath(UninstallFilename);
          // eg. change "{pf}\123" to "C:\Program Files\123"
          if bMakeUninst and (UninstallFilename <> '') then
            slInstFiles.Add(UninstallFilename); // for uninstall
        end

        // Create RegistryString: "hklm/Software/Nikse/MIEdit"; Key: "StartUpFile"; Value: "Install.xml")
        else if Copy(lineLCase, 1,22) = 'create registrystring:' then
        begin
          sRegPath := GetScriptNameValue('registrystring:', Line);
          sRegKey := GetScriptNameValue('key:', Line);
          sRegvalue := GetScriptNameValue('value:', Line);
          ImportRegistryKey(sRegPath, sRegKey, ConvertPath(sRegValue));
        end

        else if Copy(lineLCase, 1,19) = 'musicplay filename:' then
        begin
          sMusicPlayFilename := ConvertPath(GetScriptNameValue('filename:', Line));
          sMusicPlayFilename := StringReplace(sMusicPlayFilename, '"', '', [rfReplaceAll]);
          if FileExists(sMusicPlayFilename) then
          begin
            sMusic_File := sMusicPlayFilename;
            sMusic_FileExt := UpperCase(ExtractFileExt(sMusicPlayFilename));
            MusicDoOpen;
            SetMusicTrackRadioButton(pmMusicTracks.Items, AnsiLowercase(sMusic_File));
            sMusicTitle := ExtractFilename(sMusic_File);
            sMusicTitle := Copy(sMusicTitle,
              1, Length(sMusicTitle) - Length(sMusic_FileExt));
            sMusicTitle := StringReplace(sMusicTitle, '_', ' ', [rfReplaceAll]);
            DrawMusicTitle(sMusic_File, sMusicTitle);
          end;
        end
        else if Copy(lineLCase, 1,14) = 'play filename:' then
        begin
          sMusicPlayFilename := ConvertPath(GetScriptNameValue('filename:', Line));
          sMusicPlayFilename := StringReplace(sMusicPlayFilename, '"', '', [rfReplaceAll]);
          sFlags := LowerCase(GetScriptNameValue('flags:', Line));
          SetCurrentDir(GoWinDir);
          if FileExists(sMusicPlayFilename) then
          begin
            sExt := UpperCase(ExtractFileExt(sMusicPlayFilename));
            if IsMusicMod(sExt) or IsMusicStream(sExt) then
            begin
              sMusic_File := sMusicPlayFilename;
              sMusic_FileExt := sExt;
              MusicDoOpen;
              SetMusicTrackRadioButton(pmMusicTracks.Items, AnsiLowercase(sMusic_File));
              sMusicTitle := ExtractFilename(sMusic_File);
              sMusicTitle := Copy(sMusicTitle,
                1, Length(sMusicTitle) - Length(sMusic_FileExt));
               sMusicTitle := StringReplace(sMusicTitle, '_', ' ', [rfReplaceAll]);
              DrawMusicTitle(sMusic_File, sMusicTitle);
            end
            else if IsMovieFile(sExt) then
            begin
              if imgEmpty.Visible then
                imgEmpty.Visible := False;
              if imgPicture.Visible then
                imgPicture.Visible := False;
              if not PanelMP1.Visible then
                PanelMP1.Visible := True;
              PanelMP1.BringToFront;

              loadMediaFile(sMusicPlayFilename, PanelMP1.Handle);
              if MediaStreamAvailable then
              try
                if VideoAvailable then
                begin
                  Application.ProcessMessages;
                  setVideoPos(0, 0, PanelMP1.Width, PanelMP1.Height);
                  Application.ProcessMessages;
                end
                else
                  PanelMP1.Visible:=false;
                Application.ProcessMessages;
                playMediaStream;
              except
              end;
              if Pos('fullscreen', sFlags) > 0 then
              begin
                setFullScreenVideo(true);
              end;
            end;
          end;
        end

        else if Copy(lineLCase, 1,19) = 'musicplay stop' then
        begin
          if bBassDllLoaded then
            mnuMusicPlayStopClick(frmMain);
        end

        else if Copy(lineLCase, 1, 16) = 'copy archivefile' then
          CopyCurrentFile

        else if Copy(lineLCase, 1,13) = 'show message:' then
        begin
          sShowMessage := ConvertPath(GetScriptNameValue('message:', Line));
          if frmMsgBox <> nil then
            frmMsgBox.MsgBox(sShowMessage, mtInformation, [mbOK], 0);
        end // show message

        else if Copy(lineLCase, 1,10) = 'debug=true' then
        begin
          blnDebugScript := True;
        end

      end;
      Line := '';
    end
    else
      Line := Line + script[i];
  end;
  SetCurrentDir(GoWinDir);
end; // RunScript

////////////////////////////////////////////////////////////////////////

function TfrmMain.GetMultilineTag(const ATag: string;
                                        s: string;
                                  var   fileend: Boolean): string;
var
  ncount: integer;
  sRunScript: string;
begin
  ncount := 1;
  Delete(s, 1, Length(ATag)+2); // 11 = Length(<runscript>)
  repeat
    if ncount > 1 then
      s := ReadMILine(fileend);
    if Copy(s, Length(s) - (Length(ATag)+2), Length(ATag)+3) = '</'+ATag+'>' then
    begin
      Delete(s, Length(s) - (Length(ATag)+2), Length(ATag)+3);
      if ncount = 1 then
        sRunScript := EscDecodeStr(s)
      else
        sRunScript := sRunScript + #13#10 + EscDecodeStr(s);
      ncount := 9999;
    end
    else if ncount = 1 then
      sRunScript := EscDecodeStr(s)
    else
      sRunScript := sRunScript + #13#10 + EscDecodeStr(s);
    Inc(ncount);
  until (fileend) or (ncount >= 9999);

  Result:=sRunScript;
end; // GetMultilineTag

////////////////////////////////////////////////////////////////////////

function TfrmMain.UnpackResGoData(unpackfolder: string): string;
var
  unpackfile: string;
  buffer: array[0..MAX_PATH] of char;
begin
  unpackfile := '';

  if FindResource(HInstance, 'GODATA_NAME', RT_RCDATA) > 0 then
  begin
    GodataStream := TResourceStream.Create(HInstance, 'GODATA_NAME', RT_RCDATA);
    GodataStream.Read(buffer, GodataStream.Size);
    buffer[GodataStream.Size] := Char(0);
    GodataStream.Free;
    unpackfile := unpackfolder + StrPas(buffer);
  end;

  if FileExists(unpackfile) then
  begin
    try
      DeleteFile(unpackfile);
    except
      unpackfile:= '';
    end;
  end;

  if not FileExists(unpackfile) then
  begin
    try
      if FindResource(HInstance, 'GODATA', RT_RCDATA) > 0 then
      begin
        GodataStream := TResourceStream.Create(HInstance, 'GODATA', RT_RCDATA);
        GodataStream.SaveToFile(unpackfile);
        GodataStream.Free;
      end
      else
        unpackfile := '';
    except
      unpackfile:= '';
    end;
  end;

  UnpackResGoData := unpackfile;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.FormCreate(Sender: TObject);
  // Initialization: Read XML file and initialize variables
var
  datpwd: string;
  datfname: string;
  s: string;
  tagvalue: string;
  i: integer;
  SRec: TSearchRec;
  valI, valCode: integer;
  showsplash: boolean;
  usepwd: boolean;
  fileend: boolean;
  encsavepwd: boolean;
  TempDir: array[0..MAX_PATH] of char;
  reg: TRegistry;
  cdlabel: string;
  pwdfromreg: boolean;
  respath: string;
  iconList: TStringList;
  rootNode: PVirtualNode;
  Node: PVirtualNode;
  NodeData: PTreeData;
  sTempDatfile: string;
begin
  Application.OnException := MyExceptionHandler;
  blnDebugScript := False;
  Spectrum := nil;
  OcilloScope := nil;

  SkinLoadTryCount := 0;
  {$IFNDEF FPC}
  SkinZipFile := nil;
  {$ENDIF}
  bLoading := True;
  sTBName := Application.Title;
  Application.Title := '';
  runfromtemp := False;

  // Read the parameters (if any)
  if ParamCount = 1 then
    datfname := ParamStr(1) // set file AName = parameter
  else if ParamCount = 2 then
  begin
    datfname := ParamStr(1); // set file AName = parameter
    respath := ExtractFilePath(datfname);
    datpwd := ParamStr(2);
    if UpperCase(Copy(datpwd, 1,2)) = '-P' then
    begin
      Delete(datpwd, 1,2);
      runfromtemp := True;
    end
    else if UpperCase(Copy(datpwd, 1,9)) = '-FROMTEMP' then
    begin
      runfromtemp := True;
      datpwd := '';
    end
    else
      datpwd := '';
  end
  else
    datfname := 'install.xml'; // default file AName

  // Get Temporary Directory
  GoWinDir := GetCurrentDir;
  if GoWinDir[Length(GoWinDir)] = '\' then
    Delete(GoWinDir, Length(GoWinDir), 1);
  try
    TempDir:=GetTempDir(False);
    tmpdir := StrPas(TempDir);
    if tmpdir[Length(tmpdir)] <> '\' then
      tmpdir := tmpdir + '\'
  except
    tmpdir := 'c:\temp\';
  end;
  if not DirectoryExists(tmpdir) then
    MakeDir(tmpdir);

  // set current path to same dir as this executable
  SetCurrentDir(ExtractFilePath(Application.ExeName));

  // Exit if program is already running
  showsplash := False;
  {$IFNDEF FPC}
  if GlobalFindAtom('MI24') = 0 then
  begin // not second instance
    atom := GlobalAddAtom('MI22');
    secondinstance := False;

    if FileExists(GoWinDir + '\splash.jpg') or
       FileExists(GoWinDir + '\splash.gif') or
       FileExists(GoWinDir + '\splash.bmp') or
       FileExists(GoWinDir + '\splash.png') then
    begin
      Application.CreateForm(TfrmSplashScreen, frmSplashScreen);
      frmSplashScreen.Show; // Show Splash screen
      frmSplashScreen.Refresh;
      showsplash := True;
    end
  end
  else
  {$ENDIF}
  begin // Second instance - exit program
    secondinstance := True;
    frmMain.Width := 1;
    frmMain.Height := 1;
    Application.Terminate;
    Exit;
  end;


  // check if layout exists in resource file
  sTempDatfile := UnpackResGoData(tmpdir);
  if sTempDatfile <> '' then
    datfname := sTempDatfile


  // if any other install.xml is present - we'll use it
  else if FindFirst(datfname, $0000003F, SRec) = 0 then // $0000003F = Any file
//    datfname := SRec.Name
      // if not install.xml is present we will use the first other XML file present
  else if FindFirst('*.xml', $0000003F, SRec) = 0 then // $0000003F = Any file
  begin
    if (UpperCase(Copy(SRec.Name, 1,5)) = 'UNINS') then
    begin // ignore any file starting with "unins"
      while (UpperCase(Copy(SRec.Name, 1,5)) = 'UNINS') and
        (FindNext(SRec) = 0) do
      begin
        if (UpperCase(Copy(SREC.Name, 1,5)) <> 'UNINS') then
          datfname := SRec.Name
      end;
    end
    else
      datfname := SRec.Name;
  end;
  if (not FileExists(datfname)) and (FindFirst('*.dat', $0000003F, SRec) = 0) then
  // $0000003F = Any file
  begin
    if (UpperCase(Copy(SRec.Name, 1,5)) = 'UNINS') then
    begin // ignore any file starting with "unins"
      while (UpperCase(Copy(SRec.Name, 1,5)) = 'UNINS') and
        (FindNext(SRec) = 0) do
      begin
        if (UpperCase(Copy(SRec.Name, 1,5)) <> 'UNINS') then
          datfname := SRec.Name
      end;
    end
    else
      datfname := SRec.Name;
  end;
  FindClose(SRec);


  if runfromtemp then
    unpackdllpath := tmpdir;

  // Copy to hd and run?
  s := Copy(GoWindir, 1,2);
  if (not runfromtemp) and (FileExists('MultiCD.*') or FileExists('MultiDVD.*'))
   {$IFDEF WINDOWS}  and (GetDriveType(PChar(s)) = 5){$ENDIF} then // on cd/dvd
  begin
    frmMain.Width := 1;
    frmMain.Height := 1;
    {$IFDEF WINDOWS}
    GlobalDeleteAtom(atom); // remove lock
    {$ENDIF}

    s := GoWinDir + '\' + datfname;
    try
      if not showsplash then
      begin
        Application.CreateForm(TfrmDecrypt, frmDecrypt);
        frmDecrypt.lblDecrypt.Caption := 'Loading...';
        frmDecrypt.ProgressBar.Max := 100;
        frmDecrypt.ProgressBar.Position := 5;
        frmDecrypt.Show;
        frmDecrypt.Refresh;
      end;

      FileToTemp(ExtractFileName(Application.ExeName), tmpdir, True);

      if not showsplash then
        frmDecrypt.ProgressBar.Position := 30;

      FileToTemp('unrar.dll', tmpdir, false);
      if not showsplash then
        frmDecrypt.ProgressBar.Position := 40;

      FileToTemp('unacev2.dll', tmpdir, false);
      if not showsplash then
        frmDecrypt.ProgressBar.Position := 60;

      ExecuteFile('Open', tmpdir + ExtractFileName(Application.ExeName),
        '"' + s + '" -FROMTEMP', '', SW_SHOWNORMAL, False);
      if not showsplash then
      begin
        frmDecrypt.ProgressBar.Position := 90;
        Sleep(1000); // wait 1 sec
      end;
      if not showsplash then
        frmDecrypt.ProgressBar.Position := 100;

      if not showsplash then
        frmDecrypt.Free;

      secondinstance := True; // Do not unregister global atom
      Application.Terminate;
      Exit;
    except
      Sleep(2000);
      ExecuteFile('Open', tmpdir + ExtractFileName(Application.ExeName),
        '"' + s + '" -FROMTEMP', '', SW_SHOWNORMAL, False);
      Application.Terminate;
      Exit;
    end;
  end;

  {$IFDEF WINDOWS}
  if (not runfromtemp) {$IFDEF WINDOWS}and (GetDriveType(PChar(s)) <> 5){$ENDIF} then // 5 = cd/dvd
    GlobalDeleteAtom(atom); // remove lock
  {$ENDIF}
  VSTree.NodeDataSize := SizeOf(VTreeData);
  VSTree.TreeOptions.PaintOptions := VSTree.TreeOptions.PaintOptions + [toShowBackground];

  filesToDelete := TStringList.Create;
  foldersToDelete := TStringList.Create;

  {$IFDEF DELPHI}
  ZipMaster1.DllDirectory := '><';
  ZipMaster1.Dll_Load := True;
  ZipMaster1.Unattended := True;
  ZipMaster1.Unattended := False;
  {$ENDIF}

  frmMain.Width := 713;
  frmMain.Height := 521;

  bShowCustom1 := False;
  bShowCustom2 := False;
  bShowCustom3 := False;
  bShowCustom4 := False;
  bShowCustom5 := False;
  bShowCDno := True;
  bShowMore := True;
  bShowScreenShots := True;

  pwdfromreg := False;
  sCurPic := '';
  iCurPicIdx := -1;
  lblHandle.Caption := '';
  lblTitle.Caption := '';
  ArchiveDir := 'Data';
  ArchiveDirB := 'Data\';
  MoreDir := 'More';
  MoreDirB := 'More\';
  bMusicAutoStart := True;
  bMusicLoop := True;
  bMusicLoopRandom := False;
  sMusicFirstFile := '';
  sMusicFolder := 'Music';
  encsavepwd := False;
  bStretchToFit := False;
  bScreenshotZoomed := False;
  bScreenshotShowInNewWindowOnClick := False;
  iconList := TStringList.Create;
  DefFontName := frmMain.Font.Name;

  rootNode := nil;
  NodeData := nil;
  DescrUrls := TStringList.Create;
  NoteUrls := TStringList.Create;
  QuickInfoUrls := TStringList.Create;
  iTreeviewSortMode := 0;
  iStreamLoopMode := 0; // No looping of current track per default
  bAllowDesktopShortcuts := True;

  SetDefaultTexts; // load strings

  // if os is xp or newer then use 32 bit color images - will also be alpha blended!
  {$IFDEF DELPHI}
  if XpOrNewer then
    ImageListIcons.Handle := ImageList_Create(32, 32, ILC_COLOR32 or ILC_MASK, 4, 4);
  {$ENDIF}

  bDecrypt := False;
  if Uppercase(ExtractFileExt(datfname)) = '.DAT' then
  begin
    usepwd := True;
    fileend := False;
    bDecrypt := True;

    // does pwd exist in registry
    if datpwd = '' then
    begin
      cdlabel := GetLabel(GoWinDir[1]);
      try
        reg := TRegistry.Create;
        with reg do
        begin
          RootKey := HKEY_CURRENT_USER;
          OpenKeyReadonly('Software\Nikse\Multi Install');
          datpwd := ReadString(cdlabel);
          s := datpwd;
          for i := 1 to Length(s) do
            datpwd[i] := char(Ord(s[Length(s) + 1 - i]) + (25 - (Length(s) - i + 1)));
        end;
        reg.CloseKey;
        reg.Free;
      except
      end;
      if datpwd <> '' then
        pwdfromreg := True;
    end;

    Application.CreateForm(TfrmDecrypt, frmDecrypt);
    if showsplash then
      frmDecrypt.Top := frmDecrypt.Top - 33 +
        (frmSplashScreen.Height div 2);
    if datpwd = '' then
      frmDecrypt.SetPassword('Enter password for decryption:')
    else
      frmDecrypt.Pwd := datpwd;

    //    -- If you want to make your own installer it is probably a good idea
    //    -- to change the password/encryption/descryption stuff a bit so users
    //    -- will not be able to open the layout in MI Edit with the password
    //    -- for the client.
    //    -- An easy way to do this is allways to make the password start with a
    //    -- secret string 'XXXXX' - so in MI Edit you use 'XXXXXmymenu' and the
    //    -- users just use 'mymenu'.
    //    -- Uncomment the next line to make the adjustment:
    //    if datpwd <> '' then datpwd:='XXXXX' + datpwd;


    if Trim(frmDecrypt.Pwd) = '' then
    begin
      frmMain.Width := 1;
      frmMain.Height := 1;
      if sTempDatfile <> '' then
      begin
        try
          DeleteFile(sTempDatfile);
        except
        end;
      end;
      if showsplash then
        frmSplashScreen.Free;
      Application.Terminate;
      Exit;
    end;

    frmDecrypt.Show; // Show Descrypt screen
    if showsplash then
      frmSplashScreen.Refresh;
    frmDecrypt.Refresh;
    frmDecrypt.DecryptOpen(datfname);
    fileend := frmDecrypt.GetEof;
  end
  else
  begin
    usepwd := False;
    {$I-}
    AssignFile(datfile, datfname);
    FileMode := 0; // readonly
    Reset(datfile);
    {$I+}
    if IOResult <> 0 then
    begin
      frmMain.Width := 1;
      frmMain.Height := 1;
      MessageDlg('Unable to open ' + datfname + '!', mtError, [mbOK], 0);
      Application.Terminate;
      Exit;
    end
    else
      fileend := EOF(datfile);
  end;

  VSTree.BeginUpdate;
  i := -1;
  try
    while not fileend do
    begin
      s := ReadMILine(fileend);
      if (Length(s) <= 4) and (not fileend) then
        s := ReadMILine(fileend);

      if Uppercase(s) = '<PROGRAM>' then
      begin
        s := ReadMILine(fileend);

        Inc(i); // go to next program

        Node := VSTree.AddChild(rootNode); //adds a node to the root of the Tree
        NodeData := VSTree.GetNodeData(Node);
        NodeData.iAbsoluteIndex := i;
        NodeData.bCategory := False;
        NodeData.sSize := '? ' + LanguageGo.sMB;
        NodeData.sScript := '';
        NodeData.sCustomField1 := '';
        NodeData.sCustomField2 := '';
        NodeData.sCustomField3 := '';
        NodeData.sCustomField4 := '';
        NodeData.sCustomField5 := '';
        NodeData.sPgmName := '';
        NodeData.slScreenShots := nil;
        NodeData.sCDno := '-';
        NodeData.sArchivePwd := '';
        NodeData.sGoButton := 'Install';
        NodeData.iIcon := -1;
        NodeData.iIconEx := -1;
        NodeData.sDescr := '';
        NodeData.sNote := '';

        repeat
          if Uppercase(Copy(s, 1,7)) = '<DESCR>' then
            NodeData.sDescr := GetMultilineTag('DESCR', s, fileend)

          else if Uppercase(Copy(s, 1,6)) = '<NOTE>' then
            NodeData.sNote := GetMultilineTag('NOTE', s, fileend)

          else if IsTag(s, 'INSTALLPATH', tagvalue) then
            NodeData.sPath := tagvalue
          else if IsTag(s, 'PGMNAME', tagvalue) then
            NodeData.sPgmName := PathLoadConvert(tagvalue)
          else if IsTag(s, 'MORE', tagvalue) then
            NodeData.sMore := PathLoadConvert(EscDecodeStr(tagvalue))
          else if IsTag(s, 'CUSTOM1', tagvalue) then
            NodeData.sCustomField1 := EscDecodeStr(tagvalue)
          else if IsTag(s, 'CUSTOM2', tagvalue) then
            NodeData.sCustomField2 := EscDecodeStr(tagvalue)
          else if IsTag(s, 'CUSTOM3', tagvalue) then
            NodeData.sCustomField3 := EscDecodeStr(tagvalue)
          else if IsTag(s, 'CUSTOM4', tagvalue) then
            NodeData.sCustomField4 := EscDecodeStr(tagvalue)
          else if IsTag(s, 'CUSTOM5', tagvalue) then
            NodeData.sCustomField5 := EscDecodeStr(tagvalue)
          else if IsTag(s, 'CDNO', tagvalue) then
            NodeData.sCDno := EscDecodeStr(tagvalue)
          else if IsTag(s, 'ICON', tagvalue) then
          begin
            Val(tagvalue, valI, valCode);
            if valCode = 0 then
              NodeData.iIcon := valI;
          end
          else if Uppercase(Copy(s, 1,13)) = '<SCREENSHOTS>' then
          begin // Icons
            NodeData.slScreenShots := TStringList.Create;
            repeat
              if IsTag(s, 'FILENAME', tagvalue) then
                NodeData.slScreenShots.add(PathLoadConvert(EscDecodeStr(tagvalue)));
              s := ReadMILine(fileend);
            until (fileend) or (Trim(s) = '</SCREENSHOTS>');
          end // Screenshots

          else if IsTag(s, 'ARCHIVE_PWD', tagvalue) then
            NodeData.sArchivePwd := EscDecodeStr(tagvalue)
          else if IsTag(s, 'GOBUTTON', tagvalue) then
            NodeData.sGoButton := tagvalue
          else if IsTag(s, 'SIZE', tagvalue) then
            NodeData.sSize := EscDecodeStr(tagvalue)
          else if IsTag(s, 'AName', tagvalue) then
            NodeData.wsText := EscDecodeStr(tagvalue)
          else if Uppercase(Copy(s, 1,8)) = '<SCRIPT>' then
            NodeData.sScript := EscDecodeStr(GetMultilineTag('SCRIPT', s, fileend));

          s := ReadMILine(fileend);
        until fileend or (uppercase(s) = '</PROGRAM>');
      end; // <PROGRAM>

      if Uppercase(Copy(s, 1,10)) = '<CATEGORY>' then
      begin // Category
        Inc(i); // go to next program

        rootNode := VSTree.AddChild(rootNode); //adds a node to the root of the Tree
        NodeData := VSTree.GetNodeData(rootNode);
        NodeData.iAbsoluteIndex := i;
        NodeData.bCategory := True;
        NodeData.sSize := '? ' + LanguageGo.sMB;
        NodeData.sScript := '';
        NodeData.sCustomField1 := '';
        NodeData.sCustomField2 := '';
        NodeData.sCustomField3 := '';
        NodeData.sCustomField4 := '';
        NodeData.sCustomField5 := '';
        NodeData.sPgmName := '';
        NodeData.slScreenShots := nil;
        NodeData.sCDno := '-';
        NodeData.sArchivePwd := '';
        NodeData.sGoButton := 'Install';
        NodeData.iIcon := -1;
        NodeData.iIconEx := -1;
        NodeData.sDescr := '';

        s := ReadMILine(fileend);
        if IsTag(s, 'AName', tagvalue) then
          NodeData.wsText := EscDecodeStr(tagvalue);
      end

      else if Uppercase(Copy(s, 1,11)) = '</CATEGORY>' then // end Category
        rootNode := rootNode.Parent

      else if IsTag(s, 'ICON', tagvalue) then
      begin
        Val(tagvalue, valI, valCode);
        if valCode = 0 then
          NodeData.iIcon := valI;
      end

      else if IsTag(s, 'ICONEX', tagvalue) then
      begin // Category icon Expanded
        Val(tagvalue, valI, valCode);
        if valCode = 0 then
          NodeData.iIconEx := valI;
      end

      else if IsTag(s, 'PICTURE', tagvalue) then
      begin // Category picture
        NodeData.slScreenShots := TStringList.Create;
        NodeData.slScreenShots.Add(PathLoadConvert(tagvalue));
      end

      else if Uppercase(Copy(s, 1,16)) = '<CATEGORY_DESCR>' then
        NodeData.sDescr := GetMultilineTag('CATEGORY_DESCR', s, fileend)

      else if Uppercase(s) = '<HEADER>' then
      begin
        s := ReadMILine(fileend);
        repeat
          if IsTag(s, 'TITLE', tagvalue) then
            lblTitle.Caption := EscDecodeStr(tagvalue)

          else if IsTag(s, 'HANDLE', tagvalue) then
            lblHandle.Caption := EscDecodeStr(tagvalue)

          else if IsTag(s, 'TASKBARNAME', tagvalue) then
            Application.Title := EscDecodeStr(tagvalue)

          else if Uppercase(Copy(s, 1,7)) = '<ICONS>' then
          begin // Icons
            Delete(s, 1,7);
            repeat
              if IsTag(s, 'AName', tagvalue) then
                iconList.Add(tagvalue)
              else if IsTag(s, 'ICONWIDTH', tagvalue) then
              begin
                Val(tagvalue, valI, valCode);
                if valCode = 0 then
                  ImageListIcons.Width := valI;
              end
              else if IsTag(s, 'ICONHEIGHT', tagvalue) then
              begin
                Val(tagvalue, valI, valCode);
                if valCode = 0 then
                begin
                  ImageListIcons.Height := valI;
                  VSTree.DefaultNodeHeight := valI;
                end;
              end;
              s := ReadMILine(fileend);
            until fileend or (Trim(s) = '</ICONS>');
          end // Icons

          else if IsTag(s, 'RESOURCEFILE', tagvalue) then
            resourcefile := tagvalue

          else if IsTag(s, 'RESOURCEPWD', tagvalue) then
            resourcepwd := tagvalue

          else if IsTag(s, 'SHOWCUSTOM1', tagvalue) then
            bShowCustom1 := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SHOWCUSTOM2', tagvalue) then
            bShowCustom2 := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SHOWCUSTOM3', tagvalue) then
            bShowCustom3 := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SHOWCUSTOM4', tagvalue) then
            bShowCustom4 := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SHOWCUSTOM5', tagvalue) then
            bShowCustom5 := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SHOWCDNO', tagvalue) then
            bShowCDno := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SHOWSCREENSHOTS', tagvalue) then
            bShowScreenShots := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SHOWMORE', tagvalue) then
            bShowMore := UpperCase(tagvalue) = 'YES'

          else if Uppercase(Copy(s, 1,8)) = '<MESSAGE' then
          begin // Message
            case Ord(s[9]) of
              Ord('1'): msgstr[1] := EscDecodeStr(GetTagValue(s, 'MESSAGE1'));
              Ord('2'): msgstr[2] := EscDecodeStr(GetTagValue(s, 'MESSAGE2'));
              Ord('3'): msgstr[3] := EscDecodeStr(GetTagValue(s, 'MESSAGE3'));
              Ord('4'): msgstr[4] := EscDecodeStr(GetTagValue(s, 'MESSAGE4'));
              Ord('5'): msgstr[5] := EscDecodeStr(GetTagValue(s, 'MESSAGE5'));
              Ord('6'): msgstr[6] := EscDecodeStr(GetTagValue(s, 'MESSAGE6'));
              Ord('7'): msgstr[7] := EscDecodeStr(GetTagValue(s, 'MESSAGE7'));
            end;
          end // Message

          else if IsTag(s, 'ARCHIVEDIR', tagvalue) then
          begin
            ArchiveDir := Trim(PathLoadConvert(tagvalue));
            if (Length(ArchiveDir) > 0) and (ArchiveDir[Length(ArchiveDir)] <> '\') then
              ArchiveDirB := ArchiveDir + '\'
            else
              ArchiveDirB := ArchiveDir;
          end

          else if IsTag(s, 'MOREDIR', tagvalue) then
          begin
            MoreDir := Trim(PathLoadConvert(tagvalue));
            if (Length(MoreDir) > 0) and (MoreDir[Length(MoreDir)] <> '\') then
              MoreDirB := MoreDir + '\'
            else
              MoreDirB := MoreDir;
          end

          else if Uppercase(Copy(s,1,15)) = '<STARTUPSCRIPT>' then
            sStartupScript := GetMultilineTag('STARTUPSCRIPT', s, fileend)

          else if Uppercase(Copy(s,1,12)) = '<EXITSCRIPT>' then
            sExitScript := GetMultilineTag('EXITSCRIPT', s, fileend)

          else if IsTag(s, 'CUSTOM1', tagvalue) then
            LanguageGo.sCustom1 := EscDecodeStr(tagvalue)
          else if IsTag(s, 'CUSTOM2', tagvalue) then
            LanguageGo.sCustom2 := EscDecodeStr(tagvalue)
          else if IsTag(s, 'CUSTOM3', tagvalue) then
            LanguageGo.sCustom3 := EscDecodeStr(tagvalue)
          else if IsTag(s, 'CUSTOM4', tagvalue) then
            LanguageGo.sCustom4 := EscDecodeStr(tagvalue)
          else if IsTag(s, 'CUSTOM5', tagvalue) then
            LanguageGo.sCustom5 := EscDecodeStr(tagvalue)

          else if IsTag(s, 'MUSICAUTOSTART', tagvalue) then
            bMusicAutoStart := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'MUSICLOOP', tagvalue) then
            bMusicLoop := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'MUSICLOOPRANDOM', tagvalue) then
            bMusicLoopRandom := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'MUSICLOOPCURRENT', tagvalue) then
          begin
            if UpperCase(tagvalue) = 'YES' then
              iStreamLoopMode := BASS_SAMPLE_LOOP;
          end

          else if (IsTag(s, 'MUSICFIRSTFILE', tagvalue)) then
            sMusicFirstFile := tagvalue

          else if (IsTag(s, 'MUSICFOLDER', tagvalue)) then
            sMusicFolder := ConvertPath(tagvalue)

          else if (IsTag(s, 'MUSICUSEID3', tagvalue)) then
            bMusicUseID3 := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SAVEENCPWD', tagvalue) then
            encsavepwd := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'STRETCHTOFIT', tagvalue) then
            bStretchToFit := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SSCENTERONMOUSEOVER', tagvalue) then
            bScreenshotZoomed := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SSFULLSIZEONCLICK', tagvalue) then
            bScreenshotShowInNewWindowOnClick := UpperCase(tagvalue) = 'YES'

          else if IsTag(s, 'SHOWBUTTONHINTS', tagvalue) then
          begin
            if UpperCase(tagvalue) = 'YES' then
            begin
              imgPrev.ShowHint:=True;
              imgNext.ShowHint:=True;
              imgNFO.ShowHint:=True;
              imgMore.ShowHint:=True;
              imgSearch.ShowHint:=True;
              imgRun.ShowHint:=True;
              imgInstall.ShowHint:=True;
              imgPlay.ShowHint:=True;
              imgView.ShowHint:=True;
              imgPlayerOpen.ShowHint:=True;
              imgPlayerRew.ShowHint:=True;
              imgPlayerStop.ShowHint:=True;
              imgPlayerPause.ShowHint:=True;
              imgPlayerPlay.ShowHint:=True;
              imgPlayerForward.ShowHint:=True;
              imgAniGif.ShowHint:=True;
            end;
          end

          else if (IsTag(s, 'TREEVIEWEXPANDED', tagvalue)) and
            (UpperCase(tagvalue) = 'YES') then
            VSTree.TreeOptions.AutoOptions :=
              VSTree.TreeOptions.AutoOptions + [toAutoExpand]

          else if (IsTag(s, 'TREEVIEWHOTTRACK', tagvalue)) and
            (UpperCase(tagvalue) = 'YES') then
            VSTree.TreeOptions.PaintOptions :=
              VSTree.TreeOptions.PaintOptions + [toHotTrack]

          else if (IsTag(s, 'TREEVIEWSORTING', tagvalue)) and
            (UpperCase(tagvalue) = 'YES') then
            VSTree.PopupMenu := PopupMenuTreeview

          else if (IsTag(s, 'ALLOWCOPYTOCLIPBOARD', tagvalue)) and
            (UpperCase(tagvalue) = 'NO') then
          begin
            RichViewDescr.AllowSelection := False;
            RichViewDescr.PopupMenu := nil;

            RichViewNote.AllowSelection := False;
            RichViewNote.PopupMenu := nil;

            mirvQuickInfo.AllowSelection := False;
            mirvQuickInfo.PopupMenu := nil;
          end

          else if (IsTag(s,'SKIN_NAME', tagvalue)) then
             SkinName := tagvalue

          else if Uppercase(s) = '<LANGUAGE>' then
          begin
            LanguageGo.bActive := True;
            s := ReadMILine(fileend);
            begin
              repeat
                if IsTag(s, 'INSTALL', tagvalue) then
                  LanguageGo.sInstall := EscDecodeStr(tagvalue)
                else if IsTag(s, 'NFO', tagvalue) then
                  LanguageGo.sNFO := EscDecodeStr(tagvalue)
                else if IsTag(s, 'PLAY', tagvalue) then
                  LanguageGo.sPlay := EscDecodeStr(tagvalue)
                else if IsTag(s, 'VIEW', tagvalue) then
                  LanguageGo.sView := EscDecodeStr(tagvalue)
                else if IsTag(s, 'SORTBY', tagvalue) then
                  mnuTVSortBy.Caption := EscDecodeStr(tagvalue)
                else if IsTag(s, 'SORTBYCATEGORY', tagvalue) then
                  mnuOrderByCategory.Caption := EscDecodeStr(tagvalue)
                else if IsTag(s, 'SORTBYTITLE', tagvalue) then
                  mnuOrderByTitle.Caption := EscDecodeStr(tagvalue)
                else if IsTag(s,'SEARCHTITLE', tagvalue) then
                  LanguageGo.sSearchTitle :=EscDecodeStr(tagvalue)
                else if IsTag(s,'SEARCHTITLESONLY', tagvalue) then
                  LanguageGo.sSearchTitlesOnly:=EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNKNOWNSIZE', tagvalue) then
                  LanguageGo.sUnknownSize := EscDecodeStr(tagvalue)
                else if IsTag(s, 'YES', tagvalue) then
                  LanguageGo.sYes := EscDecodeStr(tagvalue)
                else if IsTag(s, 'NO', tagvalue) then
                  LanguageGo.sNo := EscDecodeStr(tagvalue)
                else if IsTag(s, 'MINIMIZE', tagvalue) then
                begin
                  mnuMinimize.Caption := EscDecodeStr(tagvalue);
                  mnuMinimize2.Caption := EscDecodeStr(tagvalue);
                  imgMinimize.ShowHint := True;
                  imgMinimize.Hint := StringReplace(EscDecodeStr(tagvalue),
                    '&', '', [rfReplaceAll]);
                end
                else if IsTag(s,'EXIT', tagvalue) then
                begin
                  mnuExit.Caption := EscDecodeStr(tagvalue);
                  mnuExit2.Caption := EscDecodeStr(tagvalue);
                end
                else if IsTag(s, 'CLOSE', tagvalue) then
                begin
                  imgClose.ShowHint := True;
                  imgClose.Hint := StringReplace(EscDecodeStr(tagvalue), '&',
                    '', [rfReplaceAll]);
                end
                else if IsTag(s, 'INSTALLOF1', tagvalue) then
                  LanguageGo.sInstallOf1 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'INSTALLOF2', tagvalue) then
                  LanguageGo.sInstallOf2 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'INSERTDISC', tagvalue) then
                  LanguageGo.sInsertDisc := EscDecodeStr(tagvalue)
                else if IsTag(s, 'ADDICON', tagvalue) then
                  LanguageGo.sAddIcon := EscDecodeStr(tagvalue)
                else if IsTag(s, 'ADDICONS', tagvalue) then
                  LanguageGo.sAddIcons := EscDecodeStr(tagvalue)
                else if IsTag(s, 'SPACEAVAIL', tagvalue) then
                  LanguageGo.sSpaceAvail := EscDecodeStr(tagvalue)
                else if IsTag(s, 'SPACEREQ', tagvalue) then
                  LanguageGo.sSpaceReq := EscDecodeStr(tagvalue)
                else if IsTag(s, 'FINISH', tagvalue) then
                  LanguageGo.sFinish := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNPACKING1', tagvalue) then
                  LanguageGo.sUnpacking1 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNPACKING2', tagvalue) then
                  LanguageGo.sUnpacking2 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'COPYTO1', tagvalue) then
                  LanguageGo.sCopyTo1 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'COPYTO2', tagvalue) then
                  LanguageGo.sCopyTo2 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'COPYING1', tagvalue) then
                  LanguageGo.sCopying1 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'COPYING2', tagvalue) then
                  LanguageGo.sCopying2 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'CURRENTFILE', tagvalue) then
                  LanguageGo.sCurrentFile := EscDecodeStr(tagvalue)
                else if IsTag(s, 'ALLFILES', tagvalue) then
                  LanguageGo.sTotalProgress := EscDecodeStr(tagvalue)
                else if IsTag(s, 'KB', tagvalue) then
                  LanguageGo.sKB := EscDecodeStr(tagvalue)
                else if IsTag(s, 'MB', tagvalue) then
                  LanguageGo.sMB := EscDecodeStr(tagvalue)
                else if IsTag(s, 'GB', tagvalue) then
                  LanguageGo.sGB := EscDecodeStr(tagvalue)
                else if IsTag(s, 'XOFY', tagvalue) then
                  LanguageGo.sXOfY := EscDecodeStr(tagvalue)
                else if IsTag(s, 'ELAPSED', tagvalue) then
                  LanguageGo.sElapsed := EscDecodeStr(tagvalue)
                else if IsTag(s, 'ESTIMATED', tagvalue) then
                  LanguageGo.sEstimated := EscDecodeStr(tagvalue)
                else if IsTag(s, 'DISKFREELOW', tagvalue) then
                  LanguageGo.sDiskFreeLow := EscDecodeStr(tagvalue)
                else if IsTag(s, 'DONEMSG1', tagvalue) then
                  LanguageGo.sDoneMsg1 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'DONEMSG2', tagvalue) then
                  LanguageGo.sDoneMsg2 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'COPY_DONEMSG1', tagvalue) then
                  LanguageGo.sCopyDoneMsg1 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'COPY_DONEMSG2', tagvalue) then
                  LanguageGo.sCopyDoneMsg2 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'SHORTCUTS1', tagvalue) then
                  LanguageGo.sShortCuts1 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'SHORTCUTS2', tagvalue) then
                  LanguageGo.sShortCuts2 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'CANCELPROMPT', tagvalue) then
                  LanguageGo.sCancelPrompt := EscDecodeStr(tagvalue)
                else if IsTag(s, 'CANCELMSG', tagvalue) then
                  LanguageGo.sCancelMsg := EscDecodeStr(tagvalue)

                else if IsTag(s, 'OK', tagvalue) then
                  LanguageGo.sOK := EscDecodeStr(tagvalue)
                else if IsTag(s, 'CANCEL', tagvalue) then
                  LanguageGo.sCancel := EscDecodeStr(tagvalue)
                else if IsTag(s, 'INFORMATION', tagvalue) then
                  LanguageGo.sInformation := EscDecodeStr(tagvalue)
                else if IsTag(s, 'CONFIRMATION', tagvalue) then
                  LanguageGo.sConfirmation := EscDecodeStr(tagvalue)
                else if IsTag(s, 'WARNING', tagvalue) then
                  LanguageGo.sWarning := EscDecodeStr(tagvalue)
                else if IsTag(s, 'ERROR', tagvalue) then
                  LanguageGo.sError := EscDecodeStr(tagvalue)

                else if IsTag(s, 'SIZE', tagvalue) then
                begin
                  LanguageGo.sSize := EscDecodeStr(tagvalue);
                  mnuOrderBySize.Caption := EscDecodeStr(tagvalue);
                end
                else if IsTag(s, 'DISCNO', tagvalue) then
                  LanguageGo.sDiscNo := EscDecodeStr(tagvalue)
                else if IsTag(s, 'MORE', tagvalue) then
                  LanguageGo.sMore := EscDecodeStr(tagvalue)
                else if IsTag(s, 'SELECT_ALL', tagvalue) then
                begin
                  mnuDescrSelectAll.Caption := EscDecodeStr(tagvalue);
                  mnuNoteSelectAll.Caption := EscDecodeStr(tagvalue);
                end
                else if IsTag(s, 'COPY_TO_CLIPBOARD', tagvalue) then
                begin
                  mnuDescrCopy.Caption := EscDecodeStr(tagvalue);
                  mnuNoteCopy.Caption := EscDecodeStr(tagvalue);
                end
                else if Uppercase(s)='<BUTTON_HINTS>' then
                begin
                  repeat
                    if (IsTag(s,'INSTALL', tagvalue)) then
                      imgInstall.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'RUN', tagvalue)) then
                      imgRun.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'PLAY', tagvalue)) then
                      imgPlay.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'VIEW', tagvalue)) then
                      imgView.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'NFO', tagvalue)) then
                      imgNFO.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'PREVIOUS_IMAGE', tagvalue)) then
                      imgPrev.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'NEXT_IMAGE', tagvalue)) then
                      imgNext.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'MUSIC_PREVIOUS', tagvalue)) then
                      imgPlayerRew.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'MUSIC_PLAY', tagvalue)) then
                      imgPlayerPlay.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'MUSIC_PAUSE', tagvalue)) then
                      imgPlayerPause.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'MUSIC_STOP', tagvalue)) then
                      imgPlayerStop.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'MUSIC_FORWARD', tagvalue)) then
                      imgPlayerForward.Hint :=EscDecodeStr(tagvalue)
                    else if (IsTag(s,'MUSIC_OPEN', tagvalue)) then
                      imgPlayerOpen.Hint :=EscDecodeStr(tagvalue);

                    s:=ReadMILine(fileend);
                  until (fileend) or (uppercase(s)='</BUTTON_HINTS>');
                end


                // Uninstall
                else if IsTag(s, 'UNINSTALLTITLE', tagvalue) then
                  LanguageGo.sUninstTitle := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNINSTALLSUBTITLE', tagvalue) then
                  LanguageGo.sUninstSubTitle := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNINSTALLINFO1', tagvalue) then
                  LanguageGo.sUninstInfo1 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNINSTALLINFO2', tagvalue) then
                  LanguageGo.sUninstInfo2 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNINSTALLREMOVE', tagvalue) then
                  LanguageGo.sRemove := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNINSTALLREMOVEDMSG1', tagvalue) then
                  LanguageGo.sRemoved1 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNINSTALLREMOVEDMSG2', tagvalue) then
                  LanguageGo.sRemoved2 := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNINSTALLPROGRESS', tagvalue) then
                  LanguageGo.sUninstProgress := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNINSTALLFILES', tagvalue) then
                  LanguageGo.sUninstFiles := EscDecodeStr(tagvalue)
                else if IsTag(s, 'UNINSTALLSHORTCUTS', tagvalue) then
                  LanguageGo.sUninstSC := EscDecodeStr(tagvalue);

                s := ReadMILine(fileend);
              until fileend or (UpperCase(Trim(s)) = '</LANGUAGE>');
            end
          end;

          s := ReadMILine(fileend);
        until fileend or (Trim(s) = '</HEADER>');
      end
    end; // eof XML file reached
  except
    VSTree.Clear;
  end;


  if bDecrypt then
  begin
    if (VSTree.TotalCount > 1) and encsavepwd and (not pwdfromreg) then
    begin
      try
        reg := TRegistry.Create;
        with reg do
        begin
          RootKey := HKEY_CURRENT_USER;
          OpenKey('Software\Nikse\Multi Install', True);
          cdlabel := GetLabel(GoWinDir[1]);
          s := frmDecrypt.OriginalPwd;
          datpwd := s;
          for i := 1 to Length(s) do
            datpwd[i] := char(Ord(s[Length(s) + 1 - i]) - (25 - i));
          WriteString(cdlabel, datpwd);
        end;
        reg.CloseKey;
        reg.Free;
      except
      end;
    end;
    frmDecrypt.DecryptClose;
    frmDecrypt.Free;
    if showsplash then
      frmSplashScreen.Refresh;
  end
  else
    CloseFile(datfile);

  if sTempDatfile <> '' then
  begin
    try
      DeleteFile(sTempDatfile);
    except
    end;
  end;

  VSTree.EndUpdate;

  if VSTree.TotalCount < 1 then
  begin
    frmMain.Width := 1;
    frmMain.Height := 1;
    if bDecrypt then
    begin
      s := 'Invalid password - please retry!';
      if pwdfromreg then
      begin
        try
          reg := TRegistry.Create;
          with reg do
          begin
            RootKey := HKEY_CURRENT_USER;
            OpenKey('Software\Nikse\Multi Install', True);
            DeleteValue(cdlabel);
          end;
          reg.CloseKey;
          reg.Free;
        except
        end;
      end;
    end
    else
      s := 'Input file empty!';
    MessageDlg(s, mtError, [mbOK], 0);
    if showsplash then
      frmSplashScreen.Free;
    Application.Terminate;
    Exit;
  end;

  lblMessage.Caption := msgstr[1] + #13#10;
  for i := 2 to 6 do
    lblMessage.Caption := lblMessage.Caption + msgstr[i] + #13#10;
  lblMessage.Caption := lblMessage.Caption + msgstr[7];

  // resource file
  if resourcefile <> '' then
  begin
    if not runfromtemp then
      respath := GoWinDir;

    if respath[Length(respath)] = '\' then
      resourcefile := respath + resourcefile
    else
      resourcefile := respath + '\' + resourcefile;

    if not FileExists(resourcefile) then
      resourcefile := ''
    else
    begin
      s := Copy(GoWindir, 1,2);
      {$IFDEF DELPHI}
      if GetDriveType(PChar(s)) = 5 then // 5 = cd/dvd
      begin
        GetTempFileName(PChar(tmpdir), PChar('tmp'), 1, @TempDir);
        s := StrPas(TempDir);
        if FileExists(s) then
        begin
          SetFileAttributes(PChar(s), 0); // remove readonly attr
          DeleteFile(s);
        end;
        FCopy(resourcefile, s);
        if FileExists(s) then
        begin
          resourcefile := s;
          filesToDelete.Add(s);
        end;
      end;
      ZipMaster1.ZipFileName := resourcefile;
      ZipMaster1.Password := resourcepwd;
      ZipMaster1.Unattended:=True;
      {$ENDIF}

    end;
  end;


  if SkinName = '' then
  begin
    MessageBox(Self.Handle,
      PChar('No skinname!'),
      PChar('Multi Install'),
      MB_ICONERROR);
    Application.Terminate;
    Exit;
  end;


  // Build Quick information labels
  lblQIText.Caption := LanguageGo.sSize;
  if bShowCDno then
    lblQIText.Caption := lblQIText.Caption + #13#10 + LanguageGo.sDiscNo;
  if bShowCustom1 then
    lblQIText.Caption := lblQIText.Caption + #13#10 + LanguageGo.sCustom1;
  if bShowCustom2 then
    lblQIText.Caption := lblQIText.Caption + #13#10 + LanguageGo.sCustom2;
  if bShowCustom3 then
    lblQIText.Caption := lblQIText.Caption + #13#10 + LanguageGo.sCustom3;
  if bShowCustom4 then
    lblQIText.Caption := lblQIText.Caption + #13#10 + LanguageGo.sCustom4;
  if bShowCustom5 then
    lblQIText.Caption := lblQIText.Caption + #13#10 + LanguageGo.sCustom5;


  // Load names of other skins (if available)
  ListOtherSkins(resourcefile, SkinName);

  // Load skin
  LoadSkin(resourcefile, SkinName);

  // Load icons
  SetCurrentDir(GoWinDir);
  if iconList.Count > 0 then
  begin
    LoadIcons(iconList);
    if ImageListIcons.Count > 0 then
      VSTree.Images := ImageListIcons;
  end;
  iconList.Free;


  if Application.Title = '' then
    Application.Title := sTBName;


  if (runfromtemp) and DirectoryExists(sMusicFolder) then
    CopyMusicFolderToTemp;

  bUseSmilies := True;

  // Treeview popup menu: Sort by
  if bShowCustom1 then
  begin
    mnuOrderByCustom1.Visible := True;
    mnuOrderByCustom1.Caption := LanguageGo.sCustom1;
  end;
  if bShowCustom2 then
  begin
    mnuOrderByCustom2.Visible := True;
    mnuOrderByCustom2.Caption := LanguageGo.sCustom2;
  end;
  if bShowCustom3 then
  begin
    mnuOrderByCustom3.Visible := True;
    mnuOrderByCustom3.Caption := LanguageGo.sCustom3;
  end;
  if bShowCustom4 then
  begin
    mnuOrderByCustom4.Visible := True;
    mnuOrderByCustom4.Caption := LanguageGo.sCustom4;
  end;
  if bShowCustom5 then
  begin
    mnuOrderByCustom5.Visible := True;
    mnuOrderByCustom5.Caption := LanguageGo.sCustom5;
  end;
  if bShowCDno then
  begin
    mnuOrderByDiscNo.Visible := True;
    mnuOrderByDiscNo.Caption := LanguageGo.sDiscNo;
  end;

  if showsplash then
  begin
    if not usepwd then
      Sleep(500);
    if showsplash then
      frmSplashScreen.Free;
  end;
end; // FormCreate

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.FormActivate(Sender: TObject);
var
  Node: PVirtualNode;
  s: string;
begin
  if bLoading then
  begin
    bLoading := False;

    VSTree.BeginUpdate;
    if toAutoExpand in VSTree.TreeOptions.AutoOptions then
      VSTree.FullExpand
    else
      VSTree.FullCollapse;
    if VSTree.CanFocus then
      VSTree.SetFocus;
    Node := VSTree.GetFirst;
    VSTree.Selected[Node] := True;
    VSTreeChange(VSTree, Node); // update quickinfo etc.
    VSTree.EndUpdate;
    Refresh;

    // Initialize music
    if (Length(sMusicFolder) > 0) and (sMusicFolder[Length(sMusicFolder)] <> '\') then
      sMusicFolder := sMusicFolder + '\';
    SetCurrentDir(GoWinDir);
    LoadMusicLibrary(bMusicAutoStart, sMusicFirstFile);
    if bBASSDLLLoaded then
    begin
      if Length(sMusic_File) > 1 then
      begin
        s := ExtractFilename(sMusic_File);
        s := Copy(s, 1, Length(s) - Length(sMusic_FileExt));
        s := StringReplace(s, '_', ' ', [rfReplaceAll]);
        DrawMusicTitle(sMusic_File, s);
      end;
    end
    else if imgPlayer.Visible then
    begin // if no music is available we hide the music controls
      imgPlayer.Visible := False;
      pbMusicVis.Visible := False;
      imgPlayerOpen.Visible := False;
      imgPlayerRew.Visible := False;
      imgPlayerStop.Visible := False;
      imgPlayerPause.Visible := False;
      imgPlayerPlay.Visible := False;
      imgPlayerForward.Visible := False;
      Refresh;
    end;
    if sStartUpScript <> '' then
    begin
      frmMain.Show; // files cannot be executed without AVisible form
      RunScript(sStartupScript);
    end;

    ChkFile.Enabled := True;
  end;
end; // FormActivate

////////////////////////////////////////////////////////////////////////

function TfrmMain.MouseOverImage(var sbtn: TSkinButton; var imgToCheck: TImage; x, y: integer): boolean;
begin
  if imgToCheck.Visible and
    (x >= imgToCheck.Left) and (x <= imgToCheck.Left + imgToCheck.Width) and
    (y >= imgToCheck.Top) and (y <= imgToCheck.Top + imgToCheck.Height) then
  begin
    Result := True;

    if (sbtn.Status <> 1) and (sbtn.Status <> 2) then
    begin
      if sbtn.gifMOver = nil then
        imgToCheck.Picture.Assign(sbtn.picMOver)
      else
        imgToCheck.Picture.Assign(sbtn.gifMOver);
      sbtn.Status := 1; // 1 = Mouse over
    end;
  end
  else
    Result := False;
end; // MouseOverImage

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ChkFileTimer(Sender: TObject);
var
  x, y: integer;
  blnMinimize: boolean;
  blnClose: boolean;
  blnPrev: boolean;
  blnNext: boolean;
  blnInstall: boolean;
  blnMore: boolean;
  blnNFO: boolean;
  blnSearch: boolean;
  blnMPOpen: boolean;
  blnMPRew: boolean;
  blnMPStop: boolean;
  blnMPPause: boolean;
  blnMPPlay: boolean;
  blnMPForward: boolean;
  blnScreenShot: boolean;
  msg  : string;
begin
  // Close/Minimize Status
  // 0 = normal
  // 1 = mouse over
  // 2 = down

  blnMinimize := False;
  blnClose := False;
  blnPrev := False;
  blnNext := False;
  blnInstall := False;
  blnMore := False;
  blnNfo := False;
  blnSearch := False;
  blnMPOpen := False;
  blnMPRew := False;
  blnMPStop := False;
  blnMPPause := False;
  blnMPPlay := False;
  blnMPForward := False;
  blnScreenShot:=False;

  x := Mouse.CursorPos.x - frmMain.Left;
  y := Mouse.CursorPos.y - frmMain.Top;;


  // Check if controls has mouse over
  if MouseOverImage(btnMinimize, imgMinimize, x, y) then
    blnMinimize := True
  else if MouseOverImage(btnClose, imgClose, x, y) then
    blnClose := True
  else if MouseOverImage(btnPrev, imgPrev, x, y) then
   blnPrev := True
  else if MouseOverImage(btnNext, imgNext, x, y) then
    blnNext := True
  else if MouseOverImage(btnInstall, imgInstall, x, y) then
    blnInstall := True
  else if MouseOverImage(btnPlay, imgPlay, x, y) then
    blnInstall := True
  else if MouseOverImage(btnRun, imgRun, x, y) then
    blnInstall := True
  else if MouseOverImage(btnView, imgView, x, y) then
    blnInstall := True
  else if MouseOverImage(btnMore, imgMore, x, y) then
    blnMore := True
  else if MouseOverImage(btnNfo, imgNfo, x, y) then
    blnNfo := True
  else if MouseOverImage(btnSearch, imgSearch, x, y) then
    blnSearch := True
  else if MouseOverImage(btnMPOpen, imgPlayerOpen, x, y) then
    blnMPOpen := True
  else if MouseOverImage(btnMPRew, imgPlayerRew, x, y) then
    blnMPRew := True
  else if MouseOverImage(btnMPStop, imgPlayerStop, x, y) then
    blnMPStop := True
  else if MouseOverImage(btnMPPause, imgPlayerPause, x, y) then
    blnMPPause := True
  else if MouseOverImage(btnMPPlay, imgPlayerPlay, x, y) then
    blnMPPlay := True
  else if MouseOverImage(btnMPForward, imgPlayerForward, x, y) then
    blnMPForward := True

  else if frmMain.Active and bScreenshotZoomed and imgPicture.Visible and
    (x >= imgPicture.Left) and (x <= imgPicture.Left + imgPicture.Width) and
    (y >= imgPicture.Top) and (y <= imgPicture.Top + imgPicture.Height) then
  begin // Screen Shot
    blnScreenShot:=True;
    if not imgPicture.Center then
    begin
      imgPicture.Stretch:=False;
      imgPicture.Center:=True;
    end;
  end;


  // go back to normal if not mouse over
  if not blnMinimize and (btnMinimize.Status <> 0) then
  begin
    imgMinimize.Picture.Assign(btnMinimize.pic);
    btnMinimize.Status := 0; // 0 = normal
  end;
  if not blnClose and (btnClose.Status <> 0) then
  begin
    imgClose.Picture.Assign(btnClose.pic);
    btnClose.Status := 0; // 0 = normal
  end;
  if (btnPrev.Status <> 0) and not blnPrev then
  begin
    if imgPrev.Visible then
      imgPrev.Picture.Assign(btnPrev.pic);
    btnPrev.Status := 0; // 0 = normal
  end;
  if (btnNext.Status <> 0) and not blnNext then
  begin
    if imgNext.Visible then
      imgNext.Picture.Assign(btnNext.pic);
    btnNext.Status := 0; // 0 = normal
  end;
  if not blnInstall then
  begin
    if (btnInstall.Status <> 0) and imgInstall.Visible then
    begin
      imgInstall.Picture.Assign(btnInstall.pic);
      btnInstall.Status := 0; // 0 = normal
    end
    else if (btnPlay.Status <> 0) and imgPlay.Visible then
    begin
      imgPlay.Picture.Assign(btnPlay.pic);
      btnPlay.Status := 0; // 0 = normal
    end
    else if (btnRun.Status <> 0) and imgRun.Visible then
    begin
      imgRun.Picture.Assign(btnRun.pic);
      btnRun.Status := 0; // 0 = normal
    end
    else if (btnView.Status <> 0) and  imgView.Visible then
    begin
      imgView.Picture.Assign(btnView.pic);
      btnView.Status := 0; // 0 = normal
    end;
  end;
  if (btnMore.Status <> 0) and not blnMore then
  begin
    if imgMore.Visible then
      imgMore.Picture.Assign(btnMore.pic);
    btnMore.Status := 0; // 0 = normal
  end;
  if (btnNfo.Status <> 0) and not blnNFO then
  begin
    if imgNFO.Visible then
      imgNFO.Picture.Assign(btnNfo.pic);
    btnNfo.Status := 0; // 0 = normal
  end;
  if (btnSearch.Status <> 0) and not blnSearch then
  begin
    if imgSearch.Visible then
      imgSearch.Picture.Assign(btnSearch.pic);
    btnSearch.Status := 0; // 0 = normal
  end;
  if (btnMPOpen.Status <> 0) and not blnMPOpen then
  begin
    if imgPlayerOpen.Visible then
      imgPlayerOpen.Picture.Assign(btnMPOpen.pic);
    btnMPOpen.Status := 0; // 0 = normal
  end;
  if (btnMPRew.Status <> 0) and not blnMPRew then
  begin
    if imgPlayerRew.Visible then
      imgPlayerRew.Picture.Assign(btnMPRew.pic);
    btnMPRew.Status := 0; // 0 = normal
  end;
  if (btnMPStop.Status <> 0) and not blnMPStop then
  begin
    if imgPlayerStop.Visible then
      imgPlayerStop.Picture.Assign(btnMPStop.pic);
    btnMPStop.Status := 0; // 0 = normal
  end;
  if (btnMPPause.Status <> 0) and not blnMPPause then
  begin
    if imgPlayerPause.Visible then
      imgPlayerPause.Picture.Assign(btnMPPause.pic);
    btnMPPause.Status := 0; // 0 = normal
  end;
  if (btnMPPlay.Status <> 0) and not blnMPPlay then
  begin
    if imgPlayerPlay.Visible then
      imgPlayerPlay.Picture.Assign(btnMPPlay.pic);
    btnMPPlay.Status := 0; // 0 = normal
  end;
  if (btnMPForward.Status <> 0) and not blnMPForward then
  begin
    if imgPlayerForward.Visible then
      imgPlayerForward.Picture.Assign(btnMPForward.pic);
    btnMPForward.Status := 0; // 0 = normal
  end;

  if bScreenshotZoomed and imgPicture.Center and not blnScreenShot then
  begin
    imgPicture.Stretch:=True;
    imgPicture.Center:=False;
  end;


  // scroll
  if PaintBoxScroll.Visible then
  begin
    msg:=msgstr[scrollMsgNo];

    BitBlt(imgScrollTemp.Canvas.Handle, 0, 0, PaintBoxScroll.Width, PaintBoxScroll.Height, imgMain.Canvas.Handle, PaintBoxScroll.Left, PaintBoxScroll.Top, SrcCopy);
    SetBkMode(imgScrollTemp.Canvas.Handle, TRANSPARENT);
    ExtTextOut(imgScrollTemp.Canvas.Handle, PaintBoxScroll.Width-scrollPos,0, ETO_OPAQUE or ETO_CLIPPED, nil, pChar(msg), Length(msg), nil);
    PaintBoxScroll.Refresh;

    Inc(ScrollPos, scrollSpeed);
    if scrollPos >= PaintBoxScroll.Width * 2 then
    begin
      scrollPos:=0;
      Inc(scrollMsgNo);
      if scrollMsgNo > 7 then
        scrollMsgNo:=1;
      if Trim(msgstr[scrollMsgNo]) = '' then
        scrollPos := PaintBoxScroll.Width * 2;
    end;
  end;
end; // ChkFileTimer

////////////////////////////////////////////////////////////////////////

function GetEnvVar(env: string): string;
var
  buf: array[0..MAX_PATH] of char;
  s: string;
  i: integer;
  res: string;
  new: string;
begin
  env := Trim(env);
  for i := 2 to Length(env) do
  begin
    if env[i] = '%' then
    begin
      buf := GetEnvironmentVariable(s);
      new := StrPas(buf);
      if (Length(new) > 1) and (new[1] = '\') then
        Delete(new, 1,1);
      if (Length(res) > 1) and (res[Length(res)] <> '\') then
        res := res + '\';
      res := res + new;
      s := '';
    end
    else
      s := s + env[i];
  end;
  Result := res + s;
end; // GetEnvVar

////////////////////////////////////////////////////////////////////////

function GetCurrentNodedata : PTreeData;
var
  Node: PVirtualNode;
begin
  Result := nil;
  try
    Node := frmMain.VSTree.GetFirstSelected;
    if Node <> nil then
      Result := frmMain.VSTree.GetNodeData(Node);
  except
    Result := nil;
  end;
end;

////////////////////////////////////////////////////////////////////////

function TfrmMain.ConvertPath(const sPath: string): string;
var
  sDummy: string;
begin
  Result := ConvertPathPlusVar(sPath, sDummy);
end; // ConvertPath

////////////////////////////////////////////////////////////////////////

// Convert a path containing a {pf}, {tmp}, {sys}, or {win} to the
// relevant path.
// {regkey=<path>:<key>} looks up value in registry.
// This is used both by 'Install path' and 'Installation script'.

function TfrmMain.ConvertPathPlusVar(     sPath: string;
                                      var sInsertedPath: string): string;
var
  reg: TRegistry;
  sPF: string;
  sDesktop: string;
  sTmp: string;
  sSys: string;
  sWin: string;
  sArcDir: string;
  sMusicDir: string;
  s: string;
  rkp: string;
  rk: string;
  i: integer;
  sStartMenuPrograms: string;
  sStartMenuProgramsStartup: string;
  sDestDir: string;
  sArcName: string;
  TempDir: array[0..MAX_PATH] of char;
  NodeData: PTreeData;
begin
  sInsertedPath := '';
  s := Lowercase(sPath);
  if length(s) > 3 then
  begin
    // lookup key in registry
    if Copy(s, 1,8) = '{regkey=' then
    begin
      i := 1;
      rkp := sPath;
      while (i <= Length(rkp)) and (rkp[i] <> '}') do
        Inc(i);
      if i > 0 then
        Delete(rkp, 1,i);
      rkp := Trim(rkp);
      if (Length(rkp) > 0) and (rkp[1] = '\') then
        Delete(rkp, 1,1);

      Delete(s, 1,8);
      try
        reg := TRegistry.Create;

        // registry root key
        if Copy(s, 1,5) = 'hkcr\' then
        begin
          reg.RootKey := HKEY_CLASSES_ROOT;
          Delete(s, 1,5);
        end
        else if Copy(s, 1,5) = 'hkcu\' then
        begin
          reg.RootKey := HKEY_CURRENT_USER;
          Delete(s, 1,5);
        end
        else if Copy(s, 1,5) = 'hklm\' then
        begin
          reg.RootKey := HKEY_LOCAL_MACHINE;
          Delete(s, 1,5);
        end
        else if Copy(s, 1,4) = 'hku\' then
        begin
          reg.RootKey := HKEY_USERS;
          Delete(s, 1,5);
        end
        else if Copy(s, 1,5) = 'hkcc\' then
        begin
          reg.RootKey := HKEY_CURRENT_CONFIG;
          Delete(s, 1,5);
        end;

        i := 1;
        rk := '';
        while (i <= Length(s)) and (s[i] <> ':') do
        begin
          rk := rk + s[i]; // build registry path
          Inc(i);
        end;
        if reg.OpenKeyReadOnly(rk) then
        begin
          rk := '';
          Inc(i);
          while (i <= Length(s)) and (s[i] <> '}') do
          begin
            rk := rk + s[i]; // build registry key AName
            Inc(i);
          end;
          sPath := Trim(reg.ReadString(rk));
          sInsertedPath := sPath; // {regkey=?} result

          if (Length(sPath) > 0) and (sPath[Length(sPath)] = '\') then
            Delete(sPath, Length(sPath), 1);

          if (rkp <> '') then
            sPath := sPath + '\' + rkp;
          reg.CloseKey;
          reg.Free;
        end
        else
          sPath := rkp;
      except
        sPath := rkp;
      end;
    end

    // Temp folder
    else if Copy(s, 1,5) = '{tmp}' then
    begin
      try
        Delete(s, 6,200);

        TempDir := GetTempDir(False);
        sTmp := StrPas(TempDir);
        if (Length(sTmp) > 1) and (sTmp[1] = '%') then
          sTmp := GetEnvVar(sTmp);
        if sTmp[Length(sTmp)] = '\' then
          Delete(sTmp, Length(sTmp), 1);
        sInsertedPath := sTmp; // {tmp} result

        Delete(sPath, 1,5);
        if (Length(sPath) > 1) and (sPath[1] <> '\') then
          sPath := '\' + sPath;
        sPath := sTmp + sPath;
      except
        sPath := 'Temp';
      end;
    end

    {$IFDEF DELPHI}
    // windows folder
    else if Copy(s, 1,5) = '{win}' then
    begin
      try
        GetWindowsDirectory(@TempDir, 255);
        sWin := StrPas(TempDir);
        if (Length(sWin) > 1) and (sWin[1] = '%') then
          sWin := GetEnvVar(sWin);
        if sWin[Length(sWin)] = '\' then
          Delete(sWin, Length(sWin), 1);
        sInsertedPath := sWin; // {win} result

        Delete(sPath, 1,5);
        if (Length(sPath) > 1) and (sPath[1] <> '\') then
          sPath := '\' + sPath;
        sPath := sWin + sPath;
      except
        sPath := '';
      end;
    end // {win}
    // System folder
    else if Copy(s, 1,5) = '{sys}' then
    begin
      GetSystemDirectory(@TempDir, 255);
      sSys := StrPas(TempDir);
      if (Length(sSys) > 1) and (sSys[1] = '%') then
        sSys := GetEnvVar(sSys);
      if sSys[Length(sSys)] = '\' then
        Delete(sSys, Length(sSys), 1);
      sInsertedPath := sSys; // {sys} result

      Delete(sPath, 1,5);
      if (Length(sPath) > 1) and (sPath[1] <> '\') then
        sPath := '\' + sPath;
      sPath := sSys + sPath;
    end // {sys}

    // Program files folder
    else if Copy(s, 1,4) = '{pf}' then
    begin
      Delete(s, 5,1); // so the string is only 4 chars long
      reg := TRegistry.Create;
      reg.RootKey := HKEY_LOCAL_MACHINE;

      // get ProgramFilesPath from the registry
      try
        if reg.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion') then
        begin
          sPF:=reg.ReadString('ProgramFilesPath'); // Program files
          reg.CloseKey;
          if (Length(sPF) > 1) and (sPF[1] = '%') then
            sPF := GetEnvVar(sPF);
        end
        else
          sPF := 'C:\Program files';
      except
        sPF := 'C:\Program files';
      end;
      reg.Free;
      if Length(sPF) > 0 then
      begin
        if sPF[Length(sPF)] = '\' then
          Delete(sPF, Length(sPF), 1);
        sInsertedPath := sPF; // {pf} result

        Delete(sPath, 1,4);
        if (Length(sPath) > 1) and (sPath[1] <> '\') then
          sPath := '\' + sPath;
        sPath := sPF + sPath;
      end;
    end // {pf}

    // Desktop folder
    else if Copy(s, 1,9) = '{desktop}' then
    begin
      Delete(s, 10,1);
      // get Desktop Path from the registry
      try
        reg := TRegistry.Create;
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders') then
        begin
          sDesktop := reg.ReadString('Desktop');
          reg.CloseKey;
        end;
        reg.Free;
        if (Length(sDesktop) > 1) and (sDesktop[1] = '%') then
          sDesktop := GetEnvVar(sDesktop);
      except
        sDesktop := 'C:\';
      end;
      if Length(sDesktop) > 0 then
      begin
        if sDesktop[Length(sDesktop)] = '\' then
          Delete(sDesktop, Length(sDesktop), 1);
        sInsertedPath := sDesktop; // {desktop} result

        Delete(sPath, 1,9);
        if (Length(sPath) > 1) and (sPath[1] <> '\') then
          sPath := '\' + sPath;
        sPath := sDesktop + sPath;
      end;
    end // {desktop}


    // Start Menu -> Programs folder -> Startup
    else if Copy(s, 1,21) = '{startmenuprgstartup}' then
    begin
      Delete(s, 22,1);
      // get StartMenuPrgStartup Path from the registry
      try
        reg := TRegistry.Create;
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders') then
        begin
          sStartMenuProgramsStartup := reg.ReadString('Startup');
          reg.CloseKey;
          reg.Free;
          if (Length(sStartMenuProgramsStartup) > 1) and (sStartMenuProgramsStartup[1] = '%') then
            sStartMenuProgramsStartup := GetEnvVar(sStartMenuProgramsStartup);
        end
        else
          sStartMenuProgramsStartup := 'C:\';
      except
        sStartMenuProgramsStartup := 'C:\';
      end;
      if Length(sStartMenuProgramsStartup) > 0 then
      begin
        if sStartMenuProgramsStartup[Length(sStartMenuProgramsStartup)] = '\' then
          Delete(sStartMenuProgramsStartup, Length(sStartMenuProgramsStartup), 1);
        sInsertedPath := sStartMenuProgramsStartup; // {desktop} result

        Delete(sPath, 1,21);
        if (Length(sPath) > 1) and (sPath[1] <> '\') then
          sPath := '\' + sPath;
        sPath := sStartMenuProgramsStartup + sPath;
      end;
    end // {startmenuprgstartup}


    // Start Menu -> Programs folder
    else if Copy(s, 1,14) = '{startmenuprg}' then
    begin
      Delete(s, 15,1);
      // get StartMenuPrg Path from the registry
      try
        reg := TRegistry.Create;
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders') then
        begin
          sStartMenuPrograms := reg.ReadString('Programs'); // Start Menu\Programs
          reg.CloseKey;
          reg.Free;
          if (Length(sStartMenuPrograms) > 1) and (sStartMenuPrograms[1] = '%') then
            sStartMenuPrograms := GetEnvVar(sStartMenuPrograms);
        end
        else
          sStartMenuPrograms := 'C:\';
      except
        sStartMenuPrograms := 'C:\';
      end;
      if Length(sStartMenuPrograms) > 0 then
      begin
        if sStartMenuPrograms[Length(sStartMenuPrograms)] = '\' then
          Delete(sStartMenuPrograms, Length(sStartMenuPrograms), 1);
        sInsertedPath := sStartMenuPrograms; // {desktop} result

        Delete(sPath, 1,14);
        if (Length(sPath) > 1) and (sPath[1] <> '\') then
          sPath := '\' + sPath;
        sPath := sStartMenuPrograms + sPath;
      end;
    end // {startmenuprg}

    {$ENDIF}

    // Archivedir (dir where archives are stored)
    else if Copy(s, 1,12) = '{archivedir}' then
    begin
      Delete(s, 13,1);
      if ArchiveDir = '' then
        sArcDir := GoWinDir
      else
        sArcDir := GoWinDir + '\' + Archivedir;
      if Length(sArcDir) > 0 then
      begin
        if sArcDir[Length(sArcDir)] = '\' then
          Delete(sArcDir, Length(sArcDir), 1);
        sInsertedPath := sArcDir; // {archivedir} result
        Delete(sPath, 1,12);
        if (Length(sPath) > 1) and (sPath[1] <> '\') then
          sPath := '\' + sPath;
        sPath := sArcDir + sPath;
      end;
    end // {archivedir}

    // Moredir (dir where archives are stored)
    else if Copy(s, 1, 9) = '{moredir}' then
    begin
      Delete(s, 10,1);
      sArcDir := GoWinDir + '\' + MoreDir;
      if Length(sArcDir) > 0 then
      begin
        if sArcDir[Length(sArcDir)] = '\' then
          Delete(sArcDir, Length(sArcDir), 1);
        sInsertedPath := sArcDir; // {moreedir} result
        Delete(sPath, 1, 9);
        if (Length(sPath) > 1) and (sPath[1] <> '\') then
          sPath := '\' + sPath;
        sPath := sArcDir + sPath;
      end;
    end // {moredir}

    // Musicdir (dir where music files are stored)
    else if Copy(s, 1,10) = '{musicdir}' then
    begin
      Delete(s, 11,1);
      sMusicDir := sMusicFolder;
      if Length(sMusicDir) > 0 then
      begin
        if sMusicDir[Length(sMusicDir)] = '\' then
          Delete(sMusicDir, Length(sMusicDir), 1);
        sInsertedPath := sMusicDir; // {musicdir} result
        Delete(sPath, 1,10);
        if (Length(sPath) > 1) and (sPath[1] <> '\') then
          sPath := '\' + sPath;
        sPath := sMusicDir + sPath;
      end;
    end // {musicdir}

    // Destination dir (dir where archive is unpacked )
    else if Copy(s, 1,9) = '{destdir}' then
    begin
      Delete(s, 10,1);
      sDestDir := '';

      // if EInstallPeth.AText = EInstallPeth then no install path is choosen. This
      // could occur when installing self extracting .exe files (which do not have
      // a {destdir}).
      if (frmInstall <> nil) and (frmInstall.EInstallPath.Text <> 'EInstallPath') then
        sDestDir := frmInstall.EInstallPath.Text
      else
      begin
        if CurNodeData <> nil then
          sDestDir := ConvertPath(CurNodeData.sPath)
        else
        begin
          NodeData := GetCurrentNodedata;
          if NodeData <> nil then
          begin
            sDestDir := NodeData.sPath;
            if (Length(sDestDir) > 2) and (sDestDir[2] <> '\') then
              sDestDir := 'C:\' + sDestDir;
          end;
        end;

        if Trim(sDestDir) = '' then
          sDestDir := 'C:\Files';

        if (Length(sDestDir) >1) and (sDestDir[2] <> ':') then
          sDestDir := 'C:\' + sDestDir;
        sDestDir := StringReplace(sDestDir, '\\', '\', [rfReplaceAll]);
      end;

      if Length(sDestDir) > 0 then
      begin
        if sDestDir[Length(sDestDir)] = '\' then
          Delete(sDestDir, Length(sDestDir), 1);
        sInsertedPath := sDestDir; // {destdir} result
        Delete(sPath, 1,9);
        if (Length(sPath) > 1) and (sPath[1] <> '\') then
          sPath := '\' + sPath;
        sPath := sDestDir + sPath;
      end;
    end; // {destdir}

    s := sPath;

    // Archive file
    if Pos('{archivefile}', s) > 0 then
    begin
      sArcName := '';
      if CurNodeData <> nil then
        sArcName := CurNodeData.sPgmName
      else
      begin
        NodeData := GetCurrentNodedata;
        if NodeData <> nil then
          sArcName := NodeData.sPgmName;
      end;

      if Pos('{archivefile}', s) = 1 then
        sInsertedPath := sArcName; // {archivefile} result
      s := StringReplace(s, '{archivefile}', sArcName, [rfReplaceAll]);
      sPath := s;
    end; // {archivefile}

    // Archive file with No Extension
    if Pos('{archivefilenoext}', s) > 0 then
    begin
      sArcName := '';
      if CurNodeData <> nil then
        sArcName := CurNodeData.sPgmName
      else
      begin
        NodeData := GetCurrentNodedata;
        if NodeData <> nil then
          sArcName := NodeData.sPgmName;
      end;

      if Pos('{archivefilenoext}', s) = 1 then
        sInsertedPath := sArcName; // {archivefilenoext} result
      s := StringReplace(s, '{archivefilenoext}', sArcName, [rfReplaceAll]);
      sPath := s;
    end; // {archivefilenoext}

    // Archive password
    if Pos('{pwd}', s) > 0 then
    begin
      sArcName := '';
      if CurNodeData <> nil then
        sArcName := CurNodeData.sArchivePwd
      else
      begin
        NodeData := GetCurrentNodedata;
        if NodeData <> nil then
          sArcName := NodeData.sArchivePwd;
      end;

      if Pos('{pwd}', s) = 1 then
        sInsertedPath := sArcName; // {archivefilenoext} result
      s := StringReplace(s, '{pwd}', sArcName, [rfReplaceAll]);
      sPath := s;
    end; // {pwd}

    // programname
    if Pos('{programname}', s) > 0 then
    begin
      sArcName := '';
      if CurNodeData <> nil then
        sArcName := CurNodeData.wsText
      else
      begin
        NodeData := GetCurrentNodedata;
        if NodeData <> nil then
          sArcName := NodeData.wsText;
      end;

      if Pos('{programname}', s) = 1 then
        sInsertedPath := sArcName; // {programname} result
      s := StringReplace(s, '{programname}', sArcName, [rfReplaceAll]);
      sPath := s;
    end; // {programname}

    // category
    if Pos('{category}', s) > 0 then
    begin
      sArcName := CurCategory;

      if Pos('{category}', s) = 1 then
        sInsertedPath := sArcName; // {category} result

      s := StringReplace(s, '{category}', '\' +sArcName + '\', [rfReplaceAll]);
      s := StringReplace(s, '\\', '\', [rfReplaceAll]);

      sPath := s;
    end; // {category}

  end;
  Result := sPath;
end; // ConvertPathPlusVar

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.SetInstallPath(path: string);
var
  InstPathPre: string;
begin
  // Set Install Path for the install routine
  InstPath := ConvertPathPlusVar(path, InstPathPre);
  path := InstPath;
  if (Length(InstPath) > 2) and (InstPath[2] = ':') then
  begin
    if InstPath[3] = '\' then
      Delete(InstPath, 1,3);
    frmInstall.VET.BrowseTo(path[1] + ':\', True, True, False, True);
  end
  else
  begin
    if (Length(InstPath) > 1) and (InstPath[1] = '\') then
      Delete(InstPath, 1,1);
    frmInstall.VET.BrowseTo('C:\', True, True, False, True);
  end;

  if (InstPathPre <> '') and (DirectoryExists(InstPathPre)) then
    frmInstall.VET.BrowseTo(InstPathPre, True, True, False, True);
  frmInstall.EInstallPath.Text := UpCase(frmInstall.EInstallPath.Text[1]) + ':\' + InstPath;
end; // SetInstallPath

////////////////////////////////////////////////////////////////////////

function GetExt(const fname: string): string;
  // Returns the extension of the file fname.
  // Also works with scrampled archive names with the extension '.mi'
var
  buf: array[0..13] of byte;
  FileHandle: integer;
  res: string;
begin
  res := UpperCase(ExtractFileExt(fname));
  if (res = '.MI') or (res = '.DAT') then
  begin
    FileHandle := FileOpen(fname, fmShareDenyNone);
    if FileHandle > 0 then
    begin
      FileRead(FileHandle, buf, SizeOf(buf));
      FileClose(FileHandle);
      if (buf[0] = Ord('R')) and
        (buf[1] = Ord('a')) and
        (buf[2] = Ord('r')) and
        (buf[3] = Ord('!')) then
        res := '.RAR'
      else if (buf[0] = Ord('P')) and
        (buf[1] = Ord('K')) then
        res := '.ZIP'
      else if (buf[7] = Ord('*')) and
        (buf[8] = Ord('*')) and
        (buf[9] = Ord('A')) and
        (buf[10] = Ord('C')) and
        (buf[11] = Ord('E')) and
        (buf[12] = Ord('*')) and
        (buf[13] = Ord('*')) then
        res := '.ACE'
    end;
  end;
  Result := res;
end; // GetExt

////////////////////////////////////////////////////////////////////////

procedure ListDrives(var slDrives: TStringList; drivetype: longword);
  // These drivestypes are available:
  //  -  DRIVE_UNKNOWN = 0;
  //  -  DRIVE_NO_ROOT_DIR = 1;
  //  -  DRIVE_REMOVABLE = 2;
  //  -  DRIVE_FIXED = 3;
  //  -  DRIVE_REMOTE = 4;
  //  -  DRIVE_CDROM = 5;
  //  -  DRIVE_RAMDISK = 6;
var
  r: longword;
  Drives: array[0..128] of char;
  pDrive: PChar;
  s: string;
begin
  slDrives := TStringList.Create;

  r := GetLogicalDriveStrings(SizeOf(Drives), Drives);
  if r = 0 then
    slDrives.Clear // no drives...
  else
  begin
    if r > SizeOf(Drives) then
      raise Exception.Create(SysErrorMessage(ERROR_OUTOFMEMORY));

    pDrive := Drives;
    while pDrive^ <> #0 do
    begin
      if GetDriveType(pDrive) = drivetype then
      begin
        s:=StrPas(pDrive);
        if (Length(s)>1) and (s[Length(s)]='\') then
          Delete(s,Length(s),1);
        slDrives.Add(s);
      end;
      Inc(pDrive, 4);
    end;
  end;
end; // ListDrives

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.UrlHighLight(var RichView: TRichView;
                                const AText: string;
                                var Urls: TStringList);
var
  FoundAt: longint;
  FtpFoundAt: longint;
  WwwFoundAt: longint;
  H1FoundAt: longint;
  H2FoundAt: longint;
  HR1FoundAt: longint;
  HR2FoundAt: longint;
  HR3FoundAt: longint;
  bIsHr: boolean;
  ScriptFoundAt: longint;
  bIsScript: boolean;
  bIsHeader: boolean;
  sHeader: string;
  sScriptTitle: string;
  ItalicFoundAt: longint;
  ItalicEndFoundAt: longint;
  UnderlineFoundAt: longint;
  UnderlineEndFoundAt: longint;
  BoldFoundAt: longint;
  BoldEndFoundAt: longint;
  sFontStyle: string;
  bFontStyleItalic: boolean;
  bFontStyleUnderline: boolean;
  bFontStyleBold: boolean;
  iStartPos, iToEnd: integer;
  sUrl: string;
  EndPos: longint;
  iCurrentFontStyle: integer;
  SmilieHappy1FoundAt: longint; // :)
  SmilieHappy2FoundAt: longint; // :-)
  SmilieSad1FoundAt: longint; // :(
  SmilieSad2FoundAt: longint; // :-(
  SmilieVeryHappy1FoundAt: longint; // :D
  SmilieVeryHappy2FoundAt: longint; // :-D
  SmilieWink1FoundAt: longint; // ;)
  SmilieWink2FoundAt: longint; // ;-)
  SmilieSurprised1FoundAt: longint; // :-O
  SmilieSurprised2FoundAt: longint; // :o
  SmilieNeutral1FoundAt: longint; // :-|
  SmilieNeutral2FoundAt: longint; // :|
  SmilieIndex: integer;
  SmilieLength: integer;
  lcTxt: string;
begin
  Urls.Clear;
  iStartPos := 1;
  FoundAt := 0;
  EndPos := Length(AText);
  iCurrentFontStyle := rvsNormal;
  bFontStyleItalic := False;
  bFontStyleUnderline := False;
  bFontStyleBold := False;
  SmilieLength := 0;
  while FoundAt <> iStartPos do
  begin
    iToEnd := Length(AText) - iStartPos+1;
    bIsScript := False;
    bIsHeader := False;
    bIsHr := False;
    SmilieIndex := -1;
    sFontStyle := '';

    lcTxt := LowerCase(Copy(AText, iStartPos, iToEnd));
    FoundAt := Pos('http://', lcTxt) +  iStartPos;
    FtpFoundAt := Pos('ftp://', lcTxt) +  iStartPos;
    WwwFoundAt := Pos('www.', lcTxt) +  iStartPos;
    ScriptFoundAt := Pos('<script', lcTxt) +  iStartPos;
    H1FoundAt := Pos('<h1>', lcTxt) +  iStartPos;
    H2FoundAt := Pos('<h2>', lcTxt) +  iStartPos;
    HR1FoundAt := Pos('<hr/>', lcTxt) +  iStartPos;
    HR2FoundAt := Pos('<hr />', lcTxt) +  iStartPos;
    HR3FoundAt := Pos('<hr>', lcTxt) +  iStartPos;
    ItalicFoundAt := Pos('<i>', lcTxt) +  iStartPos;
    ItalicEndFoundAt := Pos('</i>', lcTxt) +  iStartPos;
    UnderlineFoundAt := Pos('<u>', lcTxt) +  iStartPos;
    UnderlineEndFoundAt := Pos('</u>', lcTxt) +  iStartPos;
    BoldFoundAt := Pos('<b>', lcTxt) +  iStartPos;
    BoldEndFoundAt := Pos('</b>', lcTxt) +  iStartPos;
    SmilieHappy1FoundAt := Pos(':)', Copy(AText, iStartPos, iToEnd)) + iStartPos;
    SmilieHappy2FoundAt := Pos(':-)', Copy(AText, iStartPos, iToEnd)) + iStartPos;
    SmilieSad1FoundAt := Pos(':(', Copy(AText, iStartPos, iToEnd)) + iStartPos;
    SmilieSad2FoundAt := Pos(':-(', Copy(AText, iStartPos, iToEnd)) + iStartPos;
    SmilieVeryHappy1FoundAt := Pos(':D', Copy(AText, iStartPos, iToEnd)) + iStartPos;
    SmilieVeryHappy2FoundAt := Pos(':-D', Copy(AText, iStartPos, iToEnd)) + iStartPos;
    SmilieWink1FoundAt := Pos(';)', Copy(AText, iStartPos, iToEnd)) + iStartPos;
    SmilieWink2FoundAt := Pos(';)', Copy(AText, iStartPos, iToEnd)) + iStartPos;
    SmilieSurprised1FoundAt := Pos(':o', lcTxt) +  iStartPos;
    SmilieSurprised2FoundAt := Pos(':-o', lcTxt) +  iStartPos;
    SmilieNeutral1FoundAt := Pos(':|', Copy(AText, iStartPos, iToEnd)) + iStartPos;
    SmilieNeutral2FoundAt := Pos(':-|', Copy(AText, iStartPos, iToEnd)) + iStartPos;

    if (FtpFoundAt > iStartPos) and ((FtpFoundAt < FoundAt) or (FoundAt = iStartPos)) then
      FoundAt := FtpFoundAt;
    if (WwwFoundAt > iStartPos) and ((WwwFoundAt < FoundAt) or (FoundAt = iStartPos)) then
      FoundAt := WwwFoundAt;
    if (ScriptFoundAt > iStartPos) and ((ScriptFoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := ScriptFoundAt;
      bIsScript := True;
    end;
    if (H1FoundAt > iStartPos) and ((H1FoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := H1FoundAt;
      bIsHeader := True;
    end;
    if (H2FoundAt > iStartPos) and ((H2FoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := H2FoundAt;
      bIsHeader := True;
    end;
    if (HR1FoundAt > iStartPos) and ((HR1FoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := HR1FoundAt;
      bIsHr := True;
    end;
    if (HR2FoundAt > iStartPos) and ((HR2FoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := HR2FoundAt;
      bIsHr := True;
    end;
    if (HR3FoundAt > iStartPos) and ((HR3FoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := HR3FoundAt;
      bIsHr := True;
    end;
    if (ItalicFoundAt > iStartPos) and ((ItalicFoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := ItalicFoundAt;
      sFontStyle := 'i';
    end;
    if (ItalicEndFoundAt > iStartPos) and ((ItalicEndFoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := ItalicEndFoundAt;
      sFontStyle := '/i';
    end;
    if (UnderlineFoundAt > iStartPos) and ((UnderlineFoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := UnderlineFoundAt;
      sFontStyle := 'u';
    end;
    if (UnderlineEndFoundAt > iStartPos) and ((UnderlineEndFoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := UnderlineEndFoundAt;
      sFontStyle := '/u';
    end;
    if (BoldFoundAt > iStartPos) and ((BoldFoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := BoldFoundAt;
      sFontStyle := 'b';
    end;
    if (BoldEndFoundAt > iStartPos) and ((BoldEndFoundAt < FoundAt) or (FoundAt = iStartPos)) then
    begin
      FoundAt := BoldEndFoundAt;
      sFontStyle := '/b';
    end;
    if bUseSmilies then
    begin
      if (SmilieHappy1FoundAt > iStartPos) and ((SmilieHappy1FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieHappy1FoundAt;
        SmilieIndex := 0; // :)
        SmilieLength := 2;
      end;
      if (SmilieHappy2FoundAt > iStartPos) and ((SmilieHappy2FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieHappy2FoundAt;
        SmilieIndex := 0; // :-)
        SmilieLength := 3;
      end;
      if (SmilieSad1FoundAt > iStartPos) and ((SmilieSad1FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieSad1FoundAt;
        SmilieIndex := 1; // :(
        SmilieLength := 2;
      end;
      if (SmilieSad2FoundAt > iStartPos) and ((SmilieSad2FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieSad2FoundAt;
        SmilieIndex := 1; // :-(
        SmilieLength := 3;
      end;
      if (SmilieWink1FoundAt > iStartPos) and ((SmilieWink1FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieWink1FoundAt;
        SmilieIndex := 2; // ;)
        SmilieLength := 2;
      end;
      if (SmilieWink2FoundAt > iStartPos) and ((SmilieWink2FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieWink2FoundAt;
        SmilieIndex := 2; // ;-)
        SmilieLength := 3;
      end;
      if (SmilieVeryHappy1FoundAt > iStartPos) and ((SmilieVeryHappy1FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieVeryHappy1FoundAt;
        SmilieIndex := 3; // :D
        SmilieLength := 2;
      end;
      if (SmilieVeryHappy2FoundAt > iStartPos) and ((SmilieVeryHappy2FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieVeryHappy1FoundAt;
        SmilieIndex := 3; // :-D
        SmilieLength := 3;
      end;
      if (SmilieSurprised1FoundAt > iStartPos) and ((SmilieSurprised1FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieSurprised1FoundAt;
        SmilieIndex := 4; // :o
        SmilieLength := 2;
      end;
      if (SmilieSurprised2FoundAt > iStartPos) and ((SmilieSurprised2FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieSurprised2FoundAt;
        SmilieIndex := 4; // :-O
        SmilieLength := 3;
      end;
      if (SmilieNeutral1FoundAt > iStartPos) and ((SmilieNeutral1FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieNeutral1FoundAt;
        SmilieIndex := 5; // :|
        SmilieLength := 2;
      end;
      if (SmilieNeutral2FoundAt > iStartPos) and ((SmilieNeutral2FoundAt < FoundAt) or (FoundAt = iStartPos)) then
      begin
        FoundAt := SmilieNeutral2FoundAt;
        SmilieIndex := 5; // :-|
        SmilieLength := 3;
      end;
    end;

    if FoundAt <> iStartPos then
    begin
      RichView.AddText(Copy(AText, iStartPos, (FoundAt - iStartPos) - 1) + ' ', iCurrentFontStyle);
      iStartPos := FoundAt;
      Dec(iStartPos);
      sUrl := '';

      if SmilieIndex <> -1 then
      begin
        Inc(iStartPos, SmilieLength);
        if bUseDarkBgSmilies then
          RichView.AddBullet(SmilieIndex, ImageListSmilesDark, False)
        else
          RichView.AddBullet(SmilieIndex, ImageListSmilesLight, False);
      end
      else if sFontStyle <> '' then
      begin
        if sFontStyle = 'i' then
        begin
          bFontStyleItalic := True;
          Inc(iStartPos, 3); // Go past <i>
        end
        else if sFontStyle = '/i' then
        begin
          bFontStyleItalic := False;
          Inc(iStartPos, 4); // Go past </i>
        end
        else if sFontStyle = 'u' then
        begin
          bFontStyleUnderline := True;
          Inc(iStartPos, 3); // Go past <u>
        end
        else if sFontStyle = '/u' then
        begin
          bFontStyleUnderline := False;
          Inc(iStartPos, 4); // Go past </u>
        end
        else if sFontStyle = 'b' then
        begin
          bFontStyleBold := True;
          Inc(iStartPos, 3); // Go past <b>
        end
        else if sFontStyle = '/b' then
        begin
          bFontStyleBold := False;
          Inc(iStartPos, 4); // Go past </b>
        end;

        // set font style
        if (bFontStyleItalic = False) and (bFontStyleUnderline = False) and (bFontStyleBold = False) then
          iCurrentFontStyle := rvsNormal
        else if bFontStyleItalic and bFontStyleUnderline and bFontStyleBold  then
          iCurrentFontStyle := rvsItalicUnderlineBold
        else if bFontStyleItalic then
        begin
          iCurrentFontStyle := rvsItalic;
          if bFontStyleUnderline  then
            iCurrentFontStyle := rvsItalicUnderline
          else if bFontStyleBold then
            iCurrentFontStyle := rvsItalicBold;
        end
        else if bFontStyleUnderline then
        begin
          iCurrentFontStyle := rvsUnderline;
          if bFontStyleBold then
            iCurrentFontStyle := rvsUnderlineBold;
        end
        else
          iCurrentFontStyle := rvsBold;
      end
      else if bIsHr then
      begin
        if Lowercase(Copy(AText, iStartPos, 6))  = '<hr />' then
          Inc(iStartPos, 6) // go past <hr />
        else if Lowercase(Copy(AText, iStartPos, 5))  = '<hr/>' then
          Inc(iStartPos, 5) // go past <hr/>
        else
          Inc(iStartPos, 4); // go past <hr>

        RichView.AddBreak;
      end
      else if bIsHeader then
      begin
        sHeader := '';
        if Lowercase(copy(AText, iStartPos, 4)) = '<h1>' then
        begin
          Inc(iStartPos, 4); // go past <h1>
          while (iStartPos < EndPos) and (Lowercase(copy(AText, iStartPos, 5)) <> '</h1>') do
          begin
            sHeader := sHeader + AText[iStartPos];
            Inc(iStartPos);
          end;
          RichView.AddText(sHeader, rvsHeading);
          Inc(iStartPos, 5); // go past </h1>
        end
        else
        begin
          Inc(iStartPos, 4); // go past <h2>
          while (iStartPos < EndPos) and (Lowercase(copy(AText, iStartPos, 5)) <> '</h2>') do
          begin
            sHeader := sHeader + AText[iStartPos];
            Inc(iStartPos);
          end;
          RichView.AddText(sHeader, rvsSubHeading);
          Inc(iStartPos, 5); // go past </h2>
        end;
      end
      else if bIsScript then
      begin
        Inc(iStartPos, 7); // go past <script
        while (iStartPos < EndPos) and (Lowercase(copy(AText, iStartPos, 5)) <> 'AName=') do
          Inc(iStartPos);
        Inc(iStartPos, 5); // go past 'AName='

        // built script title
        sScriptTitle := AText[iStartPos];
        Inc(iStartPos);
        while (iStartPos <= EndPos) and (AText[iStartPos] <> '>') do
        begin
          sScriptTitle := sScriptTitle + AText[iStartPos]; // built script title
          Inc(iStartPos);
        end;
        if (Length(sScriptTitle) > 0) and (sScriptTitle[1] in ['''', '"']) then
          Delete(sScriptTitle, 1, 1);
        if (Length(sScriptTitle) > 0) and (sScriptTitle[Length(sScriptTitle)] in ['''', '"']) then
          Delete(sScriptTitle, Length(sScriptTitle), 1);

        Inc(iStartPos); // go past '>'

        while (iStartPos <= EndPos) and (Lowercase(copy(AText,iStartPos,9)) <> '</script>') do
        begin
          sUrl := sUrl + AText[iStartPos]; // built script
          Inc(iStartPos);
        end;
        Inc(iStartPos, 10); // go past ':script-->'
        Urls.Add('script:' + sUrl);
        RichView.AddText('<' + sScriptTitle + '>', rvsJump1);
      end
      else // urls: www, http:// or ftp://
      begin
        while (iStartPos <= EndPos) and
          ((AText[iStartPos] <> '!') and
          (AText[iStartPos] <> ' ') and
          (AText[iStartPos] <> ',') and
          (AText[iStartPos] <> #13)) do
        begin
          sUrl := sUrl + AText[iStartPos];
          Inc(iStartPos);
        end;
        if (Length(sUrl) > 1) and
          ((sUrl[Length(sUrl)] = '.') or
          (sUrl[Length(sUrl)] = '!') or
          (sUrl[Length(sUrl)] = ',')) then
          Delete(sUrl, Length(sUrl), 1);
        Urls.Add(sUrl);
        RichView.AddText(sUrl, rvsJump1);
      end;

    end;
  end;
  RichView.AddText(Copy(AText, iStartPos, EndPos), iCurrentFontStyle);
end; // UrlHighLight

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgMainMouseDown(Sender: TObject; Button: TMouseButton;
                                    Shift: TShiftState; X, Y: integer);
  // Move the window with drag and drop
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform({$IFDEF FPC}LM_SysCommand{$ELSE}WM_SysCommand{$ENDIF}, $F012, 0);
  end;
end; // imgMainMouseDown

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ScaleDownToFit;
var
  fw: double;
  fh: double;
  scrWidth: integer;
  scrHeight: integer;
begin
  scrWidth := ScreenshotRect.Right;
  scrHeight := ScreenshotRect.Bottom;
  imgPicture.Stretch := False;
  imgPicture.Autosize := True;
  if imgPicture.Width > scrWidth then
    fw := imgPicture.Width / scrWidth
  else
    fw := 1;
  if imgPicture.Height > scrHeight then
    fh := imgPicture.Height / scrHeight
  else
    fh := 1;
  imgPicture.Autosize := False;
  if (fw > 1) or (fh > 1) then
  begin
    if fw > fh then
    begin
      imgPicture.Width := Round(imgPicture.Width / fw);
      imgPicture.Height := Round(imgPicture.Height / fw);
    end
    else
    begin
      imgPicture.Width := Round(imgPicture.Width / fh);
      imgPicture.Height := Round(imgPicture.Height / fh);
    end;
    imgPicture.Stretch := True;
  end;

  // Center screenshots
  imgPicture.Left := ScreenshotRect.Left + ((scrWidth - imgPicture.Width) div 2);
  imgPicture.Top := ScreenshotRect.Top + ((scrHeight - imgPicture.Height) div 2);
end; // ScaleDownToFit

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.MyExceptionHandler(Sender : TObject; E : Exception );
begin
  Application.ProcessMessages;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.StopVideoPlay;
begin
  if MediaStreamAvailable and MediaStreamPlayed then
  begin
    stopMediaStream;
    if getFullScreenVideo then
      setFullScreenVideo(false);
    freeMediaStream;
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ShowPic(no: integer);
var
  sFile: string;
  s: string;
  Stream1: TStream;
  jpg: TJPEGImage;
  bmp: TBitmap;
  gif: TGIFImage;
//  png: TPNGGraphic;
  found: boolean;
  Node: PVirtualNode;
  NodeData: PTreeData;
begin
  sCurPic := '';
  iCurPicIdx := -1;
  if VSTree.SelectedCount > 0 then
  begin
    Node := VSTree.GetFirstSelected;
    NodeData := VSTree.GetNodeData(Node);
    found := False;
    if NodeData.slScreenShots = nil then
      sFile := ''
    else if (no >= 0) and (no < NodeData.slScreenShots.Count) then
    begin
      StopVideoPlay; // stop video clip if any

      sFile := NodeData.slScreenShots.Strings[no];
      if NodeData.slScreenShots.Count > 1 then
      begin
        if no > 0 then
        begin
          if not imgPrev.Enabled then
          begin
            imgPrev.Enabled := True;
            imgPrev.Picture.Assign(btnPrev.pic);
          end;
        end
        else
        begin
          if imgPrev.Enabled then
          begin
            imgPrev.Enabled := False;
            imgPrev.Picture.Assign(btnPrev.pic);
          end;
        end;
        if no < NodeData.slScreenShots.Count - 1 then
        begin
          if not imgNext.Enabled then
          begin
            imgNext.Enabled := True;
            imgNext.Picture.Assign(btnNext.pic);
          end;
        end
        else
        begin
          if imgNext.Enabled then
          begin
            imgNext.Enabled := False;
            imgNext.Picture.Assign(btnNext.pic);
          end;
        end;
      end;
    end
    else
      sFile := '';

    if (resourcefile <> '') and (Trim(sFile) <> '') then
    begin
      if not ZipMaster1.UnzBusy then
      begin
        sCurPic := sFile;
        iCurPicIdx := no;
        ZipMaster1.ZipFileName := resourcefile;
        ZipMaster1.Password := resourcepwd;
        Stream1 := ZipMaster1.ExtractFileToStream(moredirb + sFile);

        if imgEmpty.Visible then
          imgEmpty.Visible := False;
        if PanelMP1.Visible then
          PanelMP1.Visible := False;
        if not imgPicture.Visible then
          imgPicture.Visible := True;

        if Stream1 <> nil then
        begin
          if Uppercase(ExtractFileExt(sFile)) = '.JPG' then
          begin
            found := True;
            bmp := TBitmap.Create;
            jpg := TJPEGImage.Create;
            jpg.LoadFromStream(Stream1);
            bmp.Assign(jpg);
            imgPicture.Picture.Assign(bmp);
            jpg.Free;
            bmp.Free;
          end
          else if Uppercase(ExtractFileExt(sFile)) = '.GIF' then
          begin
            found := True;
            gif := TGIFImage.Create;
            gif.LoadFromStream(Stream1);
            imgPicture.Picture.Assign(gif);
            gif.Free;
          end
          else if Uppercase(ExtractFileExt(sFile)) = '.PNG' then
          begin
            found := True;
            imgPicture.Picture.Graphic := TPNGGraphic.Create;
            imgPicture.Picture.Graphic.LoadFromStream(Stream1);
          end
          else if Uppercase(ExtractFileExt(sFile)) = '.BMP' then
          begin
            found := True;
            imgPicture.Picture.Bitmap.LoadFromStream(Stream1);
          end;
        end;
        SetCurrentDir(GoWinDir);
      end;
    end;

    if (not found) and (Length(sFile) > 4) and
       (FileExists(GoWindir + '\' + MoreDirB + sFile)) then
    begin
      s := Uppercase(ExtractFileExt(sFile));
      if (s = '.JPG') or (s = '.JPEG') or (s = '.BMP') or
         (s = '.GIF') or (s = '.PNG') then
      begin
        sCurPic := sFile;
        iCurPicIdx := no;
        if imgEmpty.Visible then
          imgEmpty.Visible := False;
        if PanelMP1.Visible then
          PanelMP1.Visible := False;
        if not imgPicture.Visible then
          imgPicture.Visible := True;
        imgPicture.Picture.LoadFromFile(GoWindir + '\' + MoreDirB + sFile);
      end
      else if IsMovieFile(s) then
      begin
        sCurPic := sFile;
        iCurPicIdx := no;
        if imgEmpty.Visible then
          imgEmpty.Visible := False;
        if imgPicture.Visible then
          imgPicture.Visible := False;
        if not PanelMP1.Visible then
          PanelMP1.Visible := True;
        if IsMusicPlaying then
          mnuMusicPlayStopClick(nil);

        loadMediaFile(GoWindir + '\' + MoreDirB + sFile, PanelMP1.Handle);
        if MediaStreamAvailable then
        try
          if VideoAvailable then
          begin
            Application.ProcessMessages;
            setVideoPos(0, 0, PanelMP1.Width, PanelMP1.Height);
            Application.ProcessMessages;
          end
          else
            PanelMP1.Visible:=false;
          Application.ProcessMessages;
          playMediaStream;
        except
        end;
      end;
    end;

    if not bStretchToFit and (sCurPic <> '') then
      ScaleDownToFit;

    // Update screen shot counter - x of y
    if NodeData.slScreenShots <> nil then
      lblScreenshotCounter.Caption := IntToStr(iCurPicIdx + 1) + ' ' +
        LanguageGo.sXOfY + ' ' +
        IntToStr(NodeData.slScreenShots.Count);

    if VSTree.CanFocus then
      VSTree.SetFocus;
  end;
end; // ShowPic

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.sbPrevClick(Sender: TObject);
begin
  ShowPic(iCurPicIdx - 1);
end; // SBPic1Click

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.sbNextClick(Sender: TObject);
begin
  ShowPic(iCurPicIdx + 1);
end; // SBPic2Click

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// START MUSIC PLAY ROUTINES
////////////////////////////////////////////////////////////////////////

// Find out when end of mod reached
procedure EndOfMusic(handle: HSYNC; channel, Data, user: DWORD); stdcall;
begin
  if iStreamLoopMode > 0 then
    Exit;

  bMusic_ModStopped := True;
end; // EndOfMusic

procedure TfrmMain.MusicDoOpen;
begin
  if IsMusicStream(sMusic_FileExt) then
  begin
    if Music_Stream <> 0 then
      BASS_StreamFree(Music_Stream);

    if Music_Mod <> 0 then
    begin
      BASS_MusicFree(Music_Mod);
      Music_Stream := 0;
    end;

    Music_Stream := BASS_StreamCreateFile(False, PChar(sMusic_File), 0, 0, iStreamLoopMode);

    //Retry
    if Music_Stream = 0 then
      Music_Stream := BASS_StreamCreateURL(PChar(sMusic_File),
        0, BASS_STREAM_RESTRATE, nil, 0);

    if Music_Stream = 0 then
      ShowMessage('MusicDoOpen - Can''t create stream')
    else
    begin
      if not BASS_ChannelPlay(Music_Stream, iStreamLoopMode = BASS_SAMPLE_LOOP) then
        ShowMessage('MusicDoOpen - Error playing stream');
    end;
    dwMusic_Length := BASS_ChannelGetLength(Music_Stream); // length in bytes
  end
  else if IsMusicMod(sMusic_FileExt) then
  begin
    if Music_Stream <> 0 then
    begin
      BASS_StreamFree(Music_Stream);
      Music_Stream := 0;
    end;

    if Music_Mod <> 0 then
      BASS_MusicFree(Music_Mod);

    // Get Mod Length
    Music_Mod := BASS_MusicLoad(False, PChar(sMusic_File), 0, 0, BASS_MUSIC_CALCLEN, 0);
    if Music_Mod = 0 then
      dwMusic_Length := 0
    else
//      dwMusic_Length := BASS_MusicGetLength(Music_Mod, True);
      dwMusic_Length := BASS_ChannelGetLength(Music_Mod);


    // Get total length of Mod
    if Music_Mod <> 0 then
      BASS_MusicFree(Music_Mod);

    if iStreamLoopMode > 0 then
      Music_Mod := BASS_MusicLoad(False, PChar(sMusic_File), 0, 0, BASS_MUSIC_LOOP or BASS_MUSIC_RAMP, 0)
    else
      Music_Mod := BASS_MusicLoad(False, PChar(sMusic_File), 0, 0, BASS_MUSIC_RAMP, 0);

    if Music_Mod = 0 then
      ShowMessage('MOD - Can''t load Music')
    else
    begin
      if BASS_ChannelPlay(Music_Mod, False) then
      begin
        bMusic_ModStopped := False;
        BASS_ChannelSetSync(Music_Mod, BASS_SYNC_ONETIME + BASS_SYNC_END,
          0, EndOfMusic, 0);
      end
      else
        ShowMessage('Can''t play mod music');
    end;
  end;
end; // MusicDoOpen


// MusicFilename must be lowercase when calling this procedure
procedure TfrmMain.SetMusicTrackRadioButton(item: TMenuItem; const MusicFilename: string);
var
  i: integer;
  s: string;
begin
  for i := 0 to item.Count - 1 do
    if item.Items[i].Count > 0 then
      SetMusicTrackRadioButton(item.Items[i], MusicFilename)
    else
    begin
      s := AnsiLowercase(sMusicFolder + item[i].Parent.Hint + '\' + item[i].Hint);
      s := StringReplace(s, '\\', '\', [rfReplaceAll]);
      item[i].Checked := s = MusicFilename;
    end;
end;

procedure TfrmMain.PlayNextTrack;
var
  i, j: integer;
  lastChecked: boolean;
begin
  lastChecked := False;
  if pmMusicTracks.Items.Count > 0 then
  begin
    for i := 0 to pmMusicTracks.Items.Count - 1 do
    begin
      if pmMusicTracks.Items[i].Checked then
        lastChecked := True
      else if (lastChecked) and (pmMusicTracks.Items[i].Count < 1) then
      begin
        MusicTrackClick(pmMusicTracks.Items[i]);
        lastChecked := False;
      end
      else if pmMusicTracks.Items[i].Count > 0 then
      begin
        for j := 0 to pmMusicTracks.Items[i].Count - 1 do
        begin
          if pmMusicTracks.Items[i].Items[j].Checked then
            lastChecked := True
          else if (lastChecked) and
            (pmMusicTracks.Items[i].Items[j].Count < 1) then
          begin
            MusicTrackClick(pmMusicTracks.Items[i].Items[j]);
            lastChecked := False;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.PlayPreviousTrack;
var
  i, j: integer;
  curno: integer;
  totidx: integer;
begin
  curno := 0;
  totidx := 0;
  if pmMusicTracks.Items.Count > 0 then
  begin
    for i := 0 to pmMusicTracks.Items.Count - 1 do
    begin
      Inc(totidx);
      if pmMusicTracks.Items[i].Checked then
        curno := totidx - 1
      else if pmMusicTracks.Items[i].Count > 0 then
      begin
        Dec(totidx);
        for j := 0 to pmMusicTracks.Items[i].Count - 1 do
        begin
          Inc(totidx);
          if pmMusicTracks.Items[i].Items[j].Checked then
            curno := totidx - 1
        end;
      end;
    end;
  end;

  totidx := 0;
  if curno > 0 then
  begin
    if pmMusicTracks.Items.Count > 0 then
    begin
      for i := 0 to pmMusicTracks.Items.Count - 1 do
      begin
        Inc(totidx);
        if pmMusicTracks.Items[i].Count < 1 then
        begin
          if totidx = curno then
            MusicTrackClick(pmMusicTracks.Items[i])
        end
        else if pmMusicTracks.Items[i].Count > 0 then
        begin
          Dec(totidx);
          for j := 0 to pmMusicTracks.Items[i].Count - 1 do
          begin
            Inc(totidx);
            if pmMusicTracks.Items[i].Items[j].Count < 1 then
              if totidx = curno then
                MusicTrackClick(pmMusicTracks.Items[i].Items[j]);
          end;
        end;
      end;
    end;
  end;
end;


procedure TfrmMain.MusicPlayRandom();
var
  i, j: integer;
  iMax: integer;
  iRand: integer;
begin
  Randomize;
  iMax := 0;

  // calc no of songs
  for i := 0 to pmMusicTracks.Items.Count - 1 do
  begin
    if  pmMusicTracks.Items[i].Count = 0 then
    begin
      Inc(iMax);
      pmMusicTracks.Items[i].Checked := False;
    end
    else if pmMusicTracks.Items[i].Count > 0 then
    begin
      for j := 0 to pmMusicTracks.Items[i].Count - 1 do
      begin
        Inc(iMax);
        pmMusicTracks.Items[i].Items[j].Checked := False;
      end;
    end
  end;

  iRand := Random(iMax) +1;

  // set choosen song
  iMax := 0;
  for i := 0 to pmMusicTracks.Items.Count - 1 do
  begin
    if  pmMusicTracks.Items[i].Count = 0 then
    begin
      Inc(iMax);
      if iMax >= iRand then
      begin
        pmMusicTracks.Items[i].Checked := True; // song AFTER this one will be played
        MusicTrackClick(pmMusicTracks.Items[i]);
        Exit;
      end;
    end
    else if pmMusicTracks.Items[i].Count > 0 then
    begin
      for j := 0 to pmMusicTracks.Items[i].Count - 1 do
      begin
        Inc(iMax);
        if iMax >= iRand then
        begin
          MusicTrackClick(pmMusicTracks.Items[i].Items[j]);
          pmMusicTracks.Items[i].Items[j].Checked := True; // song AFTER this one will be played
          Exit;
        end;
      end;
    end
  end;
end;


procedure TfrmMain.MusicTimerTimer(Sender: TObject);
var
  lastChecked: boolean;
  i, j: integer;
  oldmusic: string;
  len: DWORD;
  pos: DWORD;
begin
  if not bBASSDLLLoaded or ((Music_Stream = 0) and (Music_Mod = 0)) then
    Exit;

  if iStreamLoopMode > 0 then
    Exit; // do not start next track if we are looping

  pos := 0;
  len := 0;
  if IsMusicStream(sMusic_FileExt) then
  begin
    pos := BASS_ChannelGetPosition(Music_Stream); // current pos in bytes
    len := BASS_ChannelGetLength(Music_Stream); // length in bytes
  end
  else if IsMusicMod(sMusic_FileExt) then
  begin
    if not bMusic_ModStopped then
      Inc(len);
  end;

  if pos >= len then
  begin
    // Loop music tracks
    oldmusic := sMusic_File;
    lastChecked := False;
    if (pmMusicTracks.Items.Count > 0) and bMusicLoop then
    begin

      // random music file
      if bMusicLoopRandom then
      begin
        MusicPlayRandom();
        Exit;
      end;


      for i := 0 to pmMusicTracks.Items.Count - 1 do
      begin
        if pmMusicTracks.Items[i].Checked then
          lastChecked := True
        else if (lastChecked) and (pmMusicTracks.Items[i].Count < 1) then
        begin
          MusicTrackClick(pmMusicTracks.Items[i]);
          lastChecked := False;
        end
        else if pmMusicTracks.Items[i].Count > 0 then
        begin
          for j := 0 to pmMusicTracks.Items[i].Count - 1 do
          begin
            if pmMusicTracks.Items[i].Items[j].Checked then
              lastChecked := True
            else if (lastChecked) and
              (pmMusicTracks.Items[i].Items[j].Count < 1) then
            begin
              MusicTrackClick(pmMusicTracks.Items[i].Items[j]);
              lastChecked := False;
            end;
          end;
        end;
      end;

      if oldmusic = sMusic_File then // still no song playing?
      begin // ... then let's take the first song and play that
        lastChecked := False;
        for i := 0 to pmMusicTracks.Items.Count - 1 do
        begin
          if (pmMusicTracks.Items[i].Count < 1) and (not lastChecked) then
          begin
            sMusic_File := '';
            sMusic_FileExt := '';
            lastChecked := True;
            MusicTrackClick(pmMusicTracks.Items[i]);
          end
          else if pmMusicTracks.Items[i].Count > 0 then
          begin
            for j := 0 to pmMusicTracks.Items[i].Count - 1 do
            begin
              if (pmMusicTracks.Items[i].Items[j].Count < 1) and
                (not lastChecked) then
              begin
                sMusic_File := '';
                sMusic_FileExt := '';
                lastChecked := True;
                MusicTrackClick(pmMusicTracks.Items[i].Items[j]);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end; // MusicTimerTimer

////////////////////////////////////////////////////////////////////////
// END MUSIC PLAY ROUTINES
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

procedure TfrmMain.TimerMusicTitleScrollerTimer(Sender: TObject);
const
  MUSIC_TITLE_SCROLL_DELAY = 20;
begin
  if not IsMusicPlaying then
  begin
    TimerMusicTitleScroller.Enabled := False;
    Exit;
  end;

  if iMTDelay > 0 then
  begin
    Dec(iMTDelay);
    Exit;
  end;


  // Get clean BG picture
  BitBlt(picMPTitle.Bitmap.Canvas.Handle,          // Destination
      0, 0,                                          // X, Y (target pos)
      PlayerPosSize.iTitleWidth, PlayerPosSize.iTitleHeight, // Size to copy
      picMPTitleBG.Bitmap.Canvas.Handle,             // Source
      0, 0,                                          // X, Y (Source pos)
      SrcCopy);                                      // plain copy

  if bMTScrollingRight then
    Inc(iMTXCoordinate, 3)
  else
    Dec(iMTXCoordinate, 3);

  if iMTMessageWidth + iMTXCoordinate <= PlayerPosSize.iTitleWidth then
  begin
    iMTDelay := MUSIC_TITLE_SCROLL_DELAY;
    bMTScrollingRight := True
  end
  else if iMTXCoordinate >= 0 then
  begin
    iMTDelay := MUSIC_TITLE_SCROLL_DELAY;
    bMTScrollingRight := False;
  end;

  // Draw title on gfx (anti aliased)
  picMPTitle.Bitmap.Canvas.Font := lblMessage.Font;
  picMPTitle.Bitmap.Canvas.Brush.Style := bsClear;
  DrawAAText(picMPTitle.Bitmap, iMTXCoordinate, 0, sMTMusicTitle);

  //  Just in case music is stopped (or refresh is forced in delay), then
  //  the music title position is correct (BitBlt IS fast)
  BitBlt(imgPlayer.Canvas.Handle,                   // Destination
      PlayerPosSize.iTitleX, PlayerPosSize.iTitleY,   // X, Y (Dest pos)
      PlayerPosSize.iTitleWidth, PlayerPosSize.iTitleHeight, // Size to copy
      picMPTitle.Bitmap.Canvas.Handle,                // Source
      0, 0,                                           // X, Y (Source pos)
      SrcCopy);                                       // plain copy

  // Show label - using fast paintbox
  BitBlt(pbMusicTitle.Canvas.Handle, 0, 0,
         picMPTitle.Bitmap.Width, picMPTitle.Bitmap.Height,
         picMPTitle.Bitmap.Canvas.Handle, 0, 0, SRCCOPY);
end; // TimerMusicTitleScrollerTimer

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.DrawMusicTitle(const sMusicFilename: string; sMusicTitle: string);
  // Calcs music length in hh:mm:ss
  // and displays: Songtitle + (hh:mm:ss)
var
  fSecs: float;
  sSecs: string;
  iSecs: integer;
  lblTest: TLabel;
begin
  if imgPlayer.Visible and pbMusicTitle.Visible then
  begin
    sSecs := '';
    if dwMusic_Length > 0 then
    begin
      if Music_stream > 0 then
        fSecs := BASS_ChannelBytes2Seconds(Music_Stream, dwMusic_Length)
      else
        fSecs := BASS_ChannelBytes2Seconds(Music_Mod, dwMusic_Length);

      iSecs := Round(fSecs) mod 60;
      while (iSecs > 0) do
      begin
        if iSecs < 10 then
          sSecs := '0' + IntToStr(iSecs) + ':' + sSecs
        else
          sSecs := IntToStr(iSecs) + ':' + sSecs;

        fSecs := fSecs / 60;
        iSecs := Round(fSecs) mod 60;
      end;
      if Length(sSecs) > 0 then
      begin
        sSecs[Length(sSecs)] := ')';
        if sSecs[1] = '0' then
          sSecs[1] := '('
        else
          sSecs := '(' + sSecs;
        if Pos(sSecs, sMusicTitle) < 1 then
          sMusicTitle := sMusicTitle + '  ' + sSecs;
      end;
    end;

    BitBlt(picMPTitle.Bitmap.Canvas.Handle,                    // Destination
      0, 0,                                                    // X, Y (target pos)
      PlayerPosSize.iTitleWidth, PlayerPosSize.iTitleHeight,   // Size to copy
      picMPTitleBG.Bitmap.Canvas.Handle,                       // Source
      0, 0,                                                    // X, Y (Source pos)
      SrcCopy);                                                // plain copy

    picMPTitle.Bitmap.Canvas.Font := lblMessage.Font;
    picMPTitle.Bitmap.Canvas.Brush.Style := bsClear;
    DrawAAText(picMPTitle.Bitmap, 0, 0, sMusicTitle);


    // Get width in pixels
    lblTest := TLabel.Create(nil);
    lblTest.Font := lblMessage.Font;
    lblTest.Caption := sMusictitle;
    iMTMessageWidth := lblTest.Width;
    lblTest.Free;

    // Do we need scrolling?
    sMTMusicTitle := sMusictitle;
    bMTIsScrollingNeeded := iMTMessageWidth > PlayerPosSize.iTitleWidth + 3;
    if bMTIsScrollingNeeded then // to scroll
    begin
      iMTXCoordinate := 0;
      bMTScrollingRight := False;
      iMTDelay := 10;
    end;
    TimerMusicTitleScroller.Enabled := bMTIsScrollingNeeded;

    BitBlt(imgPlayer.Canvas.Handle,                   // Destination
      PlayerPosSize.iTitleX, PlayerPosSize.iTitleY,   // X, Y (Dest pos)
      PlayerPosSize.iTitleWidth, PlayerPosSize.iTitleHeight, // Size to copy
      picMPTitle.Bitmap.Canvas.Handle,                // Source
      0, 0,                                           // X, Y (Source pos)
      SrcCopy);                                       // plain copy

    BitBlt(pbMusicTitle.Canvas.Handle,                   // Destination
      0, 0,   // X, Y (Dest pos)
      PlayerPosSize.iTitleWidth, PlayerPosSize.iTitleHeight, // Size to copy
      picMPTitle.Bitmap.Canvas.Handle,                // Source
      0, 0,                                           // X, Y (Source pos)
      SrcCopy);                                       // plain copy
  end;
end; // DrawMusicTitle

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.MusicTrackClick(Sender: TObject);
var
  s: string;
  i, j: integer;
begin
  if bBASSDLLLoaded then
  begin
    // Deselect checked radio menuitems
    if pmMusicTracks.Items.Count > 0 then
    begin
      for i := 0 to pmMusicTracks.Items.Count - 1 do
      begin
        if pmMusicTracks.Items[i].Checked then
          pmMusicTracks.Items[i].Checked := False
        else if pmMusicTracks.Items[i].Count > 0 then
        begin
          for j := 0 to pmMusicTracks.Items[i].Count - 1 do
            if pmMusicTracks.Items[i].Items[j].Checked then
              pmMusicTracks.Items[i].Items[j].Checked := False
        end;
      end;
    end;

    if (Sender as TMenuItem).Parent.Hint = '' then
      s := sMusicFolder + (Sender as TMenuItem).Hint
    else
      s := sMusicFolder + (Sender as TMenuItem).Parent.Hint + '\' +
        (Sender as TMenuItem).Hint;

    if not runfromtemp then
      s := GoWinDir + '\' + s;

    if FileExists(s) then
    begin
      (Sender as TMenuItem).Checked := True; // check clicked radio menuitem
      if s <> sMusic_File then
      begin
        sMusic_File := s;
        sMusic_FileExt := UpperCase(ExtractFileExt(s));

        MusicDoOpen;
        mnuMusicPlayStartClick(Sender);

        // Draw music title
        DrawMusicTitle(s, (Sender as TMenuItem).Caption);
        if (imgPlayer.Visible = False) or (pbMusicTitle.Visible = False) then
          sMTMusicTitle := (Sender as TMenuItem).Caption;
      end
    end;
  end;
end; // MusicTrackClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuMusicPlayStopClick(Sender: TObject);
begin
  bMusic_Paused := False;

  if IsMusicStream(sMusic_FileExt) then
    BASS_ChannelStop(Music_Stream)
  else if IsMusicMod(sMusic_FileExt) then
    BASS_ChannelStop(Music_Mod);
  ClearMusicVis;
end; // mnuMusicPlayStopClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuMusicPlayStartClick(Sender: TObject);
begin
  if not bBASSDLLLoaded then
    Exit;

  if FileExists(sMusic_File) then
  begin
    if bMusic_Paused then
    begin
      bMusic_Paused := False;
      if IsMusicStream(sMusic_FileExt) then
        BASS_ChannelPlay(Music_Stream, False)
      else if IsMusicMod(sMusic_FileExt) then
        BASS_ChannelPlay(Music_Mod, False);
      TimerMusicTitleScroller.Enabled := bMTIsScrollingNeeded;
    end
    else
    begin
      if not boolean(BASS_ChannelIsActive(Music_Stream)) then
      begin
        if IsMusicStream(sMusic_FileExt) then
        begin
          BASS_ChannelSetPosition(Music_Stream, 0);
          BASS_ChannelPreBuf(Music_Stream , 0);
          if not BASS_ChannelPlay(Music_Stream, iStreamLoopMode = BASS_SAMPLE_LOOP) then
            ShowMessage('MP3PlayStartClick - MP3 - Error');
        end
        else if IsMusicMod(sMusic_FileExt) then
        begin
          BASS_ChannelSetPosition(Music_Mod, 0);
          if not BASS_ChannelPlay(Music_Mod, False) then
            ShowMessage('MP3PlayStartClick - MOD - Error');
        end;
      end;

      MusicTimer.Enabled := False;
      MusicTimer.Enabled := True;;
      TimerMusicTitleScroller.Enabled := bMTIsScrollingNeeded;
    end;
  end
  else if (sMusic_File = '') and (pmMusicTracks.Items.Count > 0) then
    MusicPlayRandom
end; // mnuMusicPlayStartClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuMusicPlayPauseClick(Sender: TObject);
begin
  if IsMusicStream(sMusic_FileExt) then
    BASS_ChannelPause(Music_Stream)
  else if IsMusicMod(sMusic_FileExt) then
    BASS_ChannelPause(Music_Mod);

  bMusic_Paused := True;

  ClearMusicVis;
end; // mnuMusicPlayPauseClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  // Removes the global atom item from the table so it can be run again
  if not secondinstance then
    GlobalDeleteAtom(atom);
end; // FormDestroy

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuExitClick(Sender: TObject);
begin
  imgCloseClick(Sender);
end; // mnuExitClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuMinimizeClick(Sender: TObject);
begin
  Application.Minimize;
end; // mnuMinimizeClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ScreenshotPLayClick(Sender: TObject);
begin
  StopVideoPlay;
end; // ScreenshotPLayClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ScreenshotPauseClick(Sender: TObject);
begin
  if MediaStreamPlayed then
    pauseMediaStream;
end; // ScreenshotPauseClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ScreenshotStopClick(Sender: TObject);
begin
  if MediaStreamPlayed then
    stopMediaStream;
end; // ScreenshotStopClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.LaunchMPClick(Sender: TObject);
var
  sDirectory: string;
begin
  StopVideoPlay;

  sDirectory := GetCurrentDir;
  if sDirectory[Length(sDirectory)] = '\' then
    sDirectory := sDirectory + ArchiveDir
  else
    sDirectory := sDirectory + '\' + ArchiveDir;
  if sCurPic <> '' then
    ExecuteFile('Open', sCurPic, '', sDirectory, SW_SHOWNORMAL, False);
  if VSTree.CanFocus then
    VSTree.SetFocus;
end; // LaunchMPClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.PopupMenuScreenshotPopup(Sender: TObject);
begin

  if MediaStreamPlayed then
  begin
    ScreenshotPlay.Enabled := False;
    ScreenshotPause.Enabled := True;
    ScreenshotStop.Enabled := True;
  end
  else
  begin
    ScreenshotPlay.Enabled := True;
    ScreenshotPause.Enabled := False;
    ScreenshotStop.Enabled := False;
  end;
end; // PopupMenuScreenshotPopup

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeChange(Sender: TBaseVirtualTree;  Node: PVirtualNode);
var
  j: integer;
  ValCode: integer;
  s: string;
  NodeData: PTreeData;
begin
  if (Sender.SelectedCount > 0) and (Node <> nil) then
  begin
    NodeData := Sender.GetNodeData(Node);

    lblMessage.Visible := NodeData.bCategory and (lblMsgInfoBack.Height > lblMessage.Height);
    lblQIText.Visible := not NodeData.bCategory;
    mirvQuickinfo.Visible := not NodeData.bCategory;

    StopVideoPlay;

    if bShowMore then
    begin
      if (NodeData.sMore = '') or (NodeData.sMore = '-') then
      begin
        imgMore.Visible := False;
        imgNfo.Visible := False;
      end
      else
      begin
        if Uppercase(ExtractFileExt(NodeData.sMore)) = '.NFO' then
        begin
          imgNFO.Visible := True;
          imgMore.Visible := False;
        end
        else
        begin
          imgMore.Visible := True;
          imgNFO.Visible := False;
        end;
      end;
    end;

    if ((NodeData.sPgmName = '') or (NodeData.sPgmName = '-')) and (Pos('disable defaultaction', Lowercase(NodeData.sScript)) < 1) then
    begin
      imgInstall.Visible := False;
      imgPlay.Visible := False;
      imgRun.Visible := False;
      imgView.Visible := False;
    end
    else
    begin
      if (NodeData.sGoButton = '') or (NodeData.sGoButton = 'Install') then
      begin // Install
        imgInstall.Visible := True;
        imgPlay.Visible := False;
        imgRun.Visible := False;
        imgView.Visible := False;
      end
      else if NodeData.sGoButton = 'Play' then
      begin
        imgInstall.Visible := False;
        imgPlay.Visible := True;
        imgRun.Visible := False;
        imgView.Visible := False;
      end
      else if NodeData.sGoButton = 'Run' then
      begin
        imgInstall.Visible := False;
        imgPlay.Visible := False;
        imgRun.Visible := True;
        imgView.Visible := False;
      end
      else if NodeData.sGoButton = 'View' then
      begin
        imgInstall.Visible := False;
        imgPlay.Visible := False;
        imgRun.Visible := False;
        imgView.Visible := True;
      end;
    end;

    // Build Quick information
    Val(NodeData.sSize, j, ValCode);
    if ValCode <> 0 then
      s := LanguageGo.sUnknownSize
    else
      s := SizeKbToStr(j);

    if bShowCDno then
      s := s + #13#10 + NodeData.sCDno;

    if bShowCustom1 then
      s := s + #13#10 + NodeData.sCustomField1;
    if bShowCustom2 then
      s := s + #13#10 + NodeData.sCustomField2;
    if bShowCustom3 then
      s := s + #13#10 + NodeData.sCustomField3;
    if bShowCustom4 then
      s := s + #13#10 + NodeData.sCustomField4;
    if bShowCustom5 then
      s := s + #13#10 + NodeData.sCustomField5;

    mirvQuickInfo.Clear;
    UrlHighLight(mirvQuickInfo, s, QuickInfoUrls);
    mirvQuickInfo.Format;
    mirvQuickInfo.Refresh;


    // Description & Installation notes
    RichViewDescr.Clear;
    if bApdDesc2Note then
    begin
      if Trim(NodeData.sNote) = '' then
        UrlHighLight(RichViewDescr, NodeData.sDescr, DescrUrls)
      else
        UrlHighLight(RichViewDescr, NodeData.sDescr +
          #13#10 + ' ' +
          #13#10 + sD2NDelimiter + #13#10 +
          NodeData.sNote, DescrUrls);
      RichViewDescr.Format;
      RichViewDescr.Refresh;
    end
    else
    begin
      UrlHighLight(RichViewDescr, NodeData.sDescr, DescrUrls);
      RichViewDescr.Format;
      RichViewDescr.Refresh;

      RichViewNote.Clear;
      UrlHighLight(RichViewNote, NodeData.sNote, NoteUrls);
      RichViewNote.Format;
      RichViewNote.Refresh;
    end;

    if bShowScreenShots then
    begin
      ShowPic(0);
      if NodeData.slScreenShots <> nil then
      begin
        imgPrev.Visible := NodeData.slScreenShots.Count > 1;
        imgNext.Visible := imgPrev.Visible;
        lblScreenshotCounter.Caption := '1 ' + LanguageGo.sXOfY + ' ' +
          IntToStr(NodeData.slScreenShots.Count);
        lblScreenshotCounter.Visible := imgPrev.Visible;
      end
      else
      begin
        imgPrev.Visible := False;
        imgNext.Visible := False;
        lblScreenshotCounter.Visible := False;
      end;
    end;

    if sCurPic = '' then // No screenshot
    begin
      if not imgEmpty.Visible then
        imgEmpty.Visible := True;
      if imgPicture.Visible then
        imgPicture.Visible := False;
    end;
  end;

  // Check for new buttons/states and draw (and reset
  // earlier states like 'down')
  btnNfo.Status:=3;
  btnMore.Status:=3;
  btnInstall.Status:=3;
  btnRun.Status:=3;
  btnPlay.Status:=3;
  btnView.Status:=3;
end; // VSTreeChange

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeDblClick(Sender: TObject);
  // double click on a node will start installation of the clicked program
var
  p: TPoint;
  Node: PVirtualNode;
  NodeData: PTreeData;
begin
  p := VSTree.ScreenToClient(Mouse.CursorPos);
  Node := VSTree.GetNodeAt(p.X, p.Y);
  NodeData := VSTree.GetNodeData(Node);
  if (NodeData <> nil) and (not NodeData.bCategory) then
    imgInstallClick(Sender);
end; // VSTreeDblClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then // Enter
    imgInstallClick(Sender);
end; // VSTreeKeyPress

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgMinimizeClick(Sender: TObject);
begin
  Application.Minimize;
end; // imgMinimizeClick

////////////////////////////////////////////////////////////////////////

function SHDelete(Path: string): boolean;
var
  FOS: TSHFileOpStruct;
  MemFrom: array[0..max_path] of char;
  SRec: TSearchRec;
begin
  Result := False;
  if Path[Length(Path)] = '\' then
    Delete(Path, Length(Path), 1);

  if (UpperCase(Path) = 'C:') or
    (UpperCase(Path) = 'C:\PROGRAM FILES') or
    (UpperCase(Path) = 'C:\WINNT') or
    (UpperCase(Path) = 'C:\WINDOWS') then
    exit;

  if FindFirst(Path, faAnyfile and not faVolumeID, SRec) = 0 then
  begin
    with FOS do
    begin
      Wnd := Application.Handle;
      wFunc := FO_DELETE;
      FillChar(MemFrom, SizeOf(MemFrom), #0);
      StrPCopy(MemFrom, Path + #0 + #0);
      pFrom := MemFrom;
      pTo := nil;
      fFlags := FOF_NOCONFIRMATION or FOF_SILENT;
    end;
    {$I-}
    Result := SHFileOperation(FOS) = 0;
    {$I+}
    SetLastError(0);
  end;
  FindClose(SRec);
end; // SHDelete

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgCloseClick(Sender: TObject);
var
  i: integer;
  cResult: Cardinal;
begin
  RunScript(sExitScript);

  StopVideoPlay;

  // Unload mp3 player
  if MusicTimer.Enabled and bBASSDLLLoaded then
  begin
    UnloadMusicLibrary;
    Unload_BASSDLL;
  end;

  ChkFile.Enabled := False;
  TimerRender.Enabled := False;
  TimerMusicTitleScroller.Enabled := False;
  MusicTimer.Enabled := False;

  SkinZipFile.Free;

  try
    frmInstall.UnloadUnrar;
  except
  end;

  try
    frmInstall.UnloadUnAce;
  except
  end;

  // Unload custom font
  if FontFile <> '' then
    RemoveFontResource(PChar(FontFile));

  // Unload font
  if FontFile <> '' then
  begin
    RemoveFontResource(PChar(FontFile));
    SendMessageTimeout(HWND_BROADCAST,
                       WM_FONTCHANGE, // Msg
                       0, // wParam,
                       0, // lParam,
                       SMTO_NORMAL, // fuFlags,
                       200, // uTimeout in miliseconds
                       cResult); // PDWORD_PTR
  end;

  // delete any temporary files
  try
    for i := 0 to filesToDelete.Count - 1 do
    begin
      try
        if FileExists(filesToDelete.Strings[i]) then
          DeleteFile(filesToDelete.Strings[i]);
      except
      end;
    end;
    filesToDelete.Free;
  except
  end;

  try
    for i := foldersToDelete.Count - 1 downto 0 do
    begin
      try
        if DirectoryExists(foldersToDelete.Strings[i]) then
          RemoveDir(foldersToDelete.Strings[i]);
      except
      end;
    end;
    foldersToDelete.Free;
  except
  end;

  try
    SkinButtonFree(btnMinimize);
    SkinButtonFree(btnClose);
    DescrUrls.Free;
    NoteUrls.Free;
    QuickInfoUrls.Free;
    if Spectrum <> nil then
      Spectrum.Free;
    if OcilloScope <> nil then
      OcilloScope.Free;
  except
  end;

  Application.Terminate;
end; // imgCloseClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgMinimizeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgMinimize.Picture.Assign(btnMinimize.picMDown);
    btnMinimize.Status := 2; // 2 = Mouse Down
  end;
end; // imgMinimizeMouseDown

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgMinimizeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  btnMinimize.Status := 3; // 3 = Nothing - let timer decide
end; // imgMinimizeMouseUp

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgCloseMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgClose.Picture.Assign(btnClose.picMDown);
    btnClose.Status := 2; // 2 = Mouse Down
  end;
end; // imgCloseMouseDown

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgCloseMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  btnClose.Status := 3; // 3 = Nothing - let timer decide
end; // imgCloseMouseUp

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: boolean; var ImageIndex: integer);
var
  NodeData: PTreeData;
begin
  NodeData := VSTree.GetNodeData(Node);
  if VSTree.Expanded[Node] then
    ImageIndex := NodeData.iIconEx
  else
    ImageIndex := NodeData.iIcon;
end; // VSTreeGetImageIndex

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  Data: PTreeData;
begin
  Data := Sender.GetNodeData(Node);
  //  case 3 of
  //    1: CellText:=Data.wsText + '  [' + Data.sSize + LanguageGo.sMB + ']';
  //    2: CellText:=Data.wsText + '  [' + Data.sCDNO + ']';
  //    3: CellText:=Data.wsText + '  [' + Data.sCustomField1 + ']';
  //  else
  CellText := Data.wsText;
  //  end;
end; // VSTreeGetText

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreePaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
begin
  if (Node = VSTree.HotNode) and (toHotTrack in VSTree.TreeOptions.PaintOptions) then
    TargetCanvas.Font.Color := UrlHottrackColor; // mouse over color  (hottrack)
end; // VSTreePaintText

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.UrlJumpTo(const sUrl: string);
// starts browser pointing to 'sUrl'
begin
  Screen.Cursor := crHourGlass;
  if XpOrNewer then
    ExecuteFile('Open', sUrl, '', '', SW_SHOWNORMAL, False) // start associated program
  else // just start ms ie
    ExecuteFile('Open', 'iexplore', sUrl, '', SW_SHOWNORMAL, False);

  Screen.Cursor := crDefault;
end; // RichViewNoteJump

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.RichViewDescrJump(Sender: TObject; id: integer);
  // Start browser when clicked on http:// or ftp://
var
  s: string;
begin
  if DescrUrls.Count > id then
  begin
    s := DescrUrls.Strings[id];
    if Copy(s, 1, 7) = 'script:' then
      RunScript(s)
    else
      UrlJumpTo(s);
  end;
end; // RichViewDescrJump

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.RichViewNoteJump(Sender: TObject; id: integer);
  // Start browser when clicked on http:// or ftp://
var
  s: string;
begin
  if NoteUrls.Count > id then
  begin
    s := NoteUrls.Strings[id];
    if Copy(s, 1, 7) = 'script:' then
      RunScript(s)
    else
      UrlJumpTo(s);
  end;
end; // RichViewNoteJump

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.FormClose(Sender: TObject; var AAction: TCloseAction);
begin
  imgCloseClick(Sender);
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: PTreeData;
begin
  Data := Sender.GetNodeData(Node);
  if Data.slScreenShots <> nil then
    Data.slScreenShots.Free;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPrevMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgPrev.Picture.Assign(btnPrev.picMDown);
    btnPrev.Status := 2; // 2 = Mouse Down

    if imgPrev.Enabled then
      ShowPic(iCurPicIdx - 1);
  end;
end; // imgMinimizeMouseUp

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPrevMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if imgPrev.Enabled then
    imgPrev.Picture.Assign(btnPrev.pic);
  btnPrev.Status := 0; // 0 = normal
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgNextMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgNext.Picture.Assign(btnNext.picMDown);
    btnNext.Status := 2; // 2 = Mouse Down

    if imgNext.Enabled then
      ShowPic(iCurPicIdx + 1);
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgNextMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if imgNext.Enabled then
    imgNext.Picture.Assign(btnNext.pic);
  btnNext.Status := 0; // 0 = normal
end;

////////////////////////////////////////////////////////////////////////

function IsDiskInDrive(Drive: Char): Boolean;
var
  ErrorMode: Word;
begin
  // make drive is upper case
  if Drive in ['a'..'z'] then
    Dec(Drive, $20);

  // make sure it's a letter
  if not (Drive in ['A'..'Z']) then
    raise EConvertError.Create('Not a valid drive ID');

  // turn off critical errors
  ErrorMode := SetErrorMode(SEM_FailCriticalErrors);
  try
    // drive 1 = a, 2 = b, 3 = c, etc.
    if DiskSize(Ord(Drive) - $40) = -1 then
      Result := False
    else
      Result := True;
  finally
    // Restore old error mode
    SetErrorMode(ErrorMode);
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgInstallClick(Sender: TObject);
  // A user clicks on the install button and the install windows
  // will take over control, after the installations info has
  // determined
var
  i: integer;
  s: string;
  ext: string;
  doRetry: boolean;
  stitle: string;
  Offline: boolean; // Offline browsing
  Node: PVirtualNode;
  NodeData: PTreeData;
  NodeParentData: PTreeData;
  slDrives: TStringList;
  CurDrive: string;
begin
  if resourcefile <> '' then
    SetCurrentDir(GoWinDir);

  if VSTree.SelectedCount > 0 then
  begin
    CurDrive := 'C'; // default drive for installation
    Node := VSTree.GetFirstSelected;
    NodeData := VSTree.GetNodeData(Node);
    zipfile := NodeData.sPgmName;
    if (zipfile <> '') and (zipfile <> '-') or
       (Pos('disable defaultaction', Lowercase(NodeData.sScript)) > 0)then
    begin
      if (UpperCase(Copy(zipfile, 1,5)) = 'HTTP:') or
        (UpperCase(Copy(zipfile, 1,4)) = 'FTP:') then
      begin // web stuff
        ExecuteFile('Open', zipfile, '', '', SW_SHOWNORMAL, False); // launch associated program
        Exit; // exit current procedure
      end;

      if FileExists(GoWindir + '\' + ArchiveDirB + zipfile) then
        Offline := False
      else
      begin
        Offline := True;
        if (MusicTimer.Enabled) and
          bBASSDLLLoaded and
          (GetDriveType(PChar(s)) = 5) then // on cd/dvd
          mnuMusicPlayStopClick(Sender); // Stop music
      end;

      if Offline then
      begin
        ListDrives(slDrives, DRIVE_CDROM);
        for i := 0 to slDrives.Count - 1 do
        begin
          s := slDrives.Strings[i];
          if IsDiskInDrive(s[1]) then
          begin
            if FileExists(s + '\' + ArchiveDirB + zipfile) then
              CurDrive := s[1];
          end;
        end;
        SetCurrentDir(CurDrive + ':\');
        frmInstall.arcpath := CurDrive + ':\';
      end
      else
      begin
        frmInstall.arcpath := GoWinDir;
        SetCurrentDir(GoWinDir);
      end;

      // build window title for 'Insert disc' dialog
      if (Trim(lblHandle.Caption) <> '') and (Trim(lblTitle.Caption) <> '') then
        stitle := LanguageGo.sInsertDisc + ' "' +
          lblHandle.Caption + ' - ' + lblTitle.Caption + '"'
      else if Trim(lblTitle.Caption) <> '' then
        stitle := 'Insert disc: "' + lblTitle.Caption + '"'
      else
        stitle := 'Insert disc: ';
      if (NodeData.sCDno <> '-') and (NodeData.sCDno <> '') then
        stitle := stitle + ' ' + NodeData.sCDno;
      doRetry := False;
      repeat
        if FileExists(GoWindir + '\' + ArchiveDirB + zipfile) then
        begin
          if Screen.Cursor = crHourGlass then
            Screen.Cursor := crDefault;
          if Length(zipfile) > 3 then
          begin
            bDisableFinishMsg := False;
            bDisableUnpackWin := False;
            bDisableInstallWin := False;
            bDisableDefaultAction := False;
            bMakeUninst := False; // default - no uninstall
            iDesktopShortcuts := 0;
            CheckScript(NodeData.sScript); // check MakeUninst and desktop shortcuts

            CurCategory := '';
            if Node.Parent <> nil then
            begin
              NodeParentData := VStree.GetNodeData(Node.Parent);
              if NodeParentData <> nil then
                CurCategory := NodeParentData.wsText;
            end;

            frmInstall.SetNodeData(NodeData);

            if bDisableDefaultAction then
              RunScript(NodeData.sScript)
            else
            begin
              ext := GetExt(GoWindir + '\' + ArchiveDirB + zipfile);
              if (ext = '.ZIP') or (ext = '.RAR') or (ext = '.ACE') then
              begin
                if GoWinDir[Length(GoWinDir)] = '\' then
                  picdir := GoWinDir
                else
                  picdir := GoWinDir + '\';


                frmInstall.arcext := ext;
                SetInstallPath(NodeData.sPath);

                if bDisableInstallWin then
                begin
                  frmInstall.FormActivate(Sender);
                  if not bDisableUnpackWin then
                    frmMain.Hide;
                  frmInstall.imgFinishClick(Sender);
                end
                else
                begin
                  frmInstall.Show;
                  frmMain.Hide;
                end;
                doRetry := False;
              end
              else
              begin // execute file in it's own directory
                if Offline then
                  s := ExtractFilePAth(CurDrive + ':\' + ArchiveDirB + zipfile)
                else
                  s := ExtractFilePAth(GoWinDir + '\' + ArchiveDirB + zipfile);
                if s[Length(s)] = '\' then Delete(s, Length(s), 1);
                doRetry := False;
                ExecuteFile('Open', ExtractFilename(zipfile), '', s, SW_SHOWNORMAL, False);

                // Also run script if any
                if Trim(NodeData.sScript) <> '' then
                  RunScript(NodeData.sScript);

              end;
            end;
          end;
        end
        else // file not found
        begin
          bDisableFinishMsg := False;
          bDisableUnpackWin := False;
          bDisableInstallWin := False;
          bDisableDefaultAction := False;
          bMakeUninst := False; // default - no uninstall
          iDesktopShortcuts := 0;
          CheckScript(NodeData.sScript); // check MakeUninst and desktop shortcuts

          CurCategory := '';
          if Node.Parent <> nil then
          begin
            NodeParentData := VStree.GetNodeData(Node.Parent);
            if NodeParentData <> nil then
              CurCategory := NodeParentData.wsText;
          end;

          frmInstall.SetNodeData(NodeData);

          if bDisableDefaultAction then
            RunScript(NodeData.sScript)
          else
          begin
            if (zipfile = '') or (zipfile = '-') then
              Sleep(1)
            else
            begin // archive AName not empty
              ListDrives(slDrives, DRIVE_CDROM);
              for i := 0 to slDrives.Count - 1 do
              begin
                s := slDrives.Strings[i];
                if IsDiskInDrive(s[1]) then
                begin
                  if FileExists(s + '\' + ArchiveDirB + zipfile) then
                    CurDrive := s[1];
                end;
              end;

              frmMain.Repaint;
              SetCurrentDir(CurDrive + ':\');
              frmInstall.arcpath := CurDrive + ':\';

              frmMsgBox.MsgBox(stitle, mtConfirmation, [mbOK] + [mbCancel], 0);
              if frmMsgBox.msgboxReturn = mrOk then
              begin
                doRetry := True;
                Screen.Cursor := crHourGlass;
              end
              else
                doRetry := False;
            end;
          end;
        end;
      until not doRetry;
      SetCurrentDir(GoWinDir);
      if Screen.Cursor = crHourGlass then
        Screen.Cursor := crDefault;
    end;
  end;
  SetCurrentDir(GoWinDir);
end; // imgInstallClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgInstallMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    if imgInstall.Visible then
    begin
      imgInstall.Picture.Assign(btnInstall.picMDown);
      btnInstall.Status := 2; // 2 = Mouse Down
    end
    else if imgPlay.Visible then
    begin
      imgPlay.Picture.Assign(btnPlay.picMDown);
      btnPlay.Status := 2; // 2 = Mouse Down
    end
    else if imgRun.Visible then
    begin
      imgRun.Picture.Assign(btnRun.picMDown);
      btnRun.Status := 2; // 2 = Mouse Down
    end
    else if imgView.Visible then
    begin
      imgView.Picture.Assign(btnView.picMDown);
      btnView.Status := 2; // 2 = Mouse Down
    end;
  end;
end; // imgInstallMouseDown

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgInstallMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if imgInstall.Visible then
    btnInstall.Status := 3 // 3 = Nothing - let timer decide
  else if imgPlay.Visible then
    btnPlay.Status := 3 // 3 = Nothing - let timer decide
  else if imgRun.Visible then
    btnRun.Status := 3 // 3 = Nothing - let timer decide
  else if imgView.Visible then
    btnView.Status := 3 // 3 = Nothing - let timer decide
end; // imgInstallMouseUp

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgMoreClick(Sender: TObject);
var
  sDirectory: string;
  sFile: string;
  Stream1: TStream;
  Node: PVirtualNode;
  NodeData: PTreeData;
begin
  if resourcefile <> '' then
    SetCurrentDir(GoWinDir);

  if VSTree.SelectedCount > 0 then
  begin
    Node := VSTree.GetFirstSelected;
    NodeData := VSTree.GetNodeData(Node);
    sDirectory := GoWinDir;
    if sDirectory[Length(sDirectory)] <> '\' then
      sDirectory := sDirectory + '\';
    sFile := sDirectory + moredirb + NodeData.sMore;
    sDirectory := ExtractFilePath(sFile);
    sFile := ExtractFileName(sFile);

    if Uppercase(ExtractFileExt(NodeData.sMore)) = '.NFO' then
    begin
      if frmNFO = nil then // either no NFO skin or form just not loaded yet
      begin
        if ExistsSkinImage('nfo') then // test to see if NFO screen exists
        begin
          Screen.Cursor := crHourGlass;
          Application.CreateForm(TfrmNFO, frmNFO);
          LoadSkinImage(frmNFO.imgNFO.Picture, 'nfo', True);
          frmNfo.Width := frmNFO.imgNFO.Width;
          frmNfo.Height := frmNFO.imgNFO.Height;
          frmNFO.mnuNfoSelectAll.Caption:=mnuNoteSelectAll.Caption;
          frmNFO.mnuNfoCopy.Caption:=mnuNoteCopy.Caption;

          MakeTransparent(frmNFO, frmNFO.imgNFO);

          if not trlunpack then
            MakeTranslucency(frmNFO.Handle, vtranslucenty);

          frmNFO.RVStyleNFO.Color := VSTree.Color;
          with frmNFO.RVStyleNFO.TextStyles.Items[rvsNormal] do
          begin
            Color := lblMessage.Font.Color;
            AName := NFOFontName;
            CharSet := NFOFontCharset;
            if NFOFontName = 'Terminal' then
                Size := 6 // argh, now 6 is smaller than 9 - better // somehow 9 is smaller than 6.... perhaps I should use 5!?
            else
              Size := NfoFontSize;
          end;

          with frmNFO.RVStyleNFO.TextStyles.Items[rvsJump1] do
          begin // font for urls
            Color := UrlHottrackColor;
            AName := NFOFontName;
            CharSet := NFOFontCharset;
            if NFOFontName = 'Terminal' then
                Size := 6 // argh, now 6 is smaller than 9 - better! // somehow 9 is smaller than 6.... perhaps I should use 5!?
            else
              Size := NfoFontSize
          end;

          // copy background of NFO AText from imgNFO
          frmNFO.RichViewNFO.BackgroundBitmap.Width := frmNFO.RichViewNFO.Width;
          frmNFO.RichViewNFO.BackgroundBitmap.Height := frmNFO.RichViewNFO.Height;
          BitBlt(frmNFO.RichViewNFO.BackgroundBitmap.Canvas.Handle,    // Destination
            0, 0,                                                 // X, Y (target pos)
            frmNFO.RichViewNFO.Width, frmNFO.RichViewNFO.Height,  // Size to copy
            frmNFO.imgNFO.Canvas.handle,                          // Source
            frmNFO.RichViewNFO.Left, frmNFO.RichViewNFO.Top,
            // X, Y (source pos)
            SrcCopy);                                             // plain copy
          frmNFO.RichViewNFO.BackgroundStyle := bsNormal;

          Screen.Cursor := crDefault;
        end;
      end;

      if frmNFO <> nil then
      begin
        if resourcefile <> '' then
        begin
          ZipMaster1.ZipFileName := resourcefile;
          ZipMaster1.Password := resourcepwd;
          Stream1 := ZipMaster1.ExtractFileToStream(moredirb + NodeData.sMore);
          if Stream1 <> nil then
          begin
            ChkFile.Enabled:=False;
            btnNfo.Status := 0; // normal
            imgNfo.Picture.Assign(btnNfo.pic);
            frmNFO.ShowNfoFile('', Stream1);
            ChkFile.Enabled:=True;
          end
        end
        else
        begin
          ChkFile.Enabled:=False;
          btnNfo.Status := 0; // normal
          imgNfo.Picture.Assign(btnNfo.pic);
          frmNFO.ShowNfoFile(sDirectory + sFile, nil);
          ChkFile.Enabled:=True;
        end
      end
      else
      begin
        if resourcefile <> '' then
        begin
          ZipMaster1.ZipFileName := resourcefile;
          ZipMaster1.Password := resourcepwd;
          ZipMaster1.FSpecArgs.Text := moredirb + NodeData.sMore;
          ZipMaster1.ExtrOptions := [ExtrOverwrite] + [ExtrDirNames];
          ZipMaster1.ExtrBaseDir := tmpdir;
          try
            ZipMaster1.Extract;
          except
          end;

          Sleep(100);
          filesToDelete.Add(tmpdir + moredirb + NodeData.sMore);
          // Delete file later (FormDestroy)
          ExecuteFile('Open', 'notepad', ExtractFileName(tmpdir + moredirb + NodeData.sMore),
            ExtractFilePath(tmpdir + moredirb + NodeData.sMore),
            SW_SHOWNORMAL, False)
        end
        else
          ExecuteFile('Open', 'notepad', sFile, sDirectory, SW_SHOWNORMAL, False)
      end;
    end
    else // Not .NFO file
      ExecuteFile('Open', sFile, '', sDirectory, SW_SHOWNORMAL, False);


    SetCurrentDir(GoWinDir);
    if VSTree.CanFocus then VSTree.SetFocus;

  end;
  SetCurrentDir(GoWinDir);
end; // imgMoreClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgNFOMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgNFO.Picture.Assign(btnNfo.picMDown);
    btnNFO.Status := 2; // 2 = Mouse Down
  end;
end; // imgNFOMouseDown

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgMoreMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgMore.Picture.Assign(btnMore.picMDown);
    btnMore.Status := 2; // 2 = Mouse Down
  end;
end; // imgMoreMouseDown

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgNFOMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  btnNFO.Status := 3; // 3 = Nothing - let timer decide
end; // imgNFOMouseUp

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgMoreMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  btnMore.Status := 3; // 3 = Nothing - let timer decide
end; // imgMoreMouseUp

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

procedure TfrmMain.TimerRenderTimer(Sender: TObject);
var
  FFTFata: TFFTData;
  WaveData: TWaveData;
  dwHandle: cardinal;
begin
  if IsMusicStream(sMusic_fileExt) then
    dwHandle := Music_Stream
  else
    dwHandle := Music_Mod;

  if BASS_ChannelIsActive(dwHandle) <> BASS_ACTIVE_PLAYING then Exit;

  if iMusicVisualMode = 1 then
  begin
    BASS_ChannelGetData(dwHandle, @WaveData, 2048);
    OcilloScope.Draw(pbMusicVis.Canvas.Handle, WaveData, 0, pbMusicVis.Height div 2);
  end
  else if iMusicVisualMode = 2 then
  begin
    BASS_ChannelGetData(dwHandle, @FFTFata, BASS_DATA_FFT1024);
    Spectrum.Draw(pbMusicVis.Canvas.Handle, FFTFata, 0, 0);
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerOpenMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgPlayerOpen.Picture.Assign(btnMPOpen.picMDown);
    btnMPOpen.Status := 2; // 2 = Mouse Down
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerOpenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  btnMPOpen.Status := 3; // let timer deceide
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerRewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgPlayerRew.Picture.Assign(btnMPRew.picMDown);
    btnMPRew.Status := 2; // 2 = Mouse Down
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerRewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  btnMPRew.Status := 3; // let timer deceide
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerStopMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgPlayerStop.Picture.Assign(btnMPStop.picMDown);
    btnMPStop.Status := 2; // 2 = Mouse Down
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerStopMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  btnMPStop.Status := 3; // let timer deceide
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerPauseMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgPlayerPause.Picture.Assign(btnMPPause.picMDown);
    btnMPPause.Status := 2; // 2 = Mouse Down
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerPauseMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  btnMPPause.Status := 3; // let timer deceide
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerPlayMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgPlayerPlay.Picture.Assign(btnMPPlay.picMDown);
    btnMPPlay.Status := 2; // 2 = Mouse Down
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerPlayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  btnMPPlay.Status := 3; // let timer deceide
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerForwardMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    imgPlayerForward.Picture.Assign(btnMPForward.picMDown);
    btnMPForward.Status := 2; // 2 = Mouse Down
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerForwardMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  btnMPForward.Status := 3; // let timer deceide
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerOpenClick(Sender: TObject);
begin
  pmMusicTracks.Popup(Mouse.CursorPos.x,
    Mouse.CursorPos.y);
end; // imgPlayerOpenClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerStopClick(Sender: TObject);
begin
  mnuMusicPlayStopClick(Sender);
end; // imgPlayerStopClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerPauseClick(Sender: TObject);
begin
  mnuMusicPlayPauseClick(Sender);
end; // imgPlayerPauseClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerPlayClick(Sender: TObject);
begin
  mnuMusicPlayStartClick(Sender);
end; // imgPlayerPlayClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerForwardClick(Sender: TObject);
begin
  PlayNextTrack;
end; // imgPlayerForwardClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPlayerRewClick(Sender: TObject);
begin
  PlayPreviousTrack;
end; // imgPlayerRewClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ClearMusicVis;
begin
  if imgPlayer.Visible then
    imgPlayer.Refresh;
end; // ClearMusicVis

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mirvQuickInfoJump(Sender: TObject; id: integer);
begin
  if QuickInfoUrls.Count > id then
    UrlJumpTo(QuickInfoUrls.Strings[id]);
end; // mirvQuickInfoJump

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.pbMusicVisMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if Button = mbLeft then
  begin
    if iMusicVisualMode = 0 then // No visualization
      iMusicVisualMode := 1  // Oscilloscope
    else if iMusicVisualMode = 1 then
      iMusicVisualMode := 2 // Spectrum
    else
    begin // No visualization
      iMusicVisualMode := 0;
      ClearMusicVis;

      if pbMusicTitle.Visible then
        BitBlt(pbMusicTitle.Canvas.Handle,       // Destination
               0, 1,                            // X, Y (Dest pos)
               PlayerPosSize.iTitleWidth, PlayerPosSize.iTitleHeight-1, // Size to copy
               picMPTitle.Bitmap.Canvas.Handle, // Source
               0, 1,                            // X, Y (Source pos)
               SrcCopy);                        // plain copy
    end;
  end;
end; // pbMusicVisMouseDown

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuDescrSelectAllClick(Sender: TObject);
begin
  if Trim(RichViewDescr.Lines.Text) <> '' then
  begin
    RichViewDescr.SelectAll;
    RichViewDescr.Format;
    RichViewDescr.Refresh;
  end;
end; // mnuDescrSelectAllClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuDescrCopyClick(Sender: TObject);
begin
  RichViewDescr.CopyText;
end; // mnuDescrCopyClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.PopupMenuDescrPopup(Sender: TObject);
begin
  mnuDescrCopy.Enabled := RichViewDescr.SelectionExists;
  mnuDescrSelectAll.Enabled := Length(RichViewDescr.GetSelText) <
    Length(RichViewDescr.Lines.Text);
end; // PopupMenuDescrPopup

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.PopupMenuNotePopup(Sender: TObject);
begin
  mnuNoteCopy.Enabled := RichViewNote.SelectionExists;
end; // PopupMenuNotePopup

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuNoteSelectAllClick(Sender: TObject);
begin
  if Trim(RichViewNote.Lines.Text) <> '' then
  begin
    RichViewNote.SelectAll;
    RichViewNote.Format;
    RichViewNote.Refresh;
  end;
end; // mnuNoteSelectAllClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuNoteCopyClick(Sender: TObject);
begin
  RichViewNote.CopyText;
end; // mnuNoteCopyClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.InitOrderBy(iSortOrder: integer);
var
  Node: PVirtualNode;
  NodeData: PTreeData;
  NewNode: PVirtualNode;
  NewNodeData: PTreeDataSorted;
begin
  iTreeviewSortMode := iSortOrder;
  VSTree.BeginUpdate;
  VSTreeSorted.BeginUpdate;

  VSTreeSorted.Left := VSTree.Left;
  VSTreeSorted.Top := VSTree.Top;
  VSTreeSorted.Width := VSTree.Width;
  VSTreeSorted.Height := VSTree.Height;
  VSTreeSorted.NodeDataSize := SizeOf(VTreeDataSorted);
  VSTreeSorted.Font := VSTree.Font;
  VSTreeSorted.Color := VSTree.Color;
  VSTreeSorted.Colors := VSTree.Colors;
  VSTreeSorted.Images := VSTree.Images;
  VSTreeSorted.TreeOptions := VSTree.TreeOptions;
  if not VSTree.Background.Bitmap.Empty then
    VSTreeSorted.Background.Assign(VSTree.Background.Bitmap);

  VSTreeSorted.TreeOptions.PaintOptions := VSTree.TreeOptions.PaintOptions - [toShowTreeLines];
  VSTreeSorted.TreeOptions.PaintOptions := VSTree.TreeOptions.PaintOptions - [toShowRoot];


  VSTreeSorted.Clear;
  Node := VSTree.GetFirst;
  while Node <> nil do
  begin
    NodeData := VSTree.GetNodeData(Node);
    if NodeData.bCategory = False then
    begin
      NewNode := VSTreeSorted.AddChild(nil);
      NewNodeData := VSTreeSorted.GetNodeData(NewNode);
      NewNodeData.RealNode := Node;
    end;
    Node := VSTree.GetNext(Node);
  end;

  VSTreeSorted.Visible := True;
  VSTree.Visible := False;
  VSTree.EndUpdate;
  VSTreeSorted.SortTree(0, sdAscending, False);
  VSTreeSorted.EndUpdate;
  VSTreeSorted.Invalidate;
  VSTreeSorted.Refresh;
end; // InitOrderBy

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuOrderByCategoryClick(Sender: TObject);
begin
  if not VSTree.Visible then
  begin
    VSTree.Visible := True;
    VSTreeSorted.Visible := False;
    VSTree.Refresh;
  end;
  mnuOrderByCategory.Checked := True;
end; // mnuOrderByCategoryClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuOrderBySizeClick(Sender: TObject);
begin
  InitOrderBy(1); // 1=sort by size
  mnuOrderBySize.Checked := True;
end; // mnuOrderBySizeClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeSortedGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  DataSorted: PTreeDataSorted;
  Data: PTreeData;
  iVal, iValCode: integer;
begin
  DataSorted := VSTreeSorted.GetNodeData(Node);
  if DataSorted.RealNode <> nil then
  begin
    Data := VSTree.GetNodeData(DataSorted.RealNode);
    case iTreeviewSortMode of
      1:
      begin
        Val(Data.sSize, iVal, iValCode);
        if iValCode <> 0 then
          iVal := 0;
        CellText := Data.wsText + '  [' + FormatFloat('###,###,##0',
            iVal div 1024) + ' ' + LanguageGo.sMB + ']';
      end;
      2: CellText := Data.wsText + '  [' + Data.sCDNO + ']';
      3: CellText := Data.wsText + '  [' + Data.sCustomField1 + ']';
      4: CellText := Data.wsText + '  [' + Data.sCustomField2 + ']';
      5: CellText := Data.wsText + '  [' + Data.sCustomField3 + ']';
      6: CellText := Data.wsText + '  [' + Data.sCustomField4 + ']';
      7: CellText := Data.wsText + '  [' + Data.sCustomField5 + ']';
      8: CellText := Data.wsText; // Title
      else
        CellText := Data.wsText;
    end;
  end;
end; // VSTreeSortedGetText

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeSortedGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: boolean; var ImageIndex: integer);
var
  DataSorted: PTreeDataSorted;
  Data: PTreeData;
begin
  DataSorted := VSTreeSorted.GetNodeData(Node);
  Data := VSTree.GetNodeData(DataSorted.RealNode);
  ImageIndex := Data.iIcon;
end; // VSTreeSortedGetImageIndex

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeSortedCompareNodes(Sender: TBaseVirtualTree;
  Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: integer);
var
  DataSorted1: PTreeDataSorted;
  Data1: PTreeData;
  DataSorted2: PTreeDataSorted;
  Data2: PTreeData;
  iVal1, iVal2, iValCode: integer;
begin
  DataSorted1 := VSTreeSorted.GetNodeData(Node1);
  Data1 := VSTree.GetNodeData(DataSorted1.RealNode);
  DataSorted2 := VSTreeSorted.GetNodeData(Node2);
  Data2 := VSTree.GetNodeData(DataSorted2.RealNode);

  case iTreeviewSortMode of
    1: 
    begin
      Val(Data1.sSize, iVal1, iValCode);
      if iValCode <> 0 then
        iVal1 := 0;
      Val(Data2.sSize, iVal2, iValCode);
      if iValCode <> 0 then
        iVal2 := 0;
      if iVal2 > iVal1 then
        Result := 0
      else
        Result := 1
    end;
    2: 
    begin
      if Data2.sCdNo > Data1.sCdNo then
        Result := 0
      else
        Result := 1
    end;
    3: 
    begin
      if AnsiUppercase(Data2.sCustomField1) > AnsiUppercase(Data1.sCustomField1) then
        Result := 0
      else
        Result := 1
    end;
    4:
    begin
      if AnsiUppercase(Data2.sCustomField2) > AnsiUppercase(Data1.sCustomField2) then
        Result := 0
      else
        Result := 1
    end;
    5:
    begin
      if AnsiUppercase(Data2.sCustomField3) > AnsiUppercase(Data1.sCustomField3) then
        Result := 0
      else
        Result := 1
    end;
    6:
    begin
      if AnsiUppercase(Data2.sCustomField4) > AnsiUppercase(Data1.sCustomField4) then
        Result := 0
      else
        Result := 1
    end;
    7:
    begin
      if AnsiUppercase(Data2.sCustomField5) > AnsiUppercase(Data1.sCustomField5) then
        Result := 0
      else
        Result := 1
    end;
    else
      Result := 0;
  end;
end; // VSTreeSortedCompareNodes

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeSortedPaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
begin
  if (Node = VSTreeSorted.HotNode) and (toHotTrack in VSTreeSorted.TreeOptions.PaintOptions) then
    TargetCanvas.Font.Color := UrlHottrackColor; // mouse over color  (hottrack)
end; // VSTreeSortedPaintText

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuOrderByDiscNoClick(Sender: TObject);
begin
  InitOrderBy(2); // 2=sort by DiscNo
  mnuOrderByDiscNo.Checked := True;
end; // mnuOrderByDiscNoClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuOrderByCustom1Click(Sender: TObject);
begin
  InitOrderBy(3); // 3=sort by Cust1
  mnuOrderByCustom1.Checked := True;
end; // mnuOrderByCustom1Click

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuOrderByCustom2Click(Sender: TObject);
begin
  InitOrderBy(4); // 4=sort by Cust2
  mnuOrderByCustom2.Checked := True;
end; // mnuOrderByCustom2Click

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuOrderByCustom3Click(Sender: TObject);
begin
  InitOrderBy(5); // 5=sort by Cust3
  mnuOrderByCustom3.Checked := True;
end; // mnuOrderByCustom3Click

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuOrderByCustom4Click(Sender: TObject);
begin
  InitOrderBy(6); // 6=sort by Cust4
  mnuOrderByCustom4.Checked := True;
end; // mnuOrderByCustom4Click

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuOrderByCustom5Click(Sender: TObject);
begin
  InitOrderBy(7); // 7=sort by Cust5
  mnuOrderByCustom5.Checked := True;
end; // mnuOrderByCustom5Click

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeSortedChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  NodeDataSorted: PTreeDataSorted;
begin
  if Node <> nil then
  begin
    NodeDataSorted := VSTreeSorted.GetNodeData(Node);
    if NodeDataSorted.RealNode <> nil then
    begin
      VSTree.Selected[NodeDataSorted.RealNode] := True;
      VSTreeChange(VSTree, NodeDataSorted.RealNode);
    end;
  end;
end; // VSTreeSortedChange

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.VSTreeSortedDblClick(Sender: TObject);
var
  NodeDataSorted: PTreeDataSorted;
  p: TPoint;
  Node: PVirtualNode;
begin
  p := VSTreeSorted.ScreenToClient(Mouse.CursorPos);
  Node := VSTreeSorted.GetNodeAt(p.X, p.Y);
  if Node <> nil then
  begin
    NodeDataSorted := VSTreeSorted.GetNodeData(Node);
    if NodeDataSorted.RealNode <> nil then
    begin
      VSTree.Selected[NodeDataSorted.RealNode] := True;
      imgInstallClick(Sender);
    end;
  end;
end; // VSTreeSortedDblClick

////////////////////////////////////////////////////////////////////////

// Shortcuts for form (Form.KeyPreview must be set to True)
procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if (Key = VK_LEFT) and (Shift = [ssAlt]) then
    imgPrevMouseDown(Sender, mbLeft, [], 0, 0)
  else if (Key = VK_RIGHT) and (Shift = [ssAlt]) then
    imgNextMouseDown(Sender, mbLeft, [], 0, 0);
end; // FormKeyDown

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgSearchMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    imgSearch.Picture.Assign(btnSearch.picMDown);
    btnSearch.Status := 2; // 2 = Mouse Down
  end;
end; // imgSearchMouseDown

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgSearchMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  btnSearch.Status := 3; // 3 = Nothing - let timer decide
end; // imgSearchMouseUp

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgSearchClick(Sender: TObject);
begin
  ChkFile.Enabled:=False;
  btnSearch.Status := 0; // normal
  imgSearch.Picture.Assign(btnSearch.pic);
  if frmSearch = nil then
  begin
    Screen.Cursor := crHourGlass;
    Application.CreateForm(TfrmSearch, frmSearch);
    Screen.Cursor := crDefault;
  end;
  frmSearch.ShowModal;
  ChkFile.Enabled:=True;
end; // imgSearchClick

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.RichViewDescrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 65) and (Shift = [ssCtrl]) then // Ctrl+A = Select all
    mnuDescrSelectAllClick(Sender)
  else if (Key = 67) and (Shift = [ssCtrl]) then // Ctrl+C = Copy
    mnuDescrCopyClick(Sender);
end; // RichViewDescrKeyDown

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.RichViewNoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 65) and (Shift = [ssCtrl]) then // Ctrl+A = Select all
    mnuNoteSelectAllClick(Sender)
  else if (Key = 67) and (Shift = [ssCtrl]) then // Ctrl+C = Copy
    mnuNoteCopyClick(Sender);
end; // RichViewNoteKeyDown

////////////////////////////////////////////////////////////////////////

function TfrmMain.SizeKbToStr(kb: int64): string;
begin
  if kb = 0 then
    Result  := '0 ' + LanguageGo.sKB
  else if kb < 1024 then
    Result := FormatFloat('###,###,###', kb) + ' ' + LanguageGo.sKB
  else if kb < 1024000 then
    Result := FormatFloat('###,###,###', kb div 1024) + ' ' + LanguageGo.sMB
  else
    Result := FormatFloat('###,###,###.0', (kb div 1024) / 1024) + ' ' + LanguageGo.sGB
end;

////////////////////////////////////////////////////////////////////////

function TfrmMain.IsMusicPlaying: Boolean;
var
  dwHandle: cardinal;
begin
  if sMusic_FileExt = '' then
    Result := False
  else
  begin
    if IsMusicStream(sMusic_fileExt) then
      dwHandle := Music_Stream
    else
      dwHandle := Music_Mod;

    Result := BASS_ChannelIsActive(dwHandle) = BASS_ACTIVE_PLAYING;
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgAniGifMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and imgAniGif.Visible and (Trim(lblMessage.Caption) <> '') then
    frmMsgBox.MsgBox(#13#10 + lblMessage.Caption, mtInformation, [mbOK], 0);
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.WMP1PlayStateChange(ASender: TObject; OldState,
  NewState: Integer);
//var
  //curpicname: string;
  //Node: PVirtualNode;
  //NodeData: PTreeData;
begin
{
  // Go back to non fullscreen after showing a video clip
  if (MP1.Mode = mpStopped) then //and (WMP1.DisplaySize = mpFullscreen) then
  begin
    WMP1.DisplaySize := mpDefaultSize;
    WMP1.Left := ScreenshotRect.Left;
    WMP1.Top := ScreenshotRect.Top;
    WMP1.Width := ScreenshotRect.Right;
    WMP1.Height := ScreenshotRect.Bottom;

    // Show screenshot for current program
    WMP1.Visible := False;
    if not imgEmpty.Visible then
      imgEmpty.Visible := True;
    if imgPicture.Visible then
      imgPicture.Visible := False;


    if bShowScreenShots and (iCurPicIdx > -1) then
    begin
      Node := VSTree.GetFirstSelected;
      if Node <> nil then
      begin
        NodeData := VSTree.GetNodeData(Node);
        if NodeData <> nil then
        begin
          if NodeData.slScreenShots <> nil then
          begin
            if NodeData.slScreenShots.Count >= iCurPicIdx then
            begin
              curpicname := Uppercase(ExtractFilename(NodeData.slScreenShots[iCurPicIdx]));
              if curpicname = Uppercase(ExtractFilename(WMP1.FileName)) then
                WMP1.Visible := True
              else
                ShowPic(iCurPicIdx);
            end;
          end;
        end;
      end;
    end;
  end;
  }
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.PaintBoxScrollPaint(Sender: TObject);
begin
  BitBlt(PaintBoxScroll.Canvas.Handle, 0, 0, PaintBoxScroll.Width, PaintBoxScroll.Height, imgScrollTemp.Canvas.handle, 0, 0, SrcCopy);
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.PaintBoxScrollClick(Sender: TObject);
begin
  Inc(scrollSpeed);
  if scrollSpeed = 4 then
    scrollSpeed:=1;
end;

////////////////////////////////////////////////////////////////////////

function CalcCoords(s : string) : Coord;
var
  c       : Coord;
  I, Code : Integer;
  stemp   : string;
  k       : integer;
  no      : integer;
begin
  no:=0;
  stemp:='';
  for k:=1 to Length(s) do
  begin
    if s[k] <> ',' then
      stemp:=stemp+s[k];
    if (s[k] = ',') or (k = Length(s)) then
    begin
      Val(stemp, I, Code);
      stemp:='';
      Inc (no);
      if Code = 0 then
      begin
        if no = 1 then
          c.X:=I
        else
          c.Y:=I
      end
      else
        c.X:=0
    end;
  end;
  CalcCoords:=c;
end; // CalcCoords

////////////////////////////////////////////////////////////////////////

procedure SplitCoords(const Input: string; var X, Y: integer);
var
 c: Coord;
begin
  c := CalcCoords(input);
  X := c.X;
  Y := c.Y;
end;

////////////////////////////////////////////////////////////////////////

procedure SplitCoordsCtlXY(const Input: string; var Ctl: TControl);
var
 c: Coord;
begin
  c := CalcCoords(input);
  Ctl.Left := c.X;
  Ctl.Top := c.Y;
end;

////////////////////////////////////////////////////////////////////////

procedure SplitCoordsCtlSize(const Input: string; var Ctl: TControl);
var
 c: Coord;
begin
  c := CalcCoords(input);
  Ctl.Width := c.X;
  Ctl.Height := c.Y;
end;

////////////////////////////////////////////////////////////////////////

function ReadStreamLine(var eos: boolean; var stream: TStream) : string;
var
  buffer: array[0..5000] of char;
  res: string;
begin
  res := '';
  stream.Read(buffer, 1);
  while (stream.Position < stream.Size) and (buffer[0] <> #13) do
  begin
    res := res + buffer[0];
    stream.Read(buffer, 1);
  end;
  eos := stream.Position >= stream.Size;
  Result := Trim(res);
end; // ReadStreamLine

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.MakePlayerImageTransparent24bit;
const
  PIXEL_COUNT_MAX = 32768;
type
  pRGBTripleArray = ^TRGBTripleArray;
  TRGBTripleArray = array[0..PIXEL_COUNT_MAX - 1] of TRGBTriple;
var
  Row: pRGBTripleArray;
  x, y: integer;
  trColor: COLORREF;
  ScanlineDelta: integer;
  RowMain: pRGBTripleArray;
  ScanlineDeltaMain: integer;
begin
  trColor := StrToInt(transcolor);
  Row := imgPlayer.Picture.Bitmap.ScanLine[0];
  ScanlineDelta := integer(imgPlayer.Picture.Bitmap.ScanLine[1]) - integer(Row);
  RowMain := imgMain.Picture.Bitmap.ScanLine[0];
  ScanlineDeltaMain := integer(imgMain.Picture.Bitmap.ScanLine[1]) - integer(RowMain);
  if imgPlayer.Top > 0 then
    Inc(integer(RowMain), ScanlineDeltaMain * (imgPlayer.Top -1));

  for y := 0 to Pred(imgPlayer.Height) do
  begin
    for x := 0 to Pred(imgPlayer.Width) do
      if RGB(Row[x].rgbtRed, Row[x].rgbtGreen, Row[x].rgbtBlue) = trColor then
      begin
        Row[x].rgbtRed := RowMain[x].rgbtRed;
        Row[x].rgbtGreen := RowMain[x].rgbtGreen;
        Row[x].rgbtBlue := RowMain[x].rgbtBlue;
      end;

    Inc(integer(Row), ScanlineDelta); // Goto next row/y
    Inc(integer(RowMain), ScanlineDeltaMain); // Goto next row/y
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.MakePlayerImageTransparent;
var // non optimized very slow function (but easily readable)
  x,y: integer;
  trColor : longint;
begin
  trColor := StrToInt(transcolor);
  for y := 0 to Pred(imgPlayer.Height) do
    for x := 0 to Pred(imgPlayer.Width) do
      if imgPlayer.Canvas.Pixels[x, y] = trColor then
        imgPlayer.Canvas.Pixels[x, y] := imgMain.Canvas.Pixels[ImgPlayer.Left + x, imgPlayer.Top + y];
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.LoadSkin(zipfile: string; skinname: string);
var
  Stream1: TStream;
  Streamf: TFileStream;
  eos: boolean; // end of stream
  s: string;
  tagvalue: string;
  sMusicVisColor: string; // Music visualization color
  bMusicSpPeaks: boolean;// Show peaks for specktrum analyzer
  sMusicSpPeakColor: string; // Music visualization color
  fBold: boolean;
  fItalic: boolean;
  titleshadowlength: integer;
  titleshadowcolor: string;
  titleshadowdir: string;
  handleshadowlength: integer;
  handleshadowcolor: string;
  handleshadowdir: string;
  c: Coord;
  gif: TGifImage;
  picVisBGPic: TPicture;
begin
  transcolor := '';
  trlunpack := False;
  vtranslucenty := 255;
  bApdDesc2Note := False;
  sD2NDelimiter := '';
  iMusicVisualMode := 1;
  sMusicVisColor := IntToStr(clBlack);
  bMusicSpPeaks := True;
  sMusicSpPeakColor := IntToStr(RGB(255,100,100));
  FontFile := '';
  DefFontCharset :=  DEFAULT_CHARSET;
  NFOFontName := 'Terminal';
  NFOFontCharset := OEM_CHARSET;
  NFOFontSize := 9;
  othertitlesfontsize := 14;
  titleshadowlength := 0;
  handleshadowlength := 0;
  UrlHotTrackColor := clBlue;
  ButtonsTransparent:=True;
  fBold := False;
  fItalic := False;
  RichViewDescr.Alignment := taLeftJustify;
  RichViewNote.Alignment := taLeftJustify;
  RichViewNote.Visible := True;
  PaintBoxScroll.Left := 0;
  frmMain.Font.Style := [];

  // Button images
  SkinButtonInit(btnMinimize);
  SkinButtonInit(btnClose);
  SkinButtonInit(btnPrev);
  SkinButtonInit(btnNext);
  SkinButtonInit(btnInstall);
  SkinButtonInit(btnPlay);
  SkinButtonInit(btnRun);
  SkinButtonInit(btnView);
  SkinButtonInit(btnMore);
  SkinButtonInit(btnNfo);
  SkinButtonInit(btnSearch);
  SkinButtonInit(btnMPOpen);
  SkinButtonInit(btnMPRew);
  SkinButtonInit(btnMPStop);
  SkinButtonInit(btnMPPause);
  SkinButtonInit(btnMPPlay);
  SkinButtonInit(btnMPForward);

  picMPTitle := TPicture.Create;
  picMPTitleBG := TPicture.Create;


  // LOAD THE SKIN SETTINGS
  if SkinZipFile = nil then
  begin
    SkinZipFile := TZipMaster.Create(nil);
    SkinZipFile.DllDirectory := '><';
    SkinZipFile.Dll_Load := True;
  end;

  if FileExists(GoWinDir + '\skin\' + skinname + '\settings.xml') then
  begin
    Streamf := TFileStream.Create(GoWinDir + '\skin\' + skinname + '\settings.xml', fmOpenRead);
    Stream1 := TMemoryStream.Create;
    stream1.CopyFrom(Streamf, Streamf.Size);
    Streamf.Free;
  end
  else
  begin
    if FileExists(GoWinDir + '\skin\' + skinname + '.zip') then
      zipfile := GoWinDir + '\skin\' + skinname + '.zip';

    if FileExists(zipfile) then
    begin
      SkinZipFile.ZipFileName := zipfile;
      SkinZipFile.Password := resourcepwd;
      Stream1 := SkinZipFile.ExtractFileToStream('skin\' + skinname + '\settings.xml');

      if Stream1 = nil then
        Stream1 := SkinZipFile.ExtractFileToStream(skinname + '\settings.xml');
      if Stream1 = nil then
        Stream1 := SkinZipFile.ExtractFileToStream('settings.xml');
    end;
  end;

  if Stream1 =  nil then
  begin
    if SkinLoadTryCount < 3 then
    begin
      Inc(SkinLoadTryCount);
      Sleep(5000);
      SkinZipFile := nil;
      LoadSkin(zipfile, skinname);
      Exit;
    end;

    MessageBox(Application.DialogHandle,
      PChar('Unable to load skin ' + SkinName + ' - no "Settings.xml" found!'), PChar('Multi Install'), MB_ICONERROR);
    Application.Terminate;
    Exit;
  end;

  SkinLoadTryCount := 0;

  eos := False;
  while not eos do
  begin
    s := ReadStreamLine(eos, Stream1);

    if IsTag(s, 'transparent_color', tagvalue) then
      transcolor := GetDecimalColor(tagvalue)
    else if IsTag(s,'translucenty', tagvalue) then
      vtranslucenty := StrToInt(tagvalue)
    else if IsTag(s, 'translucenty_unpack_only', tagvalue) then
      trlunpack := Uppercase(tagvalue) = 'YES'
    else if IsTag(s, 'music_default_visualization', tagvalue) then
    begin
      if tagvalue = 'Oscilloscope' then
        iMusicVisualMode := 1
      else
        iMusicVisualMode := 2;
    end
    else if IsTag(s, 'music_visualization_color', tagvalue) then
      sMusicVisColor := tagvalue
    else if IsTag(s, 'music_show_spectrum_peaks', tagvalue) then
      bMusicSpPeaks := Uppercase(tagvalue) = 'YES'
    else if IsTag(s, 'music_spectrum_peak_color', tagvalue) then
      sMusicSpPeakColor := tagvalue
    else if IsTag(s, 'show_scroller', tagvalue) then
      PaintBoxScroll.Visible := Uppercase(tagvalue) = 'YES'
    else if IsTag(s, 'url_hottrack_color', tagvalue) then
      UrlHottrackColor := StrToInt(GetDecimalColor(tagvalue))
    else if IsTag(s, 'buttons_transparent', tagvalue) then
      ButtonsTransparent := Uppercase(tagvalue) = 'YES'
    else if IsTag(s, 'append_descr_to_note', tagvalue) and (UpperCase(tagvalue) = 'YES') then
    begin
      bApdDesc2Note := True;
      RichViewNote.Visible := False;
    end
    else if IsTag(s, 'descr_to_note_delimiter', tagvalue) then
      sD2NDelimiter := EscDecodeStr(tagvalue)
    else if IsTag(s, 'descr_alignment', tagvalue) then
    begin
      tagvalue := Uppercase(tagvalue);
      if tagvalue = 'CENTER' then
        RichViewDescr.Alignment := taCenter
      else if tagvalue = 'RIGHT' then
        RichViewDescr.Alignment := taRightJustify;
    end
    else if IsTag(s, 'note_alignment', tagvalue) then
    begin
      tagvalue := Uppercase(tagvalue);
      if tagvalue = 'CENTER' then
        RichViewNote.Alignment := taCenter
      else if tagvalue = 'RIGHT' then
        RichViewNote.Alignment := taRightJustify;
    end
    else if s = '<font>' then
    begin
      fBold := False;
      fItalic := False;
      while (not eos) and (s <> '</font>') do
      begin
        s := ReadStreamLine(eos, Stream1);

        if IsTag(s, 'file', tagvalue) then
          FontFile := tagvalue
        else if IsTag(s, 'AName', tagvalue) then
          DefFontName := tagvalue
        else if IsTag(s, 'bold', tagvalue) then
          fBold := Uppercase(tagvalue) = 'YES'
        else if IsTag(s, 'italic', tagvalue) then
          fItalic := Uppercase(tagvalue) = 'YES'
        else if IsTag(s, 'color', tagvalue) then
        begin
          lblTitle.Font.Color := StrToInt(GetDecimalColor(tagvalue));
          lblHandle.Font.Color := lblTitle.Font.Color;
          lblScreenshotCounter.Font.Color := lblTitle.Font.Color;
        end
        else if IsTag(s, 'nfo_name', tagvalue) then
          NFOFontName := tagvalue
        else if IsTag(s, 'nfo_charset', tagvalue) then
          NFOFontCharset := StrToInt(tagvalue)
        else if IsTag(s, 'nfo_size', tagvalue) then
          NFOFontSize := StrToInt(tagvalue)
        else if IsTag(s, 'control_color', tagvalue) then
        begin
          VSTree.Font.Color := StrToInt(GetDecimalColor(tagvalue));
          lblMessage.Font.Color := VSTree.Font.Color;
          lblQIText.Font.Color := VSTree.Font.Color;
        end
        else if IsTag(s, 'background_color', tagvalue) then
        begin
          VSTree.Color := StrToInt(GetDecimalColor(tagvalue));;
          lblMsgInfoBack.Color := VSTree.Color;
        end
        else if IsTag(s, 'treeview_color', tagvalue) then
          VSTree.Font.Color := StrToInt(GetDecimalColor(tagvalue));
      end;
    end
    else if IsTag(s, 'other_title_font_size', tagvalue) then
      othertitlesfontsize := StrToInt(tagvalue)
    else if IsTag(s, 'title_font_size', tagvalue) then
      lblTitle.Font.Size := StrToInt(tagvalue)
    else if IsTag(s, 'title_shadow_length', tagvalue) then
      titleshadowlength := StrToInt(tagvalue)
    else if IsTag(s, 'title_shadow_color', tagvalue) then
      titleshadowcolor := GetDecimalColor(tagvalue)
    else if IsTag(s, 'title_shadow_direction', tagvalue) then
      titleshadowdir := tagvalue
    else if IsTag(s, 'handle_font_size', tagvalue) then
      lblHandle.Font.Size := StrToInt(tagvalue)
    else if IsTag(s, 'handle_shadow_length', tagvalue) then
      handleshadowlength := StrToInt(tagvalue)
    else if IsTag(s, 'handle_shadow_color', tagvalue) then
      handleshadowcolor := GetDecimalColor(tagvalue)
    else if IsTag(s, 'handle_shadow_direction', tagvalue) then
      handleshadowdir := tagvalue
    else if s = '<positions_and_sizes>' then
    begin
      while (not eos) and (s <> '</positions_and_sizes>') do
      begin
        s := ReadStreamLine(eos, Stream1);

        if s = '<main>' then
        begin
          while (not eos) and (s <> '</main>') do
          begin
            s := ReadStreamLine(eos, Stream1);
            if IsTag(s, 'title_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(lblTitle))
            else if IsTag(s, 'handle_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(lblHandle))
            else if IsTag(s, 'treeview_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(VSTree))
            else if IsTag(s, 'treeview_size', tagvalue) then
              SplitCoordsCtlSize(tagvalue, TControl(VSTree))
            else if IsTag(s, 'msg_info_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(lblMsgInfoBack))
            else if IsTag(s, 'msg_info_size', tagvalue) then
              SplitCoordsCtlSize(tagvalue, TControl(lblMsgInfoBack))
            else if IsTag(s, 'screenshot_xy', tagvalue) then
            begin
              SplitCoordsCtlXY(tagvalue, TControl(imgPicture));
              imgEmpty.Left := imgPicture.Left;
              ScreenshotRect.Left := imgPicture.Left;
              PanelMP1.Left := imgPicture.Left;

              imgEmpty.Top := imgPicture.Top;
              ScreenshotRect.Top := imgPicture.Top;
              PanelMP1.Top := imgPicture.Top;
            end
            else if IsTag(s, 'screenshot_size', tagvalue) then
            begin
              SplitCoordsCtlSize(tagvalue, TControl(imgPicture));
              imgEmpty.Width := imgPicture.Width;
              ScreenshotRect.Right := imgPicture.Width;
              PanelMP1.Width := imgPicture.Width;

              imgEmpty.Height := imgPicture.Height;
              ScreenshotRect.Bottom := imgPicture.Height;
              PanelMP1.Height := imgPicture.Height;
            end
            else if IsTag(s, 'descr_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(RichViewDescr))

            else if IsTag(s, 'descr_size', tagvalue) then
              SplitCoordsCtlSize(tagvalue, TControl(RichViewDescr))
            else if IsTag(s, 'note_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(RichViewNote))
            else if IsTag(s, 'note_size', tagvalue) then
              SplitCoordsCtlSize(tagvalue, TControl(RichViewNote))
            else if IsTag(s, 'music_player_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(imgPlayer))
            else if IsTag(s, 'prev_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(imgPrev))
            else if IsTag(s, 'next_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(imgNext))
            else if IsTag(s, 'screenshot_counter_xy', tagvalue) then
            begin
              SplitCoordsCtlXY(tagvalue, TControl(lblScreenshotCounter));
              lblScreenshotCounter.Left := lblScreenshotCounter.Left + 4;
              lblScreenshotCounter.Top := lblScreenshotCounter.Top + 2;
            end
            else if IsTag(s, 'more_xy', tagvalue) then
            begin
              SplitCoordsCtlXY(tagvalue, TControl(imgMore));
              imgNfo.Left := imgMore.Left;
              imgNfo.Top := imgMore.Top;
            end
            else if IsTag(s, 'install_xy', tagvalue) then
            begin
              SplitCoordsCtlXY(tagvalue, TControl(imgInstall));
              imgPlay.Left := imgInstall.Left;
              imgRun.Left := imgInstall.Left;
              imgView.Left := imgInstall.Left;

              imgPlay.Top := imgInstall.Top;
              imgRun.Top := imgInstall.Top;
              imgView.Top := imgInstall.Top;
            end
            else if IsTag(s, 'search_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(imgSearch))
            else if IsTag(s, 'minimize_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(imgMinimize))
            else if IsTag(s, 'close_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(imgClose))
            else if IsTag(s, 'gif_animation_xy', tagvalue) then
              SplitCoordsCtlXY(tagvalue, TControl(imgAniGif))
            else if IsTag(s, 'scroll_xy', tagvalue) then
            begin
              c := CalcCoords(tagvalue);
              PaintBoxScroll.Left := c.X;
              PaintBoxScroll.Top := c.Y;
            end
            else if IsTag(s, 'scroll_width', tagvalue) then
              PaintBoxScroll.Width := StrToInt(tagvalue);
          end;
        end
        else if s = '<install>' then
        begin
          with InstPosSize do
          begin
            while (not eos) and (s <> '</install>') do
            begin
              s := ReadStreamLine(eos, Stream1);
              if IsTag(s, 'title_xy', tagvalue) then
                SplitCoords(tagvalue, iTitleX, iTitleY)
              else if IsTag(s, 'edit_path_xy', tagvalue) then
                SplitCoords(tagvalue, iEditPathX, iEditPathY)
              else if IsTag(s, 'edit_path_size', tagvalue) then
                SplitCoords(tagvalue, iEditPathWidth, iEditPathHeight)
              else if IsTag(s, 'exp_tree_xy', tagvalue) then
                SplitCoords(tagvalue, iExpTreeX, iExpTreeY)
              else if IsTag(s, 'exp_tree_size', tagvalue) then
                SplitCoords(tagvalue, iExpTreeWidth, iExpTreeHeight)
              else if IsTag(s, 'drive_box_xy', tagvalue) then
                SplitCoords(tagvalue, iDriveBoxX, iDriveBoxY)
              else if IsTag(s, 'drive_box_size', tagvalue) then
                SplitCoords(tagvalue, iDriveBoxWidth, iDriveBoxHeight)
              else if IsTag(s, 'space_avail_xy', tagvalue) then
                SplitCoords(tagvalue, iSpaceAvailX, iSpaceAvailY)
              else if IsTag(s, 'space_req_xy', tagvalue) then
                SplitCoords(tagvalue, iSpaceReqX, iSpaceReqY)
              else if IsTag(s, 'add_icon_xy', tagvalue) then
                SplitCoords(tagvalue, iAddIconX, iAddIconY)
              else if IsTag(s, 'finish_xy', tagvalue) then
                SplitCoords(tagvalue, iFinishX, iFinishY)
              else if IsTag(s, 'cancel_xy', tagvalue) then
                SplitCoords(tagvalue, iCancelX, iCancelY);
            end;
          end;
        end
        else if s = '<unpack>' then
        begin
          with UnpackPosSize do
          begin
            while (not eos) and (s <> '</unpack>') do
            begin
              s := ReadStreamLine(eos, Stream1);
              if IsTag(s, 'title_xy', tagvalue) then
                SplitCoords(tagvalue, TitleX, TitleY)
              else if IsTag(s, 'progressbar1_title_xy', tagvalue) then
                SplitCoords(tagvalue, Progressbar1TitleX, Progressbar1TitleY)
              else if IsTag(s, 'progressbar1_xy', tagvalue) then
                SplitCoords(tagvalue, Progressbar1X, Progressbar1Y)
              else if IsTag(s, 'progressbar1_size', tagvalue) then
                SplitCoords(tagvalue, Progressbar1Width, Progressbar1Height)
              else if IsTag(s, 'progressbar1_status_xy', tagvalue) then
                SplitCoords(tagvalue, Progressbar1StatusX, Progressbar1StatusY)
              else if IsTag(s, 'progressbar2_title_xy', tagvalue) then
                SplitCoords(tagvalue, Progressbar2TitleX, Progressbar2TitleY)
              else if IsTag(s, 'progressbar2_xy', tagvalue) then
                SplitCoords(tagvalue, Progressbar2X, Progressbar2Y)
              else if IsTag(s, 'progressbar2_size', tagvalue) then
                SplitCoords(tagvalue,Progressbar2Width, Progressbar2Height)
              else if IsTag(s, 'progressbar2_status_xy', tagvalue) then
                SplitCoords(tagvalue, Progressbar2StatusX, Progressbar2StatusY)
              else if IsTag(s, 'elapsed_time_xy', tagvalue) then
                SplitCoords(tagvalue, TimeElapsedX, TimeElapsedY)
              else if IsTag(s, 'estimated_time_xy', tagvalue) then
                SplitCoords(tagvalue, TimeEstimatedX, TimeEstimatedY)
              else if IsTag(s, 'cancel_xy', tagvalue) then
                SplitCoords(tagvalue, CancelX, CancelY);
            end;
          end;
        end
        else if s = '<msgbox>' then
        begin
          with MsgBoxPosSize do
          begin
            while (not eos) and (s <> '</msgbox>') do
            begin
              s := ReadStreamLine(eos, Stream1);
              if IsTag(s, 'title_xy', tagvalue) then
                SplitCoords(tagvalue, TitleX, TitleY)
              else if IsTag(s, 'textbox_xy', tagvalue) then
                SplitCoords(tagvalue, TextboxX, TextboxY)
              else if IsTag(s, 'textbox_size', tagvalue) then
                SplitCoords(tagvalue, TextboxWidth, TextboxHeight)
              else if IsTag(s, 'ok_xy', tagvalue) then
                SplitCoords(tagvalue, OkX, OkY)
              else if IsTag(s, 'oc_ok_xy', tagvalue) then
                SplitCoords(tagvalue, OcOkX, OcOkY)
              else if IsTag(s, 'oc_cancel_xy', tagvalue) then
                SplitCoords(tagvalue, OcCancelX, OcCancelY);
            end;
          end;
        end
        else if s = '<nfo>' then
        begin
          with NfoPosSize do
          begin
            while (not eos) and (s <> '</nfo>') do
            begin
              s := ReadStreamLine(eos, Stream1);
              if IsTag(s, 'textbox_xy', tagvalue) then
                SplitCoords(tagvalue, iTextboxX, iTextboxY)
              else if IsTag(s, 'textbox_size', tagvalue) then
                SplitCoords(tagvalue, iTextboxWidth, iTextboxHeight)
              else if IsTag(s, 'ok_xy', tagvalue) then
                SplitCoords(tagvalue, iOKX, iOKY);
            end;
          end;
        end
        else if s = '<music_player>' then
        begin
          with PlayerPosSize do
          begin
            while (not eos) and (s <> '</music_player>') do
            begin
              s := ReadStreamLine(eos, Stream1);
              if IsTag(s, 'title_xy', tagvalue) then
                SplitCoords(tagvalue, iTitleX, iTitleY)
              else if IsTag(s, 'title_size', tagvalue) then
                SplitCoords(tagvalue, iTitleWidth, iTitleHeight)
              else if IsTag(s, 'spectrum_osc_xy', tagvalue) then
                SplitCoords(tagvalue, iSpectrumOscX, iSpectrumOscY)
              else if IsTag(s, 'spectrum_size', tagvalue) then
                SplitCoords(tagvalue, iSpectrumOscWidth, iSpectrumOscHeight)
              else if IsTag(s, 'open_xy', tagvalue) then
                SplitCoords(tagvalue, iOpenX, iOpenY)
              else if IsTag(s, 'rew_xy', tagvalue) then
                SplitCoords(tagvalue, iRewX, iRewY)
              else if IsTag(s, 'stop_xy', tagvalue) then
                SplitCoords(tagvalue, iStopX, iStopY)
              else if IsTag(s, 'play_xy', tagvalue) then
                SplitCoords(tagvalue, iPlayX, iPlayY)
              else if IsTag(s, 'pause_xy', tagvalue) then
                SplitCoords(tagvalue, iPauseX, iPauseY)
              else if IsTag(s, 'forward_xy', tagvalue) then
                SplitCoords(tagvalue, iForwardX, iForwardY);
            end;
          end;
        end
        else if s = '<search>' then
        begin
          with SearchPosSize do
          begin
            while (not eos) and (s <> '</search>') do
            begin
              s := ReadStreamLine(eos, Stream1);
              if IsTag(s, 'title_xy', tagvalue) then
                SplitCoords(tagvalue, iTitleX, iTitleY)
              else if IsTag(s, 'search_text_xy', tagvalue) then
                SplitCoords(tagvalue, iSearchTextX, iSearchTextY)
              else if IsTag(s, 'search_text_size', tagvalue) then
                SplitCoords(tagvalue, iSearchTextWidth, iSearchTextHeight)
              else if IsTag(s, 'search_results_xy', tagvalue) then
                SplitCoords(tagvalue, iSearchResultsX, iSearchResultsY)
              else if IsTag(s, 'search_results_size', tagvalue) then
                SplitCoords(tagvalue, iSearchResultsWidth, iSearchResultsHeight)
              else if IsTag(s, 'titles_only_xy', tagvalue) then
                SplitCoords(tagvalue, iTitlesOnlyX, iTitlesOnlyY)
              else if IsTag(s, 'search_xy', tagvalue) then
                SplitCoords(tagvalue, iSearchX, iSearchY)
              else if IsTag(s, 'done_xy', tagvalue) then
                SplitCoords(tagvalue, iDoneX, iDoneY);
            end;
          end;
        end
      end;
    end
  end;


  lblQIText.Font.Size := 8;

  // Load font
  if FontFile <> '' then
    LoadFont;
  SetFonts(DefFontName, DefFontCharset);


  if fBold and fItalic then
    frmMain.Font.Style := [fsBold, fsItalic]
  else if fBold then
    frmMain.Font.Style := [fsBold]
  else if fItalic then
    frmMain.Font.Style := [fsItalic];

  lblTitle.Font.Style := frmMain.Font.Style;
  lblHandle.Font.Style := lblTitle.Font.Style;
  lblScreenshotCounter.Font.Style := lblTitle.Font.Style;
  VSTree.Font.Style := lblTitle.Font.Style;
  lblMessage.Font.Style := lblTitle.Font.Style;
  lblQIText.Font.Style := lblTitle.Font.Style;


  if lblQIText.Height > lblMsgInfoBack.Height then
    lblQIText.Font.Size := lblQIText.Font.Size - 1;
  if lblQIText.Height > lblMsgInfoBack.Height then
    lblQIText.Font.Size := lblQIText.Font.Size - 1;

  // Also update font size for Quick info fields
  mirvstyleQuickInfo.TextStyles[rvsNormal].Size := lblQIText.Font.Size;
  mirvstyleQuickInfo.TextStyles[rvsJump1].Size := lblQIText.Font.Size;

  lblQIText.Top := ((lblMsgInfoBack.Height - lblQIText.Height) div 2) + lblMsgInfoBack.Top;
  lblQIText.Left := lblMsgInfoBack.Left + 10;
  mirvQuickInfo.Top := lblQIText.Top;
  mirvQuickInfo.Left := lblQIText.Left + lblQIText.Width + 5;
  mirvQuickInfo.Width := lblMsgInfoBack.Left + lblMsgInfoBack.Width - mirvQuickInfo.Left;
  mirvQuickInfo.SendToBack;
  imgMain.SendToBack;
  mirvQuickInfo.Height := lblQIText.Height + 20; // add something to avoid line scroll
  mirvQuickInfo.BackgroundBitmap.Create;
  mirvQuickInfo.BackgroundBitmap.Width := mirvQuickInfo.Width;
  mirvQuickInfo.BackgroundBitmap.Height := mirvQuickInfo.Height;
  lblMessage.Top := ((lblMsgInfoBack.Height - lblMessage.Height) div 2) +
    lblMsgInfoBack.Top;
  lblMessage.Left := ((lblMsgInfoBack.Width - lblMessage.Width) div 2)
    + lblMsgInfoBack.Left;

  // Set transparent property for button images.
  // When not using button images with transparent border
  // then ButtonsTransparent shoud be set to False.
  imgSearch.Transparent := ButtonsTransparent;
  imgMinimize.Transparent := ButtonsTransparent;
  imgClose.Transparent := ButtonsTransparent;
  imgPrev.Transparent := ButtonsTransparent;
  imgNext.Transparent := ButtonsTransparent;
  imgNfo.Transparent := ButtonsTransparent;
  imgMore.Transparent := ButtonsTransparent;
  imgInstall.Transparent := ButtonsTransparent;
  imgRun.Transparent := ButtonsTransparent;
  imgPlay.Transparent := ButtonsTransparent;
  imgView.Transparent := ButtonsTransparent;
  imgPlayer.Transparent := ButtonsTransparent;
  imgPlayerOpen.Transparent := ButtonsTransparent;
  imgPlayerRew.Transparent := ButtonsTransparent;
  imgPlayerStop.Transparent := ButtonsTransparent;
  imgPlayerPause.Transparent := ButtonsTransparent;
  imgPlayerPlay.Transparent := ButtonsTransparent;
  imgPlayerForward.Transparent := ButtonsTransparent;
  imgAniGif.Transparent := ButtonsTransparent;

  if (not bLoading) and (transcolor = '') then
    transcolor := IntToStr(RGB(255,0,0)); // quick hack - will remove existing regions


  // LOAD THE SKIN

  if not ExistsSkinImage('Main') then
  begin
    MessageBox(Application.DialogHandle,
      PChar('Image for MAIN form not found!'),
      PChar('Multi Install'),
      MB_ICONERROR);
    Application.Terminate;
    Exit;
  end;

  LoadSkinImage(imgMain.Picture, 'main', True); // load main background image
  Width := imgMain.Width;
  Height := imgMain.Height;

  if PaintBoxScroll.Left <> 0 then
  begin // copy background of scroller from imgMain
    PaintBoxScroll.BringToFront;
    imgScrollTemp.Canvas.Font:=lblMessage.Font;
    imgScrollTemp.Canvas.Font.Size:=10;
    imgScrollTemp.Width := PaintBoxScroll.Width;
    imgScrollTemp.Picture.Bitmap.Width := PaintBoxScroll.Width;
    imgScrollTemp.Height := PaintBoxScroll.Height;

    // shorten for scroll to start (if first AText line is blank)
    if Trim(msgstr[scrollMsgNo]) = '' then
      scrollPos := PaintBoxScroll.Width * 2;

    // To avoid flicker when painting!!!
    // [csOpaque] makes the control skip the background drawing
    PaintBoxScroll.ControlStyle:=PaintBoxScroll.ControlStyle+[csOpaque];

    BitBlt(imgScrollTemp.Canvas.Handle, 0, 0, PaintBoxScroll.Width, PaintBoxScroll.Height, imgMain.Canvas.Handle, PaintBoxScroll.Left, PaintBoxScroll.Top, SrcCopy);
    SetBkMode(imgScrollTemp.Canvas.Handle, TRANSPARENT);
    PaintBoxScroll.Repaint;
  end
  else
    PaintBoxScroll.Visible := False;


  if toShowBackground in VSTree.TreeOptions.PaintOptions then
  begin // copy background of treeview from imgMain
    VSTree.Background.Bitmap.Width := VSTree.Width;
    VSTree.Background.Bitmap.Height := VSTree.Height;
    BitBlt(VSTree.Background.Bitmap.Canvas.Handle,  // Destination
      0, 0,                                    // X, Y (target pos)
      VSTree.Width, VSTree.Height,             // Size to copy
      imgMain.Canvas.handle,                   // Source
      VSTree.Left, VSTree.Top,                 // X, Y (source pos)
      SrcCopy);                                // plain copy
  end;

  // copy background of treeview from imgMain
  RichViewDescr.BackgroundBitmap.Width := RichViewDescr.Width;
  RichViewDescr.BackgroundBitmap.Height := RichViewDescr.Height;
  BitBlt(RichViewDescr.BackgroundBitmap.Canvas.Handle,  // Destination
    0, 0,                                          // X, Y (target pos)
    RichViewDescr.Width, RichViewDescr.Height,     // Size to copy
    imgMain.Canvas.handle,                         // Source
    RichViewDescr.Left, RichViewDescr.Top,         // X, Y (source pos)
    SrcCopy);                                      // plain copy
  RichViewDescr.BackgroundStyle := bsNormal;
  // BackgroundStyle MUST be assigned after bitmap is created,
  // if not - RichView will not do a full background redraw when scrolling

  if RichViewNote.Visible then
  begin
    RichViewNote.BackgroundBitmap.Create;
    RichViewNote.BackgroundBitmap.Width := RichViewNote.Width;
    RichViewNote.BackgroundBitmap.Height := RichViewNote.Height;
    BitBlt(RichViewNote.BackgroundBitmap.Canvas.Handle,  // Destination
      0, 0,                                         // X, Y (target pos)
      RichViewNote.Width, RichViewNote.Height,      // Size to copy
      imgMain.Canvas.handle,                        // Source
      RichViewNote.Left, RichViewNote.Top,          // X, Y (source pos)
      SrcCopy);                                     // plain copy
    RichViewNote.BackgroundStyle := bsNormal;
  end;

  // Quick info - add background
  if lblMsgInfoBack.Visible = False then
  begin // Transparent Msg/Quickinfo
    BitBlt(mirvQuickInfo.BackgroundBitmap.Canvas.Handle,  // Destination
      0, 0,                                          // X, Y (target pos)
      mirvQuickInfo.Width, mirvQuickInfo.Height,     // Size to copy
      imgMain.Canvas.handle,                         // Source
      mirvQuickInfo.Left, mirvQuickInfo.Top,         // X, Y (source pos)
      SrcCopy);                                      // plain copy
    mirvQuickInfo.BackgroundStyle := bsNormal;
  end;

  MakeTransparent(frmMain, imgMain);

  imgMain.Picture.Bitmap.PixelFormat := pf24bit;
  if imgMain.Picture.Bitmap.PixelFormat = pf24bit then
  begin // draw anti-aliased texts
    DrawAALabel(imgMain.Picture.Bitmap,
      lblTitle,
      titleshadowdir,
      titleshadowcolor,
      titleshadowlength);

    DrawAALabel(imgMain.Picture.Bitmap,
      lblHandle,
      handleshadowdir,
      handleshadowcolor,
      handleshadowlength);
  end;

  if not trlunpack then
    MakeTranslucency(frmMain.Handle, vtranslucenty);

  LoadSkinImage(imgEmpty.Picture, 'MainNoImage', False);

  if ExistsSkinImage('MainMinimize') then
    LoadSkinButton(imgMinimize, btnMinimize, 'MainMinimize', True);

  if ExistsSkinImage('MainClose') then
    LoadSkinButton(imgClose, btnClose, 'MainClose', True);

  LoadSkinImageGif(gif, 'MainAni');
  if gif <> nil then
  begin
    imgAniGif.Picture.Assign(gif);
    imgAniGif.Visible := True;
    if Trim(lblMessage.Caption) <> '' then
      imgAniGif.Hint := lblMessage.Caption;
  end
  else
    imgAniGif.Picture := TPicture.Create;


  if ExistsSkinImage('MainPrev') then
    LoadSkinButton(imgPrev, btnPrev, 'MainPrev', False);

  if ExistsSkinImage('MainNext') then
    LoadSkinButton(imgNext, btnNext, 'MainNext', False);

  if ExistsSkinImage('MainInstall') then
    LoadSkinButton(imgInstall, btnInstall, 'MainInstall', False);

  if ExistsSkinImage('MainPlay') then
    LoadSkinButton(imgPlay, btnPlay, 'MainPlay', False);

  if ExistsSkinImage('MainRun') then
    LoadSkinButton(imgRun, btnRun, 'MainRun', False);

  if ExistsSkinImage('MainView') then
    LoadSkinButton(imgView, btnView, 'MainView', False);

  if ExistsSkinImage('MainMore') then
    LoadSkinButton(imgMore, btnMore, 'MainMore', False);

  if ExistsSkinImage('MainNFO') then
    LoadSkinButton(imgNfo, btnNfo, 'MainNfo', False);

  if ExistsSkinImage('MainSearch') and ExistsSkinImage('Search') then
    LoadSkinButton(imgSearch, btnSearch, 'MainSearch', True);

  if ExistsSkinImage('Player') then
  begin
    pbMusicVis.ControlStyle := pbMusicVis.ControlStyle + [csOpaque]; // do not draw bg
    pbMusicTitle.ControlStyle := pbMusicTitle.ControlStyle + [csOpaque]; // do not draw bg

    pbMusicVis.Left := PlayerPosSize.iSpectrumOscX + imgPlayer.Left;
    pbMusicVis.Top := PlayerPosSize.iSpectrumOscY + imgPlayer.Top;
    pbMusicVis.Width := PlayerPosSize.iSpectrumOscWidth;
    pbMusicVis.Height := PlayerPosSize.iSpectrumOscHeight;
    pbMusicVis.BringToFront;

    LoadSkinImage(imgPlayer.Picture, 'Player', True);
    imgPlayer.Visible := True;
    if transcolor <> '' then
    begin
      imgPlayer.Picture.Bitmap.Transparent := True;
      if imgPlayer.Picture.Bitmap.PixelFormat = pf24bit then
        MakePlayerImageTransparent24bit
      else
        MakePlayerImageTransparent;
    end;

   imgPlayer.SendToBack; // should be on back - so other controls can be on top.
                         // this give skin designers more possibilities.
   imgMain.SendToBack;   // imgMain should of course be behind.


    if (PlayerPosSize.iTitleX < 0) or
       (PlayerPosSize.iTitleX > imgPlayer.Width) or
       (PlayerPosSize.iTitleY < 0) or
       (PlayerPosSize.iTitleY > imgPlayer.Height) then
      pbMusicTitle.Visible := False
    else
    begin
      scrollPos  :=0;
      scrollSpeed:=1;
      scrollMsgNo:=1;

      pbMusicTitle.Visible := True;
      pbMusicTitle.Left := PlayerPosSize.iTitleX + imgPlayer.Left;
      pbMusicTitle.Top := PlayerPosSize.iTitleY + imgPlayer.Top;
      pbMusicTitle.Width := PlayerPosSize.iTitleWidth;
      pbMusicTitle.Height := PlayerPosSize.iTitleHeight;
      pbMusicTitle.BringToFront;
    end;

    picMPTitleBG.Bitmap.Width := PlayerPosSize.iTitleWidth;
    picMPTitleBG.Bitmap.Height := PlayerPosSize.iTitleHeight;
    BitBlt(picMPTitleBG.Bitmap.Canvas.Handle,                       // Destination
      0, 0,                                                    // X, Y (target pos)
      PlayerPosSize.iTitleWidth, PlayerPosSize.iTitleHeight,
      // Size to copy
      imgPlayer.Canvas.handle,                                 // Source
      PlayerPosSize.iTitleX, PlayerPosSize.iTitleY, // X, Y (source pos)
      SrcCopy);                                                // plain copy
    picMPTitleBG.Bitmap.PixelFormat := pf24bit;

    picMPTitle.Bitmap.Width := PlayerPosSize.iTitleWidth;
    picMPTitle.Bitmap.Height := PlayerPosSize.iTitleHeight;
    picMPTitle.Bitmap.PixelFormat := pf24bit;

    if ExistsSkinImage('PlayerOpen') then
    begin
      imgPlayerOpen.Left := PlayerPosSize.iOpenX + imgPlayer.Left;
      imgPlayerOpen.Top := PlayerPosSize.iOpenY + imgPlayer.Top;
      LoadSkinButton(imgPlayerOpen, btnMPOpen, 'PlayerOpen', True);
    end;
    if ExistsSkinImage('PlayerPrev') then
    begin
      imgPlayerRew.Left := PlayerPosSize.iRewX + imgPlayer.Left;
      imgPlayerRew.Top := PlayerPosSize.iRewY + imgPlayer.Top;
      LoadSkinButton(imgPlayerRew, btnMPRew, 'PlayerPrev', True);
    end;
    if ExistsSkinImage('PlayerStop') then
    begin
      imgPlayerStop.Left := PlayerPosSize.iStopX + imgPlayer.Left;
      imgPlayerStop.Top := PlayerPosSize.iStopY + imgPlayer.Top;
      LoadSkinButton(imgPlayerStop, btnMPStop, 'PlayerStop', True);
    end;
    if ExistsSkinImage('PlayerPause') then
    begin
      imgPlayerPause.Left := PlayerPosSize.iPauseX + imgPlayer.Left;
      imgPlayerPause.Top := PlayerPosSize.iPauseY + imgPlayer.Top;
      LoadSkinButton(imgPlayerPause, btnMPPause, 'PlayerPause', True);
    end;
    if ExistsSkinImage('PlayerPlay') then
    begin
      imgPlayerPlay.Left := PlayerPosSize.iPlayX + imgPlayer.Left;
      imgPlayerPlay.Top := PlayerPosSize.iPlayY + imgPlayer.Top;
      LoadSkinButton(imgPlayerPlay, btnMPPlay, 'PlayerPlay', True);
    end;
    if ExistsSkinImage('PlayerNext') then
    begin
      imgPlayerForward.Left := PlayerPosSize.iForwardX + imgPlayer.Left;
      imgPlayerForward.Top := PlayerPosSize.iForwardY + imgPlayer.Top;
      LoadSkinButton(imgPlayerForward, btnMPForward, 'PlayerNext', True);
    end;

    OcilloScope := TOcilloScope.Create(pbMusicVis.Width, pbMusicVis.Height);
    OcilloScope.Mode := 0; // line draw
    OcilloScope.Pen := StrToInt(sMusicVisColor);

    Spectrum := TSpectrum.Create(pbMusicVis.Width, pbMusicVis.Height);
    Spectrum.Mode := 1; // solid draw
    Spectrum.Pen := StrToInt(sMusicVisColor);
    Spectrum.Peak := StrToInt(sMusicSpPeakColor);
    Spectrum.DrawPeak := bMusicSpPeaks;

    // Create bg gfx for Ocilloscope/spectrum
    picVisBGPic := TPicture.Create;
    picVisBGPic.Bitmap.Width := pbMusicVis.Width;
    picVisBGPic.Bitmap.Height := pbMusicVis.Height;
    BitBlt(picVisBGPic.Bitmap.Canvas.Handle,    // Destination
      0, 0,                                // X, Y (target pos)
      pbMusicVis.Width, pbMusicVis.Height, // Size to copy
      imgPlayer.Canvas.handle,               // Source
      PlayerPosSize.iSpectrumOscX, PlayerPosSize.iSpectrumOscY,
      // X, Y (source pos)
      SrcCopy);                            // plain copy
    OcilloScope.SetBackGround(picVisBGPic.Graphic);
    Spectrum.SetBackGround(picVisBGPic.Graphic);
    PicVisBGPic.Free;
  end
  else
    iMusicVisualMode := 0; // do not paint spectrum/osc

  try
    bUseDarkBgSmilies := (ColorToRGB(RichViewDescr.BackgroundBitmap.Canvas.Pixels[2,2]) and  $000000FF) +
                         ((ColorToRGB(RichViewDescr.BackgroundBitmap.Canvas.Pixels[2,2]) and  $0000FF00) div 256) +
                         ((ColorToRGB(RichViewDescr.BackgroundBitmap.Canvas.Pixels[2,2]) and  $00FF0000) div 256 div 256) < 650;
  except
    bUseDarkBgSmilies := True;
  end;

  if not bLoading then
  begin
    frmMain.Visible := True;
    frmMain.Refresh;

    // if reloading - then prepare subform for skinchange
    if frmInstall <> nil then
      frmInstall.NewSkinName := SkinName;
    if frmUnpack <> nil then
      frmUnpack.NewSkinName := SkinName;
    if frmMsgBox <> nil then
      frmMsgBox.NewSkinName := SkinName;
  end;
end; // LoadSkin

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ListOtherSkins(zipfile: string; var skinname: string);
var
  NewItem: TMenuItem;
  s: string;
  sl: TStringList;
  i: integer;
  RandomChoice: integer;
  Found: boolean;
begin
  sl := GetSkinNames;

  if sl.Count > 1 then
  begin
    Found := False;
    for i := 0 to sl.Count -1 do
      if AnsiUppercase(SkinName) = AnsiUppercase(sl.Strings[i]) then
        Found := True;
    if not Found then
      SkinName := '?'; // if skin not in list - use random skin

    if SkinName = '?' then
    begin
      Randomize;
      RandomChoice := Random(sl.Count);
    end
    else
      RandomChoice := -1;

    mnuChooseSkin.Visible := True;
    N4.Visible := True;

    for i := 0 to sl.Count -1 do
    begin
      NewItem := TMenuItem.Create(Self);
      s := sl.Strings[i];
      if RandomChoice = i then
        SkinName := s;
      NewItem.Hint := s;
      NewItem.Caption := StringReplace(s, '_', ' ', [rfReplaceAll]);
      NewItem.RadioItem := True;
      NewItem.Checked := AnsiUppercase(s) = AnsiUppercase(SkinName);
      NewItem.OnClick := ChangeSkinClick;
      mnuChooseSkin.Add(NewItem);
    end;
  end
  else
  begin
    mnuChooseSkin.Visible := False;
    N4.Visible := False;

    if sl.Count = 1 then
      SkinName := sl.Strings[0]; // be sure we got a skin
  end;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.ChangeSkinClick(Sender: TObject);
var
  i: integer;
  TimerRenderEnabled: boolean;
  MusicTimerEnabled: boolean;
begin
  if SkinName = (Sender as TMenuItem).Hint then
    Exit;

  mnuChooseSkin.Enabled := False;

  TimerRenderEnabled := TimerRender.Enabled;
  MusicTimerEnabled := MusicTimer.Enabled;
  TimerRender.Enabled := False;
  MusicTimer.Enabled := False;
  TimerMusicTitleScroller.Enabled := False;

  chkFile.Enabled := False;

  (Sender as TMenuItem).Checked := True;
  SkinName := (Sender as TMenuItem).Hint;

  if frmSearch <> nil then
  begin
    frmSearch.Free;
    frmSearch := nil;
  end;

  if frmNfo <> nil then
  begin
    frmNfo.Free;
    frmNfo := nil;
  end;

  if vtranslucenty <> 255 then
  begin // reset translucency if used
    MakeTranslucency(frmMain.Handle, 255);
    MakeTranslucency(frmInstall.Handle, 255);
    MakeTranslucency(frmUnpack.Handle, 255);
    MakeTranslucency(frmMsgBox.Handle, 255);
  end;

  frmMain.Visible := False;

  for i := 0 to frmMain.ControlCount - 1 do
    if frmMain.Controls[i] is TImage then
      TImage(frmMain.Controls[i]).Picture := TPicture.Create;

  LoadSkin(resourcefile, SkinName);

  VSTreeChange(VSTree, VSTree.GetFirstSelected);

  chkFile.Enabled := True;
  TimerRender.Enabled := TimerRenderEnabled;
  MusicTimer.Enabled := MusicTimerEnabled;

  if pbMusicTitle.Visible and (sMTMusicTitle <> '') then
     DrawMusictitle(sMusic_File, sMTMusicTitle); // starts TimerMusicTitleScroller if required

  mnuChooseSkin.Enabled := True;
end; // ChangeSkinClick

////////////////////////////////////////////////////////////////////////

function TfrmMain.GetSkinNames : TStringList;
// Returns skin names from both file system and in ressource file
var
  sl: TStringlist;
  slUpper: TStringlist;
  SearchRec : TSearchRec;
  i: integer;
  s: string;
begin
  sl := TStringList.Create;
  slUpper := TStringList.Create;

  if resourcefile <> '' then
  begin
    ZipMaster1.ZipFileName := resourcefile;
    ZipMaster1.Password := resourcepwd;

    for i:=0 to ZipMaster1.Count-1 do
    begin
      s := ZipMaster1.DirEntry[i]^.Filename;
      if (Uppercase(ExtractFilename(s)) = 'SETTINGS.XML') and (Uppercase(Copy(s, 1, 5)) = 'SKIN\') then
      begin
        Delete(s, 1, 5);
        s := Copy(s, 1, Pos('\', s)-1);
        if slUpper.IndexOf(AnsiUppercase(s)) = -1 then
        begin
          slUpper.Add(s);
          sl.Add(s);
        end;
      end;
    end;
  end;

  SetCurrentDir(GoWinDir);
  i:=FindFirst('skin\*.zip', faAnyFile, SearchRec);
  while i = 0 do
  begin
    s := ExtractFilename(SearchRec.Name);
    if Lowercase(ExtractFileExt(s)) =  '.zip' then // strage - but *.zip finds *.zip* ....must be a delphi bug
    begin
      s := Copy(s, 1, Length(s) - Length(ExtractFileExt(s)));
      if slUpper.IndexOf(AnsiUppercase(s)) = -1 then
      begin
        slUpper.Add(AnsiUppercase(s));
        sl.Add(s);
      end;
    end;
    i:=FindNext(SearchRec);
  end;
  FindClose(SearchRec);

  slUpper.Free;
  sl.Sort;
  Result := sl;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.mnuOrderByTitleClick(Sender: TObject);
begin
  InitOrderBy(8); // 8=sort by title
  mnuOrderByTitle.Checked := True;
end;

////////////////////////////////////////////////////////////////////////

procedure TfrmMain.imgPictureClick(Sender: TObject);
var
  Node: PVirtualNode;
  NodeData: PTreeData;
begin
  if imgPicture.Visible and bScreenshotShowInNewWindowOnClick then
  begin
    Application.CreateForm(TfrmScreenshot, frmScreenshot);
    frmScreenShot.imgScreenshot.Picture.Assign(imgPicture.Picture);
    frmScreenShot.ClientWidth := frmScreenShot.imgScreenshot.Width;
    frmScreenShot.ClientHeight := frmScreenShot.imgScreenshot.Height;
    frmScreenShot.Caption := '';

    Node := VSTree.GetFirstSelected;
    if (Node <> nil) then
    begin
      NodeData := VSTree.GetNodeData(Node);
      if (NodeData <> nil) then
        frmScreenShot.Caption := NodeData.wsText;
    end;
    frmScreenShot.ShowModal;
    frmScreenshot.Free;
  end;
end;

////////////////////////////////////////////////////////////////////////

 {
procedure TfrmMain.ZipMessage(Sender: TObject; ErrCode: Integer; Message: String );
var
  f: textfile;
  fname: string;
begin
  fname := GoWinDir +  '\debug.txt';
  if fileExists(fname) then
  begin
    AssignFile(f, fname);
    ReSet(f);
    Append(f);
    Writeln(f, IntToStr(ErrCode) + ': ' + Message);
    CloseFile(f);
  end;
end;
}

////////////////////////////////////////////////////////////////////////

end.
