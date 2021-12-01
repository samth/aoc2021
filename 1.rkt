#lang rhombus

import:
  racket
  racket/file:
    rename:
      #{file->list} as to_list
      

val nums: file.to_list("input1")

fun go(last, l):
  match l
  | []: 0
  | _ : if racket.car(l) > last
        | 1+go(racket.car(l), racket.cdr(l))
        | go(racket.car(l), racket.cdr(l))

val test: [
199,
200,
208,
210,
200,
207,
240,
269,
260,
263,
]
go(#{+inf.0},test)
go(#{+inf.0},nums)

fun sum(l): racket.apply(racket.#{+}, l)

fun windows(l,n):
  if racket.length(l) < n
  | []
  | racket.cons(sum(racket.take(l,n)), windows(racket.cdr(l), n))

go(#{+inf.0}, windows(nums,3))
    
   