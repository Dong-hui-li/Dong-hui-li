// #include <cmath>
// #include <deque>
// #include <set>
// #include <thread>
#include <iostream>

#include "taichi/ir/ir.h"
#include "taichi/ir/snode.h"
#include "taichi/ir/statements.h"
#include "taichi/ir/visitors.h"
#include "taichi/transforms/my_isl.h"
#include "taichi/program/program.h"
#include "external/isl/isl-0.22/include/isl/constraint.h"
#include "external/isl/isl-0.22/include/isl/space.h"
#include "external/isl/isl-0.22/include/isl/set.h"
#include "external/isl/isl-0.22/include/isl/ctx.h"
// #include <isl/ctx.h>
// #include <isl/space.h>
// #include <isl/set.h>


namespace taichi::lang {

class MyIsl : public BasicStmtVisitor {
 public:
    static bool run(IRNode *node) {
    MyIsl folder;
    node->accept(&folder);
    // 创建ISL上下文
    isl_ctx* ctx = isl_ctx_alloc();

    // // 创建空间，表示有两个维度（x, y）
    // isl_space* space = isl_space_set_alloc(ctx, 0, 2); // 0表示没有参数维度，2表示结果维度

    // // 创建一个多面体（x + y <= 10）
    // isl_set* set = isl_set_universe(space); // 创建一个无穷大集合

    // // 创建约束：x + y <= 10
    // isl_constraint* constraint = isl_constraint_alloc_inequality(isl_local_space_from_space(space));
    // // constraint = isl_constraint_set_coefficient(constraint, 0, 0, 1); // 设置 x 的系数为 1
    // // constraint = isl_constraint_set_coefficient(constraint, 0, 1, 1); // 设置 y 的系数为 1
    // constraint = isl_constraint_set_coefficient_si(constraint, isl_dim_set, 0, 1);
    // constraint = isl_constraint_set_coefficient_si(constraint, isl_dim_set, 1, 1);
    //     constraint = isl_constraint_set_constant_si(constraint, -10); // 设置常数项为 -10
    // // 将约束添加到集合中
    // set = isl_set_add_constraint(set, constraint);

    // 打印多面体
    std::cout << "Polyhedron: " /*<< isl_set_to_str(set) */<< std::endl;

    // 清理
    // isl_set_free(set);
    // isl_space_free(space);
    isl_ctx_free(ctx);

    return true;
  }

// const PassID MyIslPass::id = "MyIslPass";
};
namespace irpass {

bool poly_test(IRNode *root) {
  TI_AUTO_PROF;
  return MyIsl::run(root);
}

}  // namespace irpass

  // namespace taichi::lang
}
