pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include consts.lua
#include smap.lua
#include bullet.lua
#include rotor.lua
#include entity.lua
#include entities.lua
#include shooter.lua
#include enemy_aircraft.lua
#include the_lady.lua
#include main.lua

__gfx__
00000000000055550000000000000000000000000000000000000000111111111111111111111111111ccccc1111111111111ccc111111110000000000000000
000000000005cccc500000000000000000000000000000000000000011111111111111111113331111cccccc111133131ccccccc111131110000000000000000
00000000000555555000000000000000000000000000000000000000111111111111111111333311cccccccc111113311ccccccc131333110000000000000000
00000000500c5555c005000000000000000000000000000000000000111111111111111113344331cccccccc31311131cccccccc333343110000000000000000
00000000555c5555c555000000000000000000000000000000000000111666111111111111344311cccccccc33113111cccccccc343141110000000000000000
00000000555c5555c555000000000000000000000000000000000000116666611111111111144111cccccc1113111313cccccccc141143330000000000000000
00000000000c5555c000000000000000000000000000000000000000116666661111111111144111cc11cc1111111131cccccccc141113430000000000000000
00000000000555555000000000000000000000000000000000000000111111111111111111111111cc111111111111311ccccccc111111410000000000000000
00000000000555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000055550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaccaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0acca000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000700800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0b08080808080808080b08080808080808080808080808080b0b08080808080808080b08080808080808080b080808080808080808080b0808080808080807080808080808080808080807080808090808080b0b0b0808080808080808080808080b080808080808080808080808080808080808080808080808080808080808
08080708080b0b080808080808080b0b080b0808080d08080808080807080d080b080808070808080808080808080808080b0a0c080808080d090b080808080b0809080b0b080b0b0808080808090d0808080808080b08080809080b08080808080b0808080b08080b09080b080d0b0808080808080807080808080808080808
08080808080b080808080d080a0c08070808080b08080808080b080808080808070808080808080b0808080809080c0a0808080d08080808080808080808080808080b0b08090808080b0808080808080d0d08080808080808080808080b0b080808080d0d0808080809080808080808080b0b08080808080d08080b0b080808
080808080b0b0808080808080b0808080908080808080d0d0808080b0b08080b0808080808080b0b0808080808080b080808080808080808080b0808080808080808080808080d0808080808080808070808080808080b08080808080b0b08080c0808080808080c080b080b080d080808080808080808080808080808080908
09080908080808080b0b0808080d0d0d0808080808080808080808080808080808080d080908080808080d0d0808080808080b0b08080808080808080d0d0d08080807080808080d080a0c0d0808080808080b0908080b0b080d0d080808080808080b0808080b0808080b0b0d0b08080808080a080808080808080808080808
080d0d08080808080b08080d08080b08080b0708080c0c080808080909080808080808090d08080808080b08080808080808080808080809080808080b090b0808080808080b080808080808080b0b08080708080808080b0808080808080d0d0808080b0b0808080d080b0b0b080b0808080808080b0b080808080808080808
080808080808070b0808080808080b0b080b0b08080a0808080808080d0808080b08080808080808070b0b08080d08080807080808080b0b0b08080808080808080908080b0b0808080d0808080b08080808080b080808080808080809080808080d0b0b080808080808080b080c08080807080808080808080808080b0b0808
080a080b080808080808090d08080808080b0808080808080d08080808080b080808080a080b080808080808090d0808080d0d0808080b0808080807080908080808080808080808080b0b080808090809080808080b080808080808080808080d080808080b08080b080808080a0708080d0808080808080908080808080808
0b08080808080d0d080808080b08080808080808080808080808080808080808080808080808080808080808080808080808090808080809080808080808080808080808080c080a0808080808080808080d0d09080808080c0c0a08080d0d080808080d0d08080808080808080b080808080808080808080808080908080808
0808080b08080808080808080808080808080b0b0b080808080808080808080808080b0b08080808080d0807080b0d080808080d0d0808080808080d080b0b08080d0808080c0a080d08080808080b0808080808080808080a0c0a0808070d08080808080808080808080808080b0808080d0d08080808080d080808080b0808
08080b0b08080808080b0b0808080b0808080b0d08080808080b0b0b0b0b080808080b0808080b080808080808080808080b080808080b0b080b080808080b0808080b0d08080808080808080d080b0b0808080808080b0b0b0d080808080d080807080808080b0b0b0808080808080808080808090b080808080d0808080d08
08080b0808080d0d0d08080808080808080808080d080808080808080808080808080808080808080808080b0b0b0808080b080808080808080808090808080808080808080808080b0b080808080808080c0c0a080b0b0b0b0d0d0808080908080808080808080d080808080b0b080808080b090b0b0b080c0a0d0808080808
0808080808080d08080808080809080808080a080808080b0808080a0809080808080807080d09080b080808080808080808080809080808080808080d080b0808090808080d0d0808080c0c0809080808080c0a080808080b0b08080b080808080b0b080808080808080808090808080d08080d0d0d080a0c080d0d0b0b0808
08080d090808080808080808080d0808080c08080808080808080808080d0d08080d08080808080808080808080d0d0808080b0808080b080d080b080808080808080808090d0d080808080a080808080808080808080808080808080808080b08080808080d0d080b080808080808080808080808080808080b0b0b0b080808
08080808080b080808080b0b0808080808080808080b0b0b0808080b0808080808080b08080808080808070b080808080d0808080b0808080808080808080807080b0b080808080808080b0808080b0808080d0d0d0d0d08080808080708080b08080808080808080808080808080b08080808080b0b08080808080808080808
08080b0b0b0b08090808080808080b0808090b080808080808080808080808080807080808080b0b0808080808080b08080b08080808070808080b0808080d0d08080b080808080b08080808080808080808080808080808080b08080808080808080b09080808080808080808080808080d0d080b090b080808080808090d08
0808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080d0808080b0808080808080d0808080808080808080808080808080808080b0b08070808080808080808080808080b0b080b08080808080b080708080d08080808080808080808080808080808
0b08080808080808080b08080d0d0808080d0808080d0d080808080b0808080808080b08080808080808080b080808080808080b0808080b0808080808080808080b0808080808080d08080708080b080808080808080b0808080b08080b0d080808080808080808080808080808080808080808080808080808080808080b0b
08080708080b0d080808080808080b0b0808080b08080808080808080b0b08080b0808080708080b0b080808080808080b0b080808070808080708080b0b08080808080808080b0b0808080808080b08080808080808080b08080808080808080808080b0b08080808080808080d0808080b0b080808080d0b080808080b0b08
08080808080b080808080d080a0c08070808080b080808080808080808080808070808080808080b0808080809080a0a0807080808080808080808080b08080808080808080808080808080808080808080b080d08080808080808080d0808080808080b0808080d080808080808080808080b080708080808080c0c08080808
080808080b0b0808080808080b0808080808080b0808080b08080908080708080808080808080b0b0808080808080b0808080808080808080808080b0b0808080d080808090808080808080b08080808080808080d0808080b0808080b0b0b080808080808080807080d08080b080808080d0d0808080a0808080a0c08080807
09080d08080808080b0b08080808080808090d08080808080808080808080808080809080908080808080b0b0808080808080809080d0809080d08080808080b080808080808080d080808080808090908080808080808080b08090808080808080808080808080808080808080808080808080808080808080808080b0b0808
08090d08080808080b0808080d080b0808080808080808080808080b08080d08080808090908080808080b08080808080b0808080d0d08080d0d08080808080b08080b08080808080808080808080d0d08080b08080808080808080808080d08090908080808080808080d08080b080d08080808080808080d0d080808080808
080b0808080808080808080808080908080b0808080b0b0808080808080d0808080808080d0d080808080808080808080b0b0808080808080808080808070b0b080808080808080b080807080808080807080808080d08080808080b08080808080d080808070b0b08080808080b0b0808080d0808080808080808080c0a0c08
0b0808080b0b08080808080b0808080808080808080808080808080808080d0808080808080808080b0708080b080908080808080a080b080a080d0808080808080808080808080808080808080808080808080d0d08080808080808080808080a080b0808080808080908080808080808080908080d0808080b0808080c0a08
0808080b0d0808080d0d080808080d0d08080808080808080808080b08080808080b0b0808080808080808080b08080808080a0b08080808080808080808080808080808080b0b0b0b0b0b0b0b0b080808080d09090d080808080b0b08080d0808080808080d08080808080d0808080a08080808080808080808080808080808
08080b0b080808080808080808080808080808080c08080b0808080808080b0808080b080b0b0b0808080808080808080808080808080b080808080b08080d08080808080b0b0d09080b0a0a0c0b0b08080b08080808080808080808080808080808080808080d080808080d0808080807080808080808090808080808080808
080808080b08080b0808080b080b0808080d0d08080808080808080808080808080b0b0b0b08080808080d0d0808080808080808080808080808080b0808080b08080d0b0b0d0d0808090c0c0c0b08080808080808080b0b0b0908080b08080808080b080808080b080808080808080808080b0b0808080808080b0808080808
0808080808080808080808080808080808080808080808080808080808080808080b0b080808080808080808080b0b080808080b0808080d0808080808080808080d0808080d0808080d080d0b0b08080808080808080808080b0808080808080808080808080808080808080908080808080908080808080808080b08080b08
080808090d0808080808080808080808080808080b0808080d08080b080808080808080808090d08080b0808080b08080808080808080808080808070808080808080808080808080808080b0b080808080b08080d0d080808080d0808080b080b08080708080d0808080b0808080808080808080808080808080808080b0d0d
080b080808080808080b080808080b0808080808080808080808080808080c08080808080b080808080808070808080808080808080808080808080808080908080708080b080808080708080808080b080808080808080808080808080b080808080808080d090d080b080808080808080b080808080b08080708080d0d0d0d
08080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080b0808090808080908080808080808080808080808080808080808080808080b080808080b080b08080808080b080809080808080d08080808080808080b08080808080808080808080808080808
__sfx__
000000003d050370503505034050320502f0502d0502a050280502505023050210501e0501b0501605013050120500f0500c05009050030500105000050000000000000000000000000000000000000000000000
07030000076500d650016001765001600246500160033650016503b650076003d6503d6503e650076003d6503d650096003d6503b6500e60032650086002b65027650006001c6500260014650136500e65005650
00030000386603064025640206301c62019610176101561012610106100f6100d6100b6100a613086130761306613046130361303613006050060500605006050060500605006050060500605006050060500605
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000800180905009000090500900009050090000905000000090500900009050090000905009000090500900009050090000905009000090500900009050090000900009000090000900009000090000810009000
00080018090500e0000e0500e00010050100001505010000180501000013050100001505010000100501000013050100000e05010000100501000013050100000010010000100001000010000100001000010000
9110001e21110211102111026110281102b1102d1102d1102d110301102f1102b1102d1102d1102d1102b1102b1102f11028110281102811026110261102111024110241102611023110231101f1101f1101f110
0010001e241502415024150291502b1502e15030150301503015033150321502e1503015030150301502e1502e150321502b1502b1502b1502915029150291502715027150291502615026150221501f1501f150
040c0008116500160011600116502c6702b600006000a6000a6000a6000b6000360003600216001e6001d60012600126001360015600176001a6001e6001f6001160033600006000f6000e6000e6000d60024650
__music__
01 08094344
04 0b0c4b4c
03 0a424a4c

