; COMMAND-LINE: --incremental
; EXPECT: sat
; EXPECT: unsat
; EXPECT: sat
(set-logic QF_LIA)
(declare-fun x0 () Bool)
(declare-fun x1 () Bool)
(assert (or (not (or (and (or (and (or x1 x0) (not x1)) (and (not x0) (not x0))) (and (not (not x1)) (not (or x1 x1)))) (and (and (or (or x0 x0) (not x1)) (and (not x0) (not x1))) (not (or (and x1 x1) (and x0 x1)))))) (or (not (and (or (not (and x1 x1)) (not (and x1 x0))) (not (not (and x0 x1))))) (not (or (and (and (and x0 x1) (and x0 x0)) (and (or x0 x1) (and x0 x0))) (not (not (and x0 x0))))))))
(check-sat)
(push 1)
(assert (and (or (and (or (or (not (or (and (and (not x1) (and x0 x0)) (or (or x0 x1) (and x1 x0))) (and (and (or x1 x1) (or x1 x0)) (not (or x0 x0))))) (and (and (or (not (and x1 x0)) (and (not x0) (or x1 x0))) (and (not (or x0 x1)) (not (and x0 x1)))) (not (not (and (and x0 x0) (not x0)))))) (and (and (not (not (or (and x0 x0) (not x1)))) (and (or (and (and x1 x1) (not x0)) (not (and x0 x1))) (or (and (or x1 x1) (and x0 x1)) (not (not x1))))) (and (not (or (or (not x1) (or x0 x1)) (and (or x0 x1) (and x1 x1)))) (not (and (not (and x1 x0)) (not (not x1))))))) (or (or (not (or (or (or (or x0 x0) (or x1 x1)) (and (or x1 x1) (and x1 x1))) (or (not (not x1)) (not (and x0 x1))))) (or (or (and (not (or x1 x1)) (and (not x1) (and x0 x1))) (and (not (not x1)) (and (and x0 x0) (and x1 x1)))) (and (or (or (or x0 x0) (not x1)) (and (not x0) (or x1 x0))) (and (and (not x0) (and x0 x1)) (and (or x0 x1) (not x1)))))) (not (and (or (not (not (and x0 x1))) (and (not (or x0 x1)) (not (not x1)))) (and (not (and (or x1 x0) (not x0))) (and (or (or x0 x0) (or x1 x0)) (and (or x1 x1) (not x1)))))))) (not (and (not (or (and (and (or (or x0 x1) (or x0 x0)) (not (not x0))) (not (and (not x1) (not x0)))) (and (not (or (or x0 x0) (not x0))) (not (not (not x1)))))) (not (or (or (or (and (and x1 x1) (not x1)) (not (not x1))) (and (and (or x1 x1) (or x1 x0)) (and (and x0 x1) (or x0 x0)))) (not (or (not (or x1 x0)) (or (not x1) (or x0 x1))))))))) (not (and (not (and (or (and (not (or (not x0) (and x1 x1))) (and (or (not x0) (and x1 x0)) (not (not x1)))) (or (not (or (and x0 x1) (and x0 x0))) (or (not (and x0 x0)) (and (and x1 x0) (and x1 x0))))) (not (not (and (and (not x1) (not x0)) (and (not x0) (and x0 x0))))))) (and (or (and (or (or (and (or x1 x1) (and x1 x1)) (not (not x1))) (and (and (not x1) (or x1 x1)) (not (and x0 x0)))) (or (or (not (not x0)) (and (or x0 x1) (or x1 x0))) (or (and (not x1) (not x0)) (or (and x1 x1) (and x1 x0))))) (or (and (or (and (and x0 x0) (not x1)) (not (not x0))) (not (and (or x1 x1) (and x1 x0)))) (and (or (not (not x0)) (not (or x0 x1))) (and (or (or x1 x0) (and x0 x0)) (and (or x1 x0) (and x1 x1)))))) (not (not (or (and (or (or x1 x0) (and x0 x1)) (not (or x1 x1))) (and (and (not x0) (and x1 x0)) (not (or x0 x0)))))))))))
(assert (and (or (and (or (or (not (and x0 x1)) (not (or x0 x1))) (not (and (and x1 x1) (or x1 x1)))) (or (and (or (not x0) (or x0 x0)) (or (and x1 x1) (not x1))) (or (not (and x1 x0)) (and (and x0 x0) (or x0 x0))))) (not (or (or (not (and x1 x1)) (and (or x1 x0) (or x1 x0))) (not (or (or x0 x1) (and x1 x0)))))) (or (and (or (not (not (and x0 x0))) (and (and (or x0 x0) (and x1 x1)) (or (or x0 x0) (or x1 x0)))) (or (not (and (not x1) (or x1 x1))) (and (or (and x1 x0) (or x1 x0)) (not (or x0 x0))))) (or (or (and (and (or x1 x0) (and x1 x1)) (not (or x1 x0))) (and (or (not x1) (and x0 x0)) (or (or x0 x1) (or x0 x1)))) (and (and (and (and x1 x0) (or x0 x1)) (not (or x0 x1))) (and (or (not x1) (and x0 x0)) (and (or x1 x1) (and x0 x1))))))))
(check-sat)
(pop 1)
(assert (not (not (not (or x0 x1)))))
(check-sat)