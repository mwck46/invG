#invG

A comprehensive program for gravity interpretation, written in MATLAB with Graphical User Interface (GUI).

It can do the following things: (1) Extraction field data stored in '.gxf' formmat; (2) Forward modelling; (3) Inversion; (4) Generate analytical signal for testing the inversion algorithm.

It is written in Matlab 2013b

Before Start
---------------------------------------------------------------------------------------------
Download all the following files. Functions of each file is stated in 'README.txt'











--------------------------------
Start the programme
--------------------------------
Type invG and press 'Enter'. A window with 4 options will popup:

-Extract data

-Forward modelling

-Inversion

-Synthetic data


-----------------------------
Extract data
-----------------------------
1. Click 'File' -> 'Open' -> choose a '.gxf' file

2. Click the 'Choose profile' button, 

3. Select 2 points on the contour map

4. Give a name to the '.txt' file if you want to save it

3. Click 'Exit' -> 'Inversion' to direct to the inversion menu


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

2. Choose the shape of anomalous mass (2D trapizoidal prism / sphere / semi-infinite slab)

3. Modify the geometry, depth and density

4. Click 'Compute'

5. Save the profile as '.txt' by 'File'-> 'Save'

6. Click 'Inversion' to import the current profile to the inversion menu



