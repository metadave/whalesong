#lang planet dyoo/whalesong
(require (planet dyoo/whalesong/web-world)
         (planet dyoo/whalesong/resource)
         (planet dyoo/whalesong/resource/structs))

(define-resource index.html)


(printf "I see the path is: ~s\n"
        (resource-path index.html))

(printf "I see the key is: ~s\n"
        (resource-key index.html))

(printf "I see the content is: ~s\n"
        (resource-content index.html))

;; (big-bang "don't care"
;;           (initial-view index.html))