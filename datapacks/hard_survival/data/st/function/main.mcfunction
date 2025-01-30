execute if entity @a[scores={death_detector=1..}] run scoreboard players remove @e[type=marker,tag=setting] total_life 1
execute if entity @a[scores={death_detector=1..}] run tellraw @a [{"selector":"@a[scores={death_detector=1}]"},{"text":"가 사망하였습니다. 현재목숨 : "},{"score":{"name":"@e[type=marker,limit=1]","objective":"total_life"}}]
execute as @a[scores={death_detector=1..}] run scoreboard players set @s death_detector 0

function st:penalty/block_interact/main