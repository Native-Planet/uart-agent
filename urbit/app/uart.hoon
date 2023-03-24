/-  *uart
/+  default-agent, dbug, uart
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  [%0 term=(map dev:loch termios:uart) read=(map dev:loch [@ @]) write=(map dev:loch @)]
  ==
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this     .
    default  ~(. (default-agent this %|) bowl)
++  on-init   on-init:default
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  `this(state !<(state-0 old))
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?>  ?=(%uart-action mark)
  =/  act  !<(action vase)
  ?-    -.act
      %read
    :_  this
    [%pass /read/(scot %tas dev.act)/(scot %tas wut.act) %arvo %l %read dev.act wut.act cmd.act cnt.act]~
  ::
      %rite
    :_  this
    [%pass /rite/(scot %tas dev.act)/(scot %tas wut.act) %arvo %l %rite dev.act wut.act cmd.act dat.act cnt.act]~
  ::
      %getattr
    :_  this
    [%pass /getattr/(scot %tas dev.act) %arvo %l %read dev.act %con tcgets:uart 60]~
  ::
      %setattr
    =/  termios  (pack-term:uart (~(got by term:this) dev.act))
    :_  this
    [%pass /setattr/(scot %tas dev.act) %arvo %l %rite dev.act %con tcsets:uart termios 60]~
  ::
      %setspeed
    :-  ~
      =/  termios  (set-speed:uart (~(got by term:this) dev.act) baud.act)
      %_  this
       term  (~(put by term) dev.act termios)
      ==
  ::
      %tcdrain
    :_  this
    ~
  ::
      %tcflow
    :_  this
    ~
  ::
      %tcflush
    :_  this
    ~
  ::
      %tcsendbreak
    :_  this
    ~
  ==
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ~&  >>  path
  =/  dev  `@tas`(snag 2 path)
  ?+  path  (on-peek:default path)
    [%s %seen *]  ``noun+!>((~(get by read) dev))
    [%s %wrot *]  ``noun+!>((~(get by write) dev))
  ==
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  =/  cmd    (snag 0 wire)
  =/  device  (snag 1 wire)
  =/  cad  +.sign-arvo
  ~&  >  ['wire' wire]
  ~&  >  ['sign-arvo' sign-arvo]
  ?+  cmd  (on-arvo:default wire sign-arvo)
      %getattr
    ?+  sign-arvo  (on-arvo:default wire sign-arvo)
      [%loch %seen *]
      =/  termio  (unpack-term:uart dat.sign-arvo)
      ~&  ['term' termio]
      :-  ~
        %_  this
          term  (~(put by term) device termio)
        ==
      ==
    ::
      %setattr
    [~ this]
  ==
  ::?+  sign-arvo  (on-arvo:default wire sign-arvo)
      ::[%loch %seen *]
    ::~&  >>  dat.sign-arvo
    :::-  ~
      ::%_  this
        ::read  (~(put by read) device [dat.sign-arvo tus.sign-arvo])
      ::==
    ::::
      ::[%loch %rote *]
    ::~&  >>  tus.sign-arvo
    :::-  ~
      ::%_  this
        ::write  (~(put by write) device tus.sign-arvo)
      ::==
  ::==
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail   on-fail:default
--
