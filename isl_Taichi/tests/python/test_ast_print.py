import ast
source_code = """
import taichi as ti

@ti.kernel
def compute():
    x = ti.field(dtype=ti.i32, shape=())
    x[None] = 42
"""

tree = ast.parse(source_code)
print(ast.dump(tree, indent=4))