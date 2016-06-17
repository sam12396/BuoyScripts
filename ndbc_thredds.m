% Buoy44009 thredds
clear all;close all;
% addpath(genpath('/Users/samcoa/Documents/MATLAB/tnmiles_basic/'));

lname='http://dods.ndbc.noaa.gov//thredds/dodsC/data/stdmet/';
buoyn='44009/';
fname='44009h';
yr=1984:2015;

date=[];
sst=[];
W=[];
Wdir=[];
for k=1:length(yr); 
    y=yr(k)
filename=([lname buoyn fname num2str(yr(k)) '.nc']);

time_buoy=ncread(filename,'time');
date_tm=datenum(1970,0,0,0,0,double(time_buoy));
sst1=squeeze(ncread(filename,'sea_surface_temperature'));
W1=squeeze(ncread(filename,'wind_spd'));
Wdir1=squeeze(ncread(filename,'wind_dir'));

date=[date,date_tm'];
sst=[sst,sst1'];
W=[W,W1'];
Wdir=[Wdir,Wdir1'];
end
figure
sst=filter_travis(sst,1,20);
plot(date,sst,'k');
title('Surface Temperature');
datetick('x',10);
ylim([0,30]);
print(['/Users/samcoa/Documents/MATLAB/Figures/BuoyTimeS/alldata_' fname],'-dpng','-r150');
close all

%  tint=floor(min(date):1/24:floor(max(date)));
%  sstint=interp1(date,sst,tint);
% test=smooth(sstint,5*24);

% save buoy_44009_31yr date sst W Wdir
%save sst_31yr_44009  date sst
%load sst_30yr_44009



% keyboard
% 
% ii=sstint < 0;
% sstint(ii)=NaN;
% 
% kkk=1
% for k=1984:2015
%    
%     d1=datenum(k,1,1);
%     d2=datenum(k,12,31);
%     ii= tint >= d1 & tint <= d2;
%     sstyr=sstint(ii);
%     tintyr=tint(ii);
%     
%     [sstmax,ind]=max(sstyr);
%     sstmaxt(kkk)=sstmax;
%     c=datevec(tintyr(ind));
%     tintmax(kkk)=tintyr(ind)-datenum(c(1),1,1);
%     clear sstmax ind
%     
%     jj=sstyr >=18; % Need to filter the data a bit more. 7 days? Adjust this number too.
%     sst15=sstyr(jj);
%     tint15=tintyr(jj);
%     c15=datevec(tintyr(jj));
%     yday15=tint15-datenum(c15(1),1,1);
%     
%     first15(kkk)=yday15(1);
%     last15(kkk)=yday15(end);
%     
%     kkk=kkk+1
%     
%     
% end
% % mark.MarkerSize=12;
% % fast_scatter(yr',sstmaxt',tintmax','colorbar','vert','marker',mark);
% 
% close all
% 
% figure
% plot(yr,sstmaxt);
% title('maxtemp');
% 
% figure
% plot(yr,tintmax);
% title('maxday');
% 
% figure
% plot(yr,first15);
% title('First15');
% 
% figure
% plot(yr,last15);
% title('Last15');
% 
% figure
% plot(yr,last15-first15);
% title('days');
% 
% yrmon=datenum(1982,1:396,1); % All months from 1982 through 2014
% 
% % Monthly Average
% for k = 1:length(yrmon)-1
%    
%     dstart=yrmon(k);
%     dend=yrmon(k+1);
%     
%     ii=b44009.date >= dstart & b44009.date < dend;
%     
%     if sum(ii) > 0
%         b44009.sstm(k)=nanmean(b44009.sst(ii));
%         b44009.nmon(k)=sum(ii);
%     else
%         b44009.sstm(k)=NaN;
%         b44009.nmon(k)=sum(ii);
%     end
% end
% 
