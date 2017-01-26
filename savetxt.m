%Function:
%Save x coordinate and density

global xx G_model

local_path=pwd;

[FileName,PathName] = uiputfile('*.txt','Save File');
head1='X[m]';
head2='Gravity anomaly (mGal)';
header=strcat(head1, '\t', head2);

cd(PathName);
fid = fopen(FileName,'w');
fprintf(fid, header, 'newline', 'pc');
fclose(fid);
dlmwrite(FileName, [xx,G_model], 'newline','pc', 'delimiter','\t', '-append', 'roffset',1, 'precision','%.3f');
cd(local_path);