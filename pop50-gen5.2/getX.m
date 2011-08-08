function getX
fid = fopen('x.txt','w');

% dakota .in file variable descriptor
for i = 1:1598
    fprintf(fid,'"x%d" ',i);
end
fclose(fid);


%fid = fopen('template.txt', 'w');
%for i = 1:1598
%    fprintf(fid,'variable %d {x%d}\n',i, i);
%end
%fclose(fid);

% dakota .template file in the templatedir
fid = fopen('template.txt', 'w');
for i = 1:1598
    fprintf(fid,'{x%d}\n',i);
end
fclose(fid);

end
