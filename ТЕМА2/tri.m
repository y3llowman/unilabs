warning('off', 'all');
graphics_toolkit('gnuplot');
fp=fopen('prtcl.txt ','w')
XX=load('dan_vuz.txt');
X=XX(:,3:13);
R=corr(X);
[vect,lambda]=eig(X'*X);
Sobst=diag(lambda);
fprintf(fp,'Eigenvalues:\n %f \n',Sobst)
fprintf(fp, '\n')
SobMax=Sobst(end);
GlComp=vect(:,end);
Delt=100*SobMax/sum(Sobst);
fprintf(fp, 'Delta= %d \n ',round(Delt))
Res=X*GlComp;

# 6 пункт
minres = min(Res)
maxres = max(Res)
meanres = mean(Res)
stdres = std(Res)

fprintf(fp, ' Results \n ')
fprintf(fp, '%d  %f \n ',[XX(:,1),Res] )
# fprintf(fp, 'min: %f', minres, '\n', 'max: %f', maxres, '\n', 'mean: %f', meanres, '\n', 'std: %f', stdres)
fprintf(fp, 'min: %f\n max: %f\n mean: %f \n std: %f', [minres, maxres, meanres, stdres])
hist(Res,20);
xlabel('Results ');
ylabel('Number of Unis ');
saveas(gcf, 'Hist.jpg ', 'jpg ');
fclose(fp)

