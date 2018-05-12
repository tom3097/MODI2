clear all; %#ok<*CLALL>

load('danestat2.txt');

data_length = length(danestat2);

U = danestat2(:,1);
Y = danestat2(:,2);

U_ucz = zeros(data_length / 2, 1);
U_wer = zeros(data_length / 2, 1);
Y_ucz = zeros(data_length / 2, 1);
Y_wer = zeros(data_length / 2, 1);

index = 1;
for i = 1:2:data_length
    U_ucz(index) = U(i);
    Y_ucz(index) = Y(i);
    index = index + 1;
end

index = 1;
for i = 2:2:data_length
    U_wer(index) = U(i);
    Y_wer(index) = Y(i);
    index = index + 1;
end

% dane statyczne - zbior uczacy
figure;
scatter(U_ucz,Y_ucz);
xlabel('Uucz')
ylabel('Yucz')

% dane statyczne - zbior weryfikujacy
figure;
scatter(U_wer,Y_wer);
xlabel('Uwer')
ylabel('Ywer')
    