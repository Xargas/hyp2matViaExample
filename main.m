clear all; close all; clc

addpath('F:/openEMS/matlab');
addpath('F:/openEMS/hyp2mat/matlab');

physical_constants;
f_max = 20e9;

pcbfile = 'ViaExample.HYP';

CSX = InitCSX();
CSX = ImportHyperLynx(CSX, pcbfile, 'arc-precision', 0.0000254);

FDTD = InitFDTD();
FDTD = SetGaussExcite(FDTD, f_max/2, f_max/2);

Sim_Path = 'tmp';
Sim_CSX = 'pcbcsx.xml';
 
[status, message, messageid] = rmdir(Sim_Path, 's');
[status, message, messageid] = mkdir(Sim_Path );

WriteOpenEMS([Sim_Path '/' Sim_CSX], FDTD, CSX);

CSXGeomPlot([Sim_Path '/' Sim_CSX]);
