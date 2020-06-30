##

# Reads in <username>_workouts.csv and sets a number of values in the global environment
# Defines data loaded this way as <variable>_interface in order to clarify which source
# we are talking about
#' @name  setup_peloton_data
#' @title Setup Peloton data
#'
#' Set up peloton data, which you can retrieve directly from your profile once you've logged in to onepeloton.com
#'
#'
#' @param display_name Your display name on the leaderboard. If you have already set it as a string in a variable named \code{leaderboard_name}, it will use that by default
#'
#' @return Returns a dataframe, workout_data_interface
#'
#' @export
#'
setup_peloton_data <- function(display_name) {
  workout_data_interface <- read.csv(paste0(display_name,"_workouts.csv"))
  data.frame(workout_data_interface)
}

#' @name top_instructor
#' @title View top instructor
#'
#' @examples
#' top_instructor()
#' top_instructor(discipline = "Yoga")
#'
#' @export
#' @param w_data - Workout data read in from setup_peloton_data
#' @param discipline The class discipline to be summarized. Defaults to "All"
top_instructor <- function(w_data = workout_data_interface, discipline = "All") {
  if (discipline == "All") {
    filt_by_disc <- dplyr::filter(w_data, !grepl("*Just Ride", w_data$Title) & !grepl("*Scenic*", w_data$Title))
  }
  else {
    filt_by_disc <- dplyr::filter(w_data, !grepl("*Just Ride", w_data$Title) & !grepl("*Scenic*", w_data$Title) & w_data$Fitness.Discipline == discipline)
  }
  dis_class_by_inst <- table(filt_by_disc["Instructor.Name"])
  dis_class_by_inst <- data.frame(dis_class_by_inst)
  rank_inst <- dis_class_by_inst[rev(order(dis_class_by_inst$Freq)),]
  #new_column_names <- c("Top Instructor", "Number of Classes Taken")
  #colnames(rank_inst) <- new_column_names
  top_inst <- utils::head(rank_inst,1)
  print(top_inst, row.names = FALSE)
}

#' @title Cycling Summary
#' @name cycling_summary
#' @description This function summarizes cycling data
#' @usage cycling_summary(w_data = workout_data_interface, type = "All", min_time = 11, min_output = 50)
#'
#' @param w_data - A formatted dataframe read in using setup_peloton_data. Defaults to a variable, "workout_data_interface", that is the output from that function.
#' @param type Which type of
#' @param min_time The minimum amount of time to be summarized, used to exclude short rides, either ones that were aborted or warmups/cooldowns.
#' @param min_output The minimum output to be included in the summary. Defaults to 50 KJ
#' @examples
#'
#' cycling_summary()
#' cycling_summary(type = "Climb", min_time = 11)
#'
#' @return
#' @export

cycling_summary <- function(w_data = workout_data_interface,
                            type = "All",
                            min_time = 11,
                            min_output = 50) {
  # Selects only cycling rides which conform to min_time and min_output
  data <- dplyr::filter(w_data, w_data$Fitness.Discipline == "Cycling" & w_data$Length..minutes. >= min_time & w_data$Total.Output >= min_output)
  # Selects only rides corresponding to type, using a regular expression to find relevant rides
  if (type !="All") {
    if (type == "Class") {
      data <- dplyr::filter(data, !grepl("*Just Ride", data$Title) & !grepl("*Scenic*", data$Title))
    }
    else {
      data <- filter(data, grepl(paste0("*",type,"*"), data$Title))
    }
  }
  else data
data


}
