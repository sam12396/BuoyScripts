% Buoy44009 thredds
clear all;close all;
% addpath(genpath('/Users/samcoa/Documents/MATLAB/tnmiles_basic/'));

lname='http://dods.ndbc.noaa.gov//thredds/dodsC/data/stdmet/';
buoyn='44009/';
fname='44009h';
yr=1984:2015;

date=[];
sst=[];
%Windspeed m/s
W=[];
Wdir=[];
for k=1:length(yr); 
    y=yr(k)
filename=([lname buoyn fname num2str(yr(k)) '.nc']);

time_buoy=ncread(filename,'time');
date=datenum(1970,0,0,0,0,double(time_buoy));
sst1=squeeze(ncread(filename,'sea_surface_temperature'));
W1=squeeze(ncread(filename,'wind_spd'));
Wdir1=squeeze(ncread(filename,'wind_dir'));

% ii=date >= datenum(y,7,1) & date < datenum(y,12,1);
% date=date(ii);
% sst1=sst1(ii);
% W1=W1(ii);

% sst1=filter_travis(sst1,1,20);
% W1=filter_travis(W1,1,20);
figure
% subplot(2,1,1)
plot(date,sst1,'k');
title(['Surface Temperature' num2str(y)]);
datetick('x',3);
ylim([10,30]);
% subplot(2,1,2)
% plot(date,W1,'k');
% title(['Wind Speed' num2str(y)]);
% datetick('x',3);
%ylim([10,30]);
% print(['/Users/samcoa/Documents/MATLAB/Figures/BuoyTimeS/' fname '_' num2str(y)],'-dpng','-r150');
% close all
end