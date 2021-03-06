###########################################################
testthat::context("SL_tbl load")

loc <- "tests/testthat/testdata/SL_testdata"
menu_data <- studentlife:::menu_data

loc <- "testdata/SL_testdata"
load_list_s1 <- list()
load_list_s2 <- list()
load_list_s3 <- list()
for (i in 1:length(menu_data$sensing)) {
  load_list_s1[[i]] <- load_SL_tibble(
    schema = "sensing", table = studentlife:::menu_data$sensing[i],
    location = loc, csv_nrows = 1, vars = "timestamp")
  load_list_s2[[i]] <- load_SL_tibble(
    schema = "sensing", table = studentlife:::menu_data$sensing[i],
    location = loc, csv_nrows = 1)
  load_list_s3[[i]] <- load_SL_tibble(
    schema = "sensing", table = studentlife:::menu_data$sensing[i],
    location = loc)
}
load_list_a1 <- list()
load_list_a2 <- list()
for (i in 1:length(menu_data$EMA)) {
  load_list_a1[[i]] <- load_SL_tibble(
    schema = "EMA", table = studentlife:::menu_data$EMA[i],
    location = loc, csv_nrows = 1, vars = "timestamp")
  load_list_a2[[i]] <- load_SL_tibble(
    schema = "EMA", table = studentlife:::menu_data$EMA[i],
    location = loc, csv_nrows = 1, vars = "timestamp")
}
load_list_e1 <- list()
for (i in 1:length(menu_data$education)) {
  load_list_e1[[i]] <- load_SL_tibble(
    schema = "education", table = studentlife:::menu_data$education[i],
    location = loc, csv_nrows = 1)
}
load_list_u1 <- list()
load_list_u2 <- list()
for (i in 1:length(menu_data$survey)) {
  load_list_u1[[i]] <- load_SL_tibble(
    schema = "survey", table = studentlife:::menu_data$survey[i],
    location = loc, csv_nrows = 1)
  load_list_u2[[i]] <- load_SL_tibble(
    schema = "survey", table = studentlife:::menu_data$survey[i],
    location = loc, vars = "uid")
}
load_list_o1 <- list()
load_list_o2 <- list()
for (i in 1:length(menu_data$other)) {
  load_list_o1[[i]] <- load_SL_tibble(
    schema = "other", table = studentlife:::menu_data$other[i],
    location = loc, csv_nrows = 1)
}
for (i in 1:length(menu_data$other)) {
  load_list_o2[[i]] <- load_SL_tibble(
    schema = "other", table = studentlife:::menu_data$other[i],
    location = loc, csv_nrows = 1, vars = "timestamp")
}

load_lists <- list(s1 = load_list_s1,
                   s1 = load_list_s2,
                   s1 = load_list_s3,
                   a1 = load_list_a1,
                   a2 = load_list_a2,
                   e1 = load_list_e1,
                   u1 = load_list_u1,
                   u2 = load_list_u2,
                   o1 = load_list_o1,
                   o2 = load_list_o2)

testthat::test_that( "load tables from sensing with vars = timestamp", {
  for (i in 1:length(menu_data$sensing)) {
    testthat::expect_true(nrow(load_list_s1[[!!i]]) > 0)
    testthat::expect_s3_class(load_list_s1[[!!i]], "SL_tbl")
    testthat::expect_true(suppressWarnings(
      is_interval_SL_tibble(load_list_s1[[!!i]])
      || is_timestamp_SL_tibble(load_list_s1[[!!i]])))
  }
})

testthat::test_that( "load tables from sensing", {
  for (i in 1:length(menu_data$sensing)) {
    testthat::expect_true(nrow(load_list_s2[[!!i]]) > 0)
    testthat::expect_s3_class(load_list_s2[[!!i]], "SL_tbl")
    testthat::expect_true(suppressWarnings(
      is_interval_SL_tibble(load_list_s2[[!!i]])
      || is_timestamp_SL_tibble(load_list_s2[[!!i]])))
  }
})

testthat::test_that( "load tables from sensing with missing csv_nrows", {
  for (i in 1:length(menu_data$sensing)) {
    testthat::expect_true(nrow(load_list_s3[[!!i]]) > 0)
    testthat::expect_s3_class(load_list_s3[[!!i]], "SL_tbl")
    testthat::expect_true(suppressWarnings(
      is_interval_SL_tibble(load_list_s3[[!!i]])
      || is_timestamp_SL_tibble(load_list_s3[[!!i]])))
  }
})

testthat::test_that( "load tables from EMA with vars = timestamp", {
  for (i in 1:length(menu_data$EMA)) {
    testthat::expect_true(nrow(load_list_a1[[!!i]]) > 0)
    testthat::expect_s3_class(load_list_a1[[!!i]], "SL_tbl")
    testthat::expect_s3_class(load_list_a1[[!!i]], "timestamp_SL_tbl")
    testthat::expect_true(is_timestamp_SL_tibble(load_list_a1[[!!i]]))
    testthat::expect_true(length(get_EMA_questions(load_list_a1[[!!i]])) > 0)
  }
})

testthat::test_that( "load tables from EMA with vars = uid", {
  for (i in 1:length(menu_data$EMA)) {
    testthat::expect_true(nrow(load_list_a2[[!!i]]) > 0)
    testthat::expect_s3_class(load_list_a2[[!!i]], "SL_tbl")
    testthat::expect_s3_class(load_list_a2[[!!i]], "timestamp_SL_tbl")
    testthat::expect_true(is_timestamp_SL_tibble(load_list_a2[[!!i]]))
    testthat::expect_true(length(get_EMA_questions(load_list_a2[[!!i]])) > 0)
  }
})

testthat::test_that( "load tables from education", {
  for (i in 1:length(menu_data$education)) {
    testthat::expect_true(nrow(load_list_e1[[!!i]]) > 0)
    testthat::expect_s3_class(load_list_e1[[!!i]], "SL_tbl")
    if ( studentlife:::menu_data$education[i] == "deadlines" ) {
      testthat::expect_s3_class(load_list_e1[[!!i]], "dateonly_SL_tbl")
      testthat::expect_true(is_dateonly_SL_tibble(load_list_e1[[!!i]]))
    } else {
      testthat::expect_s3_class(load_list_e1[[!!i]], "dateless_SL_tbl")
      testthat::expect_true(is_dateless_SL_tibble(load_list_e1[[!!i]]))
    }
  }
})

testthat::test_that( "load tables from survey", {
  for (i in 1:length(menu_data$survey)) {
    testthat::expect_true(nrow(load_list_u1[[!!i]]) > 0)
    testthat::expect_s3_class(load_list_u1[[!!i]], "SL_tbl")
    testthat::expect_s3_class(load_list_u1[[!!i]], "dateless_SL_tbl")
    testthat::expect_true(is_dateless_SL_tibble(load_list_u1[[!!i]]))
  }
})

testthat::test_that(
  "load tables from survey with vars = uid and csv_nrows missing", {
  for (i in 1:length(menu_data$survey)) {
    testthat::expect_true(nrow(load_list_u2[[!!i]]) > 0)
    testthat::expect_s3_class(load_list_u2[[!!i]], "SL_tbl")
    testthat::expect_s3_class(load_list_u2[[!!i]], "dateless_SL_tbl")
    testthat::expect_true(is_dateless_SL_tibble(load_list_u2[[!!i]]))
  }
})

testthat::test_that( "load tables from other", {
  for (i in 1:length(menu_data$other)) {
    testthat::expect_true(nrow(load_list_o1[[!!i]]) > 0)
    testthat::expect_s3_class(load_list_o1[[!!i]], "SL_tbl")
    testthat::expect_true(is_timestamp_SL_tibble(load_list_o1[[!!i]]))
  }
})

testthat::test_that( "load tables from other with vars = timestamp", {
  for (i in 1:length(menu_data$other)) {
    testthat::expect_true(nrow(load_list_o2[[!!i]]) > 0)
    testthat::expect_s3_class(load_list_o2[[!!i]], "SL_tbl")
    testthat::expect_true(is_timestamp_SL_tibble(load_list_o2[[!!i]]))
  }
})

###########################################################
testthat::context("SL_tbl transform")

abl_lists <- load_lists
for (n in names(load_lists)) {
  for ( i in 1:length(load_lists[[n]]) ) {
    abl_lists[[n]][[i]] <-
      suppressWarnings(add_block_labels(load_lists[[n]][[i]]))
  }
}

rt_lists <- load_lists
for (n in names(load_lists)) {
  for ( i in 1:length(load_lists[[n]]) ) {
    studs <- load_lists[[n]][[i]]
    tname <- attr(studs, "table")
    time_info <- c(menu_data$timestamp, menu_data$interval)
    if ( tname %in% time_info ) {
      rt_lists[[n]][[i]] <-
        regularise_time(
          studs,
          date_range = seq(getOption("SL_start"), length.out = 20, by = 1))
    } else if ( tname %in% menu_data$dateonly ) {
      rt_lists[[n]][[i]] <-
        regularise_time(
          studs,
          date_range = seq(getOption("SL_start"), length.out = 20, by = 1),
          blocks = c("day", "week", "weekday", "month", "date"))
    }
  }
}

testthat::test_that(
  "add_block_labels behaves well with timestamp and interval", {
  ti <- which(strsplit(names(abl_lists),1,1) %in% c("s","a","o"))
  types <- c("epoch", "day", "week", "weekday", "month", "date")
  for (n in names(abl_lists)[ti]) {
    for ( i in 1:length(abl_lists[[n]]) ) {
       testthat::expect_true(nrow(abl_lists[[!!n]][[!!i]]) > 0)
       testthat::expect_s3_class(abl_lists[[!!n]][[!!i]], "SL_tbl")
       testthat::expect_true(all(types %in% names(abl_lists[[!!n]][[!!i]])))
       testthat::expect_true(suppressWarnings(
         is_interval_SL_tibble(abl_lists[[!!n]][[!!i]])
         || is_timestamp_SL_tibble(abl_lists[[!!n]][[!!i]])))
    }
  }
})

testthat::test_that(
  "add_block_labels behaves well with dateonly and dateless", {
  ti <- which(strsplit(names(abl_lists),1,1) %in% c("e", "u"))
  types <- c("day", "week", "weekday", "month", "date")
  for (n in names(abl_lists)[ti]) {
    for (i in 1:length(menu_data$education)) {
      testthat::expect_true(nrow(abl_lists[[!!n]][[!!i]]) > 0)
      testthat::expect_s3_class(abl_lists[[!!n]][[!!i]], "SL_tbl")
      if ( strsplit(n,1,1) == "e"
           && studentlife:::menu_data$education[i] == "deadlines" ) {
        testthat::expect_s3_class(
          abl_lists[[!!n]][[!!i]], "dateonly_SL_tbl")
        testthat::expect_true(
          is_dateonly_SL_tibble(abl_lists[[!!n]][[!!i]]))
        testthat::expect_true(
          all(types %in% names(abl_lists[[!!n]][[!!i]])))
      }
    }
  }
})

testthat::test_that(
  "regularise_time behaves as expected", {
    for (n in names(rt_lists)) {
      for ( i in 1:length(rt_lists[[n]]) ) {
        studs <- load_lists[[n]][[i]]
        tname <- attr(studs, "table")
        td_info <- c(menu_data$timestamp, menu_data$interval, menu_data$dateonly)
        if ( tname %in% td_info ) {
          testthat::expect_true(nrow(rt_lists[[!!n]][[!!i]]) > 0)
          testthat::expect_s3_class(rt_lists[[!!n]][[!!i]], "SL_tbl")
          testthat::expect_true(suppressWarnings(
            is_reg_SL_tibble(rt_lists[[!!n]][[!!i]])))
        }
      }
    }
})




###########################################################
testthat::context("user generics")
testthat::test_that("summary and print generics produce output", {
for (n in names(load_lists)) {
    for ( i in 1:length(load_lists[[n]]) ) {
      studs <- load_lists[[n]][[i]]
      tname <- attr(studs, "table")
      if ( tname %in% menu_data$timestamp ) {
        testthat::expect_true(c("timestamp") %in% summary(studs)$time_info)
      } else if ( tname %in% menu_data$interval ) {
        testthat::expect_true(c("interval") %in% summary(studs)$time_info)
      } else if ( tname %in% menu_data$dateonly ) {
        testthat::expect_true(c("date-only") %in% summary(studs)$time_info)
      } else {
        testthat::expect_true(length(summary(studs)) > 0)
      }
    }
  }
})


###########################################################
testthat::context("exploratory data analysis")
testthat::test_that("functions in SL_tbl_explore produce plots", {
  for (n in names(rt_lists)) {
    for ( i in 1:length(rt_lists[[n]]) ) {
      studs_r <- rt_lists[[n]][[i]]
      studs_r$m <- 1
      studs <- load_lists[[n]][[i]]
      tname <- attr(studs, "table")
      if ( tname %in% menu_data$timestamp ) {
        testthat::expect_true(length(response_hour_hist(load_lists[[!!n]][[!!i]])) > 0)
        testthat::expect_true(length(vis_NAs(studs_r, response = "m")) > 0)
        testthat::expect_true(length(vis_response_counts(studs_r, response = "m")) > 0)
      } else if ( tname %in% menu_data$interval ) {
        testthat::expect_true(length(response_hour_hist(load_lists[[!!n]][[!!i]])) > 0)
        testthat::expect_true(length(vis_NAs(studs_r, response = "m")) > 0)
        testthat::expect_true(length(vis_response_counts(studs_r, response = "m")) > 0)
      } else if ( tname %in% menu_data$dateonly ) {
        testthat::expect_true(length(vis_NAs(studs_r, response = "m")) > 0)
        testthat::expect_true(length(vis_response_counts(studs_r, response = "m")) > 0)
      }
    }
  }
})

