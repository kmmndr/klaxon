EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Transistor_BJT:BD140 Q1
U 1 1 60F33991
P 6200 3250
F 0 "Q1" H 6392 3296 50  0000 L CNN
F 1 "BD140" H 6392 3205 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-126-3_Vertical" H 6400 3175 50  0001 L CIN
F 3 "http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00001225.pdf" H 6200 3250 50  0001 L CNN
	1    6200 3250
	1    0    0    1   
$EndComp
$Comp
L Device:Speaker LS1
U 1 1 60F340FC
P 6500 3750
F 0 "LS1" H 6670 3746 50  0000 L CNN
F 1 "Speaker" H 6670 3655 50  0000 L CNN
F 2 "" H 6500 3550 50  0001 C CNN
F 3 "~" H 6490 3700 50  0001 C CNN
	1    6500 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F38CCC
P 6300 4650
F 0 "#PWR?" H 6300 4400 50  0001 C CNN
F 1 "GND" H 6305 4477 50  0000 C CNN
F 2 "" H 6300 4650 50  0001 C CNN
F 3 "" H 6300 4650 50  0001 C CNN
	1    6300 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60F3A079
P 6300 2350
F 0 "#PWR?" H 6300 2200 50  0001 C CNN
F 1 "+3.3V" H 6315 2523 50  0000 C CNN
F 2 "" H 6300 2350 50  0001 C CNN
F 3 "" H 6300 2350 50  0001 C CNN
	1    6300 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 60F40000
P 6300 4200
F 0 "R2" H 6370 4246 50  0000 L CNN
F 1 "27Ω" H 6370 4155 50  0000 L CNN
F 2 "" V 6230 4200 50  0001 C CNN
F 3 "~" H 6300 4200 50  0001 C CNN
	1    6300 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3450 6300 3750
Wire Wire Line
	6300 3850 6300 4050
Text Notes 7000 3450 0    50   ~ 0
Ib max limitée par le minimum entre:\n- ce que supporte le chip U1 < 10mA\n- ce que supporte le transistor < 0.5A ?\n\nR1 > (3.3V-0.7V) / 0.01A = 260Ω\n\nAvec 270Ω => Ib = 9mA\n\nIc max limitée par le minimum entre:\n- ce que supporte le transistor < -1.5A\nR2 > (3.3V-0.7V) / 1.5A = 1,73Ω\n- ce que supporte le haut parleur < 0.4W\nR2 > (3,3V-0,7V) / (0.4W/3.3V) = 21.45Ω\n\nAvec 27Ω => Ic = 96mA
$Comp
L MCU_Microchip_ATtiny:ATtiny85V-10SU U1
U 1 1 60F88ECD
P 4250 3350
F 0 "U1" H 3720 3396 50  0000 R CNN
F 1 "ATtiny85V-10SU" H 3720 3305 50  0000 R CNN
F 2 "Package_SO:SOIJ-8_5.3x5.3mm_P1.27mm" H 4250 3350 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 4250 3350 50  0001 C CNN
	1    4250 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2350 6300 2450
Wire Wire Line
	4250 2750 4250 2450
Wire Wire Line
	4250 2450 6300 2450
Connection ~ 6300 2450
Wire Wire Line
	6300 2450 6300 3050
Wire Wire Line
	4250 3950 4250 4550
$Comp
L Device:R R1
U 1 1 60F53282
P 5750 3250
F 0 "R1" V 5543 3250 50  0000 C CNN
F 1 "270Ω" V 5634 3250 50  0000 C CNN
F 2 "" V 5680 3250 50  0001 C CNN
F 3 "~" H 5750 3250 50  0001 C CNN
	1    5750 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 3250 5900 3250
Wire Wire Line
	5600 3250 4850 3250
Wire Wire Line
	6300 4550 6300 4650
Wire Wire Line
	6300 4350 6300 4550
Connection ~ 6300 4550
Wire Wire Line
	4250 4550 4950 4550
Wire Wire Line
	4950 3850 4950 4550
Connection ~ 4950 4550
Wire Wire Line
	4950 4550 5350 4550
Wire Wire Line
	4950 3450 4950 3050
Wire Wire Line
	4950 3050 4850 3050
$Comp
L Switch:SW_Push SW1
U 1 1 60F95068
P 4950 3650
F 0 "SW1" V 4904 3798 50  0000 L CNN
F 1 "Push" V 4995 3798 50  0000 L CNN
F 2 "" H 4950 3850 50  0001 C CNN
F 3 "~" H 4950 3850 50  0001 C CNN
	1    4950 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 3850 5350 3350
Wire Wire Line
	5350 3350 4850 3350
Wire Wire Line
	5800 3850 5800 3450
Wire Wire Line
	5350 4450 5350 4550
Connection ~ 5350 4550
Wire Wire Line
	5350 4550 5800 4550
Wire Wire Line
	5800 4450 5800 4550
Connection ~ 5800 4550
Wire Wire Line
	5800 4550 6300 4550
$Comp
L Device:Jumper JP2
U 1 1 60FBE368
P 5800 4150
F 0 "JP2" V 5754 4276 50  0000 L CNN
F 1 "Mode2" V 5845 4276 50  0000 L CNN
F 2 "" H 5800 4150 50  0001 C CNN
F 3 "~" H 5800 4150 50  0001 C CNN
	1    5800 4150
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 60FC427B
P 5350 4150
F 0 "JP1" V 5304 4276 50  0000 L CNN
F 1 "Mode1" V 5395 4276 50  0000 L CNN
F 2 "" H 5350 4150 50  0001 C CNN
F 3 "~" H 5350 4150 50  0001 C CNN
	1    5350 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 3450 5800 3450
$EndSCHEMATC
