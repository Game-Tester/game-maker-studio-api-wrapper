///gametester_set_player_pin(playerPin)
var playerPin = argument0;

if not gametester_is_initialized("gametester_set_player_pin") then return false;
if not gametester_assert(is_string(playerPin),"Invalid player pin, must be string") 
    then return false;
if not gametester_assert(string_length(playerPin) >= 6 && string_length(playerPin) <= 8,"Invalid player pin, must be between 6 and 8 characters") 
    then return false;

with gametester_get() {
    self.playerPin = playerPin;
    self.playerToken = noone;
    return true;
}
