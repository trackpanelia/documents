#import "default-template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "ListCallbacks in Trackmania Forever",
  authors: (
    "Quick",
  ),
)

= Available callbacks
- Trackmania.*PlayerConnect*(string Login, bool IsSpectator);
- TrackMania.*PlayerDisconnect*(string Login);
- TrackMania.*PlayerChat*(int PlayerUid, string Login, string Text, bool IsRegistredCmd);
- TrackMania.*PlayerManialinkPageAnswer*(int PlayerUid, string Login, int Answer);
_Difference with previous TM: this is not called if the player doesn't answer, and thus '0' is also a valid answer._

- TrackMania.*Echo*(string Internal, string Public);
- TrackMania.*ServerStart*();
- TrackMania.*ServerStop*();
```cpp
struct SChallengeInfo {
  string Uid;
  string Name;
  string FileName;
  string Author;
  string Environnement;
  string Mood;
  int BronzeTime;
  int SilverTime;
  int GoldTime;
  int AuthorTime;
  int CopperPrice;
  bool LapRace;
  int NbLaps;
  int NbCheckpoints;
}
```
- TrackMania.*EndRace*(SPlayerRanking Rankings[], SChallengeInfo Challenge);
```cpp
struct SPlayerRanking {
  string Login;
  string NickName;
  int PlayerId

  int Rank;
  int BestTime;
  int[] BestCheckpoints;
  int Score;
  int NbrLapsFinished;
  double LadderScore;
}
```
- TrackMania.*BeginChallenge*(SChallengeInfo Challenge, bool WarmUp, bool MatchContinuation);
- TrackMania.*EndChallenge*(SPlayerRanking Rankings[], SChallengeInfo Challenge, bool WasWarmUp, bool MatchContinuesOnNextChallenge, bool RestartChallenge);
- TrackMania.*BeginRound*();
- TrackMania.*EndRound*();
- TrackMania.*StatusChanged*(int StatusCode, string StatusName);
- TrackMania.*PlayerCheckpoint*(int PlayerUid, string Login, int TimeOrScore, int CurLap, int CheckpointIndex);
- TrackMania.*PlayerFinish*(int PlayerUid, string Login, int TimeOrScore);
- TrackMania.*PlayerIncoherence*(int PlayerUid, string Login);
- TrackMania.*BillUpdated*(int BillId, int State, string StateName, int TransactionId);
- TrackMania.*TunnelDataReceived*(int PlayerUid, string Login, base64 Data);
- TrackMania.*ChallengeListModified*(int CurChallengeIndex, int NextChallengeIndex, bool IsListModified);
- TrackMania.*PlayerInfoChanged*(SPlayerInfo PlayerInfo);
```cpp
struct SPlayerInfo {
  string Login;
  string NickName;
  int PlayerId;
  int TeamId;
  int SpectatorStatus;
  int LadderRanking;
  int Flags;
}
```
- TrackMania.*ManualFlowControlTransition*(string Transition);
- TrackMania.*VoteUpdated*(string StateName, string Login, string CmdName, string CmdParam);
_StateName values: NewVote, VoteCancelled, VotePassed or VoteFailed_

