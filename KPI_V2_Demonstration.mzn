%VARIABLES
%(коэффициент расхода металла:группа крепежа(1,2,3,4,5,6,8), накатка/пресс (n/p), старый/новый участок (s/n)) 

var 1.0000..2.0000: K1ns;
var 1.0000..2.0000: K2ns;
var 1.0000..2.0000: K3ns;
var 1.0000..2.0000: K4ns;
var 1.0000..2.0000: K5ns;
var 1.0000..2.0000: K6ns;
var 1.0000..2.0000: K8ns;

var 1.0000..2.0000: K1ps;
var 1.0000..2.0000: K2ps;
var 1.0000..2.0000: K3ps;
var 1.0000..2.0000: K4ps;
var 1.0000..2.0000: K5ps;
var 1.0000..2.0000: K6ps;
var 1.0000..2.0000: K8ps;

var 1.0000..2.0000: K1nn;
var 1.0000..2.0000: K2nn;
var 1.0000..2.0000: K3nn;
var 1.0000..2.0000: K4nn;
var 1.0000..2.0000: K5nn;
var 1.0000..2.0000: K6nn;
var 1.0000..2.0000: K8nn;

var 1.0000..2.0000: K1pn;
var 1.0000..2.0000: K2pn;
var 1.0000..2.0000: K3pn;
var 1.0000..2.0000: K4pn;
var 1.0000..2.0000: K5pn;
var 1.0000..2.0000: K6pn;
var 1.0000..2.0000: K8pn;

%Входные данные по объему производств которые необходимо освоить
%(объем производства:группа крепежа(1,2,3,4,5,6,8), старый/новый участок (S/N))

int: V1s = 500;
int: V2s = 4000;
int: V3s = 1000;
int: V4s = 200;
int: V5s = 200;
int: V6s = 0;
int: V8s = 0;

int: V1n = 500;
int: V2n = 3000;
int: V3n = 200;
int: V4n = 0;
int: V5n = 0;
int: V6n = 0;
int: V8n = 0;

%Вводим и рассчитываем коэффициенты удельного расхода металла по группам изделий, по переделам для старого и нового участка 
%(коэффициент расхода металла:группа крепежа(1,2,3,4,5,6,8), накатка/пресс (n/p))

var float: K1n = if (V1s + V1n) > 0 then ((K1ns*V1s + K1nn*V1n)/(V1s + V1n)) else 0 endif;
var float: K2n = if (V2s + V2n) > 0 then ((K2ns*V2s + K2nn*V2n)/(V2s + V2n)) else 0 endif;
var float: K3n = if (V3s + V3n) > 0 then ((K3ns*V3s + K3nn*V3n)/(V3s + V3n)) else 0 endif;
var float: K4n = if (V4s + V4n) > 0 then ((K4ns*V4s + K4nn*V4n)/(V4s + V4n)) else 0 endif;
var float: K5n = if (V5s + V5n) > 0 then ((K5ns*V5s + K5nn*V5n)/(V5s + V5n)) else 0 endif;
var float: K6n = if (V6s + V6n) > 0 then ((K6ns*V6s + K6nn*V6n)/(V6s + V6n)) else 0 endif;
var float: K8n = if (V8s + V8n) > 0 then ((K8ns*V8s + K8nn*V8n)/(V8s + V8n)) else 0 endif;

var float: K1p = if (V1s + V1n) > 0 then ((K1ps*V1s + K1pn*V1n)/(V1s + V1n)) else 0 endif;
var float: K2p = if (V2s + V2n) > 0 then ((K2ps*V2s + K2pn*V2n)/(V2s + V2n)) else 0 endif;
var float: K3p = if (V3s + V3n) > 0 then ((K3ps*V3s + K3pn*V3n)/(V3s + V3n)) else 0 endif;
var float: K4p = if (V4s + V4n) > 0 then ((K4ps*V4s + K4pn*V4n)/(V4s + V4n)) else 0 endif;
var float: K5p = if (V5s + V5n) > 0 then ((K5ps*V5s + K5pn*V5n)/(V5s + V5n)) else 0 endif;
var float: K6p = if (V6s + V6n) > 0 then ((K6ps*V6s + K6pn*V6n)/(V6s + V6n)) else 0 endif;
var float: K8p = if (V8s + V8n) > 0 then ((K8ps*V8s + K8pn*V8n)/(V8s + V8n)) else 0 endif;

%Вводим и рассчитываем общие коэффициенты удельного расхода металла по группам изделий для старого и нового участка
%(коэффициент расхода металла:группа крепежа(1,2,3,4,5,6,8))

var float: K1c = K1n * K1p;
var float: K2c = K2n * K2p;
var float: K3c = K3n * K3p;
var float: K4c = K4n * K4p;
var float: K5c = K5n * K5p;
var float: K6c = K6n * K6p;
var float: K8c = K8n * K8p;

%Общий объем производства участков по группам изделий
%(объем производства:группа крепежа(1,2,3,4,5,6,8))

int: V1c = V1s + V1n;
int: V2c = V2s + V2n;
int: V3c = V3s + V3n;
int: V4c = V4s + V4n;
int: V5c = V5s + V5n;
int: V6c = V6s + V6n;
int: V8c = V8s + V8n;

%Общий коэффициент расхода металла по цеху

float: Kc = 1.1020;

%CONSTRAINTS

constraint K1ns > K2ns;
constraint K2ns > K3ns;
constraint K3ns > K4ns;
constraint K4ns > K5ns;
constraint K5ns > 1;
constraint K6ns > K5ns;
constraint K8ns > K6ns;

constraint K8ps > K6ps;
constraint K6ps > K5ps;
constraint K5ps > K4ps;
constraint K4ps > K3ps;
constraint K3ps > K2ps;
constraint K2ps > K1ps;
constraint K1ps > 1;

constraint K1nn > K2nn;
constraint K2nn > K3nn;
constraint K3nn > K4nn;
constraint K4nn > K5nn;
constraint K5nn > 1;
constraint K6nn > K5nn;
constraint K8nn > K6nn;

constraint K8pn > K6pn;
constraint K6pn > K5pn;
constraint K5pn > K4pn;
constraint K4pn > K3pn;
constraint K3pn > K2pn;
constraint K2pn > K1pn;
constraint K1pn > 1;

constraint if K1c != 0 then K1c > 1 else K1c = 0 endif;
constraint if K2c != 0 then K2c > 1 else K2c = 0 endif;
constraint if K3c != 0 then K3c > 1 else K3c = 0 endif;
constraint if K4c != 0 then K4c > 1 else K4c = 0 endif;
constraint if K5c != 0 then K5c > 1 else K5c = 0 endif;
constraint if K6c != 0 then K6c > 1 else K6c = 0 endif;
constraint if K8c != 0 then K8c > 1 else K8c = 0 endif;

constraint if K1c > 1 then K1c > K2c else K1c = 0 endif;
constraint if K2c > 1 then K2c > K3c else K2c = 0 endif;
constraint if K3c > 1 then K3c > K4c else K3c = 0 endif;
constraint if K4c > 1 then K4c > K5c else K4c = 0 endif;
constraint if K5c > 1 then K5c > 1 else K5c = 0 endif;
constraint if K6c > 1 then K6c > K5c else K6c = 0 endif;
constraint if K8c > 1 then K8c > K6c else K8c = 0 endif;

%MAIN CONSTRAINT

constraint (K1c * V1c + K2c * V2c + K3c * V3c + K4c * V4c + K5c * V5c + K6c * V6c + K8c * V8c) - Kc * (V1c + V2c + V3c + V4c + V5c + V6c + V8c) = 0;

%CONSTRAINTS FOR CALIBRATION

constraint K2ns / K1ns = 0.99;
constraint K3ns / K2ns = 0.99;
constraint K4ns / K3ns = 0.99;
constraint K5ns / K4ns = 0.99;
constraint K5ns > 1.0451;

constraint K2nn / K1nn = 0.99;
constraint K3nn / K2nn = 0.99;
constraint K4nn / K3nn = 0.99;
constraint K5nn / K4nn = 0.99;
constraint K5nn > 1.05;

constraint K4pn / K5pn = 0.999;
constraint K3pn / K4pn = 0.997;
constraint K2pn / K3pn = 0.999;
constraint K1pn / K2pn = 0.999;
constraint K1pn > 1.0211;

constraint K4ps / K5ps = 0.999;
constraint K3ps / K4ps = 0.997;
constraint K2ps / K3ps = 0.999;
constraint K1ps / K2ps = 0.999;
constraint K1ps > 1.0198;

