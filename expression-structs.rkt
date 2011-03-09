#lang typed/racket/base
(require "lexical-structs.rkt")

(provide (all-defined-out))

;; Expressions

(define-type ExpressionCore (U Top Constant Var Branch Def Lam Seq App))

(define-struct: Top ([prefix : Prefix]
                     [code : ExpressionCore]) #:transparent)
(define-struct: Constant ([v : Any]) #:transparent)
(define-struct: Var ([id : Symbol]) #:transparent)
(define-struct: Branch ([predicate : ExpressionCore]
                        [consequent : ExpressionCore]
                        [alternative : ExpressionCore]) #:transparent)
(define-struct: Def ([variable : Symbol] 
                     [value : ExpressionCore]) #:transparent)
(define-struct: Lam ([parameters : (Listof Symbol)]
                     [body : ExpressionCore]) #:transparent)
(define-struct: Seq ([actions : (Listof ExpressionCore)]) #:transparent)
(define-struct: App ([operator : ExpressionCore]
                     [operands : (Listof ExpressionCore)]) #:transparent)

(: last-exp? ((Listof Expression) -> Boolean))
(define (last-exp? seq) 
  (null? (cdr seq)))

(: first-exp ((Listof Expression) -> Expression))
(define (first-exp seq) (car seq))

(: rest-exps ((Listof Expression) -> (Listof Expression)))
(define (rest-exps seq) (cdr seq))




(define-struct: Assign ([variable : Symbol]
                        [value : Expression]) #:transparent)
(define-type Expression (U ExpressionCore #;Assign))