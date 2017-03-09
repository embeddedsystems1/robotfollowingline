

/*Cumhuriyet Üniversitesi Bilgisayar Mühendisliği Gömülü Sistemler Dersi Proje 1 */

int sensorDegeri1;
int sensorDegeri2;
int sensorDegeri3;
/*Sensörler */
const int sensorPin1=A0; // CNY70 1.Sensör
const int sensorPin2=A1;// CNY70 2.Sensör
const int sensorPin3=A2;// CNY70 3.Sensör
/*Motor 1 */
const int motorPin1  = 5;  // 1.Motor 
const int motorPin2  = 6;  // 1.Motor
/*Motor 2 */
const int motorPin3  = 8; // 2.Motor
const int motorPin4  = 9;  // 2.Motor

void setup()
  {
      /*Sensörler */
      pinMode(sensorPin1, INPUT);// CNY70 1.Sensör Pin Belirlendi
      pinMode(sensorPin2, INPUT);// CNY70 2.Sensör Pin Belirlendi
      pinMode(sensorPin3, INPUT);// CNY70 3.Sensör Pin Belirlendi
      /*Motorlar */
      pinMode(motorPin1, OUTPUT);// 1.Motor Pin Belirlendi
      pinMode(motorPin2, OUTPUT);// 1.Motor Pin Belirlendi
      pinMode(motorPin3, OUTPUT);// 2.Motor Pin Belirlendi
      pinMode(motorPin4, OUTPUT);// 2.Motor Pin Belirlendi
     /*Haberleşme */
     Serial.begin(9600); // Seri Baberlesmeyi 9600 Baud Rate Hizinda   
  }

void loop()
{
      if (analogRead(sensorPin1)>200)
      sensorDegeri1 = 1; // 1.Sensorden gelen analog deger dijitale cevriliyor
      else
        sensorDegeri1 = 0;   
      if (analogRead(sensorPin2)>300)
      sensorDegeri2 = 1; // 2.Sensorden gelen analog deger dijitale cevriliyor
      else
        sensorDegeri2 = 0;   
      if (analogRead(sensorPin3)>300)
      sensorDegeri3 = 1; // 3.Sensorden gelen analog deger dijitale cevriliyor
      else
        sensorDegeri3 = 0;   

    if(sensorDegeri1 == 0){ //1. Sensör Siyah Algılandığında İleri Git
      solaDon(); 
      }
    else if(sensorDegeri3 == 0){ //3.Sensör Siyah Algıladığında
      sagaDon();
      }
      else
      ileriGit();

}


void ileriGit()
  {
    digitalWrite(motorPin1, HIGH); // 1.Motor Çalışıyor
    digitalWrite(motorPin3, HIGH); // 2.Motor Çalışıyor
  }

void sagaDon()
  {
    digitalWrite(motorPin1, HIGH); //1.Motor Dur
    digitalWrite(motorPin3, LOW); //2.Motor Çalışıyor
  }  
void solaDon()
  {
    digitalWrite(motorPin1, LOW); // 1.Motor Çalışıyor
    digitalWrite(motorPin3, HIGH); //2.Motor Dur
  }
void dur()
  {
    digitalWrite(motorPin1, LOW); // 1.Motor Dur
    digitalWrite(motorPin3, LOW); //2.Motor Dur
  }
