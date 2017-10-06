Require Import Coq.ZArith.ZArith.
Require Export Crypto.Compilers.Syntax.
Require Import Crypto.Compilers.Z.Syntax.
Require Export Bedrock.Word.
Require Export Crypto.Util.Notations.

Notation Const x := (Op (OpConst x) TT).
(* python:
<<
#!/usr/bin/env python
from __future__ import with_statement
import math

nums = tuple(list(range(128)) + [
    121665,
    8388607,
    33554431,
    67108862,
    67108863,
    134217690,
    134217710,
    134217726,
    134217727,
    268435454,
    268435455,
    536870906,
    536870910,
    4294967295,
    2251799813685210,
    2251799813685229,
    2251799813685247,
    4503599627370458,
    4503599627370494,
    4503599627370495,
    72057594037927935,
    72057594037927936,
    18446744069414584321,
    18446744073709551615,
    18446744073709551616,
    38685626227668133590597631,
    77371252455336267181195254,
    77371252455336267181195262,
    79228162514264337593543950335,
    79228162514264337593543950337,
    340282366841710300967557013911933812736,
    340282366920938463463374607431768211455,
    340282366920938463463374607431768211456,
    26959946667150639794667015087019630673637144422540572481103610249216
])

def log2_up(i):
    return int(math.ceil(math.log(i, 2)))

def word(i, width=None):
    assert(i >= 0)
    if width is None:
        if i == 0: return word(i, width=1)
        return word(i, width=2**log2_up(log2_up(i + 1)))
    return 'WO~' + '~'.join(bin(i)[2:].rjust(width, '0'))

word_formats = tuple(sorted([(n, hex(n), bin(n), word(n)) for n in nums]))

def header():
    return (r"""Require Import Coq.ZArith.ZArith.
Require Export Crypto.Compilers.Syntax.
Require Import Crypto.Compilers.Z.Syntax.
Require Export Bedrock.Word.
Require Export Crypto.Util.Notations.

Notation Const x := (Op (OpConst x) TT).
(""" + r"""* python:
<<
""" +
            open(__file__).read() +
            r""">>
 *""" + r""")""")


def hex_nots():
    return ('\n'.join('''Notation "'%s'" (* %d (%s) *)\n  := (Const %s%%Z).\nNotation "'%s'" (* %d (%s) *)\n  := (Const %s).''' % (h, d, h, d, h, d, h, w)
                      for d, h, b, w in word_formats))
def bin_nots():
    return ('\n'.join('''Notation "'%s'" (* %d (%s) *)\n  := (Const %s).''' % (b, d, h, w)
                      for d, h, b, w in word_formats))

with open('HexNotationConstants.v', 'w') as f:
    f.write(header() + '\n' + hex_nots())

with open('BinaryNotationConstants.v', 'w') as f:
    f.write(header() + '\n' + bin_nots())
>>
 *)
Notation "'0b0'" (* 0 (0x0) *)
  := (Const WO~0).
Notation "'0b1'" (* 1 (0x1) *)
  := (Const WO~1).
Notation "'0b10'" (* 2 (0x2) *)
  := (Const WO~1~0).
Notation "'0b11'" (* 3 (0x3) *)
  := (Const WO~1~1).
Notation "'0b100'" (* 4 (0x4) *)
  := (Const WO~0~1~0~0).
Notation "'0b101'" (* 5 (0x5) *)
  := (Const WO~0~1~0~1).
Notation "'0b110'" (* 6 (0x6) *)
  := (Const WO~0~1~1~0).
Notation "'0b111'" (* 7 (0x7) *)
  := (Const WO~0~1~1~1).
Notation "'0b1000'" (* 8 (0x8) *)
  := (Const WO~1~0~0~0).
Notation "'0b1001'" (* 9 (0x9) *)
  := (Const WO~1~0~0~1).
Notation "'0b1010'" (* 10 (0xa) *)
  := (Const WO~1~0~1~0).
Notation "'0b1011'" (* 11 (0xb) *)
  := (Const WO~1~0~1~1).
Notation "'0b1100'" (* 12 (0xc) *)
  := (Const WO~1~1~0~0).
Notation "'0b1101'" (* 13 (0xd) *)
  := (Const WO~1~1~0~1).
Notation "'0b1110'" (* 14 (0xe) *)
  := (Const WO~1~1~1~0).
Notation "'0b1111'" (* 15 (0xf) *)
  := (Const WO~1~1~1~1).
Notation "'0b10000'" (* 16 (0x10) *)
  := (Const WO~0~0~0~1~0~0~0~0).
Notation "'0b10001'" (* 17 (0x11) *)
  := (Const WO~0~0~0~1~0~0~0~1).
Notation "'0b10010'" (* 18 (0x12) *)
  := (Const WO~0~0~0~1~0~0~1~0).
Notation "'0b10011'" (* 19 (0x13) *)
  := (Const WO~0~0~0~1~0~0~1~1).
Notation "'0b10100'" (* 20 (0x14) *)
  := (Const WO~0~0~0~1~0~1~0~0).
Notation "'0b10101'" (* 21 (0x15) *)
  := (Const WO~0~0~0~1~0~1~0~1).
Notation "'0b10110'" (* 22 (0x16) *)
  := (Const WO~0~0~0~1~0~1~1~0).
Notation "'0b10111'" (* 23 (0x17) *)
  := (Const WO~0~0~0~1~0~1~1~1).
Notation "'0b11000'" (* 24 (0x18) *)
  := (Const WO~0~0~0~1~1~0~0~0).
Notation "'0b11001'" (* 25 (0x19) *)
  := (Const WO~0~0~0~1~1~0~0~1).
Notation "'0b11010'" (* 26 (0x1a) *)
  := (Const WO~0~0~0~1~1~0~1~0).
Notation "'0b11011'" (* 27 (0x1b) *)
  := (Const WO~0~0~0~1~1~0~1~1).
Notation "'0b11100'" (* 28 (0x1c) *)
  := (Const WO~0~0~0~1~1~1~0~0).
Notation "'0b11101'" (* 29 (0x1d) *)
  := (Const WO~0~0~0~1~1~1~0~1).
Notation "'0b11110'" (* 30 (0x1e) *)
  := (Const WO~0~0~0~1~1~1~1~0).
Notation "'0b11111'" (* 31 (0x1f) *)
  := (Const WO~0~0~0~1~1~1~1~1).
Notation "'0b100000'" (* 32 (0x20) *)
  := (Const WO~0~0~1~0~0~0~0~0).
Notation "'0b100001'" (* 33 (0x21) *)
  := (Const WO~0~0~1~0~0~0~0~1).
Notation "'0b100010'" (* 34 (0x22) *)
  := (Const WO~0~0~1~0~0~0~1~0).
Notation "'0b100011'" (* 35 (0x23) *)
  := (Const WO~0~0~1~0~0~0~1~1).
Notation "'0b100100'" (* 36 (0x24) *)
  := (Const WO~0~0~1~0~0~1~0~0).
Notation "'0b100101'" (* 37 (0x25) *)
  := (Const WO~0~0~1~0~0~1~0~1).
Notation "'0b100110'" (* 38 (0x26) *)
  := (Const WO~0~0~1~0~0~1~1~0).
Notation "'0b100111'" (* 39 (0x27) *)
  := (Const WO~0~0~1~0~0~1~1~1).
Notation "'0b101000'" (* 40 (0x28) *)
  := (Const WO~0~0~1~0~1~0~0~0).
Notation "'0b101001'" (* 41 (0x29) *)
  := (Const WO~0~0~1~0~1~0~0~1).
Notation "'0b101010'" (* 42 (0x2a) *)
  := (Const WO~0~0~1~0~1~0~1~0).
Notation "'0b101011'" (* 43 (0x2b) *)
  := (Const WO~0~0~1~0~1~0~1~1).
Notation "'0b101100'" (* 44 (0x2c) *)
  := (Const WO~0~0~1~0~1~1~0~0).
Notation "'0b101101'" (* 45 (0x2d) *)
  := (Const WO~0~0~1~0~1~1~0~1).
Notation "'0b101110'" (* 46 (0x2e) *)
  := (Const WO~0~0~1~0~1~1~1~0).
Notation "'0b101111'" (* 47 (0x2f) *)
  := (Const WO~0~0~1~0~1~1~1~1).
Notation "'0b110000'" (* 48 (0x30) *)
  := (Const WO~0~0~1~1~0~0~0~0).
Notation "'0b110001'" (* 49 (0x31) *)
  := (Const WO~0~0~1~1~0~0~0~1).
Notation "'0b110010'" (* 50 (0x32) *)
  := (Const WO~0~0~1~1~0~0~1~0).
Notation "'0b110011'" (* 51 (0x33) *)
  := (Const WO~0~0~1~1~0~0~1~1).
Notation "'0b110100'" (* 52 (0x34) *)
  := (Const WO~0~0~1~1~0~1~0~0).
Notation "'0b110101'" (* 53 (0x35) *)
  := (Const WO~0~0~1~1~0~1~0~1).
Notation "'0b110110'" (* 54 (0x36) *)
  := (Const WO~0~0~1~1~0~1~1~0).
Notation "'0b110111'" (* 55 (0x37) *)
  := (Const WO~0~0~1~1~0~1~1~1).
Notation "'0b111000'" (* 56 (0x38) *)
  := (Const WO~0~0~1~1~1~0~0~0).
Notation "'0b111001'" (* 57 (0x39) *)
  := (Const WO~0~0~1~1~1~0~0~1).
Notation "'0b111010'" (* 58 (0x3a) *)
  := (Const WO~0~0~1~1~1~0~1~0).
Notation "'0b111011'" (* 59 (0x3b) *)
  := (Const WO~0~0~1~1~1~0~1~1).
Notation "'0b111100'" (* 60 (0x3c) *)
  := (Const WO~0~0~1~1~1~1~0~0).
Notation "'0b111101'" (* 61 (0x3d) *)
  := (Const WO~0~0~1~1~1~1~0~1).
Notation "'0b111110'" (* 62 (0x3e) *)
  := (Const WO~0~0~1~1~1~1~1~0).
Notation "'0b111111'" (* 63 (0x3f) *)
  := (Const WO~0~0~1~1~1~1~1~1).
Notation "'0b1000000'" (* 64 (0x40) *)
  := (Const WO~0~1~0~0~0~0~0~0).
Notation "'0b1000001'" (* 65 (0x41) *)
  := (Const WO~0~1~0~0~0~0~0~1).
Notation "'0b1000010'" (* 66 (0x42) *)
  := (Const WO~0~1~0~0~0~0~1~0).
Notation "'0b1000011'" (* 67 (0x43) *)
  := (Const WO~0~1~0~0~0~0~1~1).
Notation "'0b1000100'" (* 68 (0x44) *)
  := (Const WO~0~1~0~0~0~1~0~0).
Notation "'0b1000101'" (* 69 (0x45) *)
  := (Const WO~0~1~0~0~0~1~0~1).
Notation "'0b1000110'" (* 70 (0x46) *)
  := (Const WO~0~1~0~0~0~1~1~0).
Notation "'0b1000111'" (* 71 (0x47) *)
  := (Const WO~0~1~0~0~0~1~1~1).
Notation "'0b1001000'" (* 72 (0x48) *)
  := (Const WO~0~1~0~0~1~0~0~0).
Notation "'0b1001001'" (* 73 (0x49) *)
  := (Const WO~0~1~0~0~1~0~0~1).
Notation "'0b1001010'" (* 74 (0x4a) *)
  := (Const WO~0~1~0~0~1~0~1~0).
Notation "'0b1001011'" (* 75 (0x4b) *)
  := (Const WO~0~1~0~0~1~0~1~1).
Notation "'0b1001100'" (* 76 (0x4c) *)
  := (Const WO~0~1~0~0~1~1~0~0).
Notation "'0b1001101'" (* 77 (0x4d) *)
  := (Const WO~0~1~0~0~1~1~0~1).
Notation "'0b1001110'" (* 78 (0x4e) *)
  := (Const WO~0~1~0~0~1~1~1~0).
Notation "'0b1001111'" (* 79 (0x4f) *)
  := (Const WO~0~1~0~0~1~1~1~1).
Notation "'0b1010000'" (* 80 (0x50) *)
  := (Const WO~0~1~0~1~0~0~0~0).
Notation "'0b1010001'" (* 81 (0x51) *)
  := (Const WO~0~1~0~1~0~0~0~1).
Notation "'0b1010010'" (* 82 (0x52) *)
  := (Const WO~0~1~0~1~0~0~1~0).
Notation "'0b1010011'" (* 83 (0x53) *)
  := (Const WO~0~1~0~1~0~0~1~1).
Notation "'0b1010100'" (* 84 (0x54) *)
  := (Const WO~0~1~0~1~0~1~0~0).
Notation "'0b1010101'" (* 85 (0x55) *)
  := (Const WO~0~1~0~1~0~1~0~1).
Notation "'0b1010110'" (* 86 (0x56) *)
  := (Const WO~0~1~0~1~0~1~1~0).
Notation "'0b1010111'" (* 87 (0x57) *)
  := (Const WO~0~1~0~1~0~1~1~1).
Notation "'0b1011000'" (* 88 (0x58) *)
  := (Const WO~0~1~0~1~1~0~0~0).
Notation "'0b1011001'" (* 89 (0x59) *)
  := (Const WO~0~1~0~1~1~0~0~1).
Notation "'0b1011010'" (* 90 (0x5a) *)
  := (Const WO~0~1~0~1~1~0~1~0).
Notation "'0b1011011'" (* 91 (0x5b) *)
  := (Const WO~0~1~0~1~1~0~1~1).
Notation "'0b1011100'" (* 92 (0x5c) *)
  := (Const WO~0~1~0~1~1~1~0~0).
Notation "'0b1011101'" (* 93 (0x5d) *)
  := (Const WO~0~1~0~1~1~1~0~1).
Notation "'0b1011110'" (* 94 (0x5e) *)
  := (Const WO~0~1~0~1~1~1~1~0).
Notation "'0b1011111'" (* 95 (0x5f) *)
  := (Const WO~0~1~0~1~1~1~1~1).
Notation "'0b1100000'" (* 96 (0x60) *)
  := (Const WO~0~1~1~0~0~0~0~0).
Notation "'0b1100001'" (* 97 (0x61) *)
  := (Const WO~0~1~1~0~0~0~0~1).
Notation "'0b1100010'" (* 98 (0x62) *)
  := (Const WO~0~1~1~0~0~0~1~0).
Notation "'0b1100011'" (* 99 (0x63) *)
  := (Const WO~0~1~1~0~0~0~1~1).
Notation "'0b1100100'" (* 100 (0x64) *)
  := (Const WO~0~1~1~0~0~1~0~0).
Notation "'0b1100101'" (* 101 (0x65) *)
  := (Const WO~0~1~1~0~0~1~0~1).
Notation "'0b1100110'" (* 102 (0x66) *)
  := (Const WO~0~1~1~0~0~1~1~0).
Notation "'0b1100111'" (* 103 (0x67) *)
  := (Const WO~0~1~1~0~0~1~1~1).
Notation "'0b1101000'" (* 104 (0x68) *)
  := (Const WO~0~1~1~0~1~0~0~0).
Notation "'0b1101001'" (* 105 (0x69) *)
  := (Const WO~0~1~1~0~1~0~0~1).
Notation "'0b1101010'" (* 106 (0x6a) *)
  := (Const WO~0~1~1~0~1~0~1~0).
Notation "'0b1101011'" (* 107 (0x6b) *)
  := (Const WO~0~1~1~0~1~0~1~1).
Notation "'0b1101100'" (* 108 (0x6c) *)
  := (Const WO~0~1~1~0~1~1~0~0).
Notation "'0b1101101'" (* 109 (0x6d) *)
  := (Const WO~0~1~1~0~1~1~0~1).
Notation "'0b1101110'" (* 110 (0x6e) *)
  := (Const WO~0~1~1~0~1~1~1~0).
Notation "'0b1101111'" (* 111 (0x6f) *)
  := (Const WO~0~1~1~0~1~1~1~1).
Notation "'0b1110000'" (* 112 (0x70) *)
  := (Const WO~0~1~1~1~0~0~0~0).
Notation "'0b1110001'" (* 113 (0x71) *)
  := (Const WO~0~1~1~1~0~0~0~1).
Notation "'0b1110010'" (* 114 (0x72) *)
  := (Const WO~0~1~1~1~0~0~1~0).
Notation "'0b1110011'" (* 115 (0x73) *)
  := (Const WO~0~1~1~1~0~0~1~1).
Notation "'0b1110100'" (* 116 (0x74) *)
  := (Const WO~0~1~1~1~0~1~0~0).
Notation "'0b1110101'" (* 117 (0x75) *)
  := (Const WO~0~1~1~1~0~1~0~1).
Notation "'0b1110110'" (* 118 (0x76) *)
  := (Const WO~0~1~1~1~0~1~1~0).
Notation "'0b1110111'" (* 119 (0x77) *)
  := (Const WO~0~1~1~1~0~1~1~1).
Notation "'0b1111000'" (* 120 (0x78) *)
  := (Const WO~0~1~1~1~1~0~0~0).
Notation "'0b1111001'" (* 121 (0x79) *)
  := (Const WO~0~1~1~1~1~0~0~1).
Notation "'0b1111010'" (* 122 (0x7a) *)
  := (Const WO~0~1~1~1~1~0~1~0).
Notation "'0b1111011'" (* 123 (0x7b) *)
  := (Const WO~0~1~1~1~1~0~1~1).
Notation "'0b1111100'" (* 124 (0x7c) *)
  := (Const WO~0~1~1~1~1~1~0~0).
Notation "'0b1111101'" (* 125 (0x7d) *)
  := (Const WO~0~1~1~1~1~1~0~1).
Notation "'0b1111110'" (* 126 (0x7e) *)
  := (Const WO~0~1~1~1~1~1~1~0).
Notation "'0b1111111'" (* 127 (0x7f) *)
  := (Const WO~0~1~1~1~1~1~1~1).
Notation "'0b11101101101000001'" (* 121665 (0x1db41) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~0~1~1~0~1~1~0~1~0~0~0~0~0~1).
Notation "'0b11111111111111111111111'" (* 8388607 (0x7fffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b1111111111111111111111111'" (* 33554431 (0x1ffffff) *)
  := (Const WO~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b11111111111111111111111110'" (* 67108862 (0x3fffffe) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0b11111111111111111111111111'" (* 67108863 (0x3ffffff) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b111111111111111111111011010'" (* 134217690 (0x7ffffda) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1~0).
Notation "'0b111111111111111111111101110'" (* 134217710 (0x7ffffee) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~0).
Notation "'0b111111111111111111111111110'" (* 134217726 (0x7fffffe) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0b111111111111111111111111111'" (* 134217727 (0x7ffffff) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b1111111111111111111111111110'" (* 268435454 (0xffffffe) *)
  := (Const WO~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0b1111111111111111111111111111'" (* 268435455 (0xfffffff) *)
  := (Const WO~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b11111111111111111111111111010'" (* 536870906 (0x1ffffffa) *)
  := (Const WO~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~0).
Notation "'0b11111111111111111111111111110'" (* 536870910 (0x1ffffffe) *)
  := (Const WO~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0b11111111111111111111111111111111'" (* 4294967295 (0xffffffff) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b111111111111111111111111111111111111111111111011010'" (* 2251799813685210 (0x7ffffffffffda) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1~0).
Notation "'0b111111111111111111111111111111111111111111111101101'" (* 2251799813685229 (0x7ffffffffffed) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0b111111111111111111111111111111111111111111111111111'" (* 2251799813685247 (0x7ffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b1111111111111111111111111111111111111111111111011010'" (* 4503599627370458 (0xfffffffffffda) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1~0).
Notation "'0b1111111111111111111111111111111111111111111111111110'" (* 4503599627370494 (0xffffffffffffe) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0b1111111111111111111111111111111111111111111111111111'" (* 4503599627370495 (0xfffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b11111111111111111111111111111111111111111111111111111111'" (* 72057594037927935 (0xffffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b100000000000000000000000000000000000000000000000000000000'" (* 72057594037927936 (0x100000000000000) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0b1111111111111111111111111111111100000000000000000000000000000001'" (* 18446744069414584321 (0xffffffff00000001L) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0b1111111111111111111111111111111111111111111111111111111111111111'" (* 18446744073709551615 (0xffffffffffffffffL) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b10000000000000000000000000000000000000000000000000000000000000000'" (* 18446744073709551616 (0x10000000000000000L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111'" (* 38685626227668133590597631 (0x1fffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b11111111111111111111111111111111111111111111111111111111111111111111111111111111110110'" (* 77371252455336267181195254 (0x3ffffffffffffffffffff6L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0).
Notation "'0b11111111111111111111111111111111111111111111111111111111111111111111111111111111111110'" (* 77371252455336267181195262 (0x3ffffffffffffffffffffeL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111'" (* 79228162514264337593543950335 (0xffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001'" (* 79228162514264337593543950337 (0x1000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0b11111111111111111111111111111111000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000'" (* 340282366841710300967557013911933812736 (0xffffffff000000010000000000000000L) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111'" (* 340282366920938463463374607431768211455 (0xffffffffffffffffffffffffffffffffL) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0b100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'" (* 340282366920938463463374607431768211456 (0x100000000000000000000000000000000L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0b100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'" (* 26959946667150639794667015087019630673637144422540572481103610249216 (0x100000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).