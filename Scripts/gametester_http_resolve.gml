///gametester_http_resolve(async_load)
var asyncLoad = argument0;

if not ds_map_exists(asyncLoad,"http_status") then exit;

var requestId = ds_map_find_value(asyncLoad,"id");
var httpStatus = ds_map_find_value(asyncLoad,"http_status");

with gametester_get() {
    if ds_map_exists(self.apiRequests,requestId) {
        if ds_map_find_value(asyncLoad, "status") == 0 {
            var requestInfo = ds_map_find_value(self.apiRequests,requestId);
            var onComplete  = ds_map_find_value(requestInfo,"onComplete");
            var onError     = ds_map_find_value(requestInfo,"onError");
            
            ds_map_delete(self.apiRequests,requestId);
            
            var responseString = ds_map_find_value(asyncLoad, "result");
            
            var decodeResult = json_decode(responseString);
            
            if (decodeResult != -1) && (httpStatus == 200) && (ds_map_find_value(decodeResult, "code") == -1)
                then script_execute(onComplete, httpStatus, decodeResult);
                else script_execute(onError, httpStatus, decodeResult, responseString);
                
            ds_map_destroy(decodeResult);
        }
    }
}
