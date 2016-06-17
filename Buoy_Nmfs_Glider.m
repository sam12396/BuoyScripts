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

%Glider trips
if y == 2015
line([datenum(2015,10,28)  datenum(2015,10,28)],[0 30], 'LineWidth',3); 
line([datenum(2015,10,8) datenum(2015,10,8)],[0 30], 'LineWidth',3);
    line([datenum(2015,10,27) datenum(2015,10,27)],[0 30], 'LineWidth',3);
line([datenum(2015,9,17) datenum(2015,9,17)],[0 30], 'LineWidth',3);
  line([datenum(2015,11,24) datenum(2015,11,24)],[0 30], 'LineWidth',3); 
line([datenum(2015,9,17) datenum(2015,9,17)],[0 30], 'LineWidth',3);
    line([datenum(2015,10,7) datenum(2015,10,7)],[0 30], 'LineWidth',3);
line([datenum(2015,8,18) datenum(2015,8,18)],[0 30], 'LineWidth',3); 
    line([datenum(2015,9,9) datenum(2015,9,9)],[0 30], 'LineWidth',3); 
line([datenum(2015,7,14) datenum(2015,7,14)],[0 30], 'LineWidth',3);
   line([datenum(2015,8,3) datenum(2015,8,3)],[0 30], 'LineWidth',3);
end

if y == 2014
line([datenum(2014,9,18) datenum(2014,9,18)],[0 30], 'LineWidth',3); 
line([datenum(2014,10,9) datenum(2014,10,9)],[0 30], 'LineWidth',3);
line([datenum(2014,9,16) datenum(2014,9,16)],[0 30], 'LineWidth',3);
line([datenum(2014,9,29) datenum(2014,9,29)],[0 30], 'LineWidth',3);
line([datenum(2014,8,15) datenum(2014,8,15)],[0 30], 'LineWidth',3);
line([datenum(2014,9,5) datenum(2014,9,5)]  ,[0 30], 'LineWidth',3);
line([datenum(2014,8,14) datenum(2014,8,14)],[0 30], 'LineWidth',3);
line([datenum(2014,9,6) datenum(2014,9,6)],[0 30], 'LineWidth',3);
line([datenum(2014,7,17) datenum(2014,7,17)],[0 30], 'LineWidth',3); 
line([datenum(2014,8,6) datenum(2014,8,6)],[0 30], 'LineWidth',3);
line([datenum(2014,7,2) datenum(2014,7,2)],[0 30], 'LineWidth',3);
line([datenum(2014,7,9) datenum(2014,7,9)],[0 30], 'LineWidth',3);
line([datenum(2014,4,22) datenum(2014,4,22)],[0 30], 'LineWidth',3);
line([datenum(2014,5,8) datenum(2014,5,8)],[0 30], 'LineWidth',3);
end

if y == 2013
line([datenum(2013,10,17) datenum(2013,10,17)],[0 30], 'LineWidth',3); 
line([datenum(2013,11,6) datenum(2013,11,6)],[0 30], 'LineWidth',3);
line([datenum(2013,9,24) datenum(2013,9,24)],[0 30], 'LineWidth',3);
line([datenum(2013,10,17) datenum(2013,10,17)],[0 30], 'LineWidth',3);
line([datenum(2013,9,12) datenum(2013,9,12)],[0 30], 'LineWidth',3); 
line([datenum(2013,9,30) datenum(2013,9,30)],[0 30], 'LineWidth',3);
line([datenum(2013,9,12) datenum(2013,9,12) ],[0 30], 'LineWidth',3);
line([datenum(2013,10,24) datenum(2013,10,24)],[0 30], 'LineWidth',3);
line([datenum(2013,9,10) datenum(2013,9,10)],[0 30], 'LineWidth',3); 
line([datenum(2013,9,27) datenum(2013,9,27)],[0 30], 'LineWidth',3);
line([datenum(2013,8,13) datenum(2013,8,13) ],[0 30], 'LineWidth',3);
line([datenum(2013,8,27) datenum(2013,8,27)],[0 30], 'LineWidth',3);
line([datenum(2013,7,17) datenum(2013,7,17)],[0 30], 'LineWidth',3);
line([ datenum(2013,8,15)  datenum(2013,8,15)],[0 30], 'LineWidth',3);
line([datenum(2013,7,17) datenum(2013,7,17)],[0 30], 'LineWidth',3);
line([ datenum(2013,8,2) datenum(2013,8,2)],[0 30], 'LineWidth',3);
line([datenum(2013,4,10) datenum(2013,4,10)],[0 30], 'LineWidth',3);
line([ datenum(2013,6,28) datenum(2013,6,28)],[0 30], 'LineWidth',3);
line([datenum(2013,4,4) datenum(2013,4,4)],[0 30], 'LineWidth',3);
line([ datenum(2013,4,7) datenum(2013,4,7)],[0 30], 'LineWidth',3);
line([datenum(2013,3,5) datenum(2013,3,5)],[0 30], 'LineWidth',3);
line([ datenum(2013,3,25) datenum(2013,3,25)],[0 30], 'LineWidth',3);
end

if y == 2012
line([datenum(2012,10,25) datenum(2012,10,25)],[0 30], 'LineWidth',3); 
line([ datenum(2012,11,5) datenum(2012,11,5)],[0 30], 'LineWidth',3); 
line([datenum(2012,10,5) datenum(2012,10,5)],[0 30], 'LineWidth',3);
line([ datenum(2012,10,23) datenum(2012,10,23)],[0 30], 'LineWidth',3); 
line([datenum(2012,9,13) datenum(2012,9,13) ],[0 30], 'LineWidth',3); 
line([datenum(2012,10,4) datenum(2012,10,4)],[0 30], 'LineWidth',3); 
line([datenum(2012,8,14) datenum(2012,8,14)],[0 30], 'LineWidth',3);
line([ datenum(2012,8,30) datenum(2012,8,30)],[0 30], 'LineWidth',3); 
line([datenum(2012,7,10) datenum(2012,7,10)],[0 30], 'LineWidth',3); 
line([ datenum(2012,7,30) datenum(2012,7,30)],[0 30], 'LineWidth',3); 
line([datenum(2012,6,7) datenum(2012,6,7)],[0 30], 'LineWidth',3);
line([ datenum(2012,6,19) datenum(2012,6,19)],[0 30], 'LineWidth',3); 
line([datenum(2012,3,23) datenum(2012,3,23) ],[0 30], 'LineWidth',3);
line([datenum(2012,4,10) datenum(2012,4,10)],[0 30], 'LineWidth',3); 
end

if y == 2011
line([datenum(2011,10,18) datenum(2011,10,18)],[0 30], 'LineWidth',3); 
line([ datenum(2011,11,18) datenum(2011,11,18)],[0 30], 'LineWidth',3); 
line([datenum(2011,10,6) datenum(2011,10,6)],[0 30], 'LineWidth',3);
line([ datenum(2011,10,27) datenum(2011,10,27)],[0 30], 'LineWidth',3); 
line([datenum(2011,9,2) datenum(2011,9,2)],[0 30], 'LineWidth',3); 
line([ datenum(2011,9,29) datenum(2011,9,29)],[0 30], 'LineWidth',3); 
line([datenum(2011,8,23) datenum(2011,8,23)],[0 30], 'LineWidth',3);
line([ datenum(2011,8,23) datenum(2011,8,23)],[0 30], 'LineWidth',3); 
line([datenum(2011,8,10) datenum(2011,8,10)],[0 30], 'LineWidth',3); 
line([ datenum(2011,9,9) datenum(2011,9,9)],[0 30], 'LineWidth',3); 
line([datenum(2011,8,5) datenum(2011,8,5)],[0 30], 'LineWidth',3);
line([ datenum(2011,8,6) datenum(2011,8,6)],[0 30], 'LineWidth',3); 
line([datenum(2011,8,2) datenum(2011,8,2)],[0 30], 'LineWidth',3);
line([ datenum(2011,8,18) datenum(2011,8,18)],[0 30], 'LineWidth',3); 
line([datenum(2011,7,13) datenum(2011,7,13)],[0 30], 'LineWidth',3); 
line([ datenum(2011,7,14) datenum(2011,7,14)],[0 30], 'LineWidth',3); 
line([datenum(2011,4,7) datenum(2011,4,7)],[0 30], 'LineWidth',3);
line([ datenum(2011,5,3) datenum(2011,5,3)],[0 30], 'LineWidth',3); 
end

if y == 2010
line([datenum(2010,11,2) datenum(2010,11,2)],[0 30], 'LineWidth',3); 
line([datenum(2010,11,19) datenum(2010,11,19)],[0 30], 'LineWidth',3);
line([datenum(2010,10,25) datenum(2010,10,25)],[0 30], 'LineWidth',3);
line([ datenum(2010,11,18) datenum(2010,11,18)],[0 30], 'LineWidth',3);
line([datenum(2010,10,8) datenum(2010,10,8)],[0 30], 'LineWidth',3); 
line([ datenum(2010,10,25) datenum(2010,10,25)],[0 30], 'LineWidth',3);
line([datenum(2010,9,24) datenum(2010,9,24)],[0 30], 'LineWidth',3);
line([ datenum(2010,9,26) datenum(2010,9,26)],[0 30], 'LineWidth',3);
line([datenum(2010,9,23) datenum(2010,9,23)],[0 30], 'LineWidth',3); 
line([ datenum(2010,10,18) datenum(2010,10,18)],[0 30], 'LineWidth',3);
line([datenum(2010,9,1) datenum(2010,9,1)],[0 30], 'LineWidth',3);
line([ datenum(2010,9,20) datenum(2010,9,20)],[0 30], 'LineWidth',3);
line([datenum(2010,8,20) datenum(2010,8,20)],[0 30], 'LineWidth',3);
line([ datenum(2010,8,30) datenum(2010,8,30)],[0 30], 'LineWidth',3);
line([datenum(2010,8,3) datenum(2010,8,3)],[0 30], 'LineWidth',3); 
line([ datenum(2010,9,1) datenum(2010,9,1)],[0 30], 'LineWidth',3);
line([datenum(2010,7,22) datenum(2010,7,22)],[0 30], 'LineWidth',3);
line([ datenum(2010,8,3) datenum(2010,8,3)],[0 30], 'LineWidth',3);
line([datenum(2010,3,19) datenum(2010,3,19)],[0 30], 'LineWidth',3);
line([ datenum(2010,4,12) datenum(2010,4,12)],[0 30], 'LineWidth',3);
line([datenum(2010,3,2) datenum(2010,3,2)],[0 30], 'LineWidth',3);
line([ datenum(2010,3,19) datenum(2010,3,19)],[0 30], 'LineWidth',3);
line([datenum(2010,2,3) datenum(2010,2,3)],[0 30], 'LineWidth',3); 
line([ datenum(2010,2,9) datenum(2010,2,9)],[0 30], 'LineWidth',3);
end

if y == 2009
line([datenum(2009,11,5) datenum(2009,11,5)],[0 30], 'LineWidth',3);
line([ datenum(2009,11,20) datenum(2009,11,20)],[0 30], 'LineWidth',3);
line([datenum(2009,10,30) datenum(2009,10,30)],[0 30], 'LineWidth',3);
line([ datenum(2009,11,20) datenum(2009,11,20)],[0 30], 'LineWidth',3);
line([datenum(2009,10,30) datenum(2009,10,30)],[0 30], 'LineWidth',3); 
line([ datenum(2009,11,20) datenum(2009,11,20)],[0 30], 'LineWidth',3);
line([datenum(2009,10,30) datenum(2009,10,30)],[0 30], 'LineWidth',3);
line([ datenum(2009,11,20) datenum(2009,11,20)],[0 30], 'LineWidth',3);
line([datenum(2009,10,15) datenum(2009,10,15)],[0 30], 'LineWidth',3); 
line([ datenum(2009,11,5) datenum(2009,11,5)],[0 30], 'LineWidth',3);
line([datenum(2009,9,21) datenum(2009,9,21)],[0 30], 'LineWidth',3);
line([ datenum(2009,10,20)],[0 30], 'LineWidth',3);
line([datenum(2009,9,21) datenum(2009,9,21)],[0 30], 'LineWidth',3);
line([ datenum(2009,10,20) datenum(2009,10,20)],[0 30], 'LineWidth',3);
line([datenum(2009,8,26) datenum(2009,8,26)],[0 30], 'LineWidth',3); 
line([ datenum(2009,9,9) datenum(2009,9,9)],[0 30], 'LineWidth',3);
line([datenum(2009,8,20) datenum(2009,8,20)],[0 30], 'LineWidth',3);
line([ datenum(2009,8,24) datenum(2009,8,24)],[0 30], 'LineWidth',3);
line([datenum(2009,6,24) datenum(2009,6,24)],[0 30], 'LineWidth',3);
line([ datenum(2009,7,9) datenum(2009,7,9)],[0 30], 'LineWidth',3);
line([datenum(2009,6,24) datenum(2009,6,24)],[0 30], 'LineWidth',3);
line([ datenum(2009,7,9) datenum(2009,7,9)],[0 30], 'LineWidth',3);
line([datenum(2009,3,22) datenum(2009,3,22)],[0 30], 'LineWidth',3); 
line([ datenum(2009,4,19) datenum(2009,4,19)],[0 30], 'LineWidth',3);
line([datenum(2009,3,13) datenum(2009,3,13)],[0 30], 'LineWidth',3);
line([ datenum(2009,3,16) datenum(2009,3,16)],[0 30], 'LineWidth',3);
line([datenum(2009,2,18) datenum(2009,2,18)],[0 30], 'LineWidth',3);
line([ datenum(2009,3,13) datenum(2009,3,13)],[0 30], 'LineWidth',3);
line([datenum(2009,1,21) datenum(2009,1,21)],[0 30], 'LineWidth',3); 
line([ datenum(2009,2,6) datenum(2009,2,6)],[0 30], 'LineWidth',3);
end

if y == 2008
line([datenum(2008,12,14) datenum(2008,12,14)],[0 30], 'LineWidth',3); 
line([ datenum(2009,1,9) datenum(2009,1,9)],[0 30], 'LineWidth',3);
line([datenum(2008,11,11) datenum(2008,11,14)],[0 30], 'LineWidth',3);
line([ datenum(2009,1,9) datenum(2009,1,9)],[0 30], 'LineWidth',3);
line([datenum(2008,10,14) datenum(2008,10,14)],[0 30], 'LineWidth',3); 
line([ datenum(2008,10,24) datenum(2008,10,24)],[0 30], 'LineWidth',3);
line([datenum(2008,9,17) datenum(2008,9,17)],[0 30], 'LineWidth',3);
line([ datenum(2008,10,22) datenum(2008,10,22)],[0 30], 'LineWidth',3);
line([datenum(2008,9,4) datenum(2008,9,4)],[0 30], 'LineWidth',3); 
line([ datenum(2008,10,4) datenum(2008,10,4)],[0 30], 'LineWidth',3);
line([datenum(2008,7,31) datenum(2008,7,31)],[0 30], 'LineWidth',3);
line([ datenum(2008,9,4) datenum(2008,9,4)],[0 30], 'LineWidth',3);
line([datenum(2008,4,30) datenum(2008,4,30)],[0 30], 'LineWidth',3);
line([ datenum(2008,5,15) datenum(2008,5,15)],[0 30], 'LineWidth',3);
line([datenum(2008,4,30) datenum(2008,4,30)],[0 30], 'LineWidth',3); 
line([ datenum(2008,5,19) datenum(2008,5,19)],[0 30], 'LineWidth',3);
line([datenum(2008,4,3) datenum(2008,4,3)],[0 30], 'LineWidth',3);
line([ datenum(2008,4,22) datenum(2008,4,22)],[0 30], 'LineWidth',3);
end

if y == 2007
line([datenum(2007,12,11) datenum(2007,12,11)],[0 30], 'LineWidth',3); 
line([ datenum(2008,1,29) datenum(2008,1,29)],[0 30],'LineWidth',3);
line([datenum(2007,10,5) datenum(2007,10,5)],[0 30], 'LineWidth',3);
line([ datenum(2007,10,27) datenum(2007,10,27)],[0 30],'LineWidth',3);
line([datenum(2007,9,6) datenum(2007,9,6)],[0 30], 'LineWidth',3); 
line([ datenum(2007,9,24) datenum(2007,9,24)],[0 30],'LineWidth',3);
line([datenum(2007,8,9) datenum(2007,8,9)],[0 30], 'LineWidth',3);
line([ datenum(2007,8,24) datenum(2007,8,24)],[0 30],'LineWidth',3);
line([datenum(2007,8,9) datenum(2007,8,9)],[0 30], 'LineWidth',3); 
line([ datenum(2007,8,24) datenum(2007,8,24)],[0 30],'LineWidth',3);
line([datenum(2007,7,18) datenum(2007,7,18)],[0 30], 'LineWidth',3);
line([ datenum(2007,8,15) datenum(2007,8,15)],[0 30],'LineWidth',3);
line([datenum(2007,7,2) datenum(2007,7,2)],[0 30], 'LineWidth',3);
line([ datenum(2007,7,14) datenum(2007,7,14)],[0 30],'LineWidth',3);
line([datenum(2007,7,2) datenum(2007,7,2)],[0 30], 'LineWidth',3); 
line([ datenum(2007,7,13) datenum(2007,7,13)],[0 30],'LineWidth',3);
line([datenum(2007,6,26) datenum(2007,6,26)],[0 30], 'LineWidth',3);
line([ datenum(2007,7,14) datenum(2007,7,14)],[0 30],'LineWidth',3);
line([datenum(2007,6,19) datenum(2007,6,19)],[0 30], 'LineWidth',3); 
line([ datenum(2007,6,21) datenum(2007,6,21)],[0 30],'LineWidth',3);
line([datenum(2007,6,7) datenum(2007,6,7)],[0 30], 'LineWidth',3);
line([ datenum(2007,6,19) datenum(2007,6,19)],[0 30],'LineWidth',3);
line([datenum(2007,5,23) datenum(2007,5,23)],[0 30], 'LineWidth',3);
line([ datenum(2007,6,19) datenum(2007,6,19)],[0 30],'LineWidth',3);
line([datenum(2007,4,26) datenum(2007,4,26)],[0 30], 'LineWidth',3); 
line([ datenum(2007,5,21) datenum(2007,5,21)],[0 30],'LineWidth',3);
line([datenum(2007,4,3) datenum(2007,4,3)],[0 30], 'LineWidth',3);
line([ datenum(2007,4,6) datenum(2007,4,6)],[0 30],'LineWidth',3);
line([datenum(2007,3,13) datenum(2007,3,13)],[0 30], 'LineWidth',3); 
line([ datenum(2007,4,6) datenum(2007,4,6)],[0 30],'LineWidth',3);
line([datenum(2007,3,7) datenum(2007,3,7)],[0 30], 'LineWidth',3);
line([ datenum(2007,4,3) datenum(2007,4,3)],[0 30],'LineWidth',3);
line([datenum(2007,2,1) datenum(2007,2,1)],[0 30], 'LineWidth',3);
line([ datenum(2007,2,12) datenum(2007,2,12)],[0 30],'LineWidth',3);
line([datenum(2007,1,23) datenum(2007,1,23)],[0 30], 'LineWidth',3); 
line([ datenum(2007,2,1) datenum(2007,2,1)],[0 30],'LineWidth',3);
end

if y == 2006
line([datenum(2006,11,10) datenum(2006,11,10)],[0 30], 'LineWidth',3); 
line([ datenum(2006,12,12) datenum(2006,12,12)],[0 30], 'LineWidth',3);
line([datenum(2006,11,7) datenum(2006,11,7)],[0 30], 'LineWidth',3);
line([ datenum(2006,11,10) datenum(2006,11,10)],[0 30], 'LineWidth',3);
line([datenum(2006,9,8) datenum(2006,9,8)],[0 30], 'LineWidth',3); 
line([ datenum(2006,9,22) datenum(2006,9,22)],[0 30], 'LineWidth',3);
line([datenum(2006,9,5) datenum(2006,9,5)],[0 30], 'LineWidth',3);
line([ datenum(2006,9,18) datenum(2006,9,18)],[0 30], 'LineWidth',3);
line([datenum(2006,8,22) datenum(2006,8,22)],[0 30], 'LineWidth',3); 
line([ datenum(2006,9,27) datenum(2006,9,27)],[0 30], 'LineWidth',3);
line([datenum(2006,8,22) datenum(2006,8,22)],[0 30], 'LineWidth',3);
line([ datenum(2006,10,5) datenum(2006,10,5)],[0 30], 'LineWidth',3);
line([datenum(2006,8,22) datenum(2006,8,22) ],[0 30], 'LineWidth',3);
line([datenum(2006,9,25) datenum(2006,9,25)],[0 30], 'LineWidth',3);
line([datenum(2006,8,17) datenum(2006,8,17)],[0 30], 'LineWidth',3); 
line([ datenum(2006,9,18) datenum(2006,9,18)],[0 30], 'LineWidth',3);
line([datenum(2006,8,17) datenum(2006,8,17)],[0 30], 'LineWidth',3);
line([ datenum(2006,9,14) datenum(2006,9,14)],[0 30], 'LineWidth',3);
line([datenum(2006,8,9) datenum(2006,8,9)],[0 30], 'LineWidth',3); 
line([ datenum(2006,8,22) datenum(2006,8,22)],[0 30], 'LineWidth',3);
line([datenum(2006,8,7) datenum(2006,8,7)],[0 30], 'LineWidth',3);
line([ datenum(2006,9,5) datenum(2006,9,5)],[0 30], 'LineWidth',3);
line([datenum(2006,8,2) datenum(2006,8,2)],[0 30], 'LineWidth',3);
line([ datenum(2006,8,6) datenum(2006,8,6)],[0 30], 'LineWidth',3);
line([datenum(2006,7,31) datenum(2006,7,31)],[0 30], 'LineWidth',3); 
line([ datenum(2006,8,16) datenum(2006,8,16)],[0 30], 'LineWidth',3);
line([datenum(2006,7,31) datenum(2006,7,31)],[0 30], 'LineWidth',3);
line([ datenum(2006,8,6) datenum(2006,8,6)],[0 30], 'LineWidth',3);
line([datenum(2006,7,31) datenum(2006,7,31)],[0 30], 'LineWidth',3); 
line([ datenum(2006,8,9) datenum(2006,8,9)],[0 30], 'LineWidth',3);
line([datenum(2006,7,31) datenum(2006,7,31)],[0 30], 'LineWidth',3);
line([ datenum(2006,8,3) datenum(2006,8,3)],[0 30], 'LineWidth',3);
line([datenum(2006,7,19) datenum(2006,7,19)],[0 30], 'LineWidth',3);
line([ datenum(2006,8,10) datenum(2006,8,10)],[0 30], 'LineWidth',3);
line([datenum(2006,7,19) datenum(2006,7,19)],[0 30], 'LineWidth',3);
line([ datenum(2006,8,7) datenum(2006,8,7)],[0 30], 'LineWidth',3);
line([datenum(2006,7,17) datenum(2006,7,17)],[0 30], 'LineWidth',3);
line([ datenum(2006,7,18) datenum(2006,7,18)],[0 30], 'LineWidth',3);
line([datenum(2006,7,12) datenum(2006,7,12)],[0 30], 'LineWidth',3); 
line([ datenum(2006,7,18) datenum(2006,7,18)],[0 30], 'LineWidth',3);
line([datenum(2006,7,12) datenum(2006,7,12)],[0 30], 'LineWidth',3);
line([ datenum(2006,7,13) datenum(2006,7,13)],[0 30], 'LineWidth',3);
line([datenum(2006,6,14) datenum(2006,6,14)],[0 30], 'LineWidth',3); 
line([ datenum(2006,6,29) datenum(2006,6,29)],[0 30], 'LineWidth',3);
line([datenum(2006,5,31) datenum(2006,5,31)],[0 30], 'LineWidth',3);
line([ datenum(2006,6,2) datenum(2006,6,2)],[0 30], 'LineWidth',3);
line([datenum(2006,5,18) datenum(2006,5,18)],[0 30], 'LineWidth',3);
line([ datenum(2006,5,24) datenum(2006,5,24)],[0 30], 'LineWidth',3);
line([datenum(2006,5,3) datenum(2006,5,3)],[0 30], 'LineWidth',3);
line([ datenum(2006,5,6) datenum(2006,5,6)],[0 30], 'LineWidth',3);
line([datenum(2006,4,27) datenum(2006,4,27)],[0 30], 'LineWidth',3); 
line([ datenum(2006,5,4) datenum(2006,5,4)],[0 30], 'LineWidth',3);
line([datenum(2006,4,26) datenum(2006,4,26)],[0 30], 'LineWidth',3);
line([ datenum(2006,5,4) datenum(2006,5,4)],[0 30], 'LineWidth',3);
line([datenum(2006,4,6) datenum(2006,4,6)],[0 30], 'LineWidth',3); 
line([ datenum(2006,4,25) datenum(2006,4,25)],[0 30], 'LineWidth',3);
line([datenum(2006,1,12) datenum(2006,1,12)],[0 30], 'LineWidth',3); 
line([ datenum(2006,2,2) datenum(2006,2,2)],[0 30], 'LineWidth',3);
end

if y == 2005
line([datenum(2005,12,12) datenum(2005,12,12)],[0 30], 'LineWidth',3); 
line([ datenum(2005,12,19) datenum(2005,12,19)],[0 30], 'LineWidth',3);
line([datenum(2005,8,9) datenum(2005,8,9)],[0 30], 'LineWidth',3);
line([ datenum(2005,8,17) datenum(2005,8,17)],[0 30], 'LineWidth',3);
line([datenum(2005,7,13) datenum(2005,7,13)],[0 30], 'LineWidth',3); 
line([ datenum(2005,7,30) datenum(2005,7,30)],[0 30], 'LineWidth',3);
line([datenum(2005,7,13) datenum(2005,7,13)],[0 30], 'LineWidth',3);
line([ datenum(2005,7,30) datenum(2005,7,30)],[0 30], 'LineWidth',3);
line([datenum(2005,5,17) datenum(2005,5,17)],[0 30], 'LineWidth',3); 
line([ datenum(2005,6,11) datenum(2005,6,11)],[0 30], 'LineWidth',3);
line([datenum(2005,4,18) datenum(2005,4,18)],[0 30], 'LineWidth',3);
line([ datenum(2005,4,28) datenum(2005,4,28)],[0 30], 'LineWidth',3);
end
% subplot(2,1,2)
% plot(date,W1,'k');
% title(['Wind Speed' num2str(y)]);
% datetick('x',3);
%ylim([10,30]);


print(['/Users/samcoa/Documents/MATLAB/Figures/Buoy_NMFS/ts_44025_glid_' num2str(y)],'-dpng','-r150');
close all
end