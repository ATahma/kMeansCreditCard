% Code for loading and preparing the Credit Card data set
clear ; close all; clc

Filename = 'CC.csv';

Xint = csvread(Filename);

% Attrivuting every column to a variable

Balance = Xint(:,2) ; % Variable

BalanceFreq = Xint(:,3) ; % Balance Frequence

Purchases =Xint(:,4); % Purchases 

OneoffPurch = Xint(:,5) ; % One Off Purchases

InstalPurch = Xint(:,6)  ; % Installement Purchases

CashAdv = Xint(:,7); % Cash Advancees

PurchFreq = Xint(:,8); % Purchase Frequency

OneoffPurchFreq = Xint(:,9); % One Off Purchase Frequency

PurchInstalFreq = Xint(:,10) ;  % Purchase Instqallement Frequency

CashAdvFreq =  Xint(:,11); % Cash Advance Frequency

CashAdvTrx = Xint(:,12); % Cash Advance TRXint


PurchTrx  =  Xint(:,13);% Pruchases TRX

CredLim  = Xint(:,14);% Credit Limit


Payments  = Xint(:,15); % Payments

MinPay  =  Xint(:,16); % Minimum Payments

PrcFullPay = Xint(:,17) ; % 

Tenure = Xint(:,18) ;

% Perform Feature Scaling 
BalanceSc = featureScale(Balance);

PurchSc = featureScale(Purchases);

CashAdvSc = featureScale(CashAdv);

CredLim = featureScale(CredLim);

% Choose according to which features you want to perform k means

% make X

X = [BalanceSc' ; PurchSc' ; CashAdvSc' ; CredLim' ; PurchFreq']';

% Initialize your random centroids
[rowX colX] = size(X);

K = 5 ; % 5 centroids
initial_centroids = kMeansInitCentroids(X, K);

% Find Closest Centroids

idx = findClosestCentroids(X, initial_centroids);
fprintf(' [X] Find Closest Centroids ------ Program paused. Press enter to continue.\n');
pause;

% Calculate new Centroids

centroids = computeCentroids(X, idx, K);
fprintf(' [X] Calculate new Centroids ------  Program paused. Press enter to continue.\n');
pause;


% Run K-means 
max_iters = 10;

[centroids, idx] = runkMeans(X, initial_centroids, ...
                                      max_iters, true)

fprintf('\nK-Means Done.\n\n');

fprintf('Program paused. Press enter to continue.\n');
pause;


