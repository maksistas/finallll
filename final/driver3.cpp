#include <unistd.h>
#include <cstdlib>

int main() {
    system("xdotool key Caps_Lock");
    system("xdotool key Num_Lock");

    return 0;
}
