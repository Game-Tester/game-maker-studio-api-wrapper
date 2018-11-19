///gametester_http_request(path,bodyMap,onComplete,onError)

var path = argument0;
var bodyMap = argument1;
var onComplete = argument2;
var onError = argument3;

with gametester_get() {
    ds_map_add(bodyMap, "developerToken", self.developerToken);
    if not gametester_assert(gametester_set_player_id(bodyMap), "Could not find player id") then return false;
     
    var newJsonData = json_encode(bodyMap);
    
    var headerMap = ds_map_create();
    ds_map_add(headerMap, "Content-Type", "application/json");
    
    var request = ds_map_create();
    ds_map_add(request,"onComplete",onComplete);
    ds_map_add(request,"onError",onError);

    var requestId = http_request(self.baseUrl + path, "POST", headerMap, newJsonData);
    ds_map_destroy(headerMap);
    
    if ds_map_exists(self.apiRequests,requestId) then ds_map_delete(self.apiRequests,requestId);
    
    ds_map_add_map(self.apiRequests,requestId,request);   
}

return true;

