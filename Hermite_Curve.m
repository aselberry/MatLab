clc; clear; close all;

px = [-2 6];
py = [-2 -2];

plot(px, py, '*r', 'MarkerSize', 10)
hold on 

vx = [6 4];
vy = [-4 4];

quiver(px(1), py(1), vx(1), vy(1), 'm', 'LineWidth', 2)
hold on
quiver(px(2), py(2), vx(2), vy(2), 'y', 'LineWidth', 2)
hold on

axis equal

t1 = 0;
t2 = 1;
syms t a3 a2 a1 a0

fx(t) = a3*t^3+a2*t^2+a1*t+a0;
fxd = diff(fx, t);
ex = [px(1) == fx(t1), ...
      px(2) == fx(t2), ...
      vx(1) == fxd(t1), ...
      vx(2) == fxd(t2)];
sx = solve(ex, [a3 a2 a1 a0]);
cx = subs(fx, [a3 a2 a1 a0], [sx.a3 sx.a2 sx.a1 sx.a0]);

syms b3 b2 b1 b0
fy(t) = b3*t^3+b2*t^2+b1*t+b0;
fyd = diff(fy, t);
ey = [py(1) == fy(t1), ...
      py(2) == fy(t2), ...
      vy(1) == fyd(t1),...
      vy(2) == fyd(t2)];
sy = solve(ey, [b3 b2 b1 b0]);
cy = subs(fy, [b3 b2 b1 b0], [sy.b3 sy.b2 sy.b1 sy.b0]);

fplot(cx, cy, [t1 t2], 'g', 'LineWidth', 2)
hold on

hpx = [px(2) 14];
hpy = [py(2) -4];

hvx = [vx(2) 3];
hvy = [vy(2) 0];

plot(hpx, hpy, '.k', 'MarkerSize', 10)
hold on

quiver(hpx(1), hpy(1), hvx(1), hvy(1), '--k', 'LineWidth', 2)

quiver(hpx(2), hpy(2), hvx(2), hvy(2), '--k', 'LineWidth', 2)

t3 = 0;
t4 = 2;

syms c3 c2 c1 c0
hfx(t) = c3*t^3+c2*t^2+c1*t+c0;
hfxd(t) = diff(hfx);
hex = [hpx(1) == hfx(t3), ...
       hpx(2) == hfx(t4), ...
       hvx(1) == hfxd(t3), ...
       hvx(2) == hfxd(t4)];
hsx = solve(hex, [c3 c2 c1 c0]);
hcx = subs(hfx, [c3 c2 c1 c0], [hsx.c3 hsx.c2 hsx.c1 hsx.c0]);

syms d3 d2 d1 d0
hfy(t) = d3*t^3+d2*t^2+d1*t+d0;
hfyd(t) = diff(hfy);
hey = [hpy(1) == hfy(t3), ...
       hpy(2) == hfy(t4), ...
       hvy(1) == hfyd(t3), ...
       hvy(2) == hfyd(t4)];
hsy = solve(hey, [d3 d2 d1 d0]);
hcy = subs(hfy, [d3 d2 d1 d0], [hsy.d3 hsy.d2 hsy.d1 hsy.d0]);

fplot(hcx, hcy, [t3 t4], 'r', 'LineWidth', 2)



