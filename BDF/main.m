clc
clear all
close all

# -------------------------------------------BDF1----------------------------------------------#

precision = 100;

a = 0;
b = 5;
# L'équation différentielle : y' = 3-y
# Sa solution est : -2*exp(-x)+3

# Par la méthode numérique
y0 = 1;


# Plot data
figure("Name", "y'+y = 3");
n = 8;
[x_y y] = EulerInv(y0, n, a, b, @Fun);
x_f = linspace(a, x_y(end), precision);
f = -2*exp(-x_f)+3;
plotPersonalized(x_y, y, x_f, f, 2, 2, 1, "red", "blue", sprintf("Nombre d'itérations = %d", n), "Solution approchée", "Solution exacte");

n = 10;
[x_y y] = EulerInv(y0, n, a, b, @Fun);
x_f = linspace(a, x_y(end), precision);
f = -2*exp(-x_f)+3;
plotPersonalized(x_y, y, x_f, f, 2, 2, 2, "red", "blue", sprintf("Nombre d'itérations = %d", n), "Solution approchée", "Solution exacte");

n = 20;
[x_y y] = EulerInv(y0, n, a, b, @Fun);
x_f = linspace(a, x_y(end), precision);
f = -2*exp(-x_f)+3;
plotPersonalized(x_y, y, x_f, f, 2, 2, 3, "red", "blue", sprintf("Nombre d'itérations = %d", n), "Solution approchée", "Solution exacte");

n = 50;
[x_y y] = EulerInv(y0, n, a, b, @Fun);
x_f = linspace(a, x_y(end), precision);
f = -2*exp(-x_f)+3;
plotPersonalized(x_y, y, x_f, f, 2, 2, 4, "red", "blue", sprintf("Nombre d'itérations = %d", n), "Solution approchée", "Solution exacte");
printf("Cliquez sur un bouton pour continuer ...\n");
pause;
# -------------------------------------------BDF3----------------------------------------------#

# Ce problème ne peut pas être résolu par les méthodes exactes

a = 0;
b = 3;
y0 = 0;
# L'équation différentielle : y' = 0.5xy-2x+4
# Sa solution est : 4*(exp((x^2)/4)*(erf(x/2)*sqrt(pi)-1)+1)
# Par la méthode numérique



# Plot data
figure("Name", "y' = 0.5xy-2x+4");
n = 6;
[x_y, y] = BDF3(y0, n, a, b, @Fun2);
x_f = linspace(a, x_y(end), precision);
f = -4*exp((x_f.^2)./4) + 4*sqrt(pi).*erf(x_f./2).*exp((x_f.^2)./4) + 4;
plotPersonalized(x_y, y, x_f, f, 2, 2, 1, "red", "blue", sprintf("Nombre d'itérations = %d", n), "Solution approchée", "Solution exacte");

n = 15;
[x_y, y] = BDF3(y0, n, a, b, @Fun2);
x_f = linspace(a, x_y(end), precision);
f = -4*exp((x_f.^2)./4) + 4*sqrt(pi).*erf(x_f./2).*exp((x_f.^2)./4) + 4;
plotPersonalized(x_y, y, x_f, f, 2, 2, 2, "red", "blue", sprintf("Nombre d'itérations = %d", n), "Solution approchée", "Solution exacte");

n = 25;
[x_y, y] = BDF3(y0, n, a, b, @Fun2);
x_f = linspace(a, x_y(end), precision);
f = -4*exp((x_f.^2)./4) + 4*sqrt(pi).*erf(x_f./2).*exp((x_f.^2)./4) + 4;
plotPersonalized(x_y, y, x_f, f, 2, 2, 3, "red", "blue", sprintf("Nombre d'itérations = %d", n), "Solution approchée", "Solution exacte");

n = 55;
[x_y, y] = BDF3(y0, n, a, b, @Fun2);
x_f = linspace(a, x_y(end), precision);
f = -4*exp((x_f.^2)./4) + 4*sqrt(pi).*erf(x_f./2).*exp((x_f.^2)./4) + 4;
plotPersonalized(x_y, y, x_f, f, 2, 2, 4, "red", "blue", sprintf("Nombre d'itérations = %d", n), "Solution approchée", "Solution exacte");

printf("Cliquez sur un bouton pour continuer ...\n");
pause;
#-------------------------Comparaison--------------------------#

a = 0;
b = 3;
y0 = 0;
list_n = [10, 20, 30, 60];

for i=1:4
  n = list_n(i);
  [x_bdf1, y_bdf1] = EulerInv(y0, n, a, b, @Fun2);
  [x_bdf3, y_bdf3] = BDF3(y0, n, a, b, @Fun2);
  x_f = linspace(a, x_y(end), precision);
  f = -4*exp((x_f.^2)./4) + 4*sqrt(pi).*erf(x_f./2).*exp((x_f.^2)./4) + 4;
  plotComparaison(x_bdf1, y_bdf1, x_bdf3, y_bdf3, x_f, f, 2, 2, i, "green", "red", "blue", sprintf("Nombre d'itérations = %d\nMAE(BDF1) = %f\nMAE(BDF3) = %f ", n, errorFunc(y_bdf1, f), errorFunc(y_bdf3, f)), "BDF1", "BDF3", "y", a, b);
end
