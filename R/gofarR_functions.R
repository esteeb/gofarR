##Peloton scripts
library(dplyr)

cycling_classes <- c(1:10)

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
#' @export
#' @examples
#' setup_peloton_data()
#' setup_peloton_data(leaderboard_name)
#' setup_peloton_data(display_name = "leaderboardName")
setup_peloton_data <- function(display_name = leaderboard_name) {
  workout_data_interface <<- read.csv(paste0(display_name,"_workouts.csv"))
  cycling_classes <<- workout_data_interface %>%
    filter(Fitness.Discipline == "Cycling")%>%
    filter(!grepl("*Just Ride", Title) & !grepl("*Scenic*", Title))
}

top_instructor <- function(discipline = "All") {
  if (discipline == "All") {
    filt_by_disc <- workout_data_interface%>%
      filter(!grepl("*Just Ride", Title) & !grepl("*Scenic*", Title))
  }
  else {
    filt_by_disc <- workout_data_interface%>%
      filter(!grepl("*Just Ride", Title) & !grepl("*Scenic*", Title))%>%
      filter(Fitness.Discipline == discipline)
  }
  dis_class_by_inst <- filt_by_disc$Instructor.Name%>%
    table()%>%
    data.frame()
  rank_inst <- dis_class_by_inst[rev(order(dis_class_by_inst$Freq)),]
  top_inst <- head(rank_inst,1)
  colnames(top_inst) <- c("Top Instructor", "Number of Classes Taken")
  print(top_inst, row.names = FALSE)
}

## Summarize cycling classes, valid inputs for type are "All", "Live", "On Demand", "Just Ride", and "Scenic"
## Function ignores any
cycling_summary <- function(data = workout_data_interface, type = "All", min_time = 11) {

}
