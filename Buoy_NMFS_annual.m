%Plots buoy and nmfs on same plot to find over lap in data. Chopped at
%38-40N.

% Buoy44009 thredds
clear all;close all;

lname='http://dods.ndbc.noaa.gov//thredds/dodsC/data/stdmet/';
buoyn='44025/';
fname='44025h';
yr=1991:2015;

date=[];
sst=[];
%Windspeed m/s
W=[];
Wdir=[];

readnmfsdata;
ind3=find(lat<=41.5 & lat>=38);
surftemp=surftemp(ind3);
bottemp=bottemp(ind3);
timeGMT=timeGMT(ind3);
lon=lon(ind3);
ind4=find(lon<=-71 & lon>=-75);
surftemp=surftemp(ind4);
bottemp=bottemp(ind4);
timeGMT=timeGMT(ind4);

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
% g_botsal=find(~isnan(botsal));
% g_surfsal=find(~isnan(surfsal));

iii=find(timeGMT>= datenum(y,1,1) & timeGMT<= datenum(y,12,31));
g_surftemp=surftemp(iii);
g_bottemp=bottemp(iii);
t_timeGMT=timeGMT(iii);
ind1=find(~isnan(g_surftemp));
g_surftemp=g_surftemp(ind1);
g_bottemp=g_bottemp(ind1);
t_timeGMT=t_timeGMT(ind1);


% sst1=filter_travis(sst1,1,20);
% W1=filter_travis(W1,1,20);
figure
% subplot(2,1,1)
plot(date,sst1,'k');
hold on
scatter(t_timeGMT,g_surftemp,5,'r','filled');
hold on
scatter(t_timeGMT,g_bottemp,5,'b','filled');
title(['Surface and Bottom Temperature' num2str(y)]);
xlim([datenum(y-1,12,25) datenum(y+1,1,7)]);
datetick('x',3, 'keeplimits', 'keepticks');
ylim([0,30]);
% subplot(2,1,2)
% plot(date,W1,'k');
% title(['Wind Speed' num2str(y)]);
% datetick('x',3);
%ylim([10,30]);


print(['/Users/samcoa/Documents/MATLAB/Figures/Buoy_NMFS/ts_44025_glid_' num2str(y)],'-dpng','-r150');
close all
end