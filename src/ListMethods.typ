#import "template.typ": *

#show: project.with(
  title: "ListMethods in Trackmania Forever",
  authors: (
    "Quick",
  ),
)

= Available methods:
== system.listMethods
```cpp
array system.listMethods()
```
Return an array of all available XML-RPC methods on this server.
== system.methodSignature
```cpp
array system.methodSignature(string)
```
Given the name of a method, return an array of legal signatures. Each signature is an array of strings.  The first item of each signature is the return type, and any others items are parameter types.
== system.methodHelp
```cpp
string system.methodHelp(string)
```
Given the name of a method, return a help string.
== system.multicall
```cpp
array system.multicall(array)
```
Process an array of calls, and return an array of results.  Calls should be structs of the form {'methodName': string, 'params': array}. Each result will either be a single-item array containing the result value, or a struct of the form {'faultCode': int, 'faultString': string}.  This is useful when you need to make lots of small calls without lots of round trips.
== Authenticate
```cpp
boolean Authenticate(string, string)
```
Allow user authentication by specifying a login and a password, to gain access to the set of functionalities corresponding to this authorization level.
== ChangeAuthPassword
```cpp
boolean ChangeAuthPassword(string, string)
```
Change the password for the specified login/user. Only available to SuperAdmin.
== EnableCallbacks
```cpp
boolean EnableCallbacks(boolean)
```
Allow the GameServer to call you back.
== GetVersion
```cpp
struct GetVersion()
```
Returns a struct with the _Name_, _Version_ and _Build_ of the application remotely controled.
== CallVote
```cpp
boolean CallVote(string)
```
Call a vote for a cmd. The command is a XML string corresponding to an XmlRpc request. Only available to Admin.
#pagebreak(weak: false)
== CallVoteEx
```cpp
boolean CallVoteEx(string, double, int, int)
```
Extended call vote. Same as CallVote, but you can additionally supply specific parameters for this vote: a ratio, a time out and who is voting. Special timeout values: a timeout of '0' means default, '1' means indefinite; a ratio of '-1' means default; Voters values: '0' means only active players, '1' means any player, '2' is for everybody, pure spectators included. Only available to Admin.
== InternalCallVote
```cpp
boolean InternalCallVote()
```
Used internally by game.
== CancelVote
```cpp
boolean CancelVote()
```
Cancel the current vote. Only available to Admin.
== GetCurrentCallVote
```cpp
struct GetCurrentCallVote()
```
Returns the vote currently in progress. The returned structure is { CallerLogin, CmdName, CmdParam }.
== SetCallVoteTimeOut
```cpp
boolean SetCallVoteTimeOut(int)
```
Set a new timeout for waiting for votes. A zero value disables callvote. Only available to Admin. Requires a challenge restart to be taken into account.
== GetCallVoteTimeOut
```cpp
struct GetCallVoteTimeOut()
```
Get the current and next timeout for waiting for votes. The struct returned contains two fields 'CurrentValue' and 'NextValue'.
== SetCallVoteRatio
```cpp
boolean SetCallVoteRatio(double)
```
Set a new default ratio for passing a vote. Must lie between 0 and 1. Only available to Admin.
== GetCallVoteRatio
```cpp
double GetCallVoteRatio()
```
Get the current default ratio for passing a vote. This value lies between 0 and 1.
== SetCallVoteRatios
```cpp
boolean SetCallVoteRatios(array)
```
Set new ratios for passing specific votes. The parameter is an array of structs {string _Command_, double _Ratio_}, ratio is in [0,1] or -1 for vote disabled. Only available to Admin.
== GetCallVoteRatios
```cpp
array GetCallVoteRatios()
```
Get the current ratios for passing votes.
== ChatSendServerMessage
```cpp
boolean ChatSendServerMessage(string)
```
Send a text message to all clients without the server login. Only available to Admin.
== ChatSendServerMessageToLanguage
```cpp
boolean ChatSendServerMessageToLanguage(array, string)
```
Send a localised text message to all clients without the server login, or optionally to a Login (which can be a single login or a list of comma-separated logins). The parameter is an array of structures {_Lang_='??', _Text_='...'}. If no matching language is found, the last text in the array is used. Only available to Admin.
== ChatSendServerMessageToId
```cpp
boolean ChatSendServerMessageToId(string, int)
```
Send a text message without the server login to the client with the specified PlayerId. Only available to Admin.
== ChatSendServerMessageToLogin
```cpp
boolean ChatSendServerMessageToLogin(string, string)
```
Send a text message without the server login to the client with the specified login. Login can be a single login or a list of comma-separated logins. Only available to Admin.
== ChatSend
```cpp
boolean ChatSend(string)
```
Send a text message to all clients. Only available to Admin.
== ChatSendToLanguage
```cpp
boolean ChatSendToLanguage(array, string)
```
Send a localised text message to all clients, or optionally to a Login (which can be a single login or a list of comma-separated logins). The parameter is an array of structures {_Lang_='??', _Text_='...'}. If no matching language is found, the last text in the array is used. Only available to Admin.
== ChatSendToLogin
```cpp
boolean ChatSendToLogin(string, string)
```
Send a text message to the client with the specified login. Login can be a single login or a list of comma-separated logins. Only available to Admin.
== ChatSendToId
```cpp
boolean ChatSendToId(string, int)
```
Send a text message to the client with the specified PlayerId. Only available to Admin.
== GetChatLines
```cpp
array GetChatLines()
```
Returns the last chat lines. Maximum of 40 lines. Only available to Admin.
== ChatEnableManualRouting
```cpp
boolean ChatEnableManualRouting(boolean, boolean)
```
The chat messages are no longer dispatched to the players, they only go to the rpc callback and the controller has to manually forward them. The second (optional) parameter allows all messages from the server to be automatically forwarded. Only available to Admin.
#pagebreak(weak: false)
== ChatForwardToLogin
```cpp
boolean ChatForwardToLogin(string, string, string)
```
(Text, SenderLogin, DestLogin) Send a text message to the specified DestLogin (or everybody if empty) on behalf of SenderLogin. DestLogin can be a single login or a list of comma-separated logins. Only available if manual routing is enabled. Only available to Admin.
== SendNotice
```cpp
boolean SendNotice(string, string, int)
```
Display a notice on all clients. The parameters are the text message to display, and the login of the avatar to display next to it (or '' for no avatar), and an optional 'max duration' in seconds (default: 3). Only available to Admin.
== SendNoticeToId
```cpp
boolean SendNoticeToId(int, string, int, int)
```
Display a notice on the client with the specified UId. The parameters are the Uid of the client to whom the notice is sent, the text message to display, and the UId of the avatar to display next to it (or '255' for no avatar), and an optional 'max duration' in seconds (default: 3). Only available to Admin.
== SendNoticeToLogin
```cpp
boolean SendNoticeToLogin(string, string, string, int)
```
Display a notice on the client with the specified login. The parameters are the login of the client to whom the notice is sent, the text message to display, and the login of the avatar to display next to it (or '' for no avatar), and an optional 'max duration' in seconds (default: 3). Login can be a single login or a list of comma-separated logins.  Only available to Admin.
== SendDisplayManialinkPage
```cpp
boolean SendDisplayManialinkPage(string, int, boolean)
```
Display a manialink page on all clients. The parameters are the xml description of the page to display, a timeout to autohide it (0 = permanent), and a boolean to indicate whether the page must be hidden as soon as the user clicks on a page option. Only available to Admin.
== SendDisplayManialinkPageToId
```cpp
boolean SendDisplayManialinkPageToId(int, string, int, boolean)
```
Display a manialink page on the client with the specified UId. The first parameter is the UId of the player, the other are identical to 'SendDisplayManialinkPage'. Only available to Admin.
== SendDisplayManialinkPageToLogin
```cpp
boolean SendDisplayManialinkPageToLogin(string, string, int, boolean)
```
Display a manialink page on the client with the specified login. The first parameter is the login of the player, the other are identical to 'SendDisplayManialinkPage'. Login can be a single login or a list of comma-separated logins. Only available to Admin.
== SendHideManialinkPage
```cpp
boolean SendHideManialinkPage()
```
Hide the displayed manialink page on all clients. Only available to Admin.
== SendHideManialinkPageToId
```cpp
boolean SendHideManialinkPageToId(int)
```
Hide the displayed manialink page on the client with the specified UId. Only available to Admin.
== SendHideManialinkPageToLogin
```cpp
boolean SendHideManialinkPageToLogin(string)
```
Hide the displayed manialink page on the client with the specified login. Login can be a single login or a list of comma-separated logins. Only available to Admin.
== GetManialinkPageAnswers
```cpp
array GetManialinkPageAnswers()
```
Returns the latest results from the current manialink page, as an array of structs {string _Login_, int _PlayerId_, int _Result_} Result==0 -> no answer, Result>0.... -> answer from the player.
== Kick
```cpp
boolean Kick(string, string)
```
Kick the player with the specified login, with an optional message. Only available to Admin.
== KickId
```cpp
boolean KickId(int, string)
```
Kick the player with the specified PlayerId, with an optional message. Only available to Admin.
== Ban
```cpp
boolean Ban(string, string)
```
Ban the player with the specified login, with an optional message. Only available to Admin.
== BanAndBlackList
```cpp
boolean BanAndBlackList(string, string, boolean)
```
Ban the player with the specified login, with a message. Add it to the black list, and optionally save the new list. Only available to Admin.
== BanId
```cpp
boolean BanId(int, string)
```
Ban the player with the specified PlayerId, with an optional message. Only available to Admin.
== UnBan
```cpp
boolean UnBan(string)
```
Unban the player with the specified client name. Only available to Admin.
== CleanBanList
```cpp
boolean CleanBanList()
```
Clean the ban list of the server. Only available to Admin.
== GetBanList
```cpp
array GetBanList(int, int)
```
Returns the list of banned players. This method takes two parameters. The first parameter specifies the maximum number of infos to be returned, and the second one the starting index in the list. The list is an array of structures. Each structure contains the following fields : _Login_, _ClientName_ and _IPAddress_.
== BlackList
```cpp
boolean BlackList(string)
```
Blacklist the player with the specified login. Only available to SuperAdmin.
== BlackListId
```cpp
boolean BlackListId(int)
```
Blacklist the player with the specified PlayerId. Only available to SuperAdmin.
== UnBlackList
```cpp
boolean UnBlackList(string)
```
UnBlackList the player with the specified login. Only available to SuperAdmin.
== CleanBlackList
```cpp
boolean CleanBlackList()
```
Clean the blacklist of the server. Only available to SuperAdmin.
== GetBlackList
```cpp
array GetBlackList(int, int)
```
Returns the list of blacklisted players. This method takes two parameters. The first parameter specifies the maximum number of infos to be returned, and the second one the starting index in the list. The list is an array of structures. Each structure contains the following fields : _Login_.
== LoadBlackList
```cpp
boolean LoadBlackList(string)
```
Load the black list file with the specified file name. Only available to Admin.
== SaveBlackList
```cpp
boolean SaveBlackList(string)
```
Save the black list in the file with specified file name. Only available to Admin.
== AddGuest
```cpp
boolean AddGuest(string)
```
Add the player with the specified login on the guest list. Only available to Admin.
== AddGuestId
```cpp
boolean AddGuestId(int)
```
Add the player with the specified PlayerId on the guest list. Only available to Admin.
== RemoveGuest
```cpp
boolean RemoveGuest(string)
```
Remove the player with the specified login from the guest list. Only available to Admin.
== RemoveGuestId
```cpp
boolean RemoveGuestId(int)
```
Remove the player with the specified PlayerId from the guest list. Only available to Admin.
== CleanGuestList
```cpp
boolean CleanGuestList()
```
Clean the guest list of the server. Only available to Admin.
#pagebreak(weak: false)
== GetGuestList
```cpp
array GetGuestList(int, int)
```
Returns the list of players on the guest list. This method takes two parameters. The first parameter specifies the maximum number of infos to be returned, and the second one the starting index in the list. The list is an array of structures. Each structure contains the following fields : _Login_.
== LoadGuestList
```cpp
boolean LoadGuestList(string)
```
Load the guest list file with the specified file name. Only available to Admin.
== SaveGuestList
```cpp
boolean SaveGuestList(string)
```
Save the guest list in the file with specified file name. Only available to Admin.
== SetBuddyNotification
```cpp
boolean SetBuddyNotification(string, boolean)
```
Sets whether buddy notifications should be sent in the chat. _login_ is the login of the player, or '' for global setting, and _enabled_ is the value. Only available to Admin.
== GetBuddyNotification
```cpp
boolean GetBuddyNotification(string)
```
Gets whether buddy notifications are enabled for _login_, or '' to get the global setting.
== WriteFile
```cpp
boolean WriteFile(string, base64)
```
Write the data to the specified file. The filename is relative to the Tracks path. Only available to Admin.
== TunnelSendDataToId
```cpp
boolean TunnelSendDataToId(int, base64)
```
Send the data to the specified player. Only available to Admin.
== TunnelSendDataToLogin
```cpp
boolean TunnelSendDataToLogin(string, base64)
```
Send the data to the specified player. Login can be a single login or a list of comma-separated logins. Only available to Admin.
== Echo
```cpp
boolean Echo(string, string)
```
Just log the parameters and invoke a callback. Can be used to talk to other xmlrpc clients connected, or to make custom votes. If used in a callvote, the first parameter will be used as the vote message on the clients. Only available to Admin.
== Ignore
```cpp
boolean Ignore(string)
```
Ignore the player with the specified login. Only available to Admin.
== IgnoreId
```cpp
boolean IgnoreId(int)
```
Ignore the player with the specified PlayerId. Only available to Admin.
== UnIgnore
```cpp
boolean UnIgnore(string)
```
Unignore the player with the specified login. Only available to Admin.
== UnIgnoreId
```cpp
boolean UnIgnoreId(int)
```
Unignore the player with the specified PlayerId. Only available to Admin.
== CleanIgnoreList
```cpp
boolean CleanIgnoreList()
```
Clean the ignore list of the server. Only available to Admin.
== GetIgnoreList
```cpp
array GetIgnoreList(int, int)
```
Returns the list of ignored players. This method takes two parameters. The first parameter specifies the maximum number of infos to be returned, and the second one the starting index in the list. The list is an array of structures. Each structure contains the following fields : _Login_.
== Pay
```cpp
int Pay(string, int, string)
```
Pay coppers from the server account to a player, returns the BillId. This method takes three parameters: _Login_ of the payee, _Coppers_ to pay and a _Label_ to send with the payment. The creation of the transaction itself may cost coppers, so you need to have coppers on the server account. Only available to Admin.
== SendBill
```cpp
int SendBill(string, int, string, string)
```
Create a bill, send it to a player, and return the BillId. This method takes four parameters: _LoginFrom_ of the payer, _Coppers_ the player has to pay, _Label_ of the transaction and an optional _LoginTo_ of the payee (if empty string, then the server account is used). The creation of the transaction itself may cost coppers, so you need to have coppers on the server account. Only available to Admin.
== GetBillState
```cpp
struct GetBillState(int)
```
Returns the current state of a bill. This method takes one parameter, the _BillId_. Returns a struct containing _State_, _StateName_ and _TransactionId_. Possible enum values are: _CreatingTransaction_, _Issued_, _ValidatingPayement_, _Payed_, _Refused_, _Error_.
== GetServerCoppers
```cpp
int GetServerCoppers()
```
Returns the current number of coppers on the server account.
== GetSystemInfo
```cpp
struct GetSystemInfo()
```
Get some system infos, including connection rates (in kbps).
== SetConnectionRates
```cpp
boolean SetConnectionRates(int, int)
```
Set the download and upload rates (in kbps).
== SetServerName
```cpp
boolean SetServerName(string)
```
Set a new server name in utf8 format. Only available to Admin.
== GetServerName
```cpp
string GetServerName()
```
Get the server name in utf8 format.
== SetServerComment
```cpp
boolean SetServerComment(string)
```
Set a new server comment in utf8 format. Only available to Admin.
== GetServerComment
```cpp
string GetServerComment()
```
Get the server comment in utf8 format.
== SetHideServer
```cpp
boolean SetHideServer(int)
```
Set whether the server should be hidden from the public server list (0 = visible, 1 = always hidden, 2 = hidden from nations). Only available to Admin.
== GetHideServer
```cpp
int GetHideServer()
```
Get whether the server wants to be hidden from the public server list.
== IsRelayServer
```cpp
boolean IsRelayServer()
```
Returns true if this is a relay server.
== SetServerPassword
```cpp
boolean SetServerPassword(string)
```
Set a new password for the server. Only available to Admin.
== GetServerPassword
```cpp
string GetServerPassword()
```
Get the server password if called as Admin or Super Admin, else returns if a password is needed or not.
== SetServerPasswordForSpectator
```cpp
boolean SetServerPasswordForSpectator(string)
```
Set a new password for the spectator mode. Only available to Admin.
== GetServerPasswordForSpectator
```cpp
string GetServerPasswordForSpectator()
```
Get the password for spectator mode if called as Admin or Super Admin, else returns if a password is needed or not.
#pagebreak(weak: false)
== SetMaxPlayers
```cpp
boolean SetMaxPlayers(int)
```
Set a new maximum number of players. Only available to Admin. Requires a challenge restart to be taken into account.
== GetMaxPlayers
```cpp
struct GetMaxPlayers()
```
Get the current and next maximum number of players allowed on server. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetMaxSpectators
```cpp
boolean SetMaxSpectators(int)
```
Set a new maximum number of Spectators. Only available to Admin. Requires a challenge restart to be taken into account.
== GetMaxSpectators
```cpp
struct GetMaxSpectators()
```
Get the current and next maximum number of Spectators allowed on server. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== EnableP2PUpload
```cpp
boolean EnableP2PUpload(boolean)
```
Enable or disable peer-to-peer upload from server. Only available to Admin.
== IsP2PUpload
```cpp
boolean IsP2PUpload()
```
Returns if the peer-to-peer upload from server is enabled.
== EnableP2PDownload
```cpp
boolean EnableP2PDownload(boolean)
```
Enable or disable peer-to-peer download for server. Only available to Admin.
== IsP2PDownload
```cpp
boolean IsP2PDownload()
```
Returns if the peer-to-peer download for server is enabled.
== AllowChallengeDownload
```cpp
boolean AllowChallengeDownload(boolean)
```
Allow clients to download challenges from the server. Only available to Admin.
== IsChallengeDownloadAllowed
```cpp
boolean IsChallengeDownloadAllowed()
```
Returns if clients can download challenges from the server.
== AutoSaveReplays
```cpp
boolean AutoSaveReplays(boolean)
```
Enable the autosaving of all replays (vizualisable replays with all players, but not validable) on the server. Only available to SuperAdmin.
== AutoSaveValidationReplays
```cpp
boolean AutoSaveValidationReplays(boolean)
```
Enable the autosaving on the server of validation replays, every time a player makes a new time. Only available to SuperAdmin.
== IsAutoSaveReplaysEnabled
```cpp
boolean IsAutoSaveReplaysEnabled()
```
Returns if autosaving of all replays is enabled on the server.
== IsAutoSaveValidationReplaysEnabled
```cpp
boolean IsAutoSaveValidationReplaysEnabled()
```
Returns if autosaving of validation replays is enabled on the server.
== SaveCurrentReplay
```cpp
boolean SaveCurrentReplay(string)
```
Saves the current replay (vizualisable replays with all players, but not validable). Pass a filename, or '' for an automatic filename. Only available to Admin.
== SaveBestGhostsReplay
```cpp
boolean SaveBestGhostsReplay(string, string)
```
Saves a replay with the ghost of all the players' best race. First parameter is the login of the player (or '' for all players), Second parameter is the filename, or '' for an automatic filename. Only available to Admin.
== GetValidationReplay
```cpp
base64 GetValidationReplay(string)
```
Returns a replay containing the data needed to validate the current best time of the player. The parameter is the login of the player.
== SetLadderMode
```cpp
boolean SetLadderMode(int)
```
Set a new ladder mode between ladder disabled (0) and forced (1). Only available to Admin. Requires a challenge restart to be taken into account.
== GetLadderMode
```cpp
struct GetLadderMode()
```
Get the current and next ladder mode on server. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== GetLadderServerLimits
```cpp
struct GetLadderServerLimits()
```
Get the ladder points limit for the players allowed on this server. The struct returned contains two fields _LadderServerLimitMin_ and _LadderServerLimitMax_.
== SetVehicleNetQuality
```cpp
boolean SetVehicleNetQuality(int)
```
Set the network vehicle quality to Fast (0) or High (1). Only available to Admin. Requires a challenge restart to be taken into account.
== GetVehicleNetQuality
```cpp
struct GetVehicleNetQuality()
```
Get the current and next network vehicle quality on server. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetServerOptions
```cpp
boolean SetServerOptions(struct)
```
Set new server options using the struct passed as parameters. This struct must contain the following fields : _Name_, _Comment_, _Password_, _PasswordForSpectator_, _NextMaxPlayers_, _NextMaxSpectators_, _IsP2PUpload_, _IsP2PDownload_, _NextLadderMode_, _NextVehicleNetQuality_, _NextCallVoteTimeOut_, _CallVoteRatio_, _AllowChallengeDownload_, _AutoSaveReplays_, and optionally for forever: _RefereePassword_, _RefereeMode_, _AutoSaveValidationReplays_, _HideServer_, _UseChangingValidationSeed_. Only available to Admin. A change of NextMaxPlayers, NextMaxSpectators, NextLadderMode, NextVehicleNetQuality, NextCallVoteTimeOut or UseChangingValidationSeed requires a challenge restart to be taken into account.
== GetServerOptions
```cpp
struct GetServerOptions(int)
```
Optional parameter for compatibility: struct version (0 = united, 1 = forever). Returns a struct containing the server options: _Name_, _Comment_, _Password_, _PasswordForSpectator_, _CurrentMaxPlayers_, _NextMaxPlayers_, _CurrentMaxSpectators_, _NextMaxSpectators_, _IsP2PUpload_, _IsP2PDownload_, _CurrentLadderMode_, _NextLadderMode_, _CurrentVehicleNetQuality_, _NextVehicleNetQuality_, _CurrentCallVoteTimeOut_, _NextCallVoteTimeOut_, _CallVoteRatio_, _AllowChallengeDownload_ and _AutoSaveReplays_, and additionally for forever: _RefereePassword_, _RefereeMode_, _AutoSaveValidationReplays_, _HideServer_, _CurrentUseChangingValidationSeed_, _NextUseChangingValidationSeed_.
== SetServerPackMask
```cpp
boolean SetServerPackMask(string)
```
Defines the packmask of the server. Can be 'United', 'Nations', 'Sunrise', 'Original', or any of the environment names. (Only challenges matching the packmask will be allowed on the server, so that player connecting to it know what to expect.) Only available when the server is stopped. Only available to Admin.
== GetServerPackMask
```cpp
string GetServerPackMask()
```
Get the packmask of the server.
== SetForcedMods
```cpp
boolean SetForcedMods(boolean, array)
```
Set the mods to apply on the clients. Parameters: _Override_, if true even the challenges with a mod will be overridden by the server setting; and _Mods_, an array of structures [{_EnvName_, _Url_}, ...]. Requires a challenge restart to be taken into account. Only available to Admin.
== GetForcedMods
```cpp
struct GetForcedMods()
```
Get the mods settings.
#pagebreak(weak: false)
== SetForcedMusic
```cpp
boolean SetForcedMusic(boolean, string)
```
Set the music to play on the clients. Parameters: _Override_, if true even the challenges with a custom music will be overridden by the server setting, and a _UrlOrFileName_ for the music. Requires a challenge restart to be taken into account. Only available to Admin.
== GetForcedMusic
```cpp
struct GetForcedMusic()
```
Get the music setting.
== SetForcedSkins
```cpp
boolean SetForcedSkins(array)
```
Defines a list of remappings for player skins. It expects a list of structs _Orig_, _Name_, _Checksum_, _Url_.  Orig is the name of the skin to remap, or '\*' for any other. Name, Checksum, Url define the skin to use. (They are optional, you may set value '' for any of those. All 3 null means same as Orig). Will only affect players connecting after the value is set. Only available to Admin.
== GetForcedSkins
```cpp
array GetForcedSkins()
```
Get the current forced skins.
== GetLastConnectionErrorMessage
```cpp
string GetLastConnectionErrorMessage()
```
Returns the last error message for an internet connection. Only available to Admin.
== SetRefereePassword
```cpp
boolean SetRefereePassword(string)
```
Set a new password for the referee mode. Only available to Admin.
== GetRefereePassword
```cpp
string GetRefereePassword()
```
Get the password for referee mode if called as Admin or Super Admin, else returns if a password is needed or not.
== SetRefereeMode
```cpp
boolean SetRefereeMode(int)
```
Set the referee validation mode. 0 = validate the top3 players, 1 = validate all players. Only available to Admin.
== GetRefereeMode
```cpp
int GetRefereeMode()
```
Get the referee validation mode.
== SetUseChangingValidationSeed
```cpp
boolean SetUseChangingValidationSeed(boolean)
```
Set whether the game should use a variable validation seed or not. Only available to Admin. Requires a challenge restart to be taken into account.
#pagebreak(weak: false)
== GetUseChangingValidationSeed
```cpp
struct GetUseChangingValidationSeed()
```
Get the current and next value of UseChangingValidationSeed. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetWarmUp
```cpp
boolean SetWarmUp(boolean)
```
Sets whether the server is in warm-up phase or not. Only available to Admin.
== GetWarmUp
```cpp
boolean GetWarmUp()
```
Returns whether the server is in warm-up phase.
== ChallengeRestart
```cpp
boolean ChallengeRestart()
```
Restarts the challenge, with an optional boolean parameter _DontClearCupScores_ (only available in cup mode). Only available to Admin.
== RestartChallenge
```cpp
boolean RestartChallenge()
```
Restarts the challenge, with an optional boolean parameter _DontClearCupScores_ (only available in cup mode). Only available to Admin.
== NextChallenge
```cpp
boolean NextChallenge()
```
Switch to next challenge, with an optional boolean parameter _DontClearCupScores_ (only available in cup mode). Only available to Admin.
== StopServer
```cpp
boolean StopServer()
```
Stop the server. Only available to SuperAdmin.
== ForceEndRound
```cpp
boolean ForceEndRound()
```
In Rounds or Laps mode, force the end of round without waiting for all players to giveup/finish. Only available to Admin.
== SetGameInfos
```cpp
boolean SetGameInfos(struct)
```
Set new game settings using the struct passed as parameters. This struct must contain the following fields : _GameMode_, _ChatTime_, _RoundsPointsLimit_, _RoundsUseNewRules_, _RoundsForcedLaps_, _TimeAttackLimit_, _TimeAttackSynchStartPeriod_, _TeamPointsLimit_, _TeamMaxPoints_, _TeamUseNewRules_, _LapsNbLaps_, _LapsTimeLimit_, _FinishTimeout_, and optionally: _AllWarmUpDuration_, _DisableRespawn_, _ForceShowAllOpponents_, _RoundsPointsLimitNewRules_, _TeamPointsLimitNewRules_, _CupPointsLimit_, _CupRoundsPerChallenge_, _CupNbWinners_, _CupWarmUpDuration_. Only available to Admin. Requires a challenge restart to be taken into account.
#pagebreak(weak: false)
== GetCurrentGameInfo
```cpp
struct GetCurrentGameInfo(int)
```
Optional parameter for compatibility: struct version (0 = united, 1 = forever). Returns a struct containing the current game settings, ie: _GameMode_, _ChatTime_, _NbChallenge_, _RoundsPointsLimit_, _RoundsUseNewRules_, _RoundsForcedLaps_, _TimeAttackLimit_, _TimeAttackSynchStartPeriod_, _TeamPointsLimit_, _TeamMaxPoints_, _TeamUseNewRules_, _LapsNbLaps_, _LapsTimeLimit_, _FinishTimeout_, and additionally for version 1: _AllWarmUpDuration_, _DisableRespawn_, _ForceShowAllOpponents_, _RoundsPointsLimitNewRules_, _TeamPointsLimitNewRules_, _CupPointsLimit_, _CupRoundsPerChallenge_, _CupNbWinners_, _CupWarmUpDuration_.
== GetNextGameInfo
```cpp
struct GetNextGameInfo(int)
```
Optional parameter for compatibility: struct version (0 = united, 1 = forever). Returns a struct containing the game settings for the next challenge, ie: _GameMode_, _ChatTime_, _NbChallenge_, _RoundsPointsLimit_, _RoundsUseNewRules_, _RoundsForcedLaps_, _TimeAttackLimit_, _TimeAttackSynchStartPeriod_, _TeamPointsLimit_, _TeamMaxPoints_, _TeamUseNewRules_, _LapsNbLaps_, _LapsTimeLimit_, _FinishTimeout_, and additionally for version 1: _AllWarmUpDuration_, _DisableRespawn_, _ForceShowAllOpponents_, _RoundsPointsLimitNewRules_, _TeamPointsLimitNewRules_, _CupPointsLimit_, _CupRoundsPerChallenge_, _CupNbWinners_, _CupWarmUpDuration_.
== GetGameInfos
```cpp
struct GetGameInfos(int)
```
Optional parameter for compatibility: struct version (0 = united, 1 = forever). Returns a struct containing two other structures, the first containing the current game settings and the second the game settings for next challenge. The first structure is named _CurrentGameInfos_ and the second _NextGameInfos_.
== SetGameMode
```cpp
boolean SetGameMode(int)
```
Set a new game mode between Rounds (0), TimeAttack (1), Team (2), Laps (3), Stunts (4) and Cup (5). Only available to Admin. Requires a challenge restart to be taken into account.
== GetGameMode
```cpp
int GetGameMode()
```
Get the current game mode.
== SetChatTime
```cpp
boolean SetChatTime(int)
```
Set a new chat time value in milliseconds (actually 'chat time' is the duration of the end race podium, 0 means no podium displayed.). Only available to Admin.
== GetChatTime
```cpp
struct GetChatTime()
```
Get the current and next chat time. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetFinishTimeout
```cpp
boolean SetFinishTimeout(int)
```
Set a new finish timeout (for rounds/laps mode) value in milliseconds. 0 means default. 1 means adaptative to the duration of the challenge. Only available to Admin. Requires a challenge restart to be taken into account.
== GetFinishTimeout
```cpp
struct GetFinishTimeout()
```
Get the current and next FinishTimeout. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetAllWarmUpDuration
```cpp
boolean SetAllWarmUpDuration(int)
```
Set whether to enable the automatic warm-up phase in all modes. 0 = no, otherwise it's the duration of the phase, expressed in number of rounds (in rounds/team mode), or in number of times the gold medal time (other modes). Only available to Admin. Requires a challenge restart to be taken into account.
== GetAllWarmUpDuration
```cpp
struct GetAllWarmUpDuration()
```
Get whether the automatic warm-up phase is enabled in all modes. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetDisableRespawn
```cpp
boolean SetDisableRespawn(boolean)
```
Set whether to disallow players to respawn. Only available to Admin. Requires a challenge restart to be taken into account.
== GetDisableRespawn
```cpp
struct GetDisableRespawn()
```
Get whether players are disallowed to respawn. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetForceShowAllOpponents
```cpp
boolean SetForceShowAllOpponents(int)
```
Set whether to override the players preferences and always display all opponents (0=no override, 1=show all, other value=minimum number of opponents). Only available to Admin. Requires a challenge restart to be taken into account.
== GetForceShowAllOpponents
```cpp
struct GetForceShowAllOpponents()
```
Get whether players are forced to show all opponents. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetTimeAttackLimit
```cpp
boolean SetTimeAttackLimit(int)
```
Set a new time limit for time attack mode. Only available to Admin. Requires a challenge restart to be taken into account.
== GetTimeAttackLimit
```cpp
struct GetTimeAttackLimit()
```
Get the current and next time limit for time attack mode. The struct returned contains two fields _CurrentValue_ and _NextValue_.
#pagebreak(weak: false)
== SetTimeAttackSynchStartPeriod
```cpp
boolean SetTimeAttackSynchStartPeriod(int)
```
Set a new synchronized start period for time attack mode. Only available to Admin. Requires a challenge restart to be taken into account.
== GetTimeAttackSynchStartPeriod
```cpp
struct GetTimeAttackSynchStartPeriod()
```
Get the current and synchronized start period for time attack mode. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetLapsTimeLimit
```cpp
boolean SetLapsTimeLimit(int)
```
Set a new time limit for laps mode. Only available to Admin. Requires a challenge restart to be taken into account.
== GetLapsTimeLimit
```cpp
struct GetLapsTimeLimit()
```
Get the current and next time limit for laps mode. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetNbLaps
```cpp
boolean SetNbLaps(int)
```
Set a new number of laps for laps mode. Only available to Admin. Requires a challenge restart to be taken into account.
== GetNbLaps
```cpp
struct GetNbLaps()
```
Get the current and next number of laps for laps mode. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetRoundForcedLaps
```cpp
boolean SetRoundForcedLaps(int)
```
Set a new number of laps for rounds mode (0 = default, use the number of laps from the challenges, otherwise forces the number of rounds for multilaps challenges). Only available to Admin. Requires a challenge restart to be taken into account.
== GetRoundForcedLaps
```cpp
struct GetRoundForcedLaps()
```
Get the current and next number of laps for rounds mode. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetRoundPointsLimit
```cpp
boolean SetRoundPointsLimit(int)
```
Set a new points limit for rounds mode (value set depends on UseNewRulesRound). Only available to Admin. Requires a challenge restart to be taken into account.
#pagebreak(weak: false)
== GetRoundPointsLimit
```cpp
struct GetRoundPointsLimit()
```
Get the current and next points limit for rounds mode (values returned depend on UseNewRulesRound). The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetRoundCustomPoints
```cpp
boolean SetRoundCustomPoints(array, boolean)
```
Set the points used for the scores in rounds mode. _Points_ is an array of decreasing integers for the players from the first to last. And you can add an optional boolean to relax the constraint checking on the scores. Only available to Admin.
== GetRoundCustomPoints
```cpp
array GetRoundCustomPoints()
```
Gets the points used for the scores in rounds mode.
== SetUseNewRulesRound
```cpp
boolean SetUseNewRulesRound(boolean)
```
Set if new rules are used for rounds mode. Only available to Admin. Requires a challenge restart to be taken into account.
== GetUseNewRulesRound
```cpp
struct GetUseNewRulesRound()
```
Get if the new rules are used for rounds mode (Current and next values). The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetTeamPointsLimit
```cpp
boolean SetTeamPointsLimit(int)
```
Set a new points limit for team mode (value set depends on UseNewRulesTeam). Only available to Admin. Requires a challenge restart to be taken into account.
== GetTeamPointsLimit
```cpp
struct GetTeamPointsLimit()
```
Get the current and next points limit for team mode (values returned depend on UseNewRulesTeam). The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetMaxPointsTeam
```cpp
boolean SetMaxPointsTeam(int)
```
Set a new number of maximum points per round for team mode. Only available to Admin. Requires a challenge restart to be taken into account.
== GetMaxPointsTeam
```cpp
struct GetMaxPointsTeam()
```
Get the current and next number of maximum points per round for team mode. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetUseNewRulesTeam
```cpp
boolean SetUseNewRulesTeam(boolean)
```
Set if new rules are used for team mode. Only available to Admin. Requires a challenge restart to be taken into account.
== GetUseNewRulesTeam
```cpp
struct GetUseNewRulesTeam()
```
Get if the new rules are used for team mode (Current and next values). The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetCupPointsLimit
```cpp
boolean SetCupPointsLimit(int)
```
Set the points needed for victory in Cup mode. Only available to Admin. Requires a challenge restart to be taken into account.
== GetCupPointsLimit
```cpp
struct GetCupPointsLimit()
```
Get the points needed for victory in Cup mode. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetCupRoundsPerChallenge
```cpp
boolean SetCupRoundsPerChallenge(int)
```
Sets the number of rounds before going to next challenge in Cup mode. Only available to Admin. Requires a challenge restart to be taken into account.
== GetCupRoundsPerChallenge
```cpp
struct GetCupRoundsPerChallenge()
```
Get the number of rounds before going to next challenge in Cup mode. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetCupWarmUpDuration
```cpp
boolean SetCupWarmUpDuration(int)
```
Set whether to enable the automatic warm-up phase in Cup mode. 0 = no, otherwise it's the duration of the phase, expressed in number of rounds. Only available to Admin. Requires a challenge restart to be taken into account.
== GetCupWarmUpDuration
```cpp
struct GetCupWarmUpDuration()
```
Get whether the automatic warm-up phase is enabled in Cup mode. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== SetCupNbWinners
```cpp
boolean SetCupNbWinners(int)
```
Set the number of winners to determine before the match is considered over. Only available to Admin. Requires a challenge restart to be taken into account.
== GetCupNbWinners
```cpp
struct GetCupNbWinners()
```
Get the number of winners to determine before the match is considered over. The struct returned contains two fields _CurrentValue_ and _NextValue_.
== GetCurrentChallengeIndex
```cpp
int GetCurrentChallengeIndex()
```
Returns the current challenge index in the selection, or -1 if the challenge is no longer in the selection.
== GetNextChallengeIndex
```cpp
int GetNextChallengeIndex()
```
Returns the challenge index in the selection that will be played next (unless the current one is restarted...)
== SetNextChallengeIndex
```cpp
boolean SetNextChallengeIndex(int)
```
Sets the challenge index in the selection that will be played next (unless the current one is restarted...)
== GetCurrentChallengeInfo
```cpp
struct GetCurrentChallengeInfo()
```
Returns a struct containing the infos for the current challenge. The struct contains the following fields : _Name_, _UId_, _FileName_, _Author_, _Environnement_, _Mood_, _BronzeTime_, _SilverTime_, _GoldTime_, _AuthorTime_, _CopperPrice_, _LapRace_, _NbLaps_ and _NbCheckpoints_.
== GetNextChallengeInfo
```cpp
struct GetNextChallengeInfo()
```
Returns a struct containing the infos for the next challenge. The struct contains the following fields : _Name_, _UId_, _FileName_, _Author_, _Environnement_, _Mood_, _BronzeTime_, _SilverTime_, _GoldTime_, _AuthorTime_, _CopperPrice_ and _LapRace_. (_NbLaps_ and _NbCheckpoints_ are also present but always set to -1)
== GetChallengeInfo
```cpp
struct GetChallengeInfo(string)
```
Returns a struct containing the infos for the challenge with the specified filename. The struct contains the following fields : _Name_, _UId_, _FileName_, _Author_, _Environnement_, _Mood_, _BronzeTime_, _SilverTime_, _GoldTime_, _AuthorTime_, _CopperPrice_ and _LapRace_. (_NbLaps_ and _NbCheckpoints_ are also present but always set to -1)
== CheckChallengeForCurrentServerParams
```cpp
boolean CheckChallengeForCurrentServerParams(string)
```
Returns a boolean if the challenge with the specified filename matches the current server settings.
== GetChallengeList
```cpp
array GetChallengeList(int, int)
```
Returns a list of challenges among the current selection of the server. This method take two parameters. The first parameter specifies the maximum number of infos to be returned, and the second one the starting index in the selection. The list is an array of structures. Each structure contains the following fields : _Name_, _UId_, _FileName_, _Environnement_, _Author_, _GoldTime_ and _CopperPrice_.
== AddChallenge
```cpp
boolean AddChallenge(string)
```
Add the challenge with the specified filename at the end of the current selection. Only available to Admin.
== AddChallengeList
```cpp
int AddChallengeList(array)
```
Add the list of challenges with the specified filenames at the end of the current selection. The list of challenges to add is an array of strings. Only available to Admin.
== RemoveChallenge
```cpp
boolean RemoveChallenge(string)
```
Remove the challenge with the specified filename from the current selection. Only available to Admin.
== RemoveChallengeList
```cpp
int RemoveChallengeList(array)
```
Remove the list of challenges with the specified filenames from the current selection. The list of challenges to remove is an array of strings. Only available to Admin.
== InsertChallenge
```cpp
boolean InsertChallenge(string)
```
Insert the challenge with the specified filename after the current challenge. Only available to Admin.
== InsertChallengeList
```cpp
int InsertChallengeList(array)
```
Insert the list of challenges with the specified filenames after the current challenge. The list of challenges to insert is an array of strings. Only available to Admin.
== ChooseNextChallenge
```cpp
boolean ChooseNextChallenge(string)
```
Set as next challenge the one with the specified filename, if it is present in the selection. Only available to Admin.
== ChooseNextChallengeList
```cpp
int ChooseNextChallengeList(array)
```
Set as next challenges the list of challenges with the specified filenames, if they are present in the selection. The list of challenges to choose is an array of strings. Only available to Admin.
== LoadMatchSettings
```cpp
int LoadMatchSettings(string)
```
Set a list of challenges defined in the playlist with the specified filename as the current selection of the server, and load the gameinfos from the same file. Only available to Admin.
== AppendPlaylistFromMatchSettings
```cpp
int AppendPlaylistFromMatchSettings(string)
```
Add a list of challenges defined in the playlist with the specified filename at the end of the current selection. Only available to Admin.
== SaveMatchSettings
```cpp
int SaveMatchSettings(string)
```
Save the current selection of challenge in the playlist with the specified filename, as well as the current gameinfos. Only available to Admin.
== InsertPlaylistFromMatchSettings
```cpp
int InsertPlaylistFromMatchSettings(string)
```
Insert a list of challenges defined in the playlist with the specified filename after the current challenge. Only available to Admin.
#pagebreak(weak: false)
== GetPlayerList
```cpp
array GetPlayerList(int, int, int)
```
Returns the list of players on the server. This method take two parameters. The first parameter specifies the maximum number of infos to be returned, and the second one the starting index in the list, an optional 3rd parameter is used for compatibility: struct version (0 = united, 1 = forever, 2 = forever, including the servers). The list is an array of PlayerInfo structures. Forever PlayerInfo struct is: Login, NickName, PlayerId, TeamId, SpectatorStatus, LadderRanking, and Flags.
LadderRanking is 0 when not in official mode,
Flags = ForceSpectator(0,1,2) + IsReferee * 10 + IsPodiumReady * 100 + IsUsingStereoscopy * 1000 + IsManagedByAnOtherServer * 10000 + IsServer * 100000 + HasPlayerSlot * 1000000
SpectatorStatus = Spectator + TemporarySpectator * 10 + PureSpectator * 100 + AutoTarget * 1000 + CurrentTargetId * 10000
== GetPlayerInfo
```cpp
struct GetPlayerInfo(string, int)
```
Returns a struct containing the infos on the player with the specified login, with an optional parameter for compatibility: struct version (0 = united, 1 = forever). The structure is identical to the ones from GetPlayerList. Forever PlayerInfo struct is: Login, NickName, PlayerId, TeamId, SpectatorStatus, LadderRanking, and Flags.
LadderRanking is 0 when not in official mode,
Flags = ForceSpectator(0,1,2) + IsReferee * 10 + IsPodiumReady * 100 + IsUsingStereoscopy * 1000 + IsManagedByAnOtherServer * 10000 + IsServer * 100000 + HasPlayerSlot * 1000000
SpectatorStatus = Spectator + TemporarySpectator * 10 + PureSpectator * 100 + AutoTarget * 1000 + CurrentTargetId * 10000
== GetDetailedPlayerInfo
```cpp
struct GetDetailedPlayerInfo(string)
```
Returns a struct containing the infos on the player with the specified login. The structure contains the following fields : _Login_, _NickName_, _PlayerId_, _TeamId_, _IPAddress_, _DownloadRate_, _UploadRate_, _Language_, _IsSpectator_, _IsInOfficialMode_, a structure named _Avatar_, an array of structures named _Skins_, a structure named _LadderStats_, _HoursSinceZoneInscription_ and _OnlineRights_ (0: nations account, 3: united account). Each structure of the array _Skins_ contains two fields _Environnement_ and a struct _PackDesc_. Each structure _PackDesc_, as well as the struct _Avatar_, contains two fields _FileName_ and _Checksum_.
== GetMainServerPlayerInfo
```cpp
struct GetMainServerPlayerInfo(int)
```
Returns a struct containing the player infos of the game server (ie: in case of a basic server, itself; in case of a relay server, the main server), with an optional parameter for compatibility: struct version (0 = united, 1 = forever). The structure is identical to the ones from GetPlayerList. Forever PlayerInfo struct is: Login, NickName, PlayerId, TeamId, SpectatorStatus, LadderRanking, and Flags.
LadderRanking is 0 when not in official mode,
Flags = ForceSpectator(0,1,2) + IsReferee * 10 + IsPodiumReady * 100 + IsUsingStereoscopy * 1000 + IsManagedByAnOtherServer * 10000 + IsServer * 100000 + HasPlayerSlot * 1000000
SpectatorStatus = Spectator + TemporarySpectator * 10 + PureSpectator * 100 + AutoTarget * 1000 + CurrentTargetId * 10000
#pagebreak(weak: false)
== GetCurrentRanking
```cpp
array GetCurrentRanking(int, int)
```
Returns the current rankings for the race in progress. (in team mode, the scores for the two teams are returned. In other modes, it's the individual players' scores) This method take two parameters. The first parameter specifies the maximum number of infos to be returned, and the second one the starting index in the ranking. The ranking returned is a list of structures. Each structure contains the following fields : _Login_, _NickName_, _PlayerId_, _Rank_, _BestTime_, _Score_, _NbrLapsFinished_ and _LadderScore_. It also contains an array _BestCheckpoints_ that contains the checkpoint times for the best race.
== GetCurrentRankingForLogin
```cpp
array GetCurrentRankingForLogin(string)
```
Returns the current ranking for the race in progressof the player with the specified login (or list of comma-separated logins). The ranking returned is a list of structures, that contains the following fields : _Login_, _NickName_, _PlayerId_, _Rank_, _BestTime_, _Score_, _NbrLapsFinished_ and _LadderScore_. It also contains an array _BestCheckpoints_ that contains the checkpoint times for the best race.
== ForceScores
```cpp
boolean ForceScores(array, boolean)
```
Force the scores of the current game. Only available in rounds and team mode. You have to pass an array of structs {int _PlayerId_, int _Score_}. And a boolean _SilentMode_ - if true, the scores are silently updated (only available for SuperAdmin), allowing an external controller to do its custom counting... Only available to Admin/SuperAdmin.
== ForcePlayerTeam
```cpp
boolean ForcePlayerTeam(string, int)
```
Force the team of the player. Only available in team mode. You have to pass the login and the team number (0 or 1). Only available to Admin.
== ForcePlayerTeamId
```cpp
boolean ForcePlayerTeamId(int, int)
```
Force the team of the player. Only available in team mode. You have to pass the playerid and the team number (0 or 1). Only available to Admin.
== ForceSpectator
```cpp
boolean ForceSpectator(string, int)
```
Force the spectating status of the player. You have to pass the login and the spectator mode (0: user selectable, 1: spectator, 2: player). Only available to Admin.
== ForceSpectatorId
```cpp
boolean ForceSpectatorId(int, int)
```
Force the spectating status of the player. You have to pass the playerid and the spectator mode (0: user selectable, 1: spectator, 2: player). Only available to Admin.
== ForceSpectatorTarget
```cpp
boolean ForceSpectatorTarget(string, string, int)
```
Force spectators to look at a specific player. You have to pass the login of the spectator (or '' for all) and the login of the target (or '' for automatic), and an integer for the camera type to use (-1 = leave unchanged, 0 = replay, 1 = follow, 2 = free). Only available to Admin.
== ForceSpectatorTargetId
```cpp
boolean ForceSpectatorTargetId(int, int, int)
```
Force spectators to look at a specific player. You have to pass the id of the spectator (or -1 for all) and the id of the target (or -1 for automatic), and an integer for the camera type to use (-1 = leave unchanged, 0 = replay, 1 = follow, 2 = free). Only available to Admin.
== SpectatorReleasePlayerSlot
```cpp
boolean SpectatorReleasePlayerSlot(string)
```
Pass the login of the spectator. A spectator that once was a player keeps his player slot, so that he can go back to race mode. Calling this function frees this slot for another player to connect. Only available to Admin.
== SpectatorReleasePlayerSlotId
```cpp
boolean SpectatorReleasePlayerSlotId(int)
```
Pass the playerid of the spectator. A spectator that once was a player keeps his player slot, so that he can go back to race mode. Calling this function frees this slot for another player to connect. Only available to Admin.
== ManualFlowControlEnable
```cpp
boolean ManualFlowControlEnable(boolean)
```
Enable control of the game flow: the game will wait for the caller to validate state transitions. Only available to Admin.
== ManualFlowControlProceed
```cpp
boolean ManualFlowControlProceed()
```
Allows the game to proceed. Only available to Admin.
== ManualFlowControlIsEnabled
```cpp
int ManualFlowControlIsEnabled()
```
Returns whether the manual control of the game flow is enabled. 0 = no, 1 = yes by the xml-rpc client making the call, 2 = yes, by some other xml-rpc client. Only available to Admin.
== ManualFlowControlGetCurTransition
```cpp
string ManualFlowControlGetCurTransition()
```
Returns the transition that is currently blocked, or '' if none. (That's exactly the value last received by the callback.) Only available to Admin.
== CheckEndMatchCondition
```cpp
string CheckEndMatchCondition()
```
Returns the current match ending condition. Return values are: 'Playing', 'ChangeMap' or 'Finished'.
== GetNetworkStats
```cpp
struct GetNetworkStats()
```
Returns a struct containing the networks stats of the server. The structure contains the following fields : _Uptime_, _NbrConnection_, _MeanConnectionTime_, _MeanNbrPlayer_, _RecvNetRate_, _SendNetRate_, _TotalReceivingSize_, _TotalSendingSize_ and an array of structures named _PlayerNetInfos_. Each structure of the array PlayerNetInfos contains the following fields : _Login_, _IPAddress_, _LastTransferTime_, _DeltaBetweenTwoLastNetState_, _PacketLossRate_. Only available to SuperAdmin.
== StartServerLan
```cpp
boolean StartServerLan()
```
Start a server on lan, using the current configuration. Only available to SuperAdmin.
== StartServerInternet
```cpp
boolean StartServerInternet(struct)
```
Start a server on internet using the 'Login' and 'Password' specified in the struct passed as parameters. Only available to SuperAdmin.
== GetStatus
```cpp
struct GetStatus()
```
Returns the current status of the server.
== QuitGame
```cpp
boolean QuitGame()
```
Quit the application. Only available to SuperAdmin.
== GameDataDirectory
```cpp
string GameDataDirectory()
```
Returns the path of the game datas directory. Only available to Admin.
== GetTracksDirectory
```cpp
string GetTracksDirectory()
```
Returns the path of the tracks directory. Only available to Admin.
== GetSkinsDirectory
```cpp
string GetSkinsDirectory()
```
Returns the path of the skins directory. Only available to Admin.
