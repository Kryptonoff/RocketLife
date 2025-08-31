/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

if (RRPClientGroupInfo isEqualTo []) then {""}else{(((RRPClientGroupInfo get "ranks") select (RRPClientGroupLevel - 1)) select 1)}