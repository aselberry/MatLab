clc; clear; close all;

syms t
cx(t) = t*cos(t);
cy(t) = t*sin(t);
cz(t) = t; 
fplot3(cx, cy, cz, [0 20*pi], 'g', 'LineWidth', 2)

hold on

xlabel('x')
ylabel('y')
zlabel('z')

t0 = 5*pi;
P = [cx(t0), cy(t0), cz(t0)];
plot3(P(1), P(2), P(3), '.k', 'MarkerSize', 20)

cxd(t) = diff(cx, t);
cyd(t) = diff(cy, t);
czd(t) = diff(cz, t);

v = [cxd(t0), cyd(t0), czd(t0)];
quiver3(P(1), P(2), P(3), ...
    v(1), v(2), v(3), 'b', 'LineWidth', 10)