(define-map user-lyrics
  {user: principal}     ;; key
  {lyrics: (string-utf8 200)}) ;; value

(define-data-var total-lyrics uint u0)

(define-constant err-empty-lyrics (err u100))

;; Public: Submit lyrics
(define-public (submit-lyrics (text (string-utf8 200)))
  (begin
    (asserts! (> (len text) u0) err-empty-lyrics)
    (map-set user-lyrics {user: tx-sender} {lyrics: text})
    (var-set total-lyrics (+ (var-get total-lyrics) u1))
    (ok true)))

;; Read-only: Get total lyrics submissions
(define-read-only (get-total-lyrics)
  (ok (var-get total-lyrics)))
