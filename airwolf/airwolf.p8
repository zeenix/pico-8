pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include consts.lua
#include bullet.lua
#include rotor.lua
#include entity.lua
#include entities.lua
#include shooter.lua
#include enemy_aircraft.lua
#include the_lady.lua
#include main.lua

__gfx__
00000000000000111100000000000000000000000000000000000000111111111111111111133331111ccccc1111111100000000000000000000000000000000
00000000000005cccc5000000000000000000000000000000000000011111111111111111133333111cccccc1131113100000000000000000000000000000000
00000000000005555550000000000000000000000000000000000000111111111111111113333331cccccccc3113131100000000000000000000000000000000
0000000000500c5555c0050000000000000000000000000000000000111111111111111133344333cccccccc1311311300000000000000000000000000000000
0000000000555c5555c5550000000000000000000000000000000000111666111111111113444311cccccccc1331313100000000000000000000000000000000
0000000000555c5555c5550000000000000000000000000000000000116666611111111111444111ccccc1111113331100000000000000000000000000000000
0000000000000c5555c0000000000000000000000000000000000000116666661111111111444111cc111c111113331100000000000000000000000000000000
00000000000005555550000000000000000000000000000000000000111111111111111111444111cc1111111111331100000000000000000000000000000000
00000000000005555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000055000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000055000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000055000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000055000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000055000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000aa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaccaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00acca00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000aa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000070000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000070000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000070000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000008080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0b08080808080808080b08080808080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08080708080b0b080808080808080b0b08000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08080808080b0808080809080a0a080708000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
080808080b0b0808080808080b08080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09080908080808080b0b08080808080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08090908080808080b08080808080b0808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
080808080808070b0b08080808080b0b08000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
080a080b08080808080809080808080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
080808080808080808080808080808080a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808080808080808080808080808080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08080808080808080b0808080808080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b08080808080808080808080809080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08080808070808080808080b0808080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
080808080808080908080b080808080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
080809080808080808080808080808080b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
080808080b0b0808080808080808080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808080b0b0b0b080808080a0808080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

