#include <stdint.h>

extern "C" void _ZN7android14SurfaceControl8setLayerEj(uint32_t);

extern "C" void _ZN7android14SurfaceControl8setLayerEi(int32_t layer) {
    return _ZN7android14SurfaceControl8setLayerEj(static_cast<uint32_t>(layer));
}
