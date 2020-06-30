#' Templated workout data from the profile interface
#'
#' A dataset containing workout data pulled from the Peloton profile interface containing 189 workouts of various types
#'
#' @format A data frame with 189 obs. of 18 variables:
#' \describe{
#'   \item{Workout.Timestamp}{Time the workout began}
#'   \item{Live.On.Demand}{A column describing whether a class is live or on demand. Left blank for Just Ride type workouts}
#'   \item{Instructor.Name}{Name of the isntructor for the class. Left blank for Just Ride and Scenic rides}
#'   \item{Length..minutes.}{The length of the class in minutes}
#'   \item{Fitness.Discipline}{The discipline of the workout - i.e. yoga/cycling/etc}
#'   \item{Type}{The type of class selected, i.e. low impact, power zone, etc}
#'   \item{Title}{The title of the class. Procedurally generated for Just Rides}
#'   \item{Class.Timestamp}{A timestamp indicating the initial run of the class}
#'   \item{Total.Output}{Total output, in kJ, from the event. Only for cycling on the Peloton bike itself}
#'   \item{Avg..Watts}{Average watt output during the event. Only for cycling on the Peloton bike itself}
#'   \item{Avg..Resistance}{Average resistance set on the bike during the event. Only for cycling on the Peloton bike itself}
#'   \item{Avg..Cadence..RPM.}{Average cadence. Only for cycling on the Peloton bike itself}
#'   \item{Avg..Speed..mph.}{Derived measure of average speed. Functionally useless, but drives total distance. Only for cycling on the Peloton bike itself}
#'   \item{Distance..mi.}{Measure of total distance. Only for cycling on the Peloton bike itself}
#'   \item{Calories.Burned}{Estimated total calories burned during event}
#'   \item{Avg..Heartrate}{Average measured heartrate, only for events where a heartrate monitor was connected}
#'   \item{Avg..Incline}{Average incline of the Tread. Only for running events on the Peloton Tread itself}
#'   \item{Avg..Pace..min.mi.}{Average running pace. Only for running events}
#' }
#'
#'
#' @source \url{http://www.onepeloton.com/login/}
"workout_data_interface"
