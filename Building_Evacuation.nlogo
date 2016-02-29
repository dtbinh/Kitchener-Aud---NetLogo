extensions[ bitmap ]

globals [
  row
  aisle 
  goal-x goal-y
  n
]

patches-own [path?]
turtles-own [direction
  fast?
  fear?
  other-nearby]

to setup ; linked with setup button on interface
  clear-all
 ; bitmap:copy-to-pcolors (bitmap:import "aud.png") true
  
  setup-patches ;declaration, created further down in code
  
  set-default-shape turtles "person" ;makes them look like people
  ask n-of number patches with [pcolor = blue]  ; makes turtles sprout on blue patches only
  [
    sprout 1 [
      if count neighbors4 with [pcolor = brown] = 4 [ die ]  
      set size 1              ;; setting turtle size
      facexy -132 55 ; initial direction faceing
      set direction 1
      set color green     ;initial color
      if xcor mod 2 != 0 [set fast? false] ;seting half the turtles to have boolean fast? false
      if xcor mod 2 = 0 [set fast? true]
      if turtles != red [set fear? false]; sets turtles not red to not have fear
      
                                         ;Kirwan
      if xcor <= 6 and xcor >= -6 [walk1];calls function walk one for turtles in specified zone
      
      
      if xcor <= 0 and xcor >= -7 [ set heading -90] ;tells turtles in zone what direction to face
      if xcor > 0 and xcor <= 7 [ set heading 90]
      if xcor >= -11 and xcor < -7 [set heading 90]
      if xcor <= 11 and xcor > 7 [set heading -90]
      
      ;Larmour
      if xcor <= 30 and xcor >= 16 [walk1]
      
      ;Dillon
      
      if xcor <= -16 and xcor >= -30 [walk1]    
      
      ;AC201
      
      if xcor < 56 and xcor >= 35 [walk1]
      
      ;AC202
      
      if xcor >= 57 and ycor < 48 and xcor <= 72 and ycor >= 40  [ set heading 0 ]
      
      ;AC203
      
      if xcor >= 73 and ycor < 48 and xcor < 84 and ycor >= 40 [set heading 0]
      
      ;AC204
      
      if xcor >= 84 and ycor < 48 and xcor <= 95 and ycor >= 40 [set heading 0]
      
      ;O'Flaherty
      if xcor = 102 and ycor > 10 and ycor < 42 [ set heading 0]
      if xcor = 103 and ycor > 10 and ycor < 42 [ set heading 0]
      if xcor = 114 and ycor > 10 and ycor < 42 [ set heading 0]
      if xcor = 115 and ycor > 10 and ycor < 42 [ set heading 0]
      
      if xcor >= 96 and xcor <= 100 [set heading 90]
      if xcor >= 115 and xcor <= 118 [set heading -90]
      if xcor >= 102 and xcor <= 113 [walk1]  
      
      ;D'arcy Thompson
      if xcor >= 120 and xcor <= 134 [walk1] 
      
      ;Cairne
      if xcor >= 136 and xcor <= 139 [set heading 90]
      if xcor >= 155 and xcor <= 158 [set heading -90]
      if xcor >= 141 and xcor <= 153 [walk1]
      
      ;McMunn
      if xcor < -127 and xcor > -138 [walk1]
      
    ]
    
  ]
  fear ;calls function fear
  reset-ticks
end

to walk1 ;function earlier called
  
  ifelse ((random 2) = 0);allows turtles randomly decide if they will go left or right in rows.
    [
      go-left
    ]
    [
      go-right
    ]
  
end

to go-left 
  set heading 90
end
to go-right
  set heading -90
end

to setup-patches 
  ;creates rows, aisles, concourse and exits
  draw-row
  draw-concourse
  draw-aisle
  draw-exit1
  draw-exit2
  draw-exit3
  draw-exit4
  draw-exit5
  draw-exit6
  draw-exit7
  draw-exit8
  draw-exit9
  draw-exit10
  draw-exit11
  draw-exit12
  draw-exit13
  draw-exit14
  draw-exit15
  draw-exit16
  
  ;Labels
  ask patch -1 -21[
    set plabel-color white
    set plabel "Kirwan"]
  
  ask patch 24 22[
    set plabel-color white
    set plabel "Larmour"]
  
  ask patch -24 22[
    set plabel-color white
    set plabel "Dillon"]
  
  ask patch 44 38[
    set plabel-color white
    set plabel "AC201"]
  
  ask patch 63 38 [
    set plabel-color white
    set plabel "AC202"]
  
  ask patch 80 38 [
    set plabel-color white
    set plabel "AC203"]
  
  ask patch 90 38 [
    set plabel-color white
    set plabel "AC204"]
  
  ask patch 110 7 [
    set plabel-color white
    set plabel "O'Flaherty"]
  
  ask patch 135 -2 [
    set plabel-color white
    set plabel "D'arcy Thompson"]
  
  ask patch 146 18 [
    set plabel-color white
    set plabel "Cairnes"]
  
  ask patch -130 24 [
    set plabel-color white
    set plabel "McMunn"]
  
  ask patch -38 37 [
    set plabel-color white
    set plabel "Media Centre"]
  
  ask patch -50 37 [
    set plabel-color white
    set plabel "Smokey's Café"]
  
  ask patch 2 71[
    set plabel-color Black
    set plabel "Stairs"]
  
end

to draw-concourse
  ask patches with [pycor >= 41 and pycor <= 54 and pxcor >= -139 and pxcor <= 34];asks particular zone of patches to turn their color to brown
  [set pcolor brown]
  ask patches with [pycor >= 49 and pycor <= 54 and pxcor >= 35 and pxcor <= 158]
  [set pcolor brown]
  ask patches with [pxcor >= -15 and pycor >= 24 and pxcor <= 15 and pycor <= 48]
  [set pcolor brown] 
  ask patches with [pxcor >= 16 and pycor >= 39 and pxcor <= 34 and pycor <= 48]
  [set pcolor brown]
  ask patches with [pxcor <= -16 and pycor >= 39 and pxcor >= -34 and pycor <= 48]
  [set pcolor brown]
  ask patches with [pxcor >= -11 and pycor >= 55 and pxcor <= 11 and pycor <= 85]
  [set pcolor brown]
  ask patches with [pxcor >= 95 and pycor >= 43 and pxcor <= 158 and pycor <= 48]
  [set pcolor brown]
  ask patches with [pxcor >= 119 and pycor >= 23 and pxcor <= 135 and pycor <= 42]
  [set pcolor brown]
  ask patches with [pxcor >= -84 and pycor >= 39 and pxcor <= -60 and pycor <= 45]
  [set pcolor brown]
  ask patches with [pxcor >= -64 and pycor >= 46 and pxcor <= -50 and pycor <= 48]
  [set pcolor brown]
  ask patches with [pxcor >= -3 and pycor >= 68 and pxcor <= 3 and pycor <= 78]
  [set pcolor white]
  
  ;media centre
  ask patches with [pxcor <= -35 and pycor <= 48 and pxcor > -50 and pycor >= 39]
  [set pcolor white]
  
  ;smokies cafe
  ask patches with [pxcor <= -50 and pycor <= 45 and pxcor > -62 and pycor >= 39]
  [set pcolor green]
  
  ;smokies seating
  ask patches with [pxcor <= -65 and pycor <= 48 and pxcor > -85 and pycor >= 45]
  [set pcolor brown]
  ask patches with [pxcor <= -85 and pycor <= 48 and pxcor > -126 and pycor >= 39]
  [set pcolor brown]
  ;table1
  ask patches with [pxcor <= -72 and pycor = 39 and pxcor >= -75]
  [set pcolor blue]
  ask patches with [pxcor <= -72 and pycor = 42 and pxcor >= -75]
  [set pcolor blue]
  ask patches with [pxcor = -77 and pycor >= 40 and pycor <= 41]
  [set pcolor blue]
  ask patches with [pxcor = -70 and pycor >= 40 and pycor <= 41]
  [set pcolor blue]
  ;table 2
  ask patches with [pxcor <= -81 and pycor = 39 and pxcor >= -84]
  [set pcolor blue]
  ask patches with [pxcor <= -81 and pycor = 42 and pxcor >= -84]
  [set pcolor blue]
  ask patches with [pxcor = -86 and pycor >= 40 and pycor <= 41]
  [set pcolor blue]
  ask patches with [pxcor = -79 and pycor >= 40 and pycor <= 41]
  [set pcolor blue]
  ;table 3
  ask patches with [pxcor <= -90 and pycor = 39 and pxcor >= -93]
  [set pcolor blue]
  ask patches with [pxcor <= -90 and pycor = 42 and pxcor >= -93]
  [set pcolor blue]
  ask patches with [pxcor = -95 and pycor >= 40 and pycor <= 41]
  [set pcolor blue]
  ask patches with [pxcor = -88 and pycor >= 40 and pycor <= 41]
  [set pcolor blue]
  ;table 4
  ask patches with [pxcor <= -99 and pycor = 39 and pxcor >= -102]
  [set pcolor blue]
  ask patches with [pxcor <= -99 and pycor = 42 and pxcor >= -102]
  [set pcolor blue]
  ask patches with [pxcor = -104 and pycor >= 40 and pycor <= 41]
  [set pcolor blue]
  ask patches with [pxcor = -97 and pycor >= 40 and pycor <= 41]
  [set pcolor blue]
  ;table 5
  ask patches with [pxcor <= -108 and pycor = 39 and pxcor >= -111]
  [set pcolor blue]
  ask patches with [pxcor <= -108 and pycor = 42 and pxcor >= -111]
  [set pcolor blue]
  ask patches with [pxcor = -113 and pycor >= 40 and pycor <= 41]
  [set pcolor blue]
  ask patches with [pxcor = -106 and pycor >= 40 and pycor <= 41]
  [set pcolor blue]
  ;table 6
  ask patches with [pxcor <= -81 and pycor = 44 and pxcor >= -84]
  [set pcolor blue]
  ask patches with [pxcor <= -81 and pycor = 47 and pxcor >= -84]
  [set pcolor blue]
  ask patches with [pxcor = -86 and pycor >= 45 and pycor <= 46]
  [set pcolor blue]
  ask patches with [pxcor = -79 and pycor >= 45 and pycor <= 46]
  [set pcolor blue]
  ;table 7
  ask patches with [pxcor <= -90 and pycor = 44 and pxcor >= -93]
  [set pcolor blue]
  ask patches with [pxcor <= -90 and pycor = 47 and pxcor >= -93]
  [set pcolor blue]
  ask patches with [pxcor = -95 and pycor >= 45 and pycor <= 46]
  [set pcolor blue]
  ask patches with [pxcor = -88 and pycor >= 45 and pycor <= 46]
  [set pcolor blue]
  ;table 8
  ask patches with [pxcor <= -99 and pycor = 44 and pxcor >= -102]
  [set pcolor blue]
  ask patches with [pxcor <= -99 and pycor = 47 and pxcor >= -102]
  [set pcolor blue]
  ask patches with [pxcor = -104 and pycor >= 45 and pycor <= 46]
  [set pcolor blue]
  ask patches with [pxcor = -97 and pycor >= 45 and pycor <= 46]
  [set pcolor blue]
  ;table 9
  ask patches with [pxcor <= -108 and pycor = 44 and pxcor >= -111]
  [set pcolor blue]
  ask patches with [pxcor <= -108 and pycor = 47 and pxcor >= -111]
  [set pcolor blue]
  ask patches with [pxcor = -113 and pycor >= 45 and pycor <= 46]
  [set pcolor blue]
  ask patches with [pxcor = -106 and pycor >= 45 and pycor <= 46]
  [set pcolor blue]
  ;table 10
  ask patches with [pxcor <= -117 and pycor = 44 and pxcor >= -120]
  [set pcolor blue]
  ask patches with [pxcor <= -117 and pycor = 47 and pxcor >= -120]
  [set pcolor blue]
  ask patches with [pxcor = -122 and pycor >= 45 and pycor <= 46]
  [set pcolor blue]
  ask patches with [pxcor = -115 and pycor >= 45 and pycor <= 46]
  [set pcolor blue]  
end

to draw-row;draws rows in the theatres....turtles can sprout here
           ;Kirwan  
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 23]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 21]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 19]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 17]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 15]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 13]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 11]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 9]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 7]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 5]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 3]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = 1]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = -1]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = -3]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = -5]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = -7]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = -9]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = -11]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = -13]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = -15]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = -17]
    [set pcolor blue]
  ask patches with [pxcor < 12 and pxcor > -12 and pycor = -19]
    [set pcolor blue]
  
  ;Larmour
  ask patches with [pxcor < 29 and pxcor > 17 and pycor = 38]
    [set pcolor blue]
  ask patches with [pxcor < 29 and pxcor > 17 and pycor = 36]
    [set pcolor blue]
  ask patches with [pxcor < 29 and pxcor > 17 and pycor = 34]
    [set pcolor blue]
  ask patches with [pxcor < 29 and pxcor > 17 and pycor = 32]
    [set pcolor blue]
  ask patches with [pxcor < 29 and pxcor > 17 and pycor = 30]
    [set pcolor blue]
  ask patches with [pxcor < 29 and pxcor > 17 and pycor = 28]
    [set pcolor blue]
  ask patches with [pxcor < 29 and pxcor > 17 and pycor = 26]
    [set pcolor blue]
  ask patches with [pxcor < 29 and pxcor > 17 and pycor = 24]
    [set pcolor blue]   
  
  ;Dillon 
  ask patches with [pxcor < -17 and pxcor > -29 and pycor = 38]
    [set pcolor blue]
  ask patches with [pxcor < -17 and pxcor > -29 and pycor = 36]
    [set pcolor blue]
  ask patches with [pxcor < -17 and pxcor > -29 and pycor = 34]
    [set pcolor blue]
  ask patches with [pxcor < -17 and pxcor > -29 and pycor = 32]
    [set pcolor blue]
  ask patches with [pxcor < -17 and pxcor > -29 and pycor = 30]
    [set pcolor blue]
  ask patches with [pxcor < -17 and pxcor > -29 and pycor = 28]
    [set pcolor blue]
  ask patches with [pxcor < -17 and pxcor > -29 and pycor = 26]
    [set pcolor blue]
  ask patches with [pxcor < -17 and pxcor > -29 and pycor = 24]
    [set pcolor blue]
  
  ;AC201
  ask patches with [pxcor < 56 and pxcor > 35 and pycor = 40]
    [set pcolor blue]      
  ask patches with [pxcor < 56 and pxcor > 35 and pycor = 42]
    [set pcolor blue]
  ask patches with [pxcor < 56 and pxcor > 35 and pycor = 44]
    [set pcolor blue]
  ask patches with [pxcor < 52 and pxcor > 39 and pycor = 46]
    [set pcolor blue]
  
  ;AC202
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 58]
  [set pcolor blue] 
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 60]
    [set pcolor blue]  
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 62]
    [set pcolor blue] 
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 64]
    [set pcolor blue] 
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 66]
    [set pcolor blue]   
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 68]
    [set pcolor blue]    
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 70]
    [set pcolor blue] 
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 72]
    [set pcolor blue] 
  
  
  ;AC203
  ask patches with [pycor <= 48 and pycor > 39 and pxcor = 73]
    [set pcolor yellow]
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 75]
    [set pcolor blue]
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 77]
    [set pcolor blue]
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 79]
    [set pcolor blue]
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 81]
    [set pcolor blue]
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 83]
    [set pcolor blue]
  
  ;AC204
  ask patches with [pycor <= 48 and pycor > 39 and pxcor = 84]
    [set pcolor yellow]
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 86]
    [set pcolor blue]
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 88]
    [set pcolor blue]
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 90]
    [set pcolor blue]
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 92]
    [set pcolor blue]
  ask patches with [pycor < 48 and pycor > 39 and pxcor = 94]
    [set pcolor blue]
  
  ;O'Flaherty
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 42]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 40]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 38]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 36]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 34]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 32]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 30]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 28]
    [set pcolor blue] 
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 26]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 24]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 22]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 20]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 18]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 16]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 14]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 12]
    [set pcolor blue]
  ask patches with [pxcor <= 100 and pxcor > 96 and pycor = 10]
    [set pcolor blue] 
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 42]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 40]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 38]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 36]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 34]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 32]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 30]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 28]
    [set pcolor blue] 
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 26]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 24]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 22]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 20]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 18]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 16]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 14]
    [set pcolor blue]
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 12]
    [set pcolor blue] 
  ask patches with [pxcor < 113 and pxcor > 102 and pycor = 10]
    [set pcolor blue]   
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 42]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 40]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 38]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 36]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 34]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 32]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 30]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 28]
    [set pcolor blue]    
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 26]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 24]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 22]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 20]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 18]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 16]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 14]
    [set pcolor blue]
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 12]
    [set pcolor blue] 
  ask patches with [pxcor < 119 and pxcor > 114 and pycor = 10]
    [set pcolor blue]   
  
  
  ;D'arcy Thompson
  ask patches with [pxcor < 130 and pxcor >= 119 and pycor = 22]
    [set pcolor blue]
  ask patches with [pxcor < 135 and pxcor >= 119 and pycor = 20]
    [set pcolor blue]
  ask patches with [pxcor < 135 and pxcor >= 119 and pycor = 18]
    [set pcolor blue]
  ask patches with [pxcor < 135 and pxcor >= 119 and pycor = 16]
    [set pcolor blue]
  ask patches with [pxcor < 135 and pxcor >= 119 and pycor = 14]
    [set pcolor blue]
  ask patches with [pxcor < 135 and pxcor >= 119 and pycor = 12]
    [set pcolor blue]
  ask patches with [pxcor < 135 and pxcor >= 119 and pycor = 10]
    [set pcolor blue]
  ask patches with [pxcor < 135 and pxcor >= 119 and pycor = 8]
    [set pcolor blue]  
  ask patches with [pxcor < 135 and pxcor >= 119 and pycor = 6]
    [set pcolor blue]   
  ask patches with [pxcor < 135 and pxcor >= 119 and pycor = 4]
    [set pcolor blue]  
  ask patches with [pxcor < 135 and pxcor >= 119 and pycor = 2]
    [set pcolor blue] 
  ask patches with [pxcor < 131 and pxcor >= 123 and pycor = 0]
    [set pcolor blue]
  
  ;Cairnes
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 42]
    [set pcolor blue]
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 40]
    [set pcolor blue]
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 38]
    [set pcolor blue]
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 36]
    [set pcolor blue]
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 34]
    [set pcolor blue]
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 32]
    [set pcolor blue]
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 30]
    [set pcolor blue]
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 28]
    [set pcolor blue]  
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 26]
    [set pcolor blue]   
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 24]
    [set pcolor blue]  
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 22]
    [set pcolor blue] 
  ask patches with [pxcor < 140 and pxcor >= 136 and pycor = 20]
    [set pcolor blue]
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 42]
    [set pcolor blue]
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 40]
    [set pcolor blue]
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 38]
    [set pcolor blue]
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 36]
    [set pcolor blue]
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 34]
    [set pcolor blue]
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 32]
    [set pcolor blue]
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 30]
    [set pcolor blue]
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 28]
    [set pcolor blue]  
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 26]
    [set pcolor blue]   
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 24]
    [set pcolor blue]  
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 22]
    [set pcolor blue] 
  ask patches with [pxcor < 153 and pxcor >= 141 and pycor = 20]
    [set pcolor blue]
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 42]
    [set pcolor blue]
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 40]
    [set pcolor blue]
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 38]
    [set pcolor blue]
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 36]
    [set pcolor blue]
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 34]
    [set pcolor blue]
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 32]
    [set pcolor blue]
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 30]
    [set pcolor blue]
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 28]
    [set pcolor blue]  
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 26]
    [set pcolor blue]   
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 24]
    [set pcolor blue]  
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 22]
    [set pcolor blue] 
  ask patches with [pxcor < 159 and pxcor >= 155 and pycor = 20]
    [set pcolor blue]
  
  ;McMunn
  ask patches with [pxcor <= -128 and pxcor >= -137 and pycor = 40]
    [set pcolor blue]
  ask patches with [pxcor <= -128 and pxcor >= -137 and pycor = 38]
    [set pcolor blue]
  ask patches with [pxcor <= -128 and pxcor >= -137 and pycor = 36]
    [set pcolor blue]
  ask patches with [pxcor <= -128 and pxcor >= -137 and pycor = 34]
    [set pcolor blue]
  ask patches with [pxcor <= -128 and pxcor >= -137 and pycor = 32]
    [set pcolor blue]
  ask patches with [pxcor <= -128 and pxcor >= -137 and pycor = 30]
    [set pcolor blue]
  ask patches with [pxcor <= -128 and pxcor >= -137 and pycor = 28]
    [set pcolor blue]
  ask patches with [pxcor <= -128 and pxcor >= -137 and pycor = 26]
    [set pcolor blue]
  
end

to draw-aisle
  ;draws aisles in theatres, where  turtles walk
  
  ;Kirwan
  ask patches with [pxcor = -6 and pycor > -20 and pycor < 24]
    [set pcolor grey]
  ask patches with [pxcor = -7 and pycor > -20 and pycor < 24]
    [set pcolor grey]
  ask patches with [pxcor = 6 and pycor > -20 and pycor < 24]
    [set pcolor grey]
  ask patches with [pxcor = 7 and pycor > -20 and pycor < 24]
    [set pcolor grey]
  
  ;Larmour
  ask patches with [pxcor = 17 and pycor > 23 and pycor < 39]
    [set pcolor grey]
  ask patches with [pxcor = 16 and pycor > 23 and pycor < 39]
    [set pcolor grey]
  ask patches with [pxcor = 29 and pycor > 23 and pycor < 39]
    [set pcolor grey]
  ask patches with [pxcor = 30 and pycor > 23 and pycor < 39]
    [set pcolor grey]
  
  ;Dillon
  ask patches with [pxcor = -17 and pycor > 23 and pycor < 39]
    [set pcolor grey]
  ask patches with [pxcor = -16 and pycor > 23 and pycor < 39]
    [set pcolor grey]
  ask patches with [pxcor = -29 and pycor > 23 and pycor < 39]
    [set pcolor grey]
  ask patches with [pxcor = -30 and pycor > 23 and pycor < 39]
    [set pcolor grey]
  
  ;Ac201
  ask patches with [pxcor = 35 and pycor > 39 and pycor <= 48]
    [set pcolor grey]
  ask patches with [pxcor = 56 and pycor > 39 and pycor <= 48]
    [set pcolor grey]
  ask patches with [pycor = 48 and pxcor > 35 and pxcor < 56]
    [set pcolor grey]
  ask patches with [pycor = 46 and pxcor > 35 and pxcor < 40]
    [set pcolor grey]
  ask patches with [pycor = 46 and pxcor > 51 and pxcor < 56]
    [set pcolor grey]
  
  ;AC202
  ask patches with [pycor = 48 and pxcor > 56 and pxcor < 73]
    [set pcolor grey]
  
  ;AC203
  ask patches with [pycor = 48 and pxcor > 73 and pxcor < 84]
    [set pcolor grey]
  
  ;AC204
  ask patches with [pycor = 48 and pxcor > 84 and pxcor < 95]
    [set pcolor grey]
  
  ;O'Flaherty
  ask patches with [pxcor = 101 and pycor >= 10 and pycor <= 42]
    [set pcolor grey]
  ask patches with [pxcor = 102 and pycor >= 10 and pycor <= 42]
    [set pcolor grey]
  ask patches with [pxcor = 113 and pycor >= 10 and pycor <= 42]
    [set pcolor grey]
  ask patches with [pxcor = 114 and pycor >= 10 and pycor <= 42]
    [set pcolor grey]
  
  ;D'arcy Thompson
  ask patches with [pxcor = 119 and pycor >= 0 and pycor <= 22]
    [set pcolor grey]
  ask patches with [pxcor = 135 and pycor >= 0 and pycor <= 22]
    [set pcolor grey]
  ask patches with [pycor = 22 and pxcor >= 130 and pxcor <= 134]
    [set pcolor grey]
  ask patches with [pycor = 0 and pxcor >= 120 and pxcor <= 123]
    [set pcolor grey]
  ask patches with [pycor = 0 and pxcor >= 130 and pxcor <= 134]
    [set pcolor grey]
  
  ;Cairnes
  ask patches with [pxcor = 141 and pycor >= 20 and pycor <= 42]
    [set pcolor grey]
  ask patches with [pxcor = 140 and pycor >= 20 and pycor <= 42]
    [set pcolor grey]
  ask patches with [pxcor = 153 and pycor >= 20 and pycor <= 42]
    [set pcolor grey]
  ask patches with [pxcor = 154 and pycor >= 20 and pycor <= 42]
    [set pcolor grey]
  
  ;McMunn
  ask patches with [pxcor = -139 and pycor >= 26 and pycor < 41]
    [set pcolor grey]
  ask patches with [pxcor = -138 and pycor >= 26 and pycor < 41]
    [set pcolor grey]
  ask patches with [pxcor = -127 and pycor >= 26 and pycor < 41]
    [set pcolor grey]
  ask patches with [pxcor = -126 and pycor >= 26 and pycor < 41]
    [set pcolor grey]
  
end

to draw-exit1
  ;exits at top of concourse area, where turtles will leave
  set goal-x -7
  set goal-y 85
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit2
  set goal-x 0
  set goal-y 85
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit3
  set goal-x 7
  set goal-y 85
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit4
  set goal-x -133
  set goal-y 55
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit5
  set goal-x -132
  set goal-y 55
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit6
  set goal-x -130
  set goal-y 55
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit7
  set goal-x -135
  set goal-y 55
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit8
  set goal-x 153
  set goal-y 55
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit9
  set goal-x 152
  set goal-y 55
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit10
  set goal-x 150
  set goal-y 55
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit11
  set goal-x 149
  set goal-y 55
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit12
  set goal-x -8
  set goal-y 85
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit13
  set goal-x -1
  set goal-y 85
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to draw-exit14
  set goal-x 8
  set goal-y 85
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end
to draw-exit15
  set goal-x -6
  set goal-y 85
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end
to draw-exit16
  set goal-x 6
  set goal-y 85
  ask patch goal-x goal-y [
    sprout 1 [ set pcolor red
      set shape "square"  
    ]
  ]
end

to go
  ask turtles with [pcolor != red] [walk] ;asks turtles with patch color not equal to red carry out function walk
  
  if all? turtles [ pcolor = red ];stops simuation
    [ stop ]
  spread
  tick
  
end

to spread ;this is the spread of fear.
          ;when one turtle with fear is near another without,
          ;the other has a chance of also getting scared, according to slider on interface, spreadfear
  
  ask turtles with [fear? = true and pcolor != red]
    [ ask other turtles-here with [fear? = false ]
      [ if (random-float 100) < spreadfear
        [ getscared ] ] ]
  
end

to walk; tells what directions turtles are to go in, and to actually move.
  
       ;Kirwan
  if xcor >= 6 and xcor <= 7 and ycor > -20 and ycor < 24 [set heading 0]
  if xcor <= -6 and xcor >= -7 and ycor > -20 and ycor < 24 [set heading 0]
  ;if xcor = 7 and ycor > -20 and ycor < 24 [set heading 0]
  ;if xcor = -7 and ycor > -20 and ycor < 24 [set heading 0]
  
  ;Larmour
  if xcor <= 17 and xcor >= 16 and ycor >= 23 and ycor <= 39 [set heading 0]
  if xcor >= 29 and xcor <= 30 and ycor >= 23 and ycor <= 39 [set heading 0]
  
  ;Dillon
  if xcor >= -17 and xcor <= -16 and ycor > 23 and ycor < 39 [set heading 0]
  if xcor <= -29 and xcor >= -30 and ycor > 23 and ycor < 39 [set heading 0]
  
  ;AC201
  if xcor = 35 and ycor < 48 and ycor > 39 [set heading 0]
  if xcor = 56 and ycor < 48 and ycor > 39 [set heading 0] 
  
  ;AC202
  if xcor > 57 and xcor <= 64 and ycor = 48 [set heading -90]
  if xcor > 64 and xcor < 72 and ycor = 48 [set heading 90]
  
  ;AC203
  if xcor > 74 and xcor <= 84 and ycor = 48 [set heading -90]
  
  ;AC204
  if xcor >= 86 and xcor <= 95 and ycor = 48 [set heading -90] 
  
  ;O'Flaherty
  if xcor >= 101 and xcor <= 102 and ycor > 9 and ycor < 43[set heading 0]
  ;if xcor = 102 and ycor > 9 and ycor < 43[set heading 0]
  if xcor >= 113 and xcor <= 114 and ycor > 9 and ycor < 43[set heading 0]
  ;if xcor = 114 and ycor > 9 and ycor < 43[set heading 0]
  
  ;D'arcy Thompson
  if xcor >= 119.0 and xcor <= 119.99 and ycor > -1 and ycor < 23[set heading 0]
  if xcor >= 135.0 and xcor <= 135.99 and ycor > -1 and ycor < 23[set heading 0]
  
  ;Cairnes
  if xcor >= 140.0 and xcor <= 141.9 and ycor < 43 [set heading 0]
  ;if xcor = 141 and ycor < 43 [set heading 0]
  if xcor >= 153.0 and xcor <= 154.9 and ycor < 43 [set heading 0]
  ;if xcor = 154 and ycor < 43 [set heading 0]
  
  ;;McMunn
  if xcor >= -139 and xcor <= -138 and ycor > 25 and ycor < 41[set heading 0]
  ;if xcor = -138 and ycor > 25 and ycor < 41[set heading 0]
  if xcor >= -127 and xcor <= -126 and ycor > 25 and ycor < 41[set heading 0]
  ;if xcor = -126 and ycor > 25 and ycor < 41[set heading 0]
  
  if fear? = true [fd 1] ;if scared, turtles move faster.
  if fear? = false  [fd .5]
  
  exit
end

to fear
  ;ask some initialy scared turtles to get scared
  ask n-of initially-scared turtles with [size = 1] [getscared] 
  
end
to getscared ;changes turtles
  set color red 
  set fear? true
end

to exit ;directs turtles to exits after they leave theatres
  
  ask turtles with [pxcor > 13 and pxcor < 98 and pycor <= 52 and pycor >= 51] [ set heading -90]
  ask turtles with [pxcor = 10 and pycor <= 52 and pycor >= 51] [face one-of turtles with [shape = "square" and xcor > 5 and xcor < 9 and ycor = 85]]
  ask turtles with [fear? = true and fast? = true and pycor = 55 and pxcor <= 13 and pxcor >= -13] [face one-of turtles with [shape = "square" and xcor > -9 and xcor < -5 and ycor = 85]]
  ask turtles with [pcolor = white] [die]
  
  ;Cairnes
  ask turtles with [pxcor >= 137.0 and pycor >= 43 and pycor <= 44 and pxcor <= 157.9] [face one-of turtles with [shape = "square" and xcor > 131 and ycor = 55 ]]
  
  ;D'arcy Thompson
  ask turtles with [pxcor >= 119 and pxcor <= 120 and pycor = 32] [face one-of turtles with [shape = "square" and xcor > 131 and ycor = 55]]
  ask turtles with [pxcor >= 135.0 and pxcor <= 135.99 and pycor = 43] [face one-of turtles with [shape = "square" and xcor > 131 and ycor = 55]]
  ask turtles with [pxcor >= 133 and pxcor <= 136 and pycor = 47] [face one-of turtles with [shape = "square" and xcor > 131 and ycor = 55]]
  
  ;O'Flaherty
  ask turtles with [pxcor >= 100 and pycor >= 43 and pycor <= 44 and pxcor <= 116] [face one-of turtles with [shape = "square" and xcor > 131 and ycor = 55 ]]
  
  ;AC204
  ask turtles with [pxcor = 85 and pycor = 48] [set heading 0]
  ask turtles with [pxcor = 85 and pycor = 49] [face one-of turtles with [shape = "square" and xcor > 131 and ycor = 55]]
  
  ;AC203
  ask turtles with [pxcor = 74 and pycor = 48] [set heading 0]
  ask turtles with [pxcor = 74 and pycor = 49] [face one-of turtles with [shape = "square" and xcor > -17 and ycor > 50]] 
  
  ;AC202
  ask turtles with [pxcor = 72 and pycor = 48] [ set heading 0]
  ask turtles with [pxcor = 57 and pycor = 48] [set heading 0]
  ask turtles with [pxcor = 72 and pycor = 49] [face one-of turtles with [shape = "square" and xcor > -17 and ycor > 50]]
  ask turtles with [pxcor = 57 and pycor = 49] [face one-of turtles with [shape = "square" and xcor > -17 and ycor > 50]]
  
  ;AC201
  ask turtles with [pxcor = 56 and pycor = 48] [set heading 0]
  ask turtles with [pxcor = 35 and pycor = 48] [set heading 0]
  ask turtles with [pxcor = 56 and pycor = 49] [face one-of turtles with [shape = "square" and xcor > 5 and xcor < 9 and ycor = 85]]
  ask turtles with [pxcor = 35 and pycor = 49] [face one-of turtles with [shape = "square" and xcor > 5 and xcor < 9 and ycor = 85]]
  
  ;McMunn
  ask turtles with [pxcor >= -140 and pycor = 42 and pxcor <= -125] [face one-of turtles with [shape = "square" and xcor <= -130 and xcor >= -135 and ycor = 55 ]]
  
  ;Dillon
  ask turtles with [pxcor >= -33 and pycor >= 39 and pycor <= 40 and pxcor <= -14] [face patch -10 52]
  ask turtles with [pxcor = -10 and pycor = 52] [face one-of turtles with [shape = "square" and xcor < -5 and xcor > -9 and ycor = 85]]
  ask turtles with [pxcor = -15 and pycor = 43 and fear? = true and fast? = true] [face turtle 2]
  
  ;Larmour
  ask turtles with [pxcor >= 14 and pycor = 39 and pxcor <= 33] [face patch 10 52]
  ask turtles with [pxcor = 29 and pycor = 49 and fear? = true and fast? = true] [face one-of turtles with [shape = "square" and xcor > 131 and ycor = 55 ]]
end
@#$#@#$#@
GRAPHICS-WINDOW
271
40
1139
342
200
-1
2.142
1
10
1
1
1
0
1
1
1
-200
200
-26
100
0
0
1
ticks
30.0

BUTTON
24
30
87
63
setup
setup
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

BUTTON
113
31
176
64
go
go
T
1
T
OBSERVER
NIL
G
NIL
NIL
0

SLIDER
20
76
192
109
number
number
0
1600
336
1
1
NIL
HORIZONTAL

MONITOR
17
270
88
315
Not exited
count turtles with [pcolor != red]
3
1
11

PLOT
5
323
205
473
Time to exit
Time
Exit
0.0
50.0
0.0
60.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot count turtles with [pcolor = red] - 16"

MONITOR
131
270
201
315
Time (sec)
ticks
17
1
11

MONITOR
17
212
103
257
Num in Kirwin
count turtles with [pxcor >= -13 and pycor < 24 and pxcor <= 13]
17
1
11

SLIDER
18
163
190
196
initially-scared
initially-scared
0
number
190
1
1
NIL
HORIZONTAL

MONITOR
111
212
208
257
Number Scared
count turtles with [fear? = true]
17
1
11

SLIDER
19
117
191
150
spreadfear
spreadfear
0
100.0
93.6
0.1
1
%
HORIZONTAL

@#$#@#$#@
## WHAT IS IT?

This is an evacuation simulation of the concourse building at the National University of Ireland, Galway. It uses the main theatres and classrooms in the building.

## HOW IT WORKS

Agents are randomly placed in the theatres and the seating area of the café.When the simulation begins, all agents move to the exits.

## HOW TO USE IT

Number is the inital number of people in the model.Initially scared is the number of people at the beginning of the model who are 'afraid'.Spreadfear is the level that fear spreads from one person to another.

## THINGS TO NOTICE

The model incorporates fear and how it spreads which cause the agents to act erratically.

## THINGS TO TRY

Try altering the number of people within the model, the number of people initally afraid and the level that fear spreads.These factors can greatly alter the efficiency of the evacuation.

## CREDITS AND REFERENCES

Credit goes to Conor Horan and David Haynes of NUIG.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.1.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="experiment" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>count turtles</metric>
    <enumeratedValueSet variable="number">
      <value value="662"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initially-scared">
      <value value="131"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>count turtles with [pcolor = red]</metric>
    <enumeratedValueSet variable="number">
      <value value="662"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initially-scared">
      <value value="131"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>count turtles with [pcolor = red]</metric>
    <enumeratedValueSet variable="number">
      <value value="163"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initially-scared">
      <value value="44"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment REAL" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="500"/>
    <metric>count turtles with [pcolor = red]</metric>
    <enumeratedValueSet variable="initially-scared">
      <value value="44"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="spreadfear">
      <value value="20.4"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number">
      <value value="224"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
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
