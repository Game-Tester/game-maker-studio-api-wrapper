///gametester_set_player_id(bodyMap)
var bodyMap = argument0;

with gametester_get() {
    if (self.playerPin != noone) then {
        ds_map_add(bodyMap, "playerPin", self.playerPin);
        return true;
    }
    
    if (self.playerToken != noone) then {
        ds_map_add(bodyMap, "playerToken", self.playerToken);
        return true;
    }
    
    return false;
}

