  ::
::::  UART helper library
::
::
|%
+$  cc-name  $?
    %vintr
    %vquit
    %verase
    %veof  
    %vtime 
    %vmin  
    %vswtc 
    %vstart
    %vstop 
    %vsusp 
    %veol  
    %vreprint
    %vdiscard
    %vwerase 
    %vlnext  
    %veol2   
  ==
++  termios
  |%
  +$  iflag  @
  +$  oflag  @
  +$  cflag  @
  +$  lflag  @
  +$  line   @
  +$  cc     (map cc-name @)
  +$  ispeed  @
  +$  ospeed  @
  -- ::termio
::
++  unpack
  |=  bytestr=@
  ^-  termios
  =/  termios  ^termios
  termios
--
