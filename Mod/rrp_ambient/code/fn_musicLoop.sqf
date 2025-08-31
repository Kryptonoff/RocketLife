if(player call RRPClient_util_isInStratis)then
{
	RRPClientCurrentMusicMode = "horror";
}
else
{
	RRPClientCurrentMusicMode = "ambients";
};
if !(RRPClientLastMusicmode isEqualTo RRPClientCurrentMusicMode)then
{
	RRPClientCurrentMusicMode call FT_fnc_musicChange;
};
RRPClientLastMusicmode = RRPClientCurrentMusicMode;
true