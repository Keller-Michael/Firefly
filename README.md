# :fly: Firefly

## The idea behind Firefly

Firefly is a very simple programming language for the [BBC Micro:bit](https://microbit.org/). The BBC Micro:bit is a pocket-sized computer with a speaker and a 5x5 grid of LEDs. The basic idea of Firefly is very lovely because it's about firefly flying in the night and emitting light in different strength. 

Sounds esotheric? Absolutely and therefore a nice change of pace. I read about this programming language in [Ronald T. Kneusel's](https://www.rkneusel.com/) wonderful book "Strange Code - Esoteric languages that make programming fun again".  You can find more information about Firefly [here](https://esolangs.org/wiki/Firefly).

## Implementation in ABAP

I wrote an [executable class](./src/zcl_mke_firefly.clas.abap) on SAP Business Technology Platform ABAP environment (Steampunk), keeping things as simple as possible. Output is done via console. Firefly is starting from position 3/3 (C3).

## Example

Input commands "1SS2S3W2E4E" leads to following console output in the end:

| A | B | C | D | E |
|:-:|:-:|:-:|:-:|:-:|
| " | 3 | 2 | 4 | " |
| " | " | " | " | " |
| " | " | " | " | " |
| " | " | 1 | " | " |
| " | " | 1 | " | " |

