XX = load('dan_vuz.txt');

X = XX(:, 3:13);
[vect_X, lambda_X] = eig(X'*X);
GlComp_X = vect_X(:, end);
Res = X * GlComp_X;

Y = XX(:, 14:15);

[vect_Y, lambda_Y] = eig(Y'*Y);
Sobst_Y = diag(lambda_Y);
SobMax_Y = Sobst_Y(end);
GlComp_Y = vect_Y(:, end);

Delt_Y = 100 * SobMax_Y / sum(Sobst_Y);
fprintf('Доля информации о кадрах: %d%%\n', round(Delt_Y));

StaffRes = Y * GlComp_Y;

fp_staff = fopen('staff_prtcl.txt', 'w');
fprintf(fp_staff, 'Код вуза | Кадровое обеспечение\n');
fprintf(fp_staff, '%d \t %f\n', [XX(:,1), StaffRes]');
fclose(fp_staff);

CorStaffFin = corr(StaffRes, XX(:,2));
fprintf('Корреляция кадров и финансирования = %f\n', CorStaffFin);

CorResStaff = corr(Res, StaffRes);
fprintf('Корреляция результативности и кадров = %f\n', CorResStaff);
