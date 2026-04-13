#include <gtest/gtest.h>

#include "irlba/Options.hpp"

TEST(Options, ChooseInvariantTolerance) {
    irlba::Options opt;
    const auto def = irlba::choose_invariant_tolerance<double>(opt);
    EXPECT_GT(def, 0);

    opt.invariant_subspace_tolerance = -1;
    EXPECT_EQ(irlba::choose_invariant_tolerance<double>(opt), def);

    opt.invariant_subspace_tolerance = 0.69;
    EXPECT_EQ(irlba::choose_invariant_tolerance<double>(opt), 0.69);
}

TEST(Options, ChooseSingularValueTolerance) {
    irlba::Options opt;
    const auto def = irlba::choose_singular_value_tolerance(opt);
    EXPECT_EQ(def, opt.convergence_tolerance);

    opt.singular_value_ratio_tolerance = -1; // for back-compatibility.
    EXPECT_EQ(irlba::choose_singular_value_tolerance(opt), def);

    opt.singular_value_ratio_tolerance = 0.1234;
    EXPECT_EQ(irlba::choose_singular_value_tolerance(opt), 0.1234);
}
