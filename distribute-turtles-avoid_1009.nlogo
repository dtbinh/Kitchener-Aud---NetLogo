;;;; SUMMARY
;; Distributing a number of evenly spread out turtles
;;;; Copyright & License
;; Copyright (C) 2006 James P. Steiner
;; You are granted a CC 2.5 by-nc-sa license to this model
;;
;;

globals
[  max-d min-d
]

turtles-own
[ d 
]

to spawn-turtles
   ca
   let start read-from-string (substring start-position 0 1)
   set start item (start)
   [ ""
     "setxy 0 0"
     "set heading random-float 360 jump .8 * random-xcor" 
     "setxy random-xcor random-ycor" 
     "4"
   ]
   ifelse start = "4"
   [ ask n-of population patches with [ pxcor > min-pxcor + spread and pycor > min-pycor + spread ]
     [ sprout 1
       [ setxy (pxcor - ( pxcor mod spread ) )
               (pycor - ( pycor mod spread ) )
       
         set heading random 360
        set color 5 + 10 * who
        set shape "circle"
        set size 1
        
       ]
     ]
   ]
   [
     crt population
     [ run start
       set heading random 360
       set color 5 + 10 * who
       set shape "circle"
       set size 1
     ]
   ]
   set reaction spread * -.25
end

to distribute-turtles
   let OK? true
   ask turtles 
   [ set OK? (run-result avoid-method) and OK?
   ]
   tick
   if OK? [ stop ]
end

to-report back-away-any
   let crowd (turtles in-radius-nowrap spread) with [self != myself]
   let result true
   if any? crowd
   [ set crowd one-of crowd
     face crowd
     jump reaction 
     set result false
   ]
   report result
end

to-report back-away-nearest
   let crowd (turtles in-radius-nowrap spread) with [self != myself]
   let result true
   if any? crowd
   [ set crowd min-one-of crowd [ distance myself ]
     face crowd
     jump reaction
     set result false
   ]
   report result
end

to-report back-away-any-from-center
   let crowd ((turtles in-radius-nowrap spread  ) with [self != myself])
   let cc count crowd
   let result true
   if any? crowd
   [ set crowd one-of crowd
     let h1 -1 if [xcor] of crowd != xcor or [ycor] of crowd != ycor
     [ set h1 towards crowd ]
     let h2 -1 if xcor != 0 or ycor != 0
     [ set h2 towardsxy 0 0 ]
     if h1 = -1 [ set h1 h2 ]
     if h2 = -1 [ set h2 h1 ]
     ifelse h1 != -1
     [ set heading mean-heading h1 h2
       jump reaction
     ]
     [ set heading random-float 360
       jump reaction
     ]
     set result false
   ]
   report result
end

to-report back-away-nearest-from-center
   let crowd ((turtles in-radius-nowrap spread ) with [self != myself])
   let cc count crowd
   let result true
   if any? crowd
   [ set crowd min-one-of crowd [ distance myself ]
     let h1 -1 if [xcor] of crowd != xcor or [ycor] of crowd != ycor
     [ set h1 towards crowd ]
     let h2 -1 if xcor != 0 or ycor != 0
     [ set h2 towardsxy 0 0 ]
     if h1 = -1 [ set h1 h2 ]
     if h2 = -1 [ set h2 h1 ]
     ifelse h1 != -1
     [ set heading mean-heading h1 h2
       jump reaction
     ]
     [ set heading random-float 360
       jump reaction
     ]
     set result false
   ]
   report result
end




   
to-report mean-heading [ h1 h2 ]
   let diff .5 * subtract-headings h1 h2
   report h2 + diff
end
      
   
to orbit
   ;; rotates turtles about the origin at a constant speed
   ;; (i.e. all turtle have the same speed within their orbital track
   ;; thus, all have a different angular speed)
   
   no-display
   ask turtles
   [ if pxcor != 0 or pycor != 0
     [ if d = 0
       [ set d -1 * distancexy 0 0
         set heading towardsxy 0 0
       ]
       setxy 0 0
       lt 120 / (d * d ) * sin (360 * d / max-pxcor)
       ifelse can-move? d
       [ jump d ]
       [ die ]
     ]
   ]  
   display
end      
   
@#$#@#$#@
GRAPHICS-WINDOW
203
10
516
344
50
50
3.0
1
10
1
1
1
0
0
0
1
-50
50
-50
50
0
0
1
ticks

CC-WINDOW
5
394
525
489
Command Center
0

SLIDER
10
10
182
43
spread
spread
2
10
4
1
1
NIL
HORIZONTAL

SLIDER
10
46
182
79
population
population
100
5000
500
100
1
NIL
HORIZONTAL

BUTTON
11
254
120
287
NIL
distribute-turtles
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
203
347
270
380
orbit
orbit
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
274
347
340
380
pretty
carefully [ set color 14 * floor (scale-color gray ( distancexy 0 0) 0 max-pxcor) + scale-color gray (towardsxy 0 0) 0 360 ]\n[ set color white ]\nset size spread\nset shape \"circle\"
NIL
1
T
TURTLE
NIL
NIL
NIL
NIL

BUTTON
11
185
119
218
NIL
spawn-turtles
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

SLIDER
11
219
103
252
reaction
reaction
-4
-0.1
-1
0.1
1
NIL
HORIZONTAL

MONITOR
130
212
187
257
NIL
ticks
3
1
11

CHOOSER
11
83
103
128
start-position
start-position
"1 - center" "2 - cluster" "3 - random" "4 - grid"
2

CHOOSER
11
132
199
177
avoid-method
avoid-method
"back-away-any" "back-away-nearest" "back-away-any-from-center" "back-away-nearest-from-center"
0

@#$#@#$#@
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

circle
false
0
Circle -7500403 true true 0 0 300

hex
true
0
Polygon -7500403 true true 0 150 75 15 225 15 300 150 225 285 75 285

link
true
0
Line -7500403 true 150 0 150 300

link direction
true
0
Line -7500403 true 150 150 30 225
Line -7500403 true 150 150 270 225

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

@#$#@#$#@
NetLogo 4.0.4
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
