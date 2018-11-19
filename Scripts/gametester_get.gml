///gametester_get()
if instance_number(_GameTesterObject) == 0 then instance_create(0,0,_GameTesterObject);

return instance_find(_GameTesterObject,0);
