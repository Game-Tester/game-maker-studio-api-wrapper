///gametester_assert(condition, message)

var condition = argument0;
var message = argument1;

if not condition == true {
    show_debug_message("GameTester Error: " + message);
}
return condition;
