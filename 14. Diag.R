data(swiss)
str(swiss)

pairs(swiss)

ggplot(swiss, aes(x = Examination, y = Education))+
  geom_point()+
  theme(axis.text = element_text(size = 12),
        axis.title = element_text(size = 12, face = 'bold'))


ggplot(swiss, aes(x = Examination, y = Education))+
  geom_point()+
  theme(axis.text = element_text(size = 12),
        axis.title = element_text(size = 12, face = 'bold'))+
  geom_smooth(method = 'lm')


ggplot(swiss, aes(x = Examination))+
  geom_histogram()

ggplot(swiss, aes(x = log(Education)))+
  geom_histogram()
