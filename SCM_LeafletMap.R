library(leaflet)
library(rgdal)



############# Icons ############

energy.icon <- makeIcon("https://static.wixstatic.com/media/7d2119_4f98913d7ecb4501a6076ec8049c15f4~mv2.png",36, 36, iconAnchorX = 18, iconAnchorY = 18)
health.icon <- makeIcon("https://static.wixstatic.com/media/7d2119_0e01f5dda27c456c98a80382159dfc67~mv2.png",36, 36, iconAnchorX = 18, iconAnchorY = 18)
water.icon <- makeIcon("https://static.wixstatic.com/media/7d2119_a2ac6ead861141f9ac4a52d6b2ccd3c1~mv2.png",36, 36, iconAnchorX = 18, iconAnchorY = 18)
mobility.icon <- makeIcon("https://static.wixstatic.com/media/7d2119_4c3bcf2d791e46ea8d87b69bfbb96bb1~mv2.png",36, 36, iconAnchorX = 18, iconAnchorY = 18)
infotech.icon <- makeIcon("https://static.wixstatic.com/media/7d2119_7be0831949474651a086643bf00c8eda~mv2.png",36, 36, iconAnchorX = 18, iconAnchorY = 18)

yes<-"<img src='https://static.wixstatic.com/media/8f29bd_993b1967cad446c09c6fddcb280c97fe~mv2.png' width=15 height=15> </img>" 
no<-"<img src='https://static.wixstatic.com/media/8f29bd_f6bd5fd882224010a13bc739426c26d3~mv2.png' width=15 height=15> </img>"
other<-"<img src='https://static.wixstatic.com/media/8f29bd_aeefbb17f180497faddfac96bd7a62ae~mv2.png' width=15 height=15> </img>"



############ Data #############

## Set your working directory first:
## E.g., setwd("/Users/intern/Google Drive/Clients/Smart Communities Maine/Survey/Survey Analysis/")

energy <- read.csv("Energy2.csv")
health <- read.csv("Health2.csv")
water <- read.csv("Water2.csv")
mobility <- read.csv("Mobility2.csv")
infotech <- read.csv("InfoTech2.csv")



############ Labels ############

for (i in 1:nrow(energy)) {
  energy$label[i]<-paste0("<b>", energy$Town[i], "</b>", 
                          "<br><br>", "LED Streetlights: ", if (is.na(energy$LEDs[i])) {other} else if (energy$LEDs[i]=="N") {no} else {yes},
                          "<br>", "Smart Streetlights: ", if (is.na(energy$SmartStreetlights[i])) {other} else if (energy$SmartStreetlights[i]=="N") {no} else {yes},
                          "<br>", "Smart Electricity Meters in Public Facilities: ", if (is.na(energy$SmartElecMeters[i])) {other} else if (energy$SmartElecMeters[i]=="N") {no} else {yes},
                          "<br>", "Smart Thermostats in Public Facilities: ", if (is.na(energy$SmartThermostats[i])) {other} else if (energy$SmartThermostats[i]=="N") {no} else {yes},
                          "<br>", "Smart Grid: ", if (is.na(energy$Smartgrid[i])) {other} else if (energy$Smartgrid[i]=="N") {no} else {yes},
                          "<br>", "Microgrid: ", if (is.na(energy$Microgrid[i])) {other} else if (energy$Microgrid[i]=="N") {no} else {yes})
}

for (i in 1:nrow(health)) {
  health$label[i]<-paste0("<b>", health$City.Town[i], "</b>",
                          "<br><br>", "Water Quality Sensors: ", if (is.na(health$Water.quality.sensors[i])) {other} else if (health$Water.quality.sensors[i]=="N") {no} else {yes},
                          "<br>", "Air Quality Sensors: ", if (is.na(health$Air.quality.sensors[i])) {other} else if (health$Air.quality.sensors[i]=="N") {no} else {yes},
                          "<br>", "Crime Mapping: ", if (is.na(health$Crime.mapping[i])) {other} else if (health$Crime.mapping[i]=="N") {no} else {yes},
                          "<br>", "Smart Surveillance Systems: ", if (is.na(health$Smart.surveillance.systems[i])) {other} else if (health$Smart.surveillance.systems[i]=="N") {no} else {yes})
}

for (i in 1:nrow(mobility)) {
  mobility$label[i]<-paste0("<b>", mobility$City.Town[i], "</b>",
                            "<p><br><br>", "Smart Parking - Sensors: ", if (is.na(mobility$Smart.Parking.Sensors[i])) {other} else if (mobility$Smart.Parking.Sensors[i]=="N") {no} else {yes},
                            "<br>", "Smart Parking - Kiosks with Digital Payment Systems: ", if (is.na(mobility$Smart.Parking.kiosks.with.digital.payment.systems[i])) {other} else if (mobility$Smart.Parking.kiosks.with.digital.payment.systems[i]=="N") {no} else {yes},
                            "<br>", "Smart Parking - Apps with Digital Payment Systems: ", if (is.na(mobility$Smart.Parking.apps.with.digital.payment.systems[i])) {other} else if (mobility$Smart.Parking.apps.with.digital.payment.systems[i]=="N") {no} else {yes},
                            "<br>", "Public Transit - Mobile Apps: ", if (is.na(mobility$Public.Transit.mobile.apps[i])) {other} else if (mobility$Public.Transit.mobile.apps[i]=="N") {no} else {yes},
                            "<br>", "Public Transit - Digital Messaging Signs: ", if (is.na(mobility$Public.Transit.digital.messaging.signs[i])) {other} else if (mobility$Public.Transit.digital.messaging.signs[i]=="N") {no} else {yes},
                            "<br>", "Public Transit - On-Board Automated Announcements:", if (is.na(mobility$Public.Transit.on.board.automated.announcements[i])) {other} else if (mobility$Public.Transit.on.board.automated.announcements[i]=="N") {no} else {yes},
                            "<br>", "Public Transit - Digital Payment Systems: ", if (is.na(mobility$Digital.public.transit.payment.systems[i])) {other} else if (mobility$Digital.public.transit.payment.systems[i]=="N") {no} else {yes},
                            "<br>", "Smart Traffic Signals: ", if (is.na(mobility$Smart.traffic.signals[i])) {other} else if (mobility$Smart.traffic.signals[i]=="N") {no} else {yes},
                            "<br>", "Transportation Infrastructure Sensors: ", if (is.na(mobility$Transportation.infrastructure.sensors[i])) {other} else if (mobility$Transportation.infrastructure.sensors[i]=="N") {no} else {yes},"</p>")
}

for (i in 1:nrow(water)) {
  water$label[i]<-paste0("<b>", water$City.Town[i], "</b>",
                         "<br><br>", "Smart Trash Containers: ", if (is.na(water$Smart.trash.containers[i])) {other} else if (water$Smart.trash.containers[i]=="N") {no} else {yes},
                         "<br>", "Smart Water Meters in Public Facilities: ", if (is.na(water$Smart.water.meters.in.public.facilities[i])) {other} else if (water$Smart.water.meters.in.public.facilities[i]=="N") {no} else {yes}, 
                         "<br>", "Smart Sewage Sensors: ", if (is.na(water$Smart.sewage.sensors[i])) {other} else if (water$Smart.sewage.sensors[i]=="N") {no} else {yes},
                         "<br>", "Water Level Sensors: ", if (is.na(water$Water.level.sensors[i])) {other} else if (water$Water.level.sensors[i]=="N") {no} else {yes})
}

for (i in 1:nrow(infotech)) {
  infotech$label[i]<-paste0("<b>", infotech$Town[i], "</b>",
                            "<br><br>", "Public WiFi: ", if (is.na(infotech$Public.wifi[i])) {other} else if (infotech$Public.wifi[i]=="N") {no} else {yes}, 
                            "<br>", "Digital Citizen Services: ", if (is.na(infotech$Digital.citizen.services[i])) {other} else if (infotech$Digital.citizen.services[i]=="N") {no} else {yes}, 
                            "<br>", "Civic Engagement Apps: ", if (is.na(infotech$Digital.citizen.services[i])) {other} else if (infotech$Digital.citizen.services[i]=="N") {no} else {yes},
                            "<br>", "Open Data Portal: ", if (is.na(infotech$Open.data.portal[i])) {other} else if (infotech$Open.data.portal[i]=="N") {no} else {yes})
}


################ Map ################

leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  addMarkers(data = energy,
             group = "Energy & Electricity",
             icon = energy.icon,
             popup = ~label) %>%
  addMarkers(data = health,
             group = "Health & Safety",
             icon = health.icon,
             popup=~label) %>%
  addMarkers(data = water,
             group = "Water & Waste",
             icon = water.icon,
             popup = ~label) %>%
  addMarkers(data = mobility,
             group = "Mobility & Transportation",
             icon = mobility.icon,
             popup =~label,
             options = popupOptions(minWidth = '1000px')) %>%
  addMarkers(data = infotech,
             group = "Information & Communications Technology",
             icon = infotech.icon,
             popup = ~label) %>%
  addLayersControl(
    baseGroups = c("Energy & Electricity", "Health & Safety", "Water & Waste", "Mobility & Transportation", "Information & Communications Technology"),
    options = layersControlOptions(collapsed = FALSE))


