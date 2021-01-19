
cr <- read.csv("CreditRisk.csv")

mean(cr$ApplicantIncome)  # mean is 5179

t.test( cr$ApplicantIncome, mu=5100, conf.level = 0.95, alternative = "less") # Sample , Population mean, Confidence level, Alternative hypothesis is less, right,left,double tailed

# cr data is for usa  u have done sampling on 981 american(so this 981 is the sample and its not the population because population is whole usa )
# mu is for the population ( for population you need to directly pass the number you can pass all the records)
#confidence level 
#alternative = "less" ( Ha is that mean income is less than 5100)
# Ho(null is that mean income is greater than equal to 5100)


#___________________

# Change the hypothesis conditions 
t.test( cr$ApplicantIncome, mu=5100, conf.level = 0.95, alternative = "greater") # Sample , Population mean, Confidence level, Alternative hypothesis is less, right,left,double tailed

#Ho is that mean income is less than or equal to 5100
#Ha is that mean income is greater than 5100


#__________________________________

t.test( cr$ApplicantIncome, mu=5100, conf.level = 0.95, alternative = "two.sided") # Sample , Population mean, Confidence level, Alternative hypothesis is less, right,left,double tailed

# Ho is that mean income is  equal to 5100
# Ha is that mean income is not equal 5100   

#__________________________________________________



t.test( cr$ApplicantIncome, mu=5100, conf.level = 0.95, alternative = "two.sided") # Sample , Population mean, Confidence level, Alternative hypothesis is less, right,left,double tailed








