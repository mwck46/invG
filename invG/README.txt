A comprehensive program for gravity interpretation:

-Extraction field data in '.gxf' formmat 
-forward modelling
-inversion 
-benchmark testing with synthetic signal

It is written in Matlab 2013b environment with a Graphical User Interface (GUI)


Download the following files:
---------------------------------------------------------------------------------------------
compactInversion.m            | main algorithm for compact inversion
Extract.fig                   | 
Extract.m                     | GUI menu for extract data
Forward.fig                   | 
Forward.m                     | GUI menu for forward modelling
g2_101_104_49_52_2kba.gxf     | Example data file
grav_dyke.m                   | generate analytical signal of 2D trapizoidal prism
grav_fault.m                  | generate analytical signal of a semi-infinite slab 
grav_sphere.m                 | generate analytical signal of a sphere
Inversion.fig                 | 
Inversion.m                   | GUI menu for inversion
invG.fig                      |
invG.m                        | Main menu
invG_colormap.mat             | data of color bar
kernel.m                      | 
loaddensity.fig               |
loaddensity.m                 |
loadfile.m                    |
opentxt.m                     | open data stored in '.txt'
real2_inv.dat                 | Temporary file for data transition between different GUI menu
savedensity.fig               |
savedensity.m                 |
savetxt.m                     | save results as '.txt' format
Synthetic.fig                 | 
Synthetic.m                   | GUI menu for generating synthetic signal

