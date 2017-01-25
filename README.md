#invG

A comprehensive program for gravity interpretation:
-Extraction field data in '.gxf' formmat 
-forward modelling
-inversion 
-benchmark testing with synthetic signal

It is written in Matlab 2013b environment with a Graphical User Interface (GUI)

Download the following files:
---------------------------------------------------------------------------------------
compactInversion.m            | main algorithm for compact inversion
Extract.fig                   | 
Extract.m                     | GUI menu for extract data
Forward.fig                   | 
Forward.m                     | GUI menu for forward modelling
g2_101_104_49_52_2kba.gxf     | Example data file
grav_dyke.m                   | analytical signal of 2D trapizoidal prism
grav_fault.m                  | analytical signal of a semi-infinite slab 
grav_sphere.m                 | analytical signal of a sphere
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



Reference files
-----------------------------------------------------------------------------------------------
gxf_details.pdf               | pdf file explaining the details of '.gxf' format














--------------------------------
Start the programme
--------------------------------
type invG and press Enter
A window with 4 options will popup:
-Extract data
-Forward modelling
-Inversion
-Synthetic data


-----------------------------
Extract data
-----------------------------
1. Click File -> Open -> choose a '.gxf' file
Upon successful openning of the file, a 3D gravity anomaly map will popup.
x-y coordinates represent the location of measured data; z axis is gravity anomaly data

2. Click the 'Choose profile' button, to choose arbitrary 2 points on the contour map
An interpolated 2D profile will be generated and stored in a '.txt' file. 

3. Click 'Exit' -> 'Inversion'
Direct to inversion menu directly


-----------------------------
Inversion
-----------------------------



-----------------------------
Forward modelling
-----------------------------





-----------------------------
Synthetic data
-----------------------------
Generate synthemtic data for testing the compact inversion algorithm. Synthetic signals are calculated by analytical formula (see Theoretical_Background.pdf)

1. Click 'Example'

2. Choose the shape of anomalous mass 
-2D trapizoidal prism
-sphere
-semi-infinite slab

3. Modify the geometry, depth and density

4. Click 'Compute'

5. Save the profile as '.txt' by 'File'-> 'Save'

6. Click 'Inversion'
Import the current profile to the inversion menu



