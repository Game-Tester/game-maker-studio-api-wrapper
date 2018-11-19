# game-maker-studio-api-wrapper

Game Maker Studio wrapper for the Game Tester API.

## Setup and Initialization
Please read the Game Tester API documentation first as this document will only cover the Game Maker Studio implementation. Import the GameTesterGMSPlugin.gmez extension file and import its resource files into your project. Or directly add the GameTesterObject.object.gmx and script files to your project.

Call ```gametester_init(developerToken)``` to initialize the API at the very start of your game. The Creation Code for the first room for example.

```gml
if (not gametester_init("developerToken")) { 
  show_message("GameTester not initialized"); 
}
```

Make sure to provide your developerToken for the test you are running.

If you are testing the API in sandbox mode call ```gametester_init_sandbox(developerToken)``` instead.

You do not have to add the GameTesterObject to any of your rooms. The init function will do this for you and the object will persist between rooms.

### Basic Usage

Once the API is initialized you can call the following functions. They all return a boolean indicating a success or error. Some require a callback function to be called on success or error. Please create these scripts and pass them for the functions that require them:

```gametester_auth(onComplete,onError)```

```gametester_set_player_pin(playerPin)```

```gametester_set_player_token(playerToken)```

```gametester_send_datapoint(id,onComplete,onError)```

```gametester_unlock_test(onComplete,onError)```

All errors will also be logged in the debug console.

### Callback Scripts

For functions that require (onComplete,onError) you must pass in scripts that will be called when the asynchronous functions return. You always need to provide a script for success and error callbacks.

Example error callback script. (Refer to the Game Tester API documentation for a full explanation of all error codes):
```gml
//http status code
var httpCode = argument0;
//map with the following keys:
//code
//message
var data = argument1;
//body of the http response as string
var responseString = argument2;

var message = ds_map_find_value(data, "message");
show_message("Game Tester error: " + message);
```

### Player Authentication
Call ```gametester_set_player_pin(playerPin)``` or ```gametester_set_player_token(playerToken)``` to set the player identification depending on which method you use (ask for pin or GameTester Connect).

After the identification is set you can optionally call ```gametester_auth(onComplete,onError)``` to test that the developerToken and playerIdentification combination is valid. It is recommended to call this function to prevent the player from continuing with the test if the identification is not correct.

Success callback script example:
```gml
//http status code
var httpCode = argument0;
//map with the following keys:
//code
//message
//playerName
var data = argument1;

var playerName = ds_map_find_value(data, "playerName");
```

### Send Datapoint
Call ```gametester_send_datapoint(id,onComplete,onError)``` to send your datapoint. Pass in the datapoint id and the callback scripts.

OnComplete callback script example:
```gml
//http status code
var httpCode = argument0;
//map with the following keys:
//code
//message
var data = argument1;

var code = ds_map_find_value(data, "code");
var message = ds_map_find_value(data, "message");
```

### Unlock Test
Call ```gametester_unlock_test(onComplete,onError)``` to unlock the test.

OnComplete callback script example:
```gml
//http status code
var httpCode = argument0;
//map with the following keys:
//code
//message
var data = argument1;

var code = ds_map_find_value(data, "code");
var message = ds_map_find_value(data, "message");
```
