;; SUMMARY
;;;;  Particles cluster around home base, around obstacles
;; COPYRIGHT & LICENSE
;;;; Copyright (C) 2005 James P. Steiner
;;;; Some Rights Reserved.
;;;; Creative Commons Attribution-NonCommercial-ShareAlike License v. 2.0.
;;;; Visit http://creativecommons.org/licenses/by-nc-sa/2.0/ for more information.

globals
[ 
  tilt-list
  dmode
]

breed [ reps ]
breed [ cons ]
breed [ clocks ]


reps-own
[ faction 
  close-enough?
]
cons-own 
[ faction
  close-enough?
  my-rep
]

to startup
   setup
end
 
to setup
  ;; (for this model to work with NetLogo's new plotting features,
  ;; __clear-all-and-reset-ticks should be replaced with clear-all at
  ;; the beginning of your setup procedure and reset-ticks at the end
  ;; of the procedure.)
  __clear-all-and-reset-ticks

  set-default-shape reps "circle"
  set-default-shape clocks "clock"
   reset-ticks
  
  create-clocks 1
  [ set size 10
    setxy max-pxcor - 5 max-pycor - 5
    set heading 0
    set color blue
  ]
  
   create-reps factions
   [ set faction who mod factions
     setxy 0 0
     set heading (who + .5)  * 360 / factions
     jump max-pxcor * .65
     set size max-pxcor * .1
     set color faction-color
     set label faction
  ]
   
   ask patch 0 0
   [ ask patches in-radius ( max-pxcor * .9) with [  random-float 100 < density ]
     [ sprout 1
       [ set breed cons
         set shape shape:
         set faction random factions
         set color faction-color
         set heading random 360
         set size 1.1
         set my-rep one-of reps with [ faction = [faction] of myself ]
         set close-enough? 0
       ]
     ]
   ]

   ask reps [ ask cons in-radius (size * 1.1) [ die ] ]
end

to go
   
   no-display

   ask clocks [ rt 5 ]
   
   let quarter-cons .1 * count cons 
   ask reps
   [ ask (cons with [ faction = [faction] of myself ]) in-radius (size * 1.5)
     [ set close-enough? ticks 
       if shape != "X" [ set shape "X" ]
     ]
     
   ]
   ask cons
   [ if close-enough? != ticks
     [ set heading towards-nowrap my-rep
        without-interruption
         [let tn tilt-neighbors with [ pcolor = black and not (any? cons-here )]
           ifelse any? tn 
           [ let target min-one-of tn [ distance-nowrap [my-rep] of myself ]
             set heading towards-nowrap target
             setxy [pxcor] of target [pycor] of target
             set color faction-color
             set close-enough? 0
             if shape != shape: [ set shape shape: ]

          ]
           [ if color mod 10 < 8.5 [ set color color + .25 ]
           ]
         ]
       ]
   ]
   every .1
   [ if mouse-down?
     [ ask patch mouse-xcor mouse-ycor [ ask cons in-radius 5 [ die ] ] ]
   ]
   display
   tick
end



to-report tilt-neighbors-3
    report patches at-points
    (list (list (dx) (dy) )
          (list (sin (heading + 45)) (cos (heading + 45)))
          (list (sin (heading - 45)) (cos (heading - 45)))
     )
end

to-report tilt-neighbors
    let t []
    if    ++0 [set t lput (list dx dy) t]
    if   ++45 [set t lput (list (sin (heading +  45)) (cos (heading +  45))) t ]
    if   --45 [set t lput (list (sin (heading -  45)) (cos (heading -  45))) t ]
    if   ++90 [set t lput (list (sin (heading -  90)) (cos (heading -  90))) t   ]      
    if   --90 [set t lput (list (sin (heading +  90)) (cos (heading +  90))) t    ]    
    if  ++135 [set t lput (list (sin (heading + 135)) (cos (heading + 135))) t     ]    
    if  --135 [set t lput (list (sin (heading - 135)) (cos (heading - 135))) t      ]   
    if +/-180 [set t lput (list (sin (heading + 180)) (cos (heading + 180))) t       ] 

    report (patches at-points t) 
end

to lottery [ chance ]
   ask reps
   [ without-interruption
     [ if random 100 < chance
       [ let r one-of reps with [ self != myself]
         let p1 patch-here
         let p2 [ patch-here ] of r 
         setxy [pxcor] of p2 [pycor] of p2
         ask r
         [ setxy [pxcor] of p1 [pycor] of p1 
         ]
       ]
     ]
   ]
 end


to-report faction-color
   report red + faction * 30
end
@#$#@#$#@
GRAPHICS-WINDOW
258
10
773
546
50
50
5.0
1
10
1
1
1
0
1
1
1
-50
50
-50
50
0
0
1
ticks
30.0

BUTTON
81
82
136
115
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
199
10
254
43
reset
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
14
82
69
115
1 step
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
117
357
172
390
lottery
lottery swapiness
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
13
357
115
390
swapiness
swapiness
0
100
85
5
1
NIL
HORIZONTAL

SLIDER
14
10
134
43
factions
factions
1
10
9
1
1
NIL
HORIZONTAL

SWITCH
74
161
164
194
++0
++0
0
1
-1000

SWITCH
121
196
211
229
++45
++45
0
1
-1000

SWITCH
139
231
229
264
++90
++90
0
1
-1000

SWITCH
121
266
211
299
++135
++135
0
1
-1000

SWITCH
74
301
164
334
+/-180
+/-180
0
1
-1000

SWITCH
29
196
119
229
--45
--45
0
1
-1000

SWITCH
11
231
101
264
--90
--90
0
1
-1000

SWITCH
29
266
119
299
--135
--135
0
1
-1000

TEXTBOX
16
117
243
150
Rules\nSwitch on to allow movement in that direction.
11
0.0
0

TEXTBOX
13
339
207
357
Cause a lottery to change waypoints
11
0.0
0

CHOOSER
46
430
184
475
shape:
shape:
"arrow" "circle" "line"
0

SLIDER
14
45
186
78
density
density
1
100
41
1
1
%
HORIZONTAL

OUTPUT
42
486
126
554
12

BUTTON
169
83
251
116
draw-blocks
ifelse mouse-down?\n[ let me patch mouse-xcor mouse-ycor\n  if dmode = -1 [ set dmode white - [pcolor] of me ]\n  if [pcolor] of me != dmode \n     [ ask me [set pcolor dmode] ]\n  \n]\n[ set dmode -1 ]
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

arrow
true
6
Polygon -13840069 true true 150 5 40 250 150 150 260 250

circle
false
6
Circle -13840069 true true 0 0 300

clock
true
6
Circle -13840069 true true 0 0 300
Circle -1 true false 30 30 240
Rectangle -2674135 true false 135 0 165 150

line
true
6
Line -13840069 true 150 0 150 300

link
true
0
Line -7500403 true 150 0 150 300

link direction
true
0
Line -7500403 true 150 150 30 225
Line -7500403 true 150 150 270 225

x
true
6
Polygon -13840069 true true 90 30 150 120 240 45 285 120 180 165 255 255 195 300 150 180 60 285 15 225 120 150 30 60

@#$#@#$#@
NetLogo 5.1.0
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
0
@#$#@#$#@
