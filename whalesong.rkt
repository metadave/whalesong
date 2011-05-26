#!/usr/bin/env racket
#lang racket/base

(require racket/list
         racket/match
         racket/string
         racket/path
         "make-structs.rkt"
         "js-assembler/package.rkt")


;; Usage:
;;
;; * Build standalone .xhtml application.
;;
;;     $ whalesong build main-module-name.rkt


(define commands `((build 
                    ,(lambda (args)
                      (do-the-build args)))))

;; listof string
(define command-names (map (lambda (x) (symbol->string (car x)))
                           commands))


(define (print-expected-command)
  (printf "Expected one of the following: [~a].\n"
          (string-join command-names ", ")))

(define (at-toplevel)
  (define args (vector->list (current-command-line-arguments)))
  (cond [(empty? args)
         (print-expected-command)]
        [else
         (cond
          [(assoc (string->symbol (first args))
                  commands)
           =>
           (lambda (p)
             ((cadr p) (rest args)))]
          [else
           (printf "Unknown command ~s.\n" (first args))
           (print-expected-command)])]))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (do-the-build filenames)
  (for ([f filenames])
       (let-values ([(base filename dir?)
                     (split-path f)])
         (let ([output-filename
                (build-path
                 (regexp-replace #rx"[.](rkt|ss)$" (path->string filename) ".xhtml"))])
           (call-with-output-file* output-filename
                                   (lambda (op)
                                     (package-standalone-xhtml
                                      (make-ModuleSource (build-path f))
                                      op))
                                   #:exists 'replace)))))
             


(at-toplevel)