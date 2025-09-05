# https://adventofcode.com/2024/day/2

# Part 1

(def lines
  (->> (slurp "day2_input.txt")
       (string/trim)
       (string/split "\n")))

(def reports
  (seq [line :in lines]
    (->> line (string/split " ") (map scan-number))))

(defn level-diffs [report]
  (seq [i :range [0 (dec (length report))]]
    (- (report (inc i)) (report i))))

(def diffs (map level-diffs reports))

(defn safe? [arr]
  (and
    (or (all pos? arr)
        (all neg? arr))
    (all (fn [d]
           (and (>= (math/abs d) 1)
                (<= (math/abs d) 3))) arr)))

(def safe-checks (map safe? diffs))
(def total-safe (count true? safe-checks))

(pp total-safe) # 129


# Part 2

# (defn safe-diff? [a b]
#   )
