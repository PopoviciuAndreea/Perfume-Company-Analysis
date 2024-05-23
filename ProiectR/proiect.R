install.packages("bupaverse")
install.packages("xesreadR")
install.packages('daqapo')
library(bupaverse)
library(xesreadR)
library(bupaR)
library(processmapR)
library(daqapo)

perfumeLog<-read_xes("JurnalR.xes")
summary(perfumeLog)
n_traces(perfumeLog)
n_cases(perfumeLog)
n_activities(perfumeLog)

activity_labels(perfumeLog)
activities(perfumeLog)
traces(perfumeLog)

trace_explorer(perfumeLog, coverage=1)

perfumeLog%>%
  start_activities("activity")%>%
  plot()

perfumeLog%>%
  end_activities("activity")%>%
  plot()

process_map(perfumeLog)
dotted_chart(perfumeLog)

perfumeLog%>%
  detect_case_id_sequence_gaps()

perfumeLog %>%
  filter_activity_presence("Macerare la cald")

perfumeLog %>%
  activity_presence() %>%
  plot()

perfumeLog %>%
  activity_frequency("activity")

number_of_repetitions(myLog, level="activity", type="all")



resources(perfumeLog)
perfumeLog %>%
  resource_frequency(level="resource-activity")
resource_map(perfumeLog)

plot(resource_frequency(perfumeLog, level = "resource"))
plot(resource_frequency(perfumeLog, level = "activity"))
plot(resource_frequency(perfumeLog, level = "resource-activity"))
plot(resource_involvement(perfumeLog, level = "resource"))
plot(resource_involvement(perfumeLog, level="resource-activity"))

plot(number_of_repetitions(perfumeLog, level="activity"))

perfumeLog%>%
  process_map(type=frequency())

perfumeLog%>%
  process_map(type=performance())


perfumeLog %>%
  detect_attribute_dependencies(antecedent = activity_id == "Macerare la rece",
                                consequent = startsWith(resource_id, "Parfumier"))

perfumeLog %>%
  filter_activity_presence("Anulare comandă")

perfumeLog %>% activity_presence() %>%
  plot()

plot(resource_frequency(perfumeLog, level = "resource"))

process_map(perfumeLog%>%
              filter_activity_presence("Macerare la cald"))
