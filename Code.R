library(tidyverse)
library(tidytuesdayR)
tuesdata <- tidytuesdayR::tt_load('2021-11-23')

tuesdata$episodes->episodes
glimpse(episodes)

episodes%>%
  filter(type=="episode")%>%
  select(season_number,episode_number,duration)->data


ggplot(data,aes(x=as.factor(season_number),y=as.factor(episode_number),fill=duration))+
  geom_tile(colour="white")+
  coord_equal()+
  scale_fill_distiller(direction=-1)+
  theme(plot.background=element_rect(fill="black"),
        panel.background = element_rect(fill="black"),
        legend.background = element_rect(fill="black"),
        legend.text = element_text(colour="white",face = "bold",margin = margin(l=5)),
        legend.title = element_text(colour="white",face = "bold",size=12,margin = margin(b=5)),
        legend.box.margin = unit(c(1,2,1,2),"cm"),
        plot.margin = unit(c(1,2,1,2),"cm"),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_text(colour="white",face = "bold"),
        axis.title.x = element_text(colour="white",face="bold",size=12, margin=margin(t=25)),
        axis.title.y = element_text(colour="white",face="bold",size=12, margin=margin(r=25)),
        plot.title.position = "plot",
        plot.caption.position = "plot",
        plot.title=element_text(size=14, face="bold",colour="white",margin=margin(b=15)),
        plot.subtitle = element_text(size=12, colour="white",margin=margin(b=25)),
        plot.caption=element_text(size=10,colour="white",hjust=0,margin=margin(t=20)))+
  labs(x="--------------------SEASON NUMBER--------------------",
       y="--------------------EPISODE NUMBER--------------------",
       fill="DURATION (IN MINUTES)",
       title="DOCTOR WHO: THE LONGEST EPISODES OF THE SHOW",
       subtitle=str_wrap("The first episodes from Season 5 and Season 8 and the 10th episode from Season 12 are the longest episodes of the show. Season 5's first episode runs for 76 whole minutes whereas the other two run for 65 minutes. The shortest episode, on the other hand, is episode 4 from Season 7, which runs only for 41 minutes",100),
       caption = "Data via Tidy Tuesday| Analysis and design: @annapurani93")->plot



ggsave("EpisodeDuration.png",plot,width = 10,height=7.14)
