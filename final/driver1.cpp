#include <X11/XKBlib.h>
#include <stdio.h>
#include <cstdlib>
#include <cstdio>
#include <unistd.h>

int main(){
    //сначала отключаем все индикаторы
    Display *d = XOpenDisplay(NULL);

    XkbStateRec xkbState1;
    XkbGetState(d, XkbUseCoreKbd, &xkbState1);
    XkbStateRec xkbState2;
    XkbGetState(d, XkbUseCoreKbd, &xkbState2);
    if(xkbState1.locked_mods & LockMask){
        system("xdotool key Caps_Lock");
    }
    if(xkbState2.locked_mods & Mod2Mask){
        system("xdotool key Num_Lock");
    }
    sleep(1);

    system("xdotool key Caps_Lock");
    system("xdotool key Num_Lock");
    sleep(1);
    system("xdotool key Caps_Lock");
    system("xdotool key Num_Lock");
    return 0;
}
