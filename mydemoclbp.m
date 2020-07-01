%  Examples
%  --------
clc 
clear all
close all

       I=imread('rice.png');
       mapping=getmapping(8,'u2'); 
       [CLBP_SH,CLBP_MH]=clbp(I,1,8,mapping,'h'); %CLBP histogram in (8,1) neighborhood
       CLBP_SH
       CLBP_MH
%using uniform patterns
