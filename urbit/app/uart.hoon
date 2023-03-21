/-  *uart
/+  default-agent, dbug
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  [%0 read=(map dev:loch [@ @]) write=(map dev:loch @)]
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
    [%pass /(scot %tas dev.act)/(scot %tas wut.act) %arvo %l %read dev.act wut.act cmd.act cnt.act]~
  ::
      %rite
    :_  this
    [%pass /(scot %tas dev.act)/(scot %tas wut.act) %arvo %l %rite dev.act wut.act cmd.act dat.act cnt.act]~
  ==
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  =/  dev  `@tas`(snag 2 path)
  ?+  path  (on-peek:default path)
    [%s %values *]  ``noun+!>((~(get by read) dev))
  ==
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  =/  what    (snag 1 wire)
  =/  device  (snag 0 wire)
  ~&  >>>  what
  ~&  >>>  device
  ?+  sign-arvo  (on-arvo:default wire sign-arvo)
      [%loch %seen *]
    ~&  >>  dat.sign-arvo
    :-  ~
      %_  this
        read  (~(put by read) device [dat.sign-arvo tus.sign-arvo])
      ==
    ::
      [%loch %rote *]
    ~&  >>  tus.sign-arvo
    :-  ~
      %_  this
        write  (~(put by write) device tus.sign-arvo)
      ==
  ==
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail   on-fail:default
--
