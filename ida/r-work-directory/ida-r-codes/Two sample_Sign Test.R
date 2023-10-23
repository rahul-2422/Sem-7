if(!require(psych)){install.packages("psych")}
if(!require(BSDA)){install.packages("BSDA")}
if(!require(DescTools)){install.packages("DescTools")}

#Sign test for paired two-sample data example1

Input =("
 Cartoon  Time  Student  Likert
 Pooh      1     a        1       
 Pooh      1     b        4       
 Pooh      1     c        3        
 Pooh      1     d        3       
 Pooh      1     e        3       
 Pooh      1     f        3       
 Pooh      1     g        4       
 Pooh      1     h        3        
 Pooh      1     i        3       
 Pooh      1     j        3       
 Pooh      2     a        4
 Pooh      2     b        5
 Pooh      2     c        4 
 Pooh      2     d        5
 Pooh      2     e        4
 Pooh      2     f        5
 Pooh      2     g        3
 Pooh      2     h        4 
 Pooh      2     i        3
 Pooh      2     j        4      
")

Data = read.table(textConnection(Input),header=TRUE)

###  Check the data frame

library(psych)

headTail(Data)
str(Data)
summary(Data)

#Two-sample sign test with BSDA package

Time_1 = Data$Likert [Data$Time == 1]
Time_2 = Data$Likert [Data$Time == 2]

library(BSDA)

SIGN.test(x = Time_1,
          y = Time_2,
          alternative = "two.sided",
          conf.level = 0.95)

#Two-sample sign test with DescTools package

Time_1 = Data$Likert [Data$Time == 1]
Time_2 = Data$Likert [Data$Time == 2]

library(DescTools)

SignTest(x = Time_1, y = Time_2)   # p < 0.05, H0 is rejected

wilcox.test(Likert ~ Time,
            data = Data,
            paired = TRUE,
            exact = FALSE,
            conf.int = TRUE,
            conf.level = 0.95)    # p < 0.05, H0 is rejected


#Example 2

Input1 = ("Before	After
84	91
103	100
111	117
89	87
116	130
96	104")

Data1 = read.table(textConnection(Input1),header=TRUE)

head(Data1)

Diff = Data1[,2]-Data1[,1]

wilcox.test(Diff, data = Data1,
            paired = F,
            exact = FALSE,
            conf.int = TRUE,
            conf.level = 0.95)    # p < 0.05, H0 is rejected

