// #include <cmath>
// #include <deque>
// #include <set>
// #include <thread>
#include <iostream>

#include "taichi/ir/ir.h"
#include "taichi/ir/snode.h"
#include "taichi/ir/statements.h"
#include "taichi/ir/visitors.h"
#include "taichi/transforms/my_hello.h"
#include "taichi/program/program.h"

namespace taichi::lang {

class MyHello : public BasicStmtVisitor {
 public:
    static bool run(IRNode *node) {
    MyHello folder;
    node->accept(&folder);
    std::cout << "Hello, World! syy" << std::endl;

    return true;
  }

// const PassID MyHelloPass::id = "MyHelloPass";
};
namespace irpass {

bool hello_printing(IRNode *root) {
  TI_AUTO_PROF;
  return MyHello::run(root);
}

}  // namespace irpass

  // namespace taichi::lang
}
