function [Crys3D, lx, ly, lz, a, b, c, dz] = SrTiO3110Crystal(na, nb, nc, ncu, rms3d)
CrysPar.na = na;
CrysPar.nb = nb;
CrysPar.nc = nc;
a = 3.9050; 
b = 3.9050*sqrt(2); 
c = 3.9050*sqrt(2);
CrysPar.a = a;
CrysPar.b = b;
CrysPar.c = c;
CrysPar.nuLayer = 4;
occ = 1;region = 0;charge = 0;
% Sr = 38, Ti = 22; O = 8
% Z charge x y z rms3d occupancy region charge
CrysPar.uLayer(1).atoms = [38, 0.50, 0.00, 0.00, rms3d, occ, region, charge; 8, 0.50, 0.50, 0.00, rms3d, occ, region, charge; 22, 0.0, 0.5, 0.0, rms3d, occ, region, charge];
CrysPar.uLayer(2).atoms = [8, 0.00, 0.25, 0.25, rms3d, occ, region, charge; 8, 0.00, 0.75, 0.25, rms3d, occ, region, charge];
CrysPar.uLayer(3).atoms = [8, 0.50, 0.00, 0.50, rms3d, occ, region, charge; 38, 0.50, 0.50, 0.50, rms3d, occ, region, charge; 22, 0.00, 0.00, 0.50, rms3d, occ, region, charge];
CrysPar.uLayer(4).atoms = [8, 0.00, 0.25, 0.75, rms3d, occ, region, charge; 8, 0.00, 0.75, 0.75, rms3d, occ, region, charge];

Crys3D = il_crystal_by_lays(CrysPar);

dz = CrysPar.c/ncu;
lx = na*CrysPar.a; ly = nb*CrysPar.b; lz = nc*CrysPar.c;