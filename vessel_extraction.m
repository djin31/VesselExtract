%Program for Retinal Blood Vessel Extraction
%Author : Athi Narayanan S
%M.E, Embedded Systems,
%K.S.R College of Engineering
%Erode, Tamil Nadu, India.
%http://sites.google.com/site/athisnarayanan/
%s_athi1983@yahoo.co.in
%Program Description
%This program extracts blood vessels from a retina image using Kirsch's Templates.
%Spatial Filtering of the input retina image is done with the Kirsch's
%Templates in different orientations. Followed by thresholding, results in
%the extracted blood vessels. The threshold can be varied to fine tune the
%output.
function bloodVessels = VesselExtract(inImg, threshold)
%Kirsch's Templates
h1=[5 -3 -3;
    5  0 -3;
    5 -3 -3]/15;
h2=[-3 -3 5;
    -3  0 5;
    -3 -3 5]/15;
h3=[-3 -3 -3;
     5  0 -3;
     5  5 -3]/15;
h4=[-3  5  5;
    -3  0  5;
    -3 -3 -3]/15;
h5=[-3 -3 -3;
    -3  0 -3;
     5  5  5]/15;
h6=[ 5  5  5;
    -3  0 -3;
    -3 -3 -3]/15;
h7=[-3 -3 -3;
    -3  0  5;
    -3  5  5]/15;
h8=[ 5  5 -3;
     5  0 -3;
    -3 -3 -3]/15;
%Spatial Filtering by Kirsch's Templatess
t1=filter2(h1,inImg);
t2=filter2(h2,inImg);
t3=filter2(h3,inImg);
t4=filter2(h4,inImg);
t5=filter2(h5,inImg);
t6=filter2(h6,inImg);
t7=filter2(h7,inImg);
t8=filter2(h8,inImg);
s=size(inImg);
bloodVessels=zeros(s(1),s(2));
temp=zeros(1,8);
%
for i=1:s(1)
    for j=1:s(2)
        temp(1)=t1(i,j);temp(2)=t2(i,j);temp(3)=t3(i,j);temp(4)=t4(i,j);
        temp(5)=t5(i,j);temp(6)=t6(i,j);temp(7)=t7(i,j);temp(8)=t8(i,j);
        if(max(temp)>threshold)
            bloodVessels(i,j)=max(temp);
        end
    end
end
