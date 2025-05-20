import taichi as ti

ti.init(arch=ti.cpu,print_ir=True)  # print_ir=True,或者 GPU

@ti.kernel
def simple_kernel():
    for i in range(10):
        a = i + 1
        # b = a + 20   

simple_kernel()