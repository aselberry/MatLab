clc; clear; close all;

syms x y z

F(x, y, z ) = x^2 + y^2 + z^2 -1;
fimplicit3(F)

axis equal
hold on 

F(0, 1, 1)
plot3(0, 1, 1, 'r*', 'MarkerSize', 30)