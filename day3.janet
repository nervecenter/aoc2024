(def mul-instruction
  '{:number (between 1 3 :d)
    :main (sequence "mul(" (<- :number) "," (<- :number) ")")})

# (pp (peg/match mul-instruction "mul(44,46)"))
# (pp (peg/match mul-instruction "mul(123,4)"))
# (pp (peg/match mul-instruction "mul(4*"))
# (pp (peg/match mul-instruction "mul(6,9!"))
# (pp (peg/match mul-instruction "?(12,34)"))
# (pp (peg/match mul-instruction "mul ( 2 , 4 )"))

# (def corrupted-memory "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))")
(def corrupted-memory (string/trim (slurp "day3_input.txt")))

(def mul-indices (peg/find-all mul-instruction corrupted-memory))
(def operands-seq
  (seq [idx :in mul-indices]
    (map scan-number (peg/match mul-instruction corrupted-memory idx))))
(def mul-results (map product operands-seq))
(def final-result (sum mul-results))

(pp final-result) # 170068701
