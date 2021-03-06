{
  ORIGINAL FILE: EmoStateDLL.h
  ---------------------------------------------------------------------------------------
  |EmoState Interface                                                                   |
  |Copyright (c) 2009 Emotiv Systems, Inc.                                              |
  |                                                                                     |
  |Header file to define constants and interfaces to access the EmoState.               |
  |                                                                                     |
  |EmoStates are generated by the Emotiv detection engine (EmoEngine) and represent     |
  |the emotional status of the user at a given time.                                    |
  |                                                                                     |
  |EmoStateHandle is an opaque reference to an internal EmoState structure              |
  |                                                                                     |
  |None of the EmoState interface functions are thread-safe.                            |
  |                                                                                     |
  |This header file is designed to be includable under C and C++ environment.           |
  ---------------------------------------------------------------------------------------

  Translated by LaKraven Studios Ltd (14th October 2011)
  Copyright (C) 2011, LaKraven Studios Ltd, All Rights Reserved
  Last Updated: 14th October 2011
}
unit Emotiv.EDK.EmoState;

interface

uses
  Windows;

const
  EDK_DLL = 'edk.dll';

type
  { Pointers }
	EmoStateHandle = Pointer;
  PEmoStateHandle = EmoStateHandle;

  { Enums }
  EE_EmotivSuite_t = (EE_EXPRESSIV = 0, EE_AFFECTIV, EE_COGNITIV);
  TEmotivSuite = EE_EmotivSuite_t;

  EE_ExpressivAlgo_t = (EXP_NEUTRAL = $0001, EXP_BLINK = $0002, EXP_WINK_LEFT = $0004, EXP_WINK_RIGHT = $0008, EXP_HORIEYE = $0010, EXP_EYEBROW = $0020,
                        EXP_FURROW = $0040, EXP_SMILE = $0080, EXP_CLENCH = $0100, EXP_LAUGH = $0200, EXP_SMIRK_LEFT = $0400, EXP_SMIRK_RIGHT = $0800);
  TExpressivAlgo = EE_ExpressivAlgo_t;

  EE_AffectivAlgo_t = (AFF_EXCITEMENT = $0001, AFF_MEDITATION = $0002, AFF_FRUSTRATION = $0004, AFF_ENGAGEMENT_BOREDOM = $0008);
  TAffectivAlgo = EE_AffectivAlgo_t;

  EE_CognitivAction_t = (COG_NEUTRAL = $0001, COG_PUSH = $0002, COG_PULL = $0004, COG_LIFT = $0008, COG_DROP = $0010, COG_LEFT = $0020, COG_RIGHT = $0040,
                         COG_ROTATE_LEFT = $0080, COG_ROTATE_RIGHT = $0100, COG_ROTATE_CLOCKWISE = $0200, COG_ROTATE_COUNTER_CLOCKWISE = $0400,
                         COG_ROTATE_FORWARDS = $0800, COG_ROTATE_REVERSE = $1000, COG_DISAPPEAR = $2000);
  PCognitivAction = ^TCognitivAction;
  TCognitivAction = EE_CognitivAction_t;
  PEE_CognitivAction_t = ^EE_CognitivAction_t;

  EE_SignalStrength_t = (NO_SIGNAL = 0, BAD_SIGNAL, GOOD_SIGNAL);
  TSignalStrength = EE_SignalStrength_t;

  EE_InputChannels_t = (EE_CHAN_CMS = 0, EE_CHAN_DRL, EE_CHAN_FP1, EE_CHAN_AF3, EE_CHAN_F7, EE_CHAN_F3, EE_CHAN_FC5, EE_CHAN_T7, EE_CHAN_P7, EE_CHAN_O1,
                        EE_CHAN_O2, EE_CHAN_P8, EE_CHAN_T8, EE_CHAN_FC6, EE_CHAN_F4, EE_CHAN_F8, EE_CHAN_AF4, EE_CHAN_FP2);
  TInputChannels = EE_InputChannels_t;

  PEE_EEG_ContactQuality_t = ^EE_EEG_ContactQuality_t;
  EE_EEG_ContactQuality_t = (EEG_CQ_NO_SIGNAL, EEG_CQ_VERY_BAD, EEG_CQ_POOR, EEG_CQ_FAIR, EEG_CQ_GOOD);
  TEEGContactQuality = EE_EEG_ContactQuality_t;

function ES_Create: EmoStateHandle; cdecl; external EDK_DLL;
procedure ES_Free(state: EmoStateHandle); cdecl; external EDK_DLL;
procedure ES_Init(state: EmoStateHandle); cdecl; external EDK_DLL;
function ES_GetTimeFromStart(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_GetHeadsetOn(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_GetNumContactQualityChannels(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_GetContactQuality(state: EmoStateHandle; electroIdx: Integer): EE_EEG_ContactQuality_t; cdecl; external EDK_DLL;
function ES_GetContactQualityFromAllChannels(state: EmoStateHandle; contactQuality: PEE_EEG_ContactQuality_t; numChannels: size_t): Integer; cdecl; external EDK_DLL;
function ES_ExpressivIsBlink(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_ExpressivIsLeftWink(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_ExpressivIsRightWink(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_ExpressivIsEyesOpen(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_ExpressivIsLookingUp(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_ExpressivIsLookingDown(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_ExpressivIsLookingLeft(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_ExpressivIsLookingRight(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
procedure ES_ExpressivGetEyelidState(state: EmoStateHandle; leftEye, rightEye: PSingle); cdecl; external EDK_DLL;
procedure ES_ExpressivGetEyeLocation(state: EmoStateHandle; x, y: PSingle); cdecl; external EDK_DLL;
function ES_ExpressivGetEyebrowExtent(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_ExpressivGetSmileExtent(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_ExpressivGetClenchExtent(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_ExpressivGetUpperFaceAction(state: EmoStateHandle): EE_ExpressivAlgo_t; cdecl; external EDK_DLL;
function ES_ExpressivGetUpperFaceActionPower(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_ExpressivGetLowerFaceAction(state: EmoStateHandle): EE_ExpressivAlgo_t; cdecl; external EDK_DLL;
function ES_ExpressivGetLowerFaceActionPower(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_ExpressivIsActive(state: EmoStateHandle; etype: EE_ExpressivAlgo_t): Integer; cdecl; external EDK_DLL;
function ES_AffectivGetExcitementLongTermScore(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_AffectivGetExcitementShortTermScore(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_AffectivIsActive(state: EmoStateHandle; etype: EE_AffectivAlgo_t): Integer; cdecl; external EDK_DLL;
function ES_AffectivGetMeditationScore(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_AffectivGetFrustrationScore(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_AffectivGetEngagementBoredomScore(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_CognitivGetCurrentAction(state: EmoStateHandle): EE_CognitivAction_t; cdecl; external EDK_DLL;
function ES_CognitivGetCurrentActionPower(state: EmoStateHandle): Single; cdecl; external EDK_DLL;
function ES_CognitivIsActive(state: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_GetWirelessSignalStatus(state: EmoStateHandle): EE_SignalStrength_t; cdecl; external EDK_DLL;
procedure ES_Copy(a, b: EmoStateHandle); cdecl; external EDK_DLL;
function ES_AffectivEqual(a, b: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_ExpressivEqual(a, b: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_CognitivEqual(a, b: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_EmoEngineEqual(a, b: EmoStateHandle): Integer; cdecl; external EDK_DLL;
function ES_Equal(a, b: EmoStateHandle): Integer; cdecl; external EDK_DLL;
procedure ES_GetBatteryChargeLevel(state: EmoStateHandle; chargeLevel, maxChargeLevel: PInteger); cdecl; external EDK_DLL;

implementation

end.
