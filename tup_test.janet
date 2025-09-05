(def atup [1 2 3 4 5 6])

(defn tuple/remove [tup idx]
  (tuple/join (tuple/slice tup 0 idx)
              (tuple/slice tup (inc idx))))

(pp (tuple/remove atup 0))
(pp (tuple/remove atup 1))
(pp (tuple/remove atup 2))
(pp (tuple/remove atup 3))
(pp (tuple/remove atup 4))
(pp (tuple/remove atup 5))
