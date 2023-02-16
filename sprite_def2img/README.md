# sprite_def2img

Converts a sprite definition, alongside a palette and chr file, and generates a 
png file with the sprites suitable for use with Tiled.

If it encounters duplicates, it will try to place a white character on top of the sprite, to help
tell the difference between them.

## Command

Run the command as follows:

```
 sprite_def2img  [path/to/sprite_definitions.c] [path/to/main_sprite.chr] [path/to/main_sprite.pal] [path/to/output.png]

 tmx2c 4 overworld levels/overworld.tmx test
 ```