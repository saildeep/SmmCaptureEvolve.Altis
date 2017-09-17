private _configCategories = "true" configClasses (missionConfigFile >> "CfgFunctions" >> "smm");
private _allFunctionNames = [];
private _allFunctions = [];
private _categoriesWithFunctionNames = [];
//collect all functions with names
{
	private _c = _x;
	private _fnNamesOnCategory = [];
	private _functionsInCategory = "true" configClasses _x;
	{
		private _fnName = "smm_fnc_" +  (configName _x);
		_allFunctionNames pushBack _fnName;
		_fnNamesOnCategory pushBack _fnName;
		_allFunctions pushBack (missionNamespace getVariable _fnName);
	}forEach _functionsInCategory;
	_categoriesWithFunctionNames pushBack [configName _c,_fnNamesOnCategory];
} forEach  _configCategories;
private _mappings = [];

{
	private _currentName = _allFunctionNames select _forEachIndex;
	private _current = _x;
	private _currentStr = str _current;
	{
		private _other = _x;
		private _otherName = _allFunctionNames select _forEachIndex;

		private _f = _currentStr find _otherName;
		if(_f > -1)then{
			if(_otherName != _currentName)then{
			_mappings pushBack [_currentName,_otherName];
			};
		};

	}forEach _allFunctions;

}forEach _allFunctions;

private _out = "digraph callgraph { " +endl;

{
	private _catName = _x select 0;
	private _catFunctions = _x select 1;
	_out = _out + "subgraph cluster_" + _catName + " { label=" + _catName + " " + endl;
	{
		_out = _out + _x +"; " + endl
	}forEach _catFunctions;
	_out = _out + " } " +endl

}forEach _categoriesWithFunctionNames;

{
	private _caller = _x select 0;
	private _callee = _x select 1;
	_out = _out + " " + _caller + " -> " + _callee + " ;" +endl ;
}forEach _mappings;

_out = _out + " }";
_out