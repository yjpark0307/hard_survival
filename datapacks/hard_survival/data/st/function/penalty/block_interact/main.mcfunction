##상호작용 감지
execute as @a[scores={furnance_interact_detector=1..}] run scoreboard players add @s block_interact_detector 1
execute as @a[scores={crafting_table_interact_detector=1..}] run scoreboard players add @s block_interact_detector 1
execute as @a[scores={chest_interact_detector=1..}] run scoreboard players add @s block_interact_detector 1

##상호작용 감지 스코어보드 초기화
scoreboard players set @a furnance_interact_detector 0
scoreboard players set @a crafting_table_interact_detector 0
scoreboard players set @a chest_interact_detector 0

##벌칙부여
execute as @a[scores={block_interact_detector=1..}] run tag @s add block_interact_penalty
execute as @a[tag=block_interact_penalty] store result score @s block_interact_penalty_random run random value 1..100
execute as @a[tag=block_interact_penalty,scores={block_interact_penalty_random=1..20}] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute as @a[tag=block_interact_penalty,scores={block_interact_penalty_random=1..5}] at @s run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:1}
execute if entity @a[tag=block_interact_penalty,scores={block_interact_penalty_random=6..20}] run tellraw @a [{"selector":"@a[tag=block_interact_penalty]"},{"text":"가 천벌을 받았습니다."}]
execute if entity @a[tag=block_interact_penalty,scores={block_interact_penalty_random=1..5}] run tellraw @a [{"selector":"@a[tag=block_interact_penalty]"},{"text":"가 더 강한 천벌을 받았습니다."}]
scoreboard players set @a block_interact_detector 0
tag @a remove block_interact_penalty