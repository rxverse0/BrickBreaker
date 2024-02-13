if(keyboard_check(vk_space))
{
    // Only move the ball if the game has not started yet
    if (!game_started)
    {
        move_towards_point(random(1000),random(100),0.4);
        game_started = true; 
    }
}

if(place_meeting(x,y, Obj_wall))
{
    move_bounce_solid(true);
}
if(place_meeting(x,y,Obj_bar))
{
    direction = random_range(45, 135);
    speed = 0.4;
}

if (place_meeting(x, y, Obj_brick))
{
    // Play the sound for each brick collision
    audio_play_sound(snd_pop, 1, false); // Play the sound only once
    move_bounce_solid(true);
}

if (!game_started)
{
    // If the game has not started, make the ball follow the bar
    x =Obj_bar.x;
    y =Obj_bar.y - Obj_bar.sprite_height/2 - sprite_height/2;
}

    var brick_width = 64;
    var brick_height = 32;
	
     if(place_meeting(x,y,Obj_check))
{
    x =Obj_bar.x;
    y =Obj_bar.y - Obj_bar.sprite_height/2 - sprite_height/2;
    speed = 0;
    game_started = false;
	score=0;
	
    // Remove all existing bricks
    with (Obj_brick)
    {
        instance_destroy();
    }

    // Recreate the bricks at their initial positions
    for (var i = 0; i < ds_list_size(global.brick_positions); i++)
    {
        var position = global.brick_positions[| i];
        instance_create_layer(position[| 0], position[| 1], "Instances", Obj_brick);
    }
	
	 

} 
