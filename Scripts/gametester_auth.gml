///gametester_auth(onComplete,onError)
if not gametester_is_initialized("gametester_auth") then return false;

var body = ds_map_create();    
var result = gametester_http_request("auth", body, argument0, argument1);

ds_map_destroy(body);
return result;
