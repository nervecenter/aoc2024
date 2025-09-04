# https://adventofcode.com/2024/day/1

(def lines (->> (slurp "day1_input.txt") (string/split "\n")))

(defn splitlines [lines-array left-list right-list]
  (let [[l r] (->> (first lines-array) (string/split "   ") (map scan-number))
        rest (array/slice lines-array 1 -1)]
    (if (empty? rest)
      [left-list right-list]
      (splitlines rest (array/concat left-list l) (array/concat right-list r)))))

(def [left-list right-list] (splitlines lines @[] @[]))
(def [sorted-left sorted-right] [(sorted left-list) (sorted right-list)])
(def distances (map (fn [l r] (math/abs (- l r))) sorted-left sorted-right))
(def total (sum distances))

(pp total) # 2367773
