gamerule commandBlockOutput false

scoreboard objectives add total_life dummy
scoreboard objectives add death_detector deathCount

function st:penalty/block_interact/init

summon marker ~ ~ ~ {Tags:["setting"]}
setblock ~ ~ ~ minecraft:repeating_command_block[conditional=false,facing=up]{Command:"function st:main",SuccessCount:0,TrackOutput:1b,UpdateLastExecution:1b,auto:1b,conditionMet:1b,powered:0b}
scoreboard players set @e[type=marker,tag=setting] total_life 10

function st:reset