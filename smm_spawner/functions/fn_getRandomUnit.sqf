private _side = _this select 0;
private _group = _this select 1;
private _sideNo = _side call smm_fnc_macrosToConfigSide;
private _unitWrappedType = ([10000,_side] call smm_fnc_getUnits) select 0;
private _type = _unitWrappedType select 0;
_type createUnit [smm_spawner_center,_group,"newUnit = this",smm_skill,"PRIVATE"];
private _unit = newUnit;
if((count _unitWrappedType) > 2)then{
	_unit spawn (_unitWrappedType select 2);
};
_unit call smm_fnc_spawnerSetSkill;

_unit