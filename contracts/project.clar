;; Song Lyrics Collector
;; A simple contract to store and retrieve song lyrics immutably.

;; Error constant
(define-constant err-lyrics-already-exist (err u100))

;; Map to store song lyrics using a song ID
(define-map lyrics-map uint (string-ascii 500))

;; Public function to submit lyrics for a song
(define-public (submit-lyrics (song-id uint) (lyrics (string-ascii 500)))
  (begin
    ;; Ensure the song hasn't already been added
    (asserts! (is-none (map-get? lyrics-map song-id)) err-lyrics-already-exist)
    (map-set lyrics-map song-id lyrics)
    (ok true)))

;; Read-only function to retrieve lyrics for a song
(define-read-only (get-lyrics (song-id uint))
  (ok (map-get? lyrics-map song-id)))
