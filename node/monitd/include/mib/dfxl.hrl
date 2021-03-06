%dfxl TS-AC-10-S-500
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ac discover -- ac配置(发现)%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-define(Ac,[
     {acName,      "1.3.6.1.4.1.26822.3.1.1.1.1.1.0" },
     {sysModel,    "1.3.6.1.4.1.26822.3.1.1.1.1.18.0"},
     {softVersion, "1.3.6.1.4.1.26822.3.1.1.1.1.19.0"}
]).

%-define(AcIfDescr,       {ifDescr, "1.3.6.1.4.1.26822.3.1.1.4.2.1.3"}).
%-define(AcIfType,        {ifType, "1.3.6.1.4.1.26822.3.1.1.4.2.1.4"}).
%-define(AcIfMTU,         {ifMtu, "1.3.6.1.4.1.26822.3.1.1.4.2.1.5"}).
%-define(AcIfSpeed,       {ifSpeed, "1.3.6.1.4.1.26822.3.1.1.4.2.1.6"}).
%-define(AcIfMacAddress,  {ifPhysAddress, "1.3.6.1.4.1.26822.3.1.1.4.2.1.7"}).
%-define(AcIfAdminStatus, {ifAdminStatus, "1.3.6.1.4.1.26822.3.1.1.4.2.1.8"}).
%-define(AcIfOperStatus,  {ifOperStatus, "1.3.6.1.4.1.26822.3.1.1.4.2.1.9"}).

-define(AcRadio,[
     %{radiusAuthServerIPAdd, "1.3.6.1.4.1.26822.3.3.5.1.2"}.
     %{radiusAuthServerPort,  "1.3.6.1.4.1.26822.3.3.5.1.3"}
]).

-define(AcVlan,[
     %{ipPoolName,      ""},
     %{ipPoolStartAddr, "1.3.6.1.4.1.26822.3.1.1.1.10.1.3"},
     %{ipPoolStopAddr,  "1.3.6.1.4.1.26822.3.1.1.1.10.1.4"},
]).

%%----------------------------------------------------------------------
%% ac monet --ac 性能采集
%%----------------------------------------------------------------------
-define(Acinfo, [
     {cpuRTUsage,               "1.3.6.1.4.1.26822.3.1.1.1.1.87.0" },
     {memRTUsage,               "1.3.6.1.4.1.26822.3.1.1.1.1.89.0" },
     {dHCPReqTimes,             "1.3.6.1.4.1.26822.3.1.1.1.1.76.0" },
     {dHCPReqSucTimes,          "1.3.6.1.4.1.26822.3.1.1.1.1.77.0" },
     {bandWidth,                "1.3.6.1.4.1.26822.3.1.1.1.1.47.0" },
     {onlineNum,                "1.3.6.1.4.1.26822.3.1.1.1.1.102.0"},
     {authNum,                  "1.3.6.1.4.1.26822.3.1.1.1.1.74.0" },
     {normalNum,                "1.3.6.1.4.1.26822.3.1.1.1.1.99.0" },
     {deauthNum,                "1.3.6.1.4.1.26822.3.1.1.1.1.100.0"},
     {authReqNum,               "1.3.6.1.4.1.26822.3.1.1.1.1.70.0" },
     {authSucNum,               "1.3.6.1.4.1.26822.3.1.1.1.1.71.0" },
     {radiusAvgDelay,           "1.3.6.1.4.1.26822.3.1.1.1.1.103.0"},
     {dHCPIpPoolUsage,          "1.3.6.1.4.1.26822.3.1.1.1.1.75.0"}
    
    %{maxNum,          "" },
    %{accReqNum,       ""},
    %{accSucNum,       ""},
    %{radiusReqPkts,   ""},
    %{radiusRepPkts,   ""},
    %{leaveReqPkts,    ""},
    %{leaveRepPkts,    ""},
    %{portalChallengeReqCount,  ""}
    %{portalChallengeRespCount, ""}
    %{portalAuthReqCount,       ""}
    %{portalAuthRespCount,      ""}
    %{leaveReqCount,            ""}
    %{leaveRepCount,            ""}
    %{addressCount,             ""}
]).

-define(Acintf, [
    {ifInUcastPkts,   "1.3.6.1.2.1.2.2.1.11"},
    {ifInNUcastPkts,  "1.3.6.1.2.1.2.2.1.12"},
    {ifInOctets,      "1.3.6.1.2.1.2.2.1.10"},
    {ifInDiscards,    "1.3.6.1.2.1.2.2.1.13"},
    {ifInErrors,      "1.3.6.1.2.1.2.2.1.14"},
    {ifOutUcastPkts,  "1.3.6.1.2.1.2.2.1.17"},
    {ifOutNUcastPkts, "1.3.6.1.2.1.2.2.1.18"},
    {ifOutOctets,     "1.3.6.1.2.1.2.2.1.16"},
    {ifOutDiscards,   "1.3.6.1.2.1.2.2.1.19"},
    {ifOutErrors,     "1.3.6.1.2.1.2.2.1.20"}
   
    %{ifUpDwnTimes,    "1.3.6.1.4.1.26822.3.1.1.4.2.1.22"}
]).

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ap monet --ap 性能采集% 
%%%%%%%%%%%%%%%%%%%%%%%%%%
%begin fix BUG #398
-define(ApWireless, [
     {ifInOctets,    "1.3.6.1.4.1.26822.3.1.1.3.6.1.17"},
     {ifInPkts,      "1.3.6.1.4.1.26822.3.1.1.3.6.1.9" },
     {ifInDiscards,  "1.3.6.1.4.1.26822.3.1.1.3.6.1.12"},
     {ifInErrors,    "1.3.6.1.4.1.26822.3.1.1.3.6.1.18"},

     {ifOutOctets,   "1.3.6.1.4.1.26822.3.1.1.3.6.1.20"},
     {ifOutPkts,     "1.3.6.1.4.1.26822.3.1.1.3.6.1.13"},
     {ifOutDiscards, "1.3.6.1.4.1.26822.3.1.1.3.6.1.21"},
     {ifOutErrors,   "1.3.6.1.4.1.26822.3.1.1.3.6.1.22"}
]).
-define(ApWire, [
     {ifInOctets,     "1.3.6.1.4.1.26822.3.1.1.3.6.1.17"},
     {ifInUcastPkts,  "1.3.6.1.4.1.26822.3.1.1.3.6.1.9" },
     {ifInNUcastPkts, "1.3.6.1.4.1.26822.3.1.1.3.6.1.16"},
     {ifInDiscards,   "1.3.6.1.4.1.26822.3.1.1.3.6.1.12"},
     {ifInErrors,     "1.3.6.1.4.1.26822.3.1.1.3.6.1.18"},

     {ifOutOctets,    "1.3.6.1.4.1.26822.3.1.1.3.6.1.20"},
     {ifOutUcastPkts, "1.3.6.1.4.1.26822.3.1.1.3.6.1.13"},
     {ifOutNUcastPkts,"1.3.6.1.4.1.26822.3.1.1.3.6.1.19"},
     {ifOutDiscards,  "1.3.6.1.4.1.26822.3.1.1.3.6.1.21"},
     {ifOutErrors,    "1.3.6.1.4.1.26822.3.1.1.3.6.1.22"}
]).
%end fix BUG #398

-define(MonAssoc,[
     {assocNum,          "1.3.6.1.4.1.26822.3.1.1.3.1.1.51"},
     {assocFailNum,      "1.3.6.1.4.1.26822.3.1.1.3.23.1.30"},
     {reAssocNum,        "1.3.6.1.4.1.26822.3.1.1.3.23.1.11"},
     {assocRefusedNum,   "1.3.6.1.4.1.26822.3.1.1.3.23.1.9" },
     {apStationAssocSum,  "1.3.6.1.4.1.26822.3.1.1.3.1.1.28"},
     {apStationOnlineSum,"1.3.6.1.4.1.26822.3.1.1.3.1.1.123" },
     {cpuRTUsage,        "1.3.6.1.4.1.26822.3.1.1.3.1.1.109"},
     {memRTUsage,        "1.3.6.1.4.1.26822.3.1.1.3.1.1.110"}
     %assocRefusedNum,1.3.6.1.4.1.26822.3.1.1.3.23.1.11-1.3.6.1.4.1.26822.3.1.1.3.23.1.12
]).

-define(ApSta,[
     {apId,         "1.3.6.1.4.1.26822.3.1.1.3.3.1.35"},
     {staMac,       "1.3.6.1.4.1.26822.3.1.1.3.3.1.6" },
     {staIp,        "1.3.6.1.4.1.26822.3.1.1.3.3.1.18"},
     {staRssi,      "1.3.6.1.4.1.26822.3.1.1.3.3.1.16"},
     {staNoiseRate, "1.3.6.1.4.1.26822.3.1.1.3.3.1.17"},
     {staChannel,   "1.3.6.1.4.1.26822.3.1.1.3.3.1.27"},  
     {staVlan,      "1.3.6.1.4.1.26822.3.1.1.3.3.1.24"},
     {staSsid,      "1.3.6.1.4.1.26822.3.1.1.3.3.1.19"},
     %begin fix BUG #398
     {staTxframe,   "1.3.6.1.4.1.26822.3.1.1.3.3.1.4" },
     {staTxbytes,   "1.3.6.1.4.1.26822.3.1.1.3.3.1.28"},
     {staRxframe,   "1.3.6.1.4.1.26822.3.1.1.3.3.1.3" },
     {staRxbytes,   "1.3.6.1.4.1.26822.3.1.1.3.3.1.29"}
     %edn fix BUG #398
]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ap discover -- ap配置(发现)%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-define(Ap,[
     {apMac,        "1.3.6.1.4.1.26822.3.1.1.3.1.1.8" }, 
     {apIp,         "1.3.6.1.4.1.26822.3.1.1.3.1.1.3" },
     {apMask,       "1.3.6.1.4.1.26822.3.1.1.3.1.1.4" },
     {apName,       "1.3.6.1.4.1.26822.3.1.1.3.1.1.11"},
     {apSerialNo,   "1.3.6.1.4.1.26822.3.1.1.3.1.1.12"},
     {apType,       "1.3.6.1.4.1.26822.3.1.1.3.1.1.14"},
     {apSoftVersion,"1.3.6.1.4.1.26822.3.1.1.3.1.1.16"}
]).
-define(ApWirelessIf,[
     {ifDescr,       "1.3.6.1.4.1.26822.3.1.1.3.6.1.2" },
     {ifType,        "1.3.6.1.4.1.26822.3.1.1.3.6.1.3" },
     {ifMtu,         "1.3.6.1.4.1.26822.3.1.1.3.6.1.4" },
     {ifSpeed,       "1.3.6.1.4.1.26822.3.1.1.3.6.1.5" },
     {ifPhysAddress, "1.3.6.1.4.1.26822.3.1.1.3.6.1.6" },
     {ifAdminStatus, "1.3.6.1.4.1.26822.3.1.1.3.6.1.23"},
     {ifOperStatus,  "1.3.6.1.4.1.26822.3.1.1.3.6.1.8" }
]).
-define(ApRadio,[
     {radioChannel, "1.3.6.1.4.1.26822.3.1.1.3.2.1.27" },
     {radioModel,   "1.3.6.1.4.1.26822.3.1.1.3.2.1.3"  },
     {radioPower,   "1.3.6.1.4.1.26822.3.1.1.3.2.1.24" },
     {radioPeriod,  "1.3.6.1.4.1.26822.3.1.1.3.2.1.30"},
     {radioDtim,    "1.3.6.1.4.1.26822.3.1.1.3.2.1.31" },
     {radioRts,     "1.3.6.1.4.1.26822.3.1.1.3.2.1.7"  },
     {radioSlice,   "1.3.6.1.4.1.26822.3.1.1.3.2.1.6"  }
]).

-define(WlanSecurity, {wlanSecurity, "1.3.6.1.4.1.26822.3.2.1.3.1.5"}).

-define(ApState, [
     {apState, "1.3.6.1.4.1.26822.3.1.1.3.1.1.9"}
]).

%%----------------------------------------------------------------------
%% ApSsid
%%----------------------------------------------------------------------
-define(SsidAssoc,{ssidAssoc,"1.3.6.1.4.1.26822.3.2.1.2.1.2"}).
-define(DiscoApSsid,[
    {ssidName,             "1.3.6.1.4.1.26822.3.2.1.3.1.6" },
    {ssidEnabled,          "1.3.6.1.4.1.26822.3.2.1.3.1.17"},
    {ssidHidden,           "1.3.6.1.4.1.26822.3.2.1.3.1.7" },
    {staIsolate,           "1.3.6.1.4.1.26822.3.2.1.3.1.18"},
    {dot11Auth,            "1.3.6.1.4.1.26822.3.2.1.3.1.4" },
    {security,             "1.3.6.1.4.1.26822.3.2.1.3.1.5" },
    {authenMode,           "1.3.6.1.4.1.26822.3.2.1.3.1.19"},
    {securityCiphers,      "1.3.6.1.4.1.26822.3.2.1.3.1.20"},
    {vlanId,               "1.3.6.1.4.1.26822.3.2.1.3.1.8" },
    {maxSimultUsers,       "1.3.6.1.4.1.26822.3.2.1.3.1.11"}
]).



