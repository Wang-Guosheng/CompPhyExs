function [ hd ]  =  helmholtzfun(Ru, Rl, h)
% HELMHOLTXFUN plot the magnetic induction of helmholtz coils with radius
% Ru,  Rd,  and height h.
%  return the handle of the plot

    phi = 0:pi/20:2*pi;
    plot3(Ru*cos(phi), Ru*sin(phi), h/2*ones(size(phi)), 'r - ', 'LineWidth', 3); hold on;
    plot3(Rl*cos(phi), Rl*sin(phi),  - h/2*ones(size(phi)), 'r - ', 'LineWidth', 3);
    rx = @(R, x, phi)x - R*cos(phi);
    ry = @(R, y, phi)y - R*sin(phi);
    rzu = @(h, z, phi)z - h/2;
    rzl = @(h, z, phi)z + h/2;
    r2u = @(Ru, Rd, h, x, y, z, phi)rx(Ru, x, phi).^2 + ry(Ru, y, phi).^2 + rzu(h, z, phi).^2;
    r2l = @(Ru, Rd, h, x, y, z, phi)rx(Rd, x, phi).^2 + ry(Rd, y, phi).^2 + rzl(h, z, phi).^2;
    dbxdphi = @(Ru, Rd, h, x, y, z, phi)  (Ru*z.*(cos(phi))./r2u(Ru, Rd, h, x, y, z, phi) + Rd*z.*(cos(phi))./r2l(Ru, Rd, h, x, y, z, phi));
    dbydphi = @(Ru, Rd, h, x, y, z, phi)  (Ru*z.*(sin(phi))./r2u(Ru, Rd, h, x, y, z, phi) + Rd*z.*(sin(phi))./r2l(Ru, Rd, h, x, y, z, phi));
    dbzdphi = @(Ru, Rd, h, x, y, z, phi) -(Ru*(rx(Ru, x, phi).*cos(phi) + ry(Ru, y, phi).*sin(phi))./r2u(Ru, Rd, h, x, y, z, phi) + Rd*(rx(Rd, x, phi).*cos(phi) + ry(Rd, y, phi).*sin(phi))./r2l(Ru, Rd, h, x, y, z, phi));
    [x, y, z] = meshgrid((-2:1:2).*max(Ru, Rl));
    Bx = zeros([1, numel(x)]); By = Bx; Bz = Bx;
    for k = 1:numel(x)
    	Bx(k) = integral(@(phi)dbxdphi(Ru, Rl, h, x(k), y(k), z(k), phi), 0, 2*pi);
    	By(k) = integral(@(phi)dbydphi(Ru, Rl, h, x(k), y(k), z(k), phi), 0, 2*pi);
    	Bz(k) = integral(@(phi)dbzdphi(Ru, Rl, h, x(k), y(k), z(k), phi), 0, 2*pi);
    end
    Bx = reshape(Bx, size(x)); By = reshape(By, size(x)); Bz = reshape(Bz, size(x));
    c = coneplot(x, y, z, Bx, By, Bz, .1, 'nointerp'); c.FaceColor = 'red'; c.EdgeColor = 'none'; light;
    [startx, starty] = meshgrid((-2:1:2).*max(Ru, Rl));
    startz = -2*max(Ru, Rl)*ones(size(startx));
    streamline(x, y, z, Bx, By, Bz, startx, starty, startz, [.1,15000]);
    streamline(x, y, z, Bx, By, Bz, startx, startz, starty, [.1,5000]);
    streamline(x, y, z, Bx, By, Bz, startz, starty, startx, [.1,5000]);
    streamline(x, y, z, Bx, By, Bz, startx, -startz, starty, [.1,5000]);
    streamline(x, y, z, Bx, By, Bz, -startz, starty, startx, [.1,5000]);
    hd = gca; hold off;
end