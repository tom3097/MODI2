clear all; %#ok<*CLALL>

load('danestat2.txt');

U = danestat2(:,1);
Y = danestat2(:,2);

% dane statyczne
figure;
scatter(U,Y);
xlabel('U')
ylabel('Y')