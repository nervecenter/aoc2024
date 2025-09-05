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

(defn safe? [diffs]
  (and
    (or (all pos? diffs)
        (all neg? diffs))
    (all (fn [d]
           (and (>= (math/abs d) 1)
                (<= (math/abs d) 3))) diffs)))

(def safe-checks (map safe? diffs))
(def total-safe (count true? safe-checks))

(pp total-safe) # 129


# Part 2

(defn try-dampen [report idx]
  (cond
    (= idx (length report)) false
    (safe? (level-diffs (array/remove report idx))) true
    (try-dampen report (inc idx))))

(def dampened-checks
  (seq [i :range [0 (length safe-checks)]]
    (or
      (safe-checks i)
      (try-dampen (reports i) 0))))

(def dampened-total-safe (count true? dampened-checks))

(pp dampened-total-safe)
