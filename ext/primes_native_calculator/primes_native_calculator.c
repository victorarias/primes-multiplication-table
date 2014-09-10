#include "ruby.h"

VALUE calculator = Qnil;

void Init_primes_native_calculator();

VALUE method_calculate_up_to(VALUE self, VALUE rb_up_to);

void Init_primes_native_calculator() {
  calculator = rb_define_module("PrimesNativeCalculator");
  rb_define_singleton_method(calculator, "calculate", method_calculate_up_to, 1);
}

VALUE method_calculate_up_to(VALUE self, VALUE rb_up_to) {
  int up_to = NUM2INT(rb_up_to) + 1; // we should include the limit iself
  int *candidates = malloc(sizeof(int) * up_to);

  // initialize array
  for(int i = 2; i < up_to; i++) {
    candidates[i] = i;
  }

  candidates[0] = candidates[1] = 0; // 0 and 1

  // sieve
  for(int i = 2; i < up_to; i++) {
    int val = candidates[i];
    int val2 = val * val;

    if(val == 0) continue;
    if(val2 > up_to) break;

    while(val2 <= up_to) {
      candidates[val2] = 0;
      val2 += val;
    }
  }

  // copy to Ruby array, removing non-primes
  VALUE rb_s = rb_ary_new2(up_to);
  for(int i = 0; i < up_to; i++) {
    int val = candidates[i];

    if(val > 0)
      rb_ary_push(rb_s, INT2NUM(val));
  }

  free(candidates);

  return rb_s;
}
