# https://adventofcode.com/2024/day/1

import std/math
import std/sugar
import std/tables
import std/strutils
import std/sequtils
import std/algorithm

# Part 1

let lines = read_file("day1_input.txt").strip().split("\n")

proc split_lines_and_sort(lines_array: seq[string]): (seq[int], seq[int]) =
    for line in lines_array:
        let l_r = line.split("   ").map(parse_int)
        result[0].add l_r[0]
        result[1].add l_r[1]
    result[0].sort()
    result[1].sort()

let (left_list, right_list) = split_lines_and_sort(lines)
let total_distance = zip(left_list, right_list).map((l_r) => abs(l_r[0] - l_r[1])).sum()

echo total_distance # 2367773


# Part 2

let left_freqs = to_count_table(left_list)
let right_freqs = to_count_table(right_list)

var similarity = 0
for num in left_freqs.keys:
    if num in right_freqs:
        similarity += num * right_freqs[num]

echo similarity # 21271939

