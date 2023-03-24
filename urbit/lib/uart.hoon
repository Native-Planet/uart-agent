  ::
::::  UART helper library
::
::
|%
+$  cc-name  $:
    vintr=@uxC
    vquit=@uxC
    verase=@uxC
    vkill=@uxC
    veof=@uxC
    vtime=@uxC
    vmin=@uxC
    vswtc=@uxC
    vstart=@uxC
    vstop=@uxC
    vsusp=@uxC
    veol=@uxC
    vreprint=@uxC
    vdiscard=@uxC
    vwerase=@uxC
    vlnext=@uxC
    veol2=@uxC
  ==
+$  termios   
  $:
    iflag=@ux
    oflag=@ux
    cflag=@ux
    lflag=@ux
    line=@uxC
    cc=cc-name
  == ::termio
::
++  baud  |%
  ++  cbaud     10.017
  ++  b0        0
  ++  b50       1
  ++  b75       2
  ++  b110      3
  ++  b134      4
  ++  b150      5
  ++  b200      6
  ++  b300      7
  ++  b600      10
  ++  b1200     11
  ++  b1800     12
  ++  b2400     13
  ++  b4800     14
  ++  b9600     15
  ++  b19200    16
  ++  b38400    17
  ++  b57600    10.001
  ++  b115200   10.002
  ++  b230400   10.003
  ++  b460800   10.004
  ++  b500000   10.005
  ++  b576000   10.006
  ++  b921600   10.007
  ++  b1000000  10.010
  ++  b1152000  10.011
  ++  b1500000  10.012
  ++  b2000000  10.013
  ++  b2500000  10.014
  ++  b3000000  10.015
  ++  b3500000  10.016
  ++  b4000000  10.017
--
::
++  unpack-term
  |=  bytestr=@
  ^-  termios
  =/  termios  *termios
  %_  termios
    iflag  (cut 3 [0 4] bytestr)
    oflag  (cut 3 [4 4] bytestr)
    cflag  (cut 3 [8 4] bytestr)
    lflag  (cut 3 [12 4] bytestr)
    line   (cut 3 [16 1] bytestr)
    vintr.cc     (cut 3 [17 1] bytestr)
    vquit.cc     (cut 3 [18 1] bytestr)
    verase.cc    (cut 3 [19 1] bytestr)
    vkill.cc     (cut 3 [20 1] bytestr)
    veof.cc      (cut 3 [21 1] bytestr)
    vtime.cc     (cut 3 [22 1] bytestr)
    vmin.cc      (cut 3 [23 1] bytestr)
    vswtc.cc     (cut 3 [24 1] bytestr)
    vstart.cc    (cut 3 [25 1] bytestr)
    vstop.cc     (cut 3 [26 1] bytestr)
    vsusp.cc     (cut 3 [27 1] bytestr)
    veol.cc      (cut 3 [28 1] bytestr)
    vreprint.cc  (cut 3 [29 1] bytestr)
    vdiscard.cc  (cut 3 [30 1] bytestr)
    vwerase.cc   (cut 3 [31 1] bytestr)
    vlnext.cc    (cut 3 [32 1] bytestr)
    veol2.cc     (cut 3 [33 1] bytestr)
  ==
  ::termios
::
++  set-speed
  |=  [term=termios speed=@]
  ^-  termios
  %_  term
    cflag   (con (dis cflag.term (not 5 1 cbaud:baud)) speed)
  ==
::
++  get-speed
  |=  =termios
  ^-  @ud
  (dis cflag.termios cbaud:baud)
::
++  tcgets  0x5401
++  tcsets  0x5402
++  tcsbrk  0x5409
++  tcxonc  0x540A
++  tcflsh  0x540B
--
