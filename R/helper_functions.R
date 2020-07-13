# Script of internal helper functions

summarize_just_ride <- function(data_in = NULL, jr_min_time = NULL, jr_min_output = NULL) {
  filtered_jr <- data_in %>%
    dplyr::select(Workout.Timestamp, Length..minutes., Total.Output, Avg..Watts, Distance..mi., Calories.Burned)%>%
    dplyr::arrange(Length..minutes.)
  n_jr <- filtered_jr%>%
    dplyr::summarise(dplyr::n())
  summarized_jr <- colMeans(filtered_jr[,2:6])
  summarized_jr <- as.data.frame(c(n_jr, summarized_jr))
  colnames(summarized_jr) <- c("Number of Just Rides", "Avg. Length in Minutes", "Avg. Total Output", "Avg. Power", "Avg. Distance in miles", "Avg. calories burned")
  print(summarized_jr)
  plot(x = filtered_jr$Length..minutes., y = filtered_jr$Avg..Watts, main = "Average Power in Watts and Length in Minutes", xlab = "Length in minutes", ylab = "Average power in watts")
  return(filtered_jr)
}
