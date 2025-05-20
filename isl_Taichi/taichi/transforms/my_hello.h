#pragma once

#include "taichi/ir/pass.h"

namespace taichi::lang {

class MyHelloPass : public Pass {
 public:
  static const PassID id;

  struct Args {
    Program *program;
  };
};

}  // namespace taichi::lang
