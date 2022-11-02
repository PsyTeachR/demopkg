test_that("data available", {
  data("self_res_att")

  expect_true( exists("self_res_att") )
  expect_equal(ncol(self_res_att), 16)
  expect_equal(nrow(self_res_att), 108)
  expect_true(is.factor(self_res_att$sex))
})
