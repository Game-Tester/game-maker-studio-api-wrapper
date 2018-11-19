///gametester_send_datapoint(id,onComplete,onError)
if not gametester_is_initialized("game_tester_send_datapoint") then return false;

with gametester_get() {
    var body = ds_map_create();  
    ds_map_add(body,"datapointId",argument0);
    var result = gametester_http_request("", body, argument1, argument2);
    
    ds_map_destroy(body);
    return result;
}
