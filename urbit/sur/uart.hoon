/+  uart
|%
+$  action
  $%  [%read =dev:loch =wut:loch =cmd:loch =cnt:loch]     ::  %read from device dev for cnt bytes
      [%rite =dev:loch =wut:loch =cmd:loch dat=@ =cnt:loch]    ::  %rite out to device dev
      [%getattr =dev:loch]                                     ::  get attribute
      [%setattr =dev:loch]                                     ::  set attribute
      [%setspeed =dev:loch baud=@]                            ::  set baud rate
      [%tcdrain =dev:loch]
      [%tcflow =dev:loch action=@]
      [%tcflush =dev:loch queue=@]
      [%tcsendbreak =dev:loch]
  ==
--
