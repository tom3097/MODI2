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

M=[ones(100,1) U_ucz];
W=M\Y_ucz;
display(W);

a0 = W(1);
a1 = W(2);

U_mod = -1: 0.1: 1;
Y_mod = a0 + a1 * U_mod;

% charakterystyka y(u) - model liniowy
figure;
plot(U_mod, Y_mod);
xlabel('U')
ylabel('Y')

% blad na zbiorze uczacym
Y_ucz_pre = a0 + a1 * U_ucz;
Err_Y_ucz = sum((Y_ucz_pre - Y_ucz).^2);
display(Err_Y_ucz);

% blad na zbiorze weryfikujacym
Y_wer_pre = a0 + a1 * U_wer;
Err_Y_wer = sum((Y_wer_pre - Y_wer).^2);
display(Err_Y_wer);

% model na tle zbioru uczacego
figure;
plot(U_mod, Y_mod);
hold on;
scatter(U_ucz, Y_ucz);
xlabel('Uucz');
ylabel('Yucz');

% model na tle zbioru weryfikujacego
figure;
plot(U_mod, Y_mod);
hold on;
scatter(U_wer, Y_wer);
xlabel('Uwer');
ylabel('Ywer');