plot(1:5)

# To load a package: install.packages("package_name")

#install.packages("ggplot2")

# Must load the package before using: library(package_name)

library(ggplot2)

plot(cars)

# Every ggplot has at least 3 layers
# data + aes(thetics) + geom(etries)

ggplot(data=cars) + aes(x=speed, y=dist) + geom_point()

# Change the color of the points

#ggplot(data=cars) + aes(x=speed, y=dist) + geom_point(col="blue")

carplot <- ggplot(data=cars) + aes(x=speed, y=dist) + geom_point(col="blue")

carplot + geom_smooth(method="lm")

carplot + labs(title="Speed Over Distance")

carplot + labs(title="Speed and Stopping Distances of Cars",
               x="Speed (MPH)", 
               y="Stopping Distance (ft)",
               subtitle = "More Relevant Information if I Had Some",
               caption="Dataset: 'cars' preloaded in RStudio") +
  geom_smooth(method="lm", se=FALSE) +
  theme_bw()

# RNA-Seq plot

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
nrow(genes)
ncol(genes)
colnames(genes)
table(genes$State)
round( table(genes$State)/nrow(genes) * 100, 2 )
ggplot(genes) + aes(x=Condition1, y=Condition2) + geom_point()
ggplot(genes) + aes(x=Condition1, y=Condition2, col=State) + geom_point()
reg_plot <- ggplot(genes) + 
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()
reg_plot + scale_colour_manual( values=c("blue","gray","red") )
reg_plot + scale_colour_manual(values=c("blue","gray","red")) +
  labs(title="Gene Expresion Changes Upon Drug Treatment",
       x="Control (no drug) ",
       y="Drug Treatment")
reg_plot2 <- ggplot(genes) + 
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point(alpha = 0.4)
reg_plot2 + scale_colour_manual(values=c("blue","gray","red")) +
  labs(title="Gene Expresion Changes Upon Drug Treatment",
       x="Control (no drug) ",
       y="Drug Treatment")