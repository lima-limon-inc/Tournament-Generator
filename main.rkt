#lang racket/gui

(require "tournament-generator.rkt")
(require "tournament-gui.rkt")

(define member-dir "members/")

(define members (map path->string (directory-list member-dir)))

(define competitions (generate-tournamet members))

(show-comparision competitions member-dir)


