///gametester_unlock_test(onComplete,onError)
if not gametester_is_initialized("game_tester_unlock_test") then return false;

var body = ds_map_create();  
ds_map_add(body,"function","unlockPlayerTest");
var result = gametester_http_request("", body, argument0, argument1);

ds_map_destroy(body);
return result;
