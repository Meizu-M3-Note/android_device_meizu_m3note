#include <stdlib.h>

extern "C" {
    void _ZN7android11IDumpTunnel11asInterfaceERKNS_2spINS_7IBinderEEE() {
       /* no op, call was deprecated */
    }

    void _ZN7android5Fence4waitEi(int);

    void _ZN7android5Fence4waitEj(unsigned int timeout) {
        _ZN7android5Fence4waitEi(static_cast<int>(timeout));
    }
}
