private ["_res"];
_res = "";
{
_res = str(floor(_x)) + ';;;' + _res;
}forEach _this;
_res