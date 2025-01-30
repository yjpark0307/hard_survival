##세계세팅
gamerule commandBlockOutput false

##스코어보드 인수 초기화
scoreboard objectives add total_life dummy
scoreboard objectives add death_detector deathCount

##기타 스코어보드 초기화
function st:init

##사전설정
summon marker ~ ~ ~ {Tags:["setting"]}
setblock ~ ~ ~ minecraft:repeating_command_block[conditional=false,facing=up]{Command:"function st:main",SuccessCount:0,TrackOutput:1b,UpdateLastExecution:1b,auto:1b,conditionMet:1b,powered:0b}
scoreboard players set @e[type=marker,tag=setting] total_life 10