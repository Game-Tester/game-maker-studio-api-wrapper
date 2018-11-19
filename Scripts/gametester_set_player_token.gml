///gametester_set_player_token(playerToken)
var playerToken = argument0;

if not gametester_is_initialized("gametester_set_player_token") then return false;
if not gametester_assert(is_string(playerToken),"Invalid player token, must be string") 
    then return false;

with gametester_get() {
    self.playerToken = playerToken;
    self.playerPin = noone;
    return true;
}
