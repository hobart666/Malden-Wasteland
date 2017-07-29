// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

OccupationMissions =
[
	// Mission filename, weight
	["mission_Airblockade", 1],
	["mission_Industryannexation", 1],
	["mission_Conqueror", 1],
	["mission_Gasstation", 1],
	["mission_Airpost", 1],
	["mission_CommunicationInterruption", 1],
	["mission_Harborinvasion", 1]
	
	
];

SpecialMissions =
[
	// Mission filename, weight
	["mission_altisPatrol", 1],
	["mission_Roulette", 1],
	["mission_falsecops", 1],
	["mission_MoneyShipment", 1],
	["mission_Falcon", 1],
	["mission_StomperSOS", 1],
	["mission_HostageRescue", 1],
	["mission_TombRaider", 1],
	["mission_UAV", 1],
	["mission_Explosives", 1],
	["mission_Gravedigger", 1]
	//["mission_Train", 1]
	
	
];

MainMissions =
[
	// Mission filename, weight
	//["mission_ArmedDiversquad", 0.3],
	["mission_Coastal_Convoy", 0.6],
	["mission_Convoy", 1],
	//["mission_Hackers", 0.5],
	["mission_HostileHeliFormation", 0.3],
	["mission_HostileJetFormation", 1],
	["mission_APC", 0.5],
	["mission_MBT", 0.4],
	["mission_LightArmVeh", 0.5],
	["mission_ArmedHeli", 0.5],
	["mission_AbandonedJet", 0.4],
	["mission_Artillary", 0.7]
];

SideMissions =
[
	["mission_HostileHelicopter", 1],
	["mission_Banditpost", 1],
	["mission_ISIS", 0.5],
	["mission_MiniConvoy", 0.5],
	["mission_TownInvasion", 0.5],
	["mission_WepCache", 0.5],
	["mission_Outpost", 0.5],
	["mission_Truck", 0.5],
	["mission_Roadblock", 0.5],
	["mission_HostileJet", 0.5],
	["mission_Sniper", 0.5],
	["mission_Smugglers", 0.5],
	["mission_HostageRescue", 0.5],
	["mission_drugsRunners", 0.5]
];

/* MoneyMissions =
[
	["mission_MoneyShipment", 1],
	["mission_SunkenTreasure", 1],
//	["mission_militaryPatrol", 1]
	["mission_altisPatrol", 1]
]; */

MissionSpawnMarkers = (allMapMarkers select {["Mission_", _x] call fn_startsWith}) apply {[_x, false]};
ForestMissionMarkers = (allMapMarkers select {["ForestMission_", _x] call fn_startsWith}) apply {[_x, false]};
RoadblockMissionMarkers = (allMapMarkers select {["RoadBlock_", _x] call fn_startsWith}) apply {[_x, false]};
GasstationMissionMarkers = (allMapMarkers select {["Gasstation_", _x] call fn_startsWith}) apply {[_x, false]};
AirpostMissionMarkers = (allMapMarkers select {["Airpost_", _x] call fn_startsWith}) apply {[_x, false]};
IndustryMissionMarkers = (allMapMarkers select {["Industry_", _x] call fn_startsWith}) apply {[_x, false]};
ConquerorMissionMarkers = (allMapMarkers select {["Conqueror_", _x] call fn_startsWith}) apply {[_x, false]};
HarborMissionMarkers = (allMapMarkers select {["Harbor_", _x] call fn_startsWith}) apply {[_x, false]};
CommMissionMarkers = (allMapMarkers select {["Comm_", _x] call fn_startsWith}) apply {[_x, false]};
SniperMissionMarkers = (allMapMarkers select {["Sniper_", _x] call fn_startsWith}) apply {[_x, false]};
SunkenMissionMarkers = (allMapMarkers select {["SunkenMission_", _x] call fn_startsWith}) apply {[_x, false]};

if !(ForestMissionMarkers isEqualTo []) then
{
	SideMissions append
	[
		["mission_Sniper", 1],
		["mission_WepCache", 3]
	];
};

LandConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf") apply {[_x, false]};
CoastalConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf") apply {[_x, false]};

MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation", "mission_HostileJetFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter", "mission_HostileJet"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
//MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;

{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SpecialMissions;
{ _x set [2, false] } forEach OccupationMissions;
{ _x set [2, false] } forEach SideMissions;
//{ _x set [2, false] } forEach MoneyMissions;
