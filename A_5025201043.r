#Library
#install.packages("BSDA")
#library(BSDA)

# Soal no 1
#a. Standar deviasi dari selisih
x <- c(78,75,67,77,70,72,78,74,77)
y <- c(100,95,70,90,90,90,89,90,100)
stDev <- sd(x-y)
print(stDev)

#b. t(p-value)
var(x)
var(y)
t.test(x,y,paired = TRUE,var.equal = FALSE)

#c. confidence level 0.5
var.test(x, y, ratio =1,
         alternative = c("two.sided", "less", "greater"),
         conf.level = 0.05)

#Soal no 2
#a. Apakah setuju dengan klaim tersebut?
#Setuju

#b. Maksud dari output yang dihasilkan


tsum.test(n.x = 100,
          mean.x = 23500,
          sd(3900)
)
#c.Kesimpulan dari P-Value yang di hasilkan
#Berdasarkan dari P-Value diketahui rata-rata mobil adalah lebih dari 20.000km /tahun

#Soal no 3
#a Nilai z
z1 <- (3.64-0)/(1.67/sqrt(19))
print(z1)
z2 <- (2.79-0)/(1.32/sqrt(27))
print(z2)

#b Sampel Statistik
tsum.test(mean.x=3.64, 
          s.x = 1.67, 
          n.x = 19, 
          mean.y =2.79,
          s.y = 1.32, 
          n.y = 27, 
          alternative = "greater", var.equal = TRUE)

#c Uji Statistik df=2
curve(dt(x, df=2), from=-4, to=4)

#d nilai kritikal
qt(p=0.05/2, df=2, lower.tail=FALSE)

#Soal no 4
#a Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup
#2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan
#lihat apakah ada outlier utama dalam homogenitas varians.

myFile  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dim(myFile)
head(myFile)
attach(myFile)

myFile$V1 <- as.factor(myFile$V1)
myFile$V1 = factor(myFile$V1,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih"))

class(myFile$V1)

group1 <- subset(myFile, V1=="Kucing Oren")
group2 <- subset(myFile, V1=="Kucing Hitam")
group3 <- subset(myFile, V1=="Kucing Putih")

#b carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang
#didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
  
bartlett.test(Length~V1, data=dataoneway)


#Referensi lain
#https://www.rdocumentation.org/packages/BSDA/versions/1.2.1/topics/tsum.test 
