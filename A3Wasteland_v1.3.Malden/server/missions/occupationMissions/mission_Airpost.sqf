// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_Airpost.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "occupationMissionDefines.sqf";

private ["_nbUnits", "_airpost", "_objects"];

_setupVars =
{
	_missionType = "Airport Outpost";
	_locationsArray = AirpostMissionMarkers;
	_nbUnits = AI_GROUP_MEDIUM;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_airpost = (call compile preprocessFileLineNumbers "server\missions\airposts\airpostsList.sqf") call BIS_fnc_selectRandom;
	_objects = [_airpost, _missionPos, 0] call createAirpost;

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits, 5] call createCustomGroup4;

	_missionHintText = format ["<br/>Attention! A group of armed units <br/><t color='%1'>blockades a local airport</t>.<br/>Head there, eliminate them all and break this blockade!", occupationMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach _objects;
};

_successExec =
{
	// Mission completed
	{ deleteVehicle _x } forEach _objects;

	_box1 = createVehicle ["Box_NATO_Wps_F", _lastPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, "mission_USSpecial"] call randomCrateLoadOut;

	_box2 = createVehicle ["Box_East_Wps_F", _lastPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, "mission_USLaunchers"] call randomCrateLoadOut;

	_box3 = createVehicle ["Box_IND_WpsSpecial_F", _lastPos, [], 5, "None"];
	_box3 setDir random 360;
	[_box3, "mission_Main_A3snipers"] call randomCrateLoadOut;
	
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2, _box3];

	_successHintMessage = format ["<br/>Well done! The airport is free again!"];
};

_this call occupationMissionProcessor;
