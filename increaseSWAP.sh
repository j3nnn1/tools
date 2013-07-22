
dd if=/dev/zero of=/media/misperoles/swapR bs=1M count=8192 

mkswap /media/misperoles/swapR

swapon /media/misperoles/swapR
