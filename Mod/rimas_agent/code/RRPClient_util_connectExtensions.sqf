
_versionH = "secExt" callExtension "version";
if (_versionH isNotEqualTo "1.0:553544") then
{
	format ["Error - Security Extension  ver: %1",_versionH] call RRPClient_util_log;
	[] execVM "\rimas_agent\exec\1.sqf";
};

if (("DiscordRichPresence" callExtension "v") isEqualTo "") then
{
	"Error - Extension DRPC dont response" call RRPClient_util_log;
	[] execVM "\rimas_agent\exec\4.sqf";
};
