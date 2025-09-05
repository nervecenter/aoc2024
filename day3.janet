(def mul-instructions
  '{:number (between 1 3 :d)
    :main (sequence "mul(" (<- :number) "," (<- :number) ")")})

# (pp (peg/match mul-instructions "mul(44,46)"))
# (pp (peg/match mul-instructions "mul(123,4)"))
# (pp (peg/match mul-instructions "mul(4*"))
# (pp (peg/match mul-instructions "mul(6,9!"))
# (pp (peg/match mul-instructions "?(12,34)"))
# (pp (peg/match mul-instructions "mul ( 2 , 4 )"))

# (def corrupted-memory "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))")
(def corrupted-memory (string/trim (slurp "day3_input.txt")))

(def mul-indices (peg/find-all mul-instructions corrupted-memory))
(def operands-seq
  (seq [idx :in mul-indices]
    (map scan-number (peg/match mul-instructions corrupted-memory idx))))
(def mul-results (map product operands-seq))
(def final-result (sum mul-results))

(pp final-result) # 170068701

# Part 2

(def all-ops 
  '{:number (between 1 3 :d)
    :mul (sequence "mul(" (<- :number) "," (<- :number) ")")
    :do-dont (<- (choice "do()" "don't()"))
    :main (choice :mul :do-dont)})

(def all-ops-indices (peg/find-all all-ops corrupted-memory))
(def all-ops-seq
  (seq [idx :in all-ops-indices]
    (peg/match all-ops corrupted-memory idx)))

(defn perform-mul [operands]
  (product (map (fn [o] (scan-number o)) operands)))

(defn process-ops [sequence idx mode acc]
  (cond
    (= idx (length sequence))           acc
    (deep= (sequence idx) @["do()"])    (process-ops sequence (inc idx) :do acc)
    (deep= (sequence idx) @["don't()"]) (process-ops sequence (inc idx) :dont acc)
    (= mode :dont)                      (process-ops sequence (inc idx) :dont acc)
    (= mode :do)                        (process-ops sequence (inc idx) :do (array/push acc (perform-mul (sequence idx))))))

(def mul-results-2 (process-ops all-ops-seq 0 :do @[]))
(def processed-sum-2 (sum mul-results-2))

(pp processed-sum-2) # 78683433

