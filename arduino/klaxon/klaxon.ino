/*
  Klaxon
*/

#define BUTTON_PIN 0
#define LED_PIN 1
#define SPEAKER_PIN 2
#define MODE_PIN1 3
#define MODE_PIN2 4

typedef struct _Ton {
  int frequency;
  int duration;
} Ton;

void setup() {
  pinMode(BUTTON_PIN, INPUT); // INPUT_PULLUP);           // set pin to input
  digitalWrite(BUTTON_PIN, true);

  pinMode(LED_PIN, OUTPUT);

  pinMode(SPEAKER_PIN, OUTPUT);

  pinMode(MODE_PIN1, INPUT);
  digitalWrite(MODE_PIN1, LOW);

  pinMode(MODE_PIN2, INPUT);
  digitalWrite(MODE_PIN2, LOW);
}

int modeKlaxon() {
  int ret = 0;
  ret += digitalRead(MODE_PIN1) == HIGH ? 1 : 0;
  ret += digitalRead(MODE_PIN2) == HIGH ? 2 : 0;

  return ret;
}

void sound(int frequency, int duration) {
  tone(SPEAKER_PIN, frequency, duration);
  delay(duration);
  noTone(SPEAKER_PIN);
}

void playTon(Ton arr[], int count) {
  for (int idx=0; idx < count; idx++) {
    sound(arr[idx].frequency, arr[idx].duration);
  }
}

void pompier() {
  Ton arr[] {
    // { 435, 1000 }, { 488, 1000 } // do not work on 85s chip
    { 435, 1000 }, { 485, 1000 }
  };

  playTon(arr, sizeof(arr)/sizeof(arr[0]));
}

void ambulance() {
  Ton arr[] {
    { 520, 700 }, { 416, 700 }
  };

  playTon(arr, sizeof(arr)/sizeof(arr[0]));
}

void police() {
  Ton arr[] {
    { 435, 700 }, { 580, 700 }
  };

  playTon(arr, sizeof(arr)/sizeof(arr[0]));
}

void sirene_us() {
  for (int freq=600; freq<900; freq+=10){
    sound(freq, 100);
  }
  for (int freq=900; freq>600; freq-=10){
    sound(freq, 100);
  }
}

void sirene_wowwow() {
  for (int freq=440; freq<1220; freq+=10) {
    sound(freq, 20);
  }

  for (int freq=1220; freq>440; freq-=10){
    sound(freq, 20);
  }
}

void loop() {
  if (digitalRead(BUTTON_PIN) == LOW) {
    digitalWrite(LED_PIN, LOW);
    switch (modeKlaxon()) {
      case 0:
        pompier();
        break;
      case 1:
        police();
        break;
      case 2:
        ambulance();
        break;
      case 3:
        //sirene_us();
        sirene_wowwow();
        break;
      default:
        digitalWrite(LED_PIN, true);
        delay(100);
        digitalWrite(LED_PIN, false);
        delay(100);
        break;
    }
    noTone(SPEAKER_PIN);
  } else {
    digitalWrite(LED_PIN, HIGH);
  }
}
