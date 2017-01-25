#invG

A comprehensive program for gravity interpretation:
-Extraction field data in '.gxf' formmat 
-forward modelling
-inversion 
-benchmark testing with synthetic signal

It is written in Matlab 2013b environment with a Graphical User Interface (GUI)


Download the following files:




g2_101_104_49_52_2kba.gxf (Example data file)










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



