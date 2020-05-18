///gametester_init_sandbox(developerToken)
var developerToken = argument0;
if not gametester_assert(is_string(developerToken),"Missing developer token. Please initialize with your developer token") 
    then return false;
    
with gametester_get() {
    self.baseUrl = "https://server.gametester.gg/dev-api/v1/sandbox";
    self.apiRequests = ds_map_create();
    self.developerToken = developerToken;
    self.initialized = true;
}

return true;
