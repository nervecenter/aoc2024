# https://adventofcode.com/2024/day/4

# Part 1

(def letter-field-lines (->> (slurp "day4_input.txt") (string/trim) (string/split "\n")))
(def sample-field-lines
  (->> "MMMSXXMASM\nMSAMXMSMSA\nAMXSXMAAMM\nMSAMASMSMX\nXMASAMXAMM\nXXAMMXXAMA\nSMSMSASXSS\nSAXAMASAAA\nMAMMMXMMMM\nMXMXAXMASX"
       (string/trim)
       (string/split "\n")))

(each l sample-field-lines (pp l))

(defn walk-diag-up-right [lines]
  (var j 0)
  (var i 0)
  (while (and (> i 0) (> j 0))))
