private["_b"]; 
{ 
    _b = (configFile >> "CfgMagazines" >> _x >> "ItemActions" >> "Build" >> "create"); 
    if(!(isNull cursorTarget) && {getText(_b) == (typeOf cursorTarget)}) then { 
        player addMagazine _x;
    };
} forEach (
    (configfile >> "CfgMagazines") call { 
        private ["_a"]; 
        _a = []; 
        for "_i" from 0 to ((count _this) - 1) do { 
            if (isClass (_this select _i)) then { 
                _a set [count _a, configName (_this select _i)]; 
            }; 
        };
        _a 
    }
);