clear all; clc;

input_multislice = multem_default_values();         % Load default values;

input_multislice.pn_model = 3;                  % ePM_Still_Atom = 1, ePM_Absorptive = 2, ePM_Frozen_Phonon = 3
input_multislice.interaction_model = 1;             % eESIM_Multislice = 1, eESIM_Phase_Object = 2, eESIM_Weak_Phase_Object = 3
input_multislice.potential_slicing = 1;             % ePS_Planes = 1, ePS_dz_Proj = 2, ePS_dz_Sub = 3, ePS_Auto = 4
input_multislice.pn_dim = 111; 
input_multislice.pn_seed = 300183; 
input_multislice.pn_nconf = 3;

input_multislice.spec_rot_theta = 0; 					% final angle
input_multislice.spec_rot_u0 = [1 0 0]; 					% unitary vector			
input_multislice.spec_rot_center_type = 1; 			% 1: geometric center, 2: User define		
input_multislice.spec_rot_center_p = [0 0 0];					% rotation point

na = 4; nb = 4; nc = 20; ncu = 2; rms3d = 0.085;

[input_multislice.spec_atoms, input_multislice.spec_lx...
, input_multislice.spec_ly, input_multislice.spec_lz...
, a, b, c, input_multislice.spec_dz] = Au001Crystal(na, nb, nc, ncu, rms3d);

% show_crystal(1, input_multislice.spec_atoms);

input_multislice.spec_dz = 5.0;

view
% get spec slicing
tic;
[atoms, Slice] = il_spec_slicing(input_multislice);
toc;
[natoms,~] = size(atoms); [nslice, ~] = size(Slice);

for i = 1:nslice
    figure(1); clf;
    i1 = Slice(i, 5); i2 = Slice(i, 6); ii = i1:1:i2;
    plot3(atoms(:, 2), atoms(:, 3), atoms(:, 4), '.k', atoms(ii, 2), atoms(ii, 3), atoms(ii, 4), 'or');
    set(gca,'FontSize',12,'LineWidth',1,'PlotBoxAspectRatio',[1.25 1 1]);
    title('Atomic positions');
    ylabel('y','FontSize',14);
    xlabel('x','FontSize',12);
    axis equal;
    i2-i1+1
    view([1 0 0]);
    pause(0.1);
end

[size(input_multislice.spec_atoms, 1), natoms, nslice]
[input_multislice.spec_lx, input_multislice.spec_ly, input_multislice.spec_lz]