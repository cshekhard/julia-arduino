/* YourDuino SoftwareSerialExample1
   - Connect to another Arduino running "YD_SoftwareSerialExampleRS485_1Remote"
   - Connect this unit Pins 10, 11, Gnd
   - Pin 3 used for RS485 direction control
   - To other unit Pins 11,10, Gnd  (Cross over)
   - Open Serial Monitor, type in top window. 
   - Should see same characters echoed back from remote Arduino

   Questions: terry@yourduino.com 
*/

/*-----( Import needed libraries )-----*/
#include <SoftwareSerial.h>
/*-----( Declare Constants and Pin Numbers )-----*/
#define SSerialRX        10  //Serial Receive pin
#define SSerialTX        11  //Serial Transmit pin

#define SSerialTxControl 3   //RS485 Direction control

#define RS485Transmit    HIGH
#define RS485Receive     LOW

#define Pin13LED         13

/*-----( Declare objects )-----*/
SoftwareSerial RS485Serial(SSerialRX, SSerialTX); // RX, TX

/*-----( Declare Variables )-----*/
int i;
uint8_t byteReceived[8];
uint8_t byteSend[8];
//uint8_t byteReceivedold;
uint8_t byteReceived1=5;

void setup()   /****** SETUP: RUNS ONCE ******/
{  i=0;
  // Start the built-in serial port, probably to Serial Monitor
  Serial.begin(9600);
  //Serial.println("YourDuino.com SoftwareSerial remote loop example");
  //Serial.println("Use Serial Monitor, type in upper window, ENTER");
  
  pinMode(Pin13LED, OUTPUT);   
  pinMode(SSerialTxControl, OUTPUT);    
  
  digitalWrite(SSerialTxControl, RS485Receive);  // Init Transceiver   
  
  // Start the software serial port, to another device
  RS485Serial.begin(9600);   // set the data rate 

}//--(end setup )---


void loop()   /****** LOOP: RUNS CONSTANTLY ******/
{
  digitalWrite(Pin13LED, HIGH);  // Show activity
  while(Serial.available()>0)
  {
    byteReceived[i++]= Serial.read();
    //byteReceived=Serial.readBytesUntil('1',byteReceivedold,7);
     if(i==8) 
    { 
    digitalWrite(SSerialTxControl, RS485Transmit);  // Enable RS485 Transmit 
     
    RS485Serial.write(byteReceived[0]);          // Send byte to Remote Arduino
     RS485Serial.write(byteReceived[1]); 
      RS485Serial.write(byteReceived[2]); 
       RS485Serial.write(byteReceived[3]); 
        RS485Serial.write(byteReceived[4]); 
         RS485Serial.write(byteReceived[5]); 
          RS485Serial.write(byteReceived[6]); 
           RS485Serial.write(byteReceived[7]); 
    i=0;
    }
    
    digitalWrite(Pin13LED, LOW);  // Show activity    
    //delay(10);
    digitalWrite(SSerialTxControl, RS485Receive);  // Disable RS485 Transmit       
  }
  
  if (RS485Serial.available())  //Look for data from other Arduino
   {
    digitalWrite(Pin13LED, HIGH);  // Show activity
    byteReceived1 = RS485Serial.read();    // Read received byte
    String str = String(byteReceived1,HEX);  // newly added for julia-arduino interface
    if (str.length()==1)
    	Serial.print("0");
    Serial.print(str);        // changed from Serial.write to Serial.print for julia-arduino interface
    //delay(10);
    digitalWrite(Pin13LED, LOW);  // Show activity   
   }  

}//--(end main loop )---

/*-----( Declare User-written Functions )-----*/

//NONE
//*********( THE END )***********
